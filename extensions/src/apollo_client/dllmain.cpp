#include <boost/tokenizer.hpp>
#include <boost/asio.hpp> // Must be included before "shared.hpp" as both contain <windows.h>

#include <string>
#include <queue>
#include <chrono>

#include "shared.hpp"

INITIALIZE_EASYLOGGINGPP

using boost::asio::ip::tcp;

std::queue<std::string> playerQueue;

void ClearQueue(std::queue<std::string> &q) {
    std::queue<std::string> empty;
    std::swap(q, empty);
}

void DebugOut(std::string type, std::string message, std::string completedIn = "") {
    std::string msg = type + message;
    if (completedIn != "")
        msg += " (" + completedIn + " nanoseconds)";
    LOG(INFO) << msg;
}

void TCPRequest(std::string path) {
    DebugOut("REST ", "Beginning Connection for REST Endpoint for path ");
    DebugOut("REST ", path);

    std::string restReply = "";

    // Clear queue if old data still exists for some reason
    if (!playerQueue.empty())
        ClearQueue(playerQueue);

    try {
        //std::string host = "localhost";
        std::string host = "theseus-aegis.com";

        boost::asio::io_service io_service;

        // Get a list of endpoints corresponding to the server name.
        tcp::resolver resolver(io_service);
        tcp::resolver::query query(host, "8081");

        tcp::resolver::iterator endpoint_iterator = resolver.resolve(query);

        // Print endpoints
        tcp::resolver::iterator d_iter = endpoint_iterator;
        tcp::resolver::iterator d_end; // End marker
        while (d_iter != d_end) {
            tcp::endpoint d_endpoint = *d_iter++;
            boost::asio::ip::address d_address = d_endpoint.address();
            DebugOut("Endpoint: ", d_address.to_string());
        }

        // Try each endpoint until we successfully establish a connection.
        tcp::socket socket(io_service);

        auto cStart = std::chrono::high_resolution_clock::now();

        boost::asio::connect(socket, endpoint_iterator);

        auto cEnd = std::chrono::high_resolution_clock::now();
        DebugOut("message: ", "Establish connection", std::to_string(std::chrono::duration_cast<std::chrono::nanoseconds>(cEnd - cStart).count()));

        // Form the request. We specify the "Connection: close" header so that the
        // server will close the socket after transmitting the response. This will
        // allow us to treat all data up until the EOF as the content.
        boost::asio::streambuf request;
        std::ostream request_stream(&request);
        request_stream << "GET " << path << " HTTP/1.1\r\n";
        request_stream << "Host: " << host << "\r\n";
        request_stream << "Accept: */*\r\n";
        request_stream << "Connection: close\r\n\r\n";

        // Send the request.
        boost::asio::write(socket, request);

        // Read the response status line. The response streambuf will automatically
        // grow to accommodate the entire line. The growth may be limited by passing
        // a maximum size to the streambuf constructor.
        boost::asio::streambuf response;
        boost::asio::read_until(socket, response, "\r\n");


        // Check that response is OK
        std::istream response_stream(&response);
        std::string http_version;
        response_stream >> http_version;
        unsigned int status_code;
        response_stream >> status_code;
        std::string status_message;
        std::getline(response_stream, status_message);
        if (!response_stream || http_version.substr(0, 5) != "HTTP/") {
            //std::cout << "Invalid response\n";
            DebugOut("REST", "Invalid Response");
        }
        if (status_code != 200) {
            DebugOut("REST", "Response returned with status code " + status_code);
        }

        // Read the response headers, which are terminated by a blank line.
        boost::asio::read_until(socket, response, "\r\n\r\n");

        // Process the response headers.
        std::string header;
        while (std::getline(response_stream, header) && header != "\r") {
            DebugOut("REST Header - ", header);
        }

        // Write whatever content we already have to output.
        if (response.size() > 0) {
            std::ostringstream ss;
            ss << &response;
            restReply = restReply + ss.str();
        }

        // Read until EOF, writing data to output as we go.
        boost::system::error_code error;
        while (boost::asio::read(socket, response, boost::asio::transfer_at_least(1), error)) {
            std::ostringstream ss;
            ss << &response;
            restReply = restReply + ss.str();
        }

        if (error != boost::asio::error::eof)
            throw boost::system::system_error(error);

    }
    catch (std::exception& e) {
        DebugOut("REST Exception ", e.what());
    }


    // Prepare the queue
    std::string fixedStr = restReply;
    boost::char_separator<char> sep("|");
    boost::tokenizer<boost::char_separator<char>> tok(fixedStr, sep);

    for (boost::tokenizer<boost::char_separator<char>>::iterator beg = tok.begin(); beg != tok.end(); ++beg) {
        playerQueue.push(*beg);
        DebugOut("Command ", *beg);
    }

    DebugOut("Entries found: ", std::to_string(playerQueue.size()));
}

#ifndef __linux__
extern "C" {
    EXPORT void __stdcall RVExtensionVersion(char *output, int outputSize);
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
}
#endif

void __stdcall RVExtensionVersion(char *output, int outputSize) {
    ZERO_OUTPUT();
    strncpy(output, TAC_VERSION, outputSize);
    EXTENSION_RETURN();
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    ZERO_OUTPUT();

    std::string message(function);

    if (!strcmp(function, "version")) {
        strncpy(output, TAC_VERSION, outputSize);
        EXTENSION_RETURN();
    } else if (!strcmp(function, "loadArmory")) {
        std::string playerRequest = message.substr(10, message.size() - 1);
        TCPRequest("/apollo/armory/" + playerRequest);

        if (playerQueue.size() >= 0) {
            playerQueue.push("done");
            strncpy(output, "loaded", outputSize);
        } else {
            strncpy(output, "error", outputSize);
        }
        EXTENSION_RETURN();
    } else if (!strcmp(function, "loadPlayer")) {
        std::string playerId = message.substr(10, message.size() - 1);
        TCPRequest("/apollo/loadInfantry/" + playerId);

        if (playerQueue.size() > 0) {
            playerQueue.push("done");
            strncpy(output, "loaded", outputSize);
        } else {
            strncpy(output, "error", outputSize);
        }
        EXTENSION_RETURN();
    } else if (!strcmp(function, "get")) {
        if (playerQueue.size() > 0) {
            std::string command = playerQueue.front();
            playerQueue.pop();
            DebugOut("Get ", command);
            strncpy(output, command.c_str(), outputSize);
        } else {
            strncpy(output, "error", outputSize);
        }
        EXTENSION_RETURN();
    }

    strncpy(output,  "error", outputSize);
    EXTENSION_RETURN();
}

void Init() {
    el::Configurations conf;

    conf.setGlobally(el::ConfigurationType::Filename, "logs/tac_dll.log");
    conf.setGlobally(el::ConfigurationType::MaxLogFileSize, "1048576"); // 1 MB - truncated on start if bigger than specified
#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    conf.setGlobally(el::ConfigurationType::PerformanceTracking, "true");
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif
    el::Loggers::setDefaultConfigurations(conf, true);

    LOG(INFO) << "Apollo Client Loaded";
}

void Cleanup() {
    LOG(INFO) << "Apollo Client Unloaded";
}

#ifndef __linux__
BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
)
{
    switch (ul_reason_for_call)
    {
        case DLL_PROCESS_ATTACH:
            Init();
            break;
        case DLL_THREAD_ATTACH:
        case DLL_THREAD_DETACH:
        case DLL_PROCESS_DETACH:
            Cleanup();
            break;
    }
    return TRUE;
}
#endif

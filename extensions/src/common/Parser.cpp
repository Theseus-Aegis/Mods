#include "stdafx.h"

using boost::asio::ip::tcp;

static std::queue<std::string> playerQueue;

void Parser::ClearQueue(std::queue<std::string> &q) {
    std::queue<std::string> empty;
    std::swap(q, empty);
}

void Parser::DebugOut(std::string type, std::string message, std::string completedIn) {
    std::string msg = type + message;
    if (completedIn != "")
        msg += " (" + completedIn + " nanoseconds)";
    LOG(INFO) << msg;
}

void Parser::TCPRequest(std::string path) {
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
            DebugOut("Endpoint: ", boost::lexical_cast<std::string>(d_endpoint));
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



    //Prepare the queue
    std::string fixedStr = restReply;
    boost::char_separator<char> sep("|");
    boost::tokenizer<boost::char_separator<char>> tok(fixedStr, sep);

    for (boost::tokenizer<boost::char_separator<char>>::iterator beg = tok.begin(); beg != tok.end(); ++beg) {
        playerQueue.push(*beg);
        DebugOut("Command ", *beg);
    }

    DebugOut("Entries found: ", std::to_string(playerQueue.size()));
}

void Parser::Execute(char *output, int outputSize, const char *function) {
    auto bStart = std::chrono::high_resolution_clock::now();

    std::string message(function);
    static bool commandRecognized = false;

    if (boost::algorithm::contains(message, "version")) {
        strncpy_s(output, outputSize, "1.3", _TRUNCATE);
    } else if (boost::algorithm::contains(message, "loadArmory")) {
        std::string playerRequest = message.substr(10, message.size() - 1);
        TCPRequest("/apollo/armory/" + playerRequest);

        if (playerQueue.size() >= 0) {
            playerQueue.push("done");
            strncpy_s(output, outputSize, "loaded", _TRUNCATE);
        } else {
            strncpy_s(output, outputSize, "error", _TRUNCATE);
        }
    } else if (boost::algorithm::contains(message, "loadPlayer")) {
        std::string playerId = message.substr(10, message.size() - 1);
        TCPRequest("/apollo/loadInfantry/" + playerId);

        if (playerQueue.size() > 0) {
            playerQueue.push("done");
            strncpy_s(output, outputSize, "loaded", _TRUNCATE);
        } else {
            strncpy_s(output, outputSize, "error", _TRUNCATE);
        }
    } else if (boost::algorithm::contains(message, "get")) {
        if (playerQueue.size() > 0) {
            std::string command = playerQueue.front();
            playerQueue.pop();
            DebugOut("Get ", command);
            strncpy_s(output, outputSize, command.c_str(), _TRUNCATE);
        } else {
            strncpy_s(output, outputSize, "error", _TRUNCATE);
        }
    } else {
        // Unknown command
        strncpy_s(output, outputSize, "error", _TRUNCATE); // Set to receive data from Arma 3
    }

    // Final print
    auto bEnd = std::chrono::high_resolution_clock::now();
    DebugOut("message: ", message, std::to_string(std::chrono::duration_cast<std::chrono::nanoseconds>(bEnd - bStart).count()));
}

Parser::Parser(char *output, int outputSize, const char *function) {
    Execute(output, outputSize, function);
}

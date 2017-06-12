#include "shared.hpp"
//INITIALIZE_EASYLOGGINGPP

#include <string>


extern "C" {
    EXPORT void __stdcall RVExtensionVersion(char *output, int outputSize);
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
}
void __stdcall RVExtensionVersion(char *output, int outputSize)
{
    ZERO_OUTPUT();
    strncpy(output, TAC_VERSION, outputSize);
    EXTENSION_RETURN();
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    ZERO_OUTPUT();
    if (!strcmp(function, "version")) {
        strncpy(output, TAC_VERSION, outputSize);
    } else {
        strncpy(output,  "tac_test_return", outputSize);
    }
    EXTENSION_RETURN();
}

void Init() {
//    el::Configurations conf;
//
//    conf.setGlobally(el::ConfigurationType::Filename, "logs/tac_dll.log");
//    conf.setGlobally(el::ConfigurationType::MaxLogFileSize, "1048576"); // 1 MB - truncated on start if bigger than specified
//#ifdef _DEBUG
//    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
//    conf.setGlobally(el::ConfigurationType::PerformanceTracking, "true");
//#else
//    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
//#endif
//    el::Loggers::setDefaultConfigurations(conf, true);
//
//    LOG(INFO) << "Apollo Client Loaded";
}

void Cleanup() {
    //LOG(INFO) << "ApolloClient Unloaded";
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

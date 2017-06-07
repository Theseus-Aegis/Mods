//#include "stdafx.h"
#include <windows.h>
#include <string>

//INITIALIZE_EASYLOGGINGPP

extern "C" {
    __declspec(dllexport) void __stdcall RVExtensionVersion(char *output, int outputSize);
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
}
void __stdcall RVExtensionVersion(char *output, int outputSize)
{
    strncpy_s(output, outputSize, /*TAC_FULL_VERSION_STR*/"1.3", _TRUNCATE);
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    if (!strcmp(function, "version")) {
        strncpy_s(output, outputSize, /*TAC_FULL_VERSION_STR*/"1.3", _TRUNCATE);
    } else {
        strncpy_s(output, outputSize, "tac_test_return", _TRUNCATE);
    }
}

void Init() {
    /*el::Configurations conf;

    conf.setGlobally(el::ConfigurationType::Filename, "logs/ApolloClient.log");
    conf.setGlobally(el::ConfigurationType::MaxLogFileSize, "1048576"); // 1 MB - truncated on start if bigger than specified
#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    conf.setGlobally(el::ConfigurationType::PerformanceTracking, "true");
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif
    el::Loggers::setDefaultConfigurations(conf, true);

    LOG(INFO) << "ApolloClient Loaded";*/
}

void Cleanup() {
    //LOG(INFO) << "ApolloClient Unloaded";
}

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

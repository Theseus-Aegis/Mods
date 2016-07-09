#include "script_component.hpp"

// Check JNI presence
if ("jni" callExtension "version" == "") exitWith {
    ACE_LOGERROR("Apollo failed to initialize - no JNI extension active");
};

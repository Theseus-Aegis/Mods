let version_short = `${HEMTT_PROJECT_VERSION_MAJOR}.${HEMTT_PROJECT_VERSION_MINOR}.${HEMTT_PROJECT_VERSION_PATCH}`;

let version = HEMTT_VFS
    .join("mod.cpp")
    .open_file()
    .read();
version.replace("0.0.0", version_short);
HEMTT_VFS
    .join("mod.cpp")
    .create_file()
    .write(version);

print("mod.cpp version set to " + version_short);

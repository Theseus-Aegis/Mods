let releases = HEMTT_RFS.join("releases");
let name_nospaces = HEMTT.project().name();
name_nospaces.remove(" ");

let src = releases.join(HEMTT.project().prefix() + "-" + HEMTT.project().version().to_string() + ".zip");
let dst = releases.join(name_nospaces + "_" + HEMTT.project().version().to_string() + ".zip");

if src.is_file() { // support --no-archive
    print("Moving zip to " + dst);
    if !src.move(dst) {
        fatal("Failed to move " + src + " to " + dst);
    }
}

platform_setup :: () {

}

platform_get_biggest_monitor_pos :: () -> s32, s32 {
    return -1, -1;
    // unimplemented();
}

platform_create_window :: () {
    window = create_window(window_width, window_height, window_generic_title, window_x, window_y);
}

platform_maximize_window :: (window: Window_Type) {
    // To be honest, I wouldn't do this on macOS. Feels strange to fullscreen or maximize a document window on launch.
    // Leaving it blank for now.
    // There is probably a way to do it though if you want it. -Don
}

platform_enable_drag_and_drop :: (window: Window_Type) {
    // @Todo We may have to wait for the jai compiler to ship something for this. -Don
}

platform_get_dpi_scale :: (window: Window_Type) -> float {
    return xx NSView.convertPointToBacking(NSWindow.contentView(window), .{1, 0}).x;
}

platform_set_window_title :: (title: string) {
    NSWindow.setTitle(window, title);
}

platform_wait_message :: inline () {

}

platform_set_refresh_timer :: (window: Window_Type) {
    // unimplemented();
}

platform_kill_refresh_timer :: (window: Window_Type) {
    // unimplemented();
}

platform_enumerate_logical_drives :: inline () -> [] string {
    return string.["/"]; // On macOS, root ("/") gives us access to all external volumes through /Volumes/.
}

platform_get_save_file_name :: (name := "") -> string, bool {
    // unimplemented();
    return "", false;
}

platform_get_fonts_dir :: () -> string {
    return "/Library/Fonts";
}

//figure out how to get home dir
platform_get_user_fonts_dir :: () -> string {
    return "/Users/jason/Library/Fonts";
}

platform_open_in_explorer :: (dir: string) {
    // unimplemented();
}

#scope_file

Monitor :: struct {
    left   : int;
    top    : int;
    right  : int;
    bottom : int;
};

monitors : [..] Monitor;

#import "Objective_C";

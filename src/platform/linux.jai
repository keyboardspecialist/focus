platform_setup :: () {

}

platform_get_biggest_monitor_pos :: () -> s32, s32 {
    unimplemented();
}

platform_create_window :: () {
    window = create_window(window_width, window_height, window_generic_title, window_x, window_y, background_color_rgb = as_3_floats(Colors.BACKGROUND));
}

platform_maximize_window :: (window: Window_Type) {

}

platform_enable_drag_and_drop :: (window: Window_Type) {
    typelist := string.["url/url", "text/uri-list", "text/plain", "application/octet-stream"];  // @Incomplete: test this on Linux
    X11.enable_drag_and_drop(window, typelist);
}

platform_get_dpi_scale :: (window: Window_Type) -> float {
    unimplemented();
}

platform_set_window_title :: (title: string) {
    d := X11.x_global_display;
    win_name := temp_c_string(title);
    X11.XStoreName(d, window, win_name);
}

platform_wait_message :: inline () {
    unimplemented();
}

platform_set_refresh_timer :: (window: Window_Type) {
    unimplemented();
}

platform_kill_refresh_timer :: (window: Window_Type) {
    unimplemented();
}

platform_enumerate_logical_drives :: () -> [] string {
    unimplemented();
}

platform_get_save_file_name :: (name := "") -> string, bool {
    unimplemented();
}

platform_get_fonts_dir :: () -> string {
    return "/usr/share/fonts";
}

platform_get_user_fonts_dir :: () -> string {
    return "/~/.fonts";
}

platform_open_in_explorer :: (dir: string) {
    unimplemented();
}

#scope_file

Monitor :: struct {
    left   : int;
    top    : int;
    right  : int;
    bottom : int;
};

monitors : [..] Monitor;

X11 :: #import "X11";

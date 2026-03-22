draw_set_alpha(1);

var in_mix_screen = !variable_global_exists("game_screen") || (global.game_screen == "mix");
var screen_button_label = in_mix_screen ? "OPEN RECIPE BOOK" : "BACK TO LAB";

draw_set_color(make_color_rgb(40, 75, 120));
draw_roundrect(button_x, button_y, button_x + button_w, button_y + button_h, false);
draw_set_color(make_color_rgb(83, 92, 44));
draw_roundrect(hint_button_x, hint_button_y, hint_button_x + hint_button_w, hint_button_y + hint_button_h, false);
draw_set_color(make_color_rgb(70, 55, 35));
draw_roundrect(screen_button_x, screen_button_y, screen_button_x + screen_button_w, screen_button_y + screen_button_h, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
if (in_mix_screen) {
    draw_text(button_x + button_w * 0.5, button_y + button_h * 0.5, "ADD BASE ELEMENTS");
    draw_text(hint_button_x + hint_button_w * 0.5, hint_button_y + hint_button_h * 0.5, "HINT");
}
draw_text(screen_button_x + screen_button_w * 0.5, screen_button_y + screen_button_h * 0.5, screen_button_label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var discovered = 0;
if (variable_global_exists("discovered_count")) {
    discovered = global.discovered_count;
}

draw_text(24, 96, "Unique Elements Found: " + string(discovered));

if (in_mix_screen) {
    var hint_message = "Press HINT for a recipe suggestion.";
    if (variable_global_exists("hint_text")) {
        hint_message = global.hint_text;
    }
    draw_text(24, 132, "Mix elements in the lab view.");
    draw_text(24, 160, hint_message);
    exit;
}

var panel_x = 24;
var panel_y = 132;
var panel_w = room_width - 48;
var panel_h = room_height - panel_y - 24;

draw_set_color(make_color_rgb(20, 30, 45));
draw_roundrect(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

draw_set_color(c_white);
draw_text(panel_x + 12, panel_y + 10, "Discovered Elements");
draw_text(panel_x + panel_w - 220, panel_y + 10, "CLICK TO ADD TO LAB");

if (variable_global_exists("discovered_list")) {
    var max_rows = floor((panel_h - 64) / 22);
    var total = ds_list_size(global.discovered_list);
    var shown = min(total, max_rows);
    var row_y = panel_y + 40;

    for (var i = 0; i < shown; i++) {
        var el = global.discovered_list[| i];
        var item_top = row_y + i * 22;
        var item_bottom = item_top + 22;
        if (point_in_rectangle(mouse_x, mouse_y, panel_x + 8, item_top, panel_x + panel_w - 8, item_bottom)) {
            draw_set_color(make_color_rgb(48, 68, 96));
            draw_roundrect(panel_x + 6, item_top, panel_x + panel_w - 6, item_bottom, false);
            draw_set_color(c_white);
        }
        draw_text(panel_x + 12, item_top, string(i + 1) + ". " + string_upper(el));
    }

    if (total > shown) {
        draw_text(panel_x + 12, panel_y + panel_h - 28, "... +" + string(total - shown) + " more");
    }
}

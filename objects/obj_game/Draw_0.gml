draw_set_alpha(1);
draw_set_color(make_color_rgb(40, 75, 120));
draw_roundrect(button_x, button_y, button_x + button_w, button_y + button_h, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(button_x + button_w * 0.5, button_y + button_h * 0.5, "ADD BASE ELEMENTS");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var discovered = 0;
if (variable_global_exists("discovered_count")) {
    discovered = global.discovered_count;
}

draw_text(24, 96, "Unique Elements Found: " + string(discovered));

var panel_x = 24;
var panel_y = 132;
var panel_w = 300;
var panel_h = 600;

draw_set_color(make_color_rgb(20, 30, 45));
draw_roundrect(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

draw_set_color(c_white);
draw_text(panel_x + 12, panel_y + 10, "Discovered Elements");

if (variable_global_exists("discovered_list")) {
    var max_rows = 24;
    var total = ds_list_size(global.discovered_list);
    var shown = min(total, max_rows);
    var row_y = panel_y + 40;

    for (var i = 0; i < shown; i++) {
        var el = global.discovered_list[| i];
        draw_text(panel_x + 12, row_y + i * 22, string(i + 1) + ". " + string_upper(el));
    }

    if (total > shown) {
        draw_text(panel_x + 12, panel_y + panel_h - 28, "... +" + string(total - shown) + " more");
    }
}

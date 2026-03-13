function icon_hash(_text) {
    var h = 2166136261;
    var len = string_length(_text);
    for (var i = 1; i <= len; i++) {
        h = (h ^ ord(string_char_at(_text, i))) * 16777619;
        h = h & $7fffffff;
    }
    return h;
}

function element_abbrev(_name) {
    var parts = string_split(_name, "_");
    if (array_length(parts) >= 2) {
        return string_upper(string_copy(parts[0], 1, 1) + string_copy(parts[1], 1, 1));
    }
    if (string_length(_name) >= 2) {
        return string_upper(string_copy(_name, 1, 2));
    }
    return string_upper(_name);
}

var n = string_lower(element_name);
var custom_text = has_custom_icon ? "true" : "false";

if (has_custom_icon) {
    draw_sprite(icon_sprite, image_index, x, y);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(x, y - 48, string(element_name));
    draw_text(x, y - 34, "idx=" + string(sprite_index));
    draw_text(x, y - 20, "custom=" + custom_text);
    exit;
}

var h = icon_hash(n);

var hue = h mod 256;
var sat = 170 + ((h >> 8) mod 70);
var val = 170 + ((h >> 16) mod 70);
var col_a = make_color_hsv(hue, sat, val);
var col_b = make_color_hsv((hue + 32 + ((h >> 3) mod 64)) mod 256, sat, min(255, val + 30));

var r = 30;

draw_set_color(col_a);
draw_circle(x, y, r, false);

draw_set_color(col_b);
switch ((h >> 4) mod 6) {
    case 0:
        draw_circle(x, y, r * 0.58, false);
        break;
    case 1:
        draw_rectangle(x - r * 0.55, y - r * 0.55, x + r * 0.55, y + r * 0.55, false);
        break;
    case 2:
        draw_triangle(x, y - r * 0.65, x - r * 0.6, y + r * 0.45, x + r * 0.6, y + r * 0.45, false);
        break;
    case 3:
        draw_rectangle(x - r * 0.2, y - r * 0.65, x + r * 0.2, y + r * 0.65, false);
        draw_rectangle(x - r * 0.65, y - r * 0.2, x + r * 0.65, y + r * 0.2, false);
        break;
    case 4:
        draw_triangle(x - r * 0.62, y, x, y - r * 0.62, x + r * 0.62, y, false);
        draw_triangle(x - r * 0.62, y, x, y + r * 0.62, x + r * 0.62, y, false);
        break;
    case 5:
        draw_circle(x - r * 0.28, y, r * 0.25, false);
        draw_circle(x + r * 0.28, y, r * 0.25, false);
        break;
}

draw_set_color(c_white);
switch ((h >> 10) mod 4) {
    case 0:
        draw_line_width(x - 10, y + 12, x + 10, y + 12, 2);
        break;
    case 1:
        draw_line_width(x - 12, y - 12, x + 12, y + 12, 2);
        break;
    case 2:
        draw_circle(x, y, 6, true);
        break;
    case 3:
        draw_rectangle(x - 6, y - 6, x + 6, y + 6, true);
        break;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, element_abbrev(n));
draw_text(x, y - 48, string(element_name));
draw_text(x, y - 34, "idx=" + string(sprite_index));
draw_text(x, y - 20, "custom=" + custom_text);

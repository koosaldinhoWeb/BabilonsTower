function icon_hash(_text) {
    var h = 2166136261;
    var len = string_length(_text);
    for (var i = 1; i <= len; i++) {
        h = (h ^ ord(string_char_at(_text, i))) * 16777619;
        h = h & $7fffffff;
    }
    return h;
}

function element_has(_name, _token) {
    return string_pos(_token, _name) > 0;
}

function icon_palette(_name) {
    if (element_has(_name, "fire") || element_has(_name, "lava") || element_has(_name, "ember") || element_has(_name, "flare") || element_has(_name, "phoenix") || element_has(_name, "meteor") || element_has(_name, "sulfur") || element_has(_name, "boil") || element_has(_name, "plasma") || element_has(_name, "suncore")) {
        return [make_color_rgb(92, 16, 10), make_color_rgb(219, 77, 28), make_color_rgb(255, 203, 94)];
    }

    if (element_has(_name, "water") || element_has(_name, "rain") || element_has(_name, "river") || element_has(_name, "ocean") || element_has(_name, "dew") || element_has(_name, "spring") || element_has(_name, "downpour") || element_has(_name, "glacier") || element_has(_name, "ice")) {
        return [make_color_rgb(16, 49, 91), make_color_rgb(54, 145, 214), make_color_rgb(186, 236, 255)];
    }

    if (element_has(_name, "cloud") || element_has(_name, "fog") || element_has(_name, "mist") || element_has(_name, "steam") || element_has(_name, "smoke") || element_has(_name, "veil") || element_has(_name, "blizzard")) {
        return [make_color_rgb(58, 70, 88), make_color_rgb(142, 158, 178), make_color_rgb(241, 247, 255)];
    }

    if (element_has(_name, "earth") || element_has(_name, "mud") || element_has(_name, "dust") || element_has(_name, "sand") || element_has(_name, "clay") || element_has(_name, "brick") || element_has(_name, "pottery") || element_has(_name, "tablet") || element_has(_name, "desert") || element_has(_name, "dune") || element_has(_name, "canyon") || element_has(_name, "mountain") || element_has(_name, "plateau") || element_has(_name, "wall") || element_has(_name, "ore")) {
        return [make_color_rgb(77, 53, 31), make_color_rgb(155, 112, 63), make_color_rgb(230, 198, 140)];
    }

    if (element_has(_name, "obsidian") || element_has(_name, "ash") || element_has(_name, "soot") || element_has(_name, "tar") || element_has(_name, "shadow") || element_has(_name, "coal")) {
        return [make_color_rgb(22, 24, 30), make_color_rgb(74, 78, 90), make_color_rgb(182, 189, 198)];
    }

    if (element_has(_name, "plant") || element_has(_name, "tree") || element_has(_name, "seed") || element_has(_name, "moss") || element_has(_name, "willow") || element_has(_name, "algae") || element_has(_name, "fertilizer") || element_has(_name, "peat") || element_has(_name, "bog") || element_has(_name, "swamp")) {
        return [make_color_rgb(22, 67, 29), make_color_rgb(74, 168, 74), make_color_rgb(196, 242, 150)];
    }

    if (element_has(_name, "wind") || element_has(_name, "storm") || element_has(_name, "hurricane") || element_has(_name, "airship") || element_has(_name, "avalanche")) {
        return [make_color_rgb(30, 58, 84), make_color_rgb(113, 172, 221), make_color_rgb(229, 246, 255)];
    }

    if (element_has(_name, "lightning") || element_has(_name, "thunder") || element_has(_name, "electrolyte")) {
        return [make_color_rgb(44, 49, 84), make_color_rgb(255, 214, 71), make_color_rgb(255, 247, 186)];
    }

    if (element_has(_name, "glass") || element_has(_name, "crystal") || element_has(_name, "gem") || element_has(_name, "lens") || element_has(_name, "mirror") || element_has(_name, "porcelain") || element_has(_name, "ceramic") || element_has(_name, "fulgurite")) {
        return [make_color_rgb(38, 72, 80), make_color_rgb(115, 204, 214), make_color_rgb(227, 253, 255)];
    }

    if (element_has(_name, "engine") || element_has(_name, "tractor") || element_has(_name, "turbine") || element_has(_name, "rocket") || element_has(_name, "chimney")) {
        return [make_color_rgb(56, 57, 62), make_color_rgb(146, 151, 160), make_color_rgb(247, 196, 73)];
    }

    if (element_has(_name, "acid") || element_has(_name, "sludge") || element_has(_name, "lye") || element_has(_name, "marsh_gas")) {
        return [make_color_rgb(42, 65, 15), make_color_rgb(132, 192, 46), make_color_rgb(229, 255, 120)];
    }

    var h = icon_hash(_name);
    var hue = h mod 256;
    var sat = 150 + ((h >> 8) mod 60);
    var val = 160 + ((h >> 16) mod 70);
    return [
        make_color_hsv(hue, sat, max(50, val - 90)),
        make_color_hsv((hue + 18) mod 256, sat, val),
        make_color_hsv((hue + 36) mod 256, max(80, sat - 50), min(255, val + 45))
    ];
}

function icon_motif(_name) {
    if (element_has(_name, "fire") || element_has(_name, "lava") || element_has(_name, "ember") || element_has(_name, "flare") || element_has(_name, "phoenix") || element_has(_name, "meteor") || element_has(_name, "sulfur") || element_has(_name, "plasma") || element_has(_name, "suncore")) return "flame";
    if (element_has(_name, "water") || element_has(_name, "rain") || element_has(_name, "river") || element_has(_name, "ocean") || element_has(_name, "dew") || element_has(_name, "spring") || element_has(_name, "downpour") || element_has(_name, "ice")) return "drop";
    if (element_has(_name, "cloud") || element_has(_name, "fog") || element_has(_name, "mist") || element_has(_name, "steam") || element_has(_name, "smoke") || element_has(_name, "veil")) return "cloud";
    if (element_has(_name, "earth") || element_has(_name, "mud") || element_has(_name, "dust") || element_has(_name, "sand") || element_has(_name, "clay") || element_has(_name, "brick") || element_has(_name, "pottery") || element_has(_name, "tablet") || element_has(_name, "desert") || element_has(_name, "dune") || element_has(_name, "canyon") || element_has(_name, "wall")) return "stone";
    if (element_has(_name, "mountain") || element_has(_name, "volcano") || element_has(_name, "island") || element_has(_name, "plateau") || element_has(_name, "geyser")) return "peak";
    if (element_has(_name, "plant") || element_has(_name, "tree") || element_has(_name, "seed") || element_has(_name, "moss") || element_has(_name, "willow") || element_has(_name, "algae")) return "leaf";
    if (element_has(_name, "wind") || element_has(_name, "storm") || element_has(_name, "hurricane") || element_has(_name, "airship") || element_has(_name, "blizzard") || element_has(_name, "avalanche")) return "swirl";
    if (element_has(_name, "lightning") || element_has(_name, "thunder") || element_has(_name, "electrolyte")) return "bolt";
    if (element_has(_name, "glass") || element_has(_name, "crystal") || element_has(_name, "gem") || element_has(_name, "lens") || element_has(_name, "mirror") || element_has(_name, "porcelain") || element_has(_name, "ceramic") || element_has(_name, "fulgurite")) return "crystal";
    if (element_has(_name, "engine") || element_has(_name, "tractor") || element_has(_name, "turbine") || element_has(_name, "rocket") || element_has(_name, "chimney")) return "gear";
    if (element_has(_name, "obsidian") || element_has(_name, "ash") || element_has(_name, "soot") || element_has(_name, "tar") || element_has(_name, "shadow") || element_has(_name, "coal")) return "shard";
    if (element_has(_name, "acid") || element_has(_name, "sludge") || element_has(_name, "lye") || element_has(_name, "marsh_gas")) return "toxic";
    return "sigil";
}

function draw_icon_badge(_x, _y, _r, _bg, _accent, _detail) {
    draw_set_color(_bg);
    draw_circle(_x, _y, _r, false);
    draw_set_color(_accent);
    draw_circle(_x, _y, _r - 5, false);
    draw_set_color(_detail);
    draw_circle(_x, _y, _r - 10, true);
}

function draw_icon_motif(_motif, _x, _y, _r, _accent, _detail) {
    draw_set_color(_accent);

    switch (_motif) {
        case "flame":
            draw_triangle(_x, _y - _r * 0.78, _x - _r * 0.5, _y + _r * 0.4, _x + _r * 0.08, _y + _r * 0.16, false);
            draw_triangle(_x, _y - _r * 0.78, _x - _r * 0.08, _y + _r * 0.16, _x + _r * 0.5, _y + _r * 0.4, false);
            draw_set_color(_detail);
            draw_triangle(_x, _y - _r * 0.4, _x - _r * 0.2, _y + _r * 0.24, _x + _r * 0.2, _y + _r * 0.24, false);
            break;

        case "drop":
            draw_triangle(_x, _y - _r * 0.76, _x - _r * 0.4, _y - _r * 0.02, _x + _r * 0.4, _y - _r * 0.02, false);
            draw_circle(_x, _y + _r * 0.12, _r * 0.42, false);
            draw_set_color(_detail);
            draw_circle(_x - _r * 0.12, _y - _r * 0.04, _r * 0.12, false);
            break;

        case "cloud":
            draw_circle(_x - _r * 0.28, _y + _r * 0.02, _r * 0.24, false);
            draw_circle(_x + _r * 0.02, _y - _r * 0.12, _r * 0.3, false);
            draw_circle(_x + _r * 0.32, _y + _r * 0.04, _r * 0.22, false);
            draw_rectangle(_x - _r * 0.44, _y - _r * 0.02, _x + _r * 0.42, _y + _r * 0.28, false);
            draw_set_color(_detail);
            draw_line_width(_x - _r * 0.18, _y + _r * 0.46, _x + _r * 0.18, _y + _r * 0.46, 2);
            break;

        case "stone":
            draw_rectangle(_x - _r * 0.45, _y - _r * 0.35, _x + _r * 0.45, _y + _r * 0.35, false);
            draw_set_color(_detail);
            draw_line_width(_x - _r * 0.18, _y - _r * 0.24, _x + _r * 0.22, _y + _r * 0.12, 2);
            draw_line_width(_x - _r * 0.26, _y + _r * 0.1, _x + _r * 0.08, _y + _r * 0.1, 2);
            break;

        case "peak":
            draw_triangle(_x - _r * 0.58, _y + _r * 0.4, _x - _r * 0.08, _y - _r * 0.46, _x + _r * 0.34, _y + _r * 0.4, false);
            draw_triangle(_x - _r * 0.08, _y + _r * 0.4, _x + _r * 0.26, _y - _r * 0.2, _x + _r * 0.58, _y + _r * 0.4, false);
            draw_set_color(_detail);
            draw_triangle(_x - _r * 0.16, _y - _r * 0.18, _x - _r * 0.02, _y - _r * 0.42, _x + _r * 0.1, _y - _r * 0.18, false);
            break;

        case "leaf":
            draw_ellipse(_x - _r * 0.34, _y - _r * 0.2, _x + _r * 0.2, _y + _r * 0.42, false);
            draw_set_color(_detail);
            draw_line_width(_x - _r * 0.08, _y + _r * 0.34, _x + _r * 0.2, _y - _r * 0.18, 2);
            draw_line_width(_x + _r * 0.02, _y + _r * 0.18, _x + _r * 0.22, _y + _r * 0.02, 2);
            break;

        case "swirl":
            draw_circle(_x, _y, _r * 0.5, true);
            draw_set_color(c_black);
            draw_circle(_x + _r * 0.16, _y, _r * 0.32, true);
            draw_set_color(_detail);
            draw_line_width(_x - _r * 0.38, _y + _r * 0.26, _x + _r * 0.42, _y + _r * 0.02, 3);
            break;

        case "bolt":
            draw_triangle(_x - _r * 0.08, _y - _r * 0.52, _x + _r * 0.14, _y - _r * 0.04, _x - _r * 0.06, _y - _r * 0.04, false);
            draw_triangle(_x - _r * 0.02, _y - _r * 0.04, _x + _r * 0.12, _y - _r * 0.04, _x - _r * 0.16, _y + _r * 0.5, false);
            draw_set_color(_detail);
            draw_circle(_x + _r * 0.26, _y - _r * 0.28, _r * 0.1, false);
            break;

        case "crystal":
            draw_triangle(_x, _y - _r * 0.62, _x - _r * 0.38, _y - _r * 0.08, _x, _y + _r * 0.54, false);
            draw_triangle(_x, _y - _r * 0.62, _x, _y + _r * 0.54, _x + _r * 0.38, _y - _r * 0.08, false);
            draw_set_color(_detail);
            draw_line_width(_x, _y - _r * 0.58, _x, _y + _r * 0.48, 2);
            break;

        case "gear":
            draw_circle(_x, _y, _r * 0.32, false);
            draw_rectangle(_x - _r * 0.08, _y - _r * 0.62, _x + _r * 0.08, _y - _r * 0.38, false);
            draw_rectangle(_x - _r * 0.08, _y + _r * 0.38, _x + _r * 0.08, _y + _r * 0.62, false);
            draw_rectangle(_x - _r * 0.62, _y - _r * 0.08, _x - _r * 0.38, _y + _r * 0.08, false);
            draw_rectangle(_x + _r * 0.38, _y - _r * 0.08, _x + _r * 0.62, _y + _r * 0.08, false);
            draw_set_color(_detail);
            draw_circle(_x, _y, _r * 0.12, false);
            break;

        case "shard":
            draw_triangle(_x - _r * 0.34, _y + _r * 0.5, _x - _r * 0.08, _y - _r * 0.56, _x + _r * 0.06, _y + _r * 0.3, false);
            draw_triangle(_x + _r * 0.04, _y + _r * 0.42, _x + _r * 0.18, _y - _r * 0.3, _x + _r * 0.4, _y + _r * 0.5, false);
            draw_set_color(_detail);
            draw_line_width(_x - _r * 0.12, _y - _r * 0.06, _x + _r * 0.22, _y + _r * 0.14, 2);
            break;

        case "toxic":
            draw_circle(_x - _r * 0.22, _y + _r * 0.04, _r * 0.16, false);
            draw_circle(_x + _r * 0.22, _y + _r * 0.04, _r * 0.16, false);
            draw_circle(_x, _y - _r * 0.22, _r * 0.16, false);
            draw_set_color(_detail);
            draw_circle(_x, _y + _r * 0.06, _r * 0.08, false);
            break;

        default:
            draw_circle(_x, _y, _r * 0.34, false);
            draw_set_color(_detail);
            draw_line_width(_x - _r * 0.3, _y, _x + _r * 0.3, _y, 2);
            draw_line_width(_x, _y - _r * 0.3, _x, _y + _r * 0.3, 2);
            break;
    }
}

function draw_element_label(_x, _y, _name) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_text(_x, _y, string_upper(string_replace_all(_name, "_", " ")));
}

if (variable_global_exists("game_screen") && (global.game_screen != "mix")) {
    exit;
}

var n = string_lower(element_name);

if (has_custom_icon) {
    draw_sprite(icon_sprite, image_index, x, y);
    draw_element_label(x, y + 40, n);
    exit;
}

var palette = icon_palette(n);
var bg_col = palette[0];
var accent_col = palette[1];
var detail_col = palette[2];
var motif = icon_motif(n);
var r = 30;

draw_icon_badge(x, y, r, bg_col, accent_col, detail_col);
draw_icon_motif(motif, x, y, r - 8, accent_col, detail_col);
draw_element_label(x, y + 40, n);

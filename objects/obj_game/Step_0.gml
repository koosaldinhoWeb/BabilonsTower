function build_recipe_key(_a, _b) {
    var a = string_lower(_a);
    var b = string_lower(_b);
    return (a < b) ? (a + "|" + b) : (b + "|" + a);
}

function spawn_lab_icon(_element_name) {
    var spawn_x = 0;
    var spawn_y = 0;
    var found_spot = false;
    var min_y = max(spawn_margin, button_y + button_h + spawn_margin);

    for (var attempt = 0; attempt < spawn_max_attempts; attempt++) {
        spawn_x = random_range(spawn_margin, room_width - spawn_margin);
        spawn_y = random_range(min_y, room_height - spawn_margin);

        if (!collision_circle(spawn_x, spawn_y, spawn_separation, obj_icon, false, true)) {
            found_spot = true;
            break;
        }
    }

    if (!found_spot) {
        spawn_x = random_range(spawn_margin, room_width - spawn_margin);
        spawn_y = random_range(min_y, room_height - spawn_margin);
    }

    var icon = instance_create_layer(spawn_x, spawn_y, "Instances", obj_icon);
    icon.element_name = _element_name;
}

function find_screen_hint() {
    if (!variable_global_exists("recipe_map")) {
        return "No recipes loaded.";
    }

    var icon_list = ds_list_create();
    with (obj_icon) {
        ds_list_add(icon_list, id);
    }

    var icon_count = ds_list_size(icon_list);
    var fallback_hint = "";

    for (var i = 0; i < icon_count; i++) {
        var icon_a = icon_list[| i];
        if (!instance_exists(icon_a)) {
            continue;
        }

        for (var j = i + 1; j < icon_count; j++) {
            var icon_b = icon_list[| j];
            if (!instance_exists(icon_b)) {
                continue;
            }

            var key = build_recipe_key(icon_a.element_name, icon_b.element_name);
            if (ds_map_exists(global.recipe_map, key)) {
                var results = global.recipe_map[? key];
                var all_discovered = true;

                for (var r = 0; r < array_length(results); r++) {
                    var result_name = string_lower(results[r]);
                    if (!variable_global_exists("discovered_elements") || !ds_map_exists(global.discovered_elements, result_name)) {
                        all_discovered = false;
                        break;
                    }
                }

                var hint_text = "Hint: combine "
                    + string_upper(string_replace_all(string(icon_a.element_name), "_", " "))
                    + " + "
                    + string_upper(string_replace_all(string(icon_b.element_name), "_", " "));

                if (!all_discovered) {
                    ds_list_destroy(icon_list);
                    return hint_text;
                }

                if (fallback_hint == "") {
                    fallback_hint = hint_text;
                }
            }
        }
    }

    ds_list_destroy(icon_list);

    if (fallback_hint != "") {
        return fallback_hint;
    }

    return "Hint: no valid combination is currently on the lab screen.";
}

if (mouse_check_button_pressed(mb_left)) {
    var over_button = point_in_rectangle(mouse_x, mouse_y, button_x, button_y, button_x + button_w, button_y + button_h);
    var over_hint_button = point_in_rectangle(mouse_x, mouse_y, hint_button_x, hint_button_y, hint_button_x + hint_button_w, hint_button_y + hint_button_h);
    var over_screen_button = point_in_rectangle(mouse_x, mouse_y, screen_button_x, screen_button_y, screen_button_x + screen_button_w, screen_button_y + screen_button_h);

    if (over_screen_button) {
        global.game_screen = (global.game_screen == "mix") ? "recipes" : "mix";
    } else if ((global.game_screen == "mix") && over_hint_button) {
        global.hint_text = find_screen_hint();
    } else if ((global.game_screen == "mix") && over_button) {
        spawn_lab_icon("earth");
        spawn_lab_icon("wind");
        spawn_lab_icon("fire");
        spawn_lab_icon("water");
    } else if (global.game_screen == "recipes") {
        var panel_x = 24;
        var panel_y = 132;
        var panel_w = room_width - 48;
        var panel_h = room_height - panel_y - 24;
        var row_y = panel_y + 40;
        var row_h = 22;

        if (variable_global_exists("discovered_list")) {
            var max_rows = floor((panel_h - 64) / row_h);
            var total = ds_list_size(global.discovered_list);
            var shown = min(total, max_rows);

            for (var i = 0; i < shown; i++) {
                var top_y = row_y + i * row_h;
                var bottom_y = top_y + row_h;
                if (point_in_rectangle(mouse_x, mouse_y, panel_x + 12, top_y, panel_x + panel_w - 12, bottom_y)) {
                    var chosen_element = global.discovered_list[| i];
                    spawn_lab_icon(chosen_element);
                    global.hint_text = "Added " + string_upper(string_replace_all(string(chosen_element), "_", " ")) + " to the lab.";
                    global.game_screen = "mix";
                    break;
                }
            }
        }
    }
}

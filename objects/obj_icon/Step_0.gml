if (!discovery_registered) {
    var name_lower = string_lower(element_name);
        if (name_lower != "unknown" && variable_global_exists("discovered_elements")) {
            if (!ds_map_exists(global.discovered_elements, name_lower)) {
                global.discovered_elements[? name_lower] = true;
                global.discovered_count += 1;
                if (variable_global_exists("discovered_list")) {
                    ds_list_add(global.discovered_list, name_lower);
                }
            }
            discovery_registered = true;
    }
}

var element_lower = string_lower(element_name);
if (icon_resolved_name != element_lower) {
    var sprite_name = "spr_el_" + element_lower;
    icon_sprite = asset_get_index(sprite_name);
    has_custom_icon = (icon_sprite != -1) && sprite_exists(icon_sprite);
    show_debug_message(
        "[obj_icon] element_name=" + string(element_name)
        + " element_lower=" + element_lower
        + " sprite_name=" + sprite_name
        + " icon_sprite=" + string(icon_sprite)
        + " has_custom_icon=" + string(has_custom_icon)
    );
    if (has_custom_icon) {
        sprite_index = icon_sprite;
    } else {
        sprite_index = -1;
    }
    icon_resolved_name = element_lower;
}

var click_radius = 34;

if (mouse_check_button_pressed(mb_left)) {
    if (point_distance(mouse_x, mouse_y, x, y) <= click_radius) {
        dragging = true;
        drag_offset_x = x - mouse_x;
        drag_offset_y = y - mouse_y;
    }
}

if (dragging) {
    x = mouse_x + drag_offset_x;
    y = mouse_y + drag_offset_y;

    if (mouse_check_button_released(mb_left)) {
        dragging = false;
        if (!variable_global_exists("recipe_map")) {
            exit;
        }

        var hit_list = ds_list_create();
        var hit_count = instance_place_list(x, y, obj_icon, hit_list, false);
        var other_icon = noone;

        for (var i = 0; i < hit_count; i++) {
            var candidate = hit_list[| i];
            if (candidate != id) {
                other_icon = candidate;
                break;
            }
        }

        ds_list_destroy(hit_list);

        if (other_icon != noone) {
            var a = string_lower(element_name);
            var b = string_lower(other_icon.element_name);
            var key = (a < b) ? (a + "|" + b) : (b + "|" + a);

            if (ds_map_exists(global.recipe_map, key)) {
                var results = global.recipe_map[? key];
                var spawn_x = (x + other_icon.x) * 0.5;
                var spawn_y = (y + other_icon.y) * 0.5;

                with (other_icon) {
                    instance_destroy();
                }

                var result_count = array_length(results);
                var spacing = 36;
                for (var r = 0; r < result_count; r++) {
                    var offset_x = (r - (result_count - 1) * 0.5) * spacing;
                    var new_icon = instance_create_layer(spawn_x + offset_x, spawn_y, "Instances", obj_icon);
                    new_icon.element_name = results[r];
                }

                instance_destroy();
                exit;
            }

            var separate_distance = 72;
            var dir = point_direction(other_icon.x, other_icon.y, x, y);
            if (point_distance(other_icon.x, other_icon.y, x, y) < 1) {
                dir = irandom(359);
            }

            x = other_icon.x + lengthdir_x(separate_distance, dir);
            y = other_icon.y + lengthdir_y(separate_distance, dir);
            x = clamp(x, click_radius, room_width - click_radius);
            y = clamp(y, click_radius, room_height - click_radius);
        }
    }
}

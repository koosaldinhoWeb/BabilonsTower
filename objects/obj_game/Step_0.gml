if (mouse_check_button_pressed(mb_left)) {
    var over_button = point_in_rectangle(mouse_x, mouse_y, button_x, button_y, button_x + button_w, button_y + button_h);
    if (over_button) {
        var icon_earth = instance_create_layer(spawn_center_x - (spawn_spacing * 1.5), spawn_center_y, "Instances", obj_icon);
        icon_earth.element_name = "earth";

        var icon_wind = instance_create_layer(spawn_center_x - (spawn_spacing * 0.5), spawn_center_y, "Instances", obj_icon);
        icon_wind.element_name = "wind";

        var icon_fire = instance_create_layer(spawn_center_x + (spawn_spacing * 0.5), spawn_center_y, "Instances", obj_icon);
        icon_fire.element_name = "fire";

        var icon_water = instance_create_layer(spawn_center_x + (spawn_spacing * 1.5), spawn_center_y, "Instances", obj_icon);
        icon_water.element_name = "water";
    }
}

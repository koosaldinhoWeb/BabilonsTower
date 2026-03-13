if (variable_global_exists("recipe_map")) {
    ds_map_destroy(global.recipe_map);
}

if (variable_global_exists("discovered_elements")) {
    ds_map_destroy(global.discovered_elements);
}

if (variable_global_exists("discovered_list")) {
    ds_list_destroy(global.discovered_list);
}

global.recipe_map = ds_map_create();
global.discovered_elements = ds_map_create();
global.discovered_list = ds_list_create();
global.discovered_count = 0;

function add_recipe(_a, _b, _result) {
    var a = string_lower(_a);
    var b = string_lower(_b);
    var key = (a < b) ? (a + "|" + b) : (b + "|" + a);
    global.recipe_map[? key] = [_result];
}

function add_recipe_split(_a, _b, _result_a, _result_b) {
    var a = string_lower(_a);
    var b = string_lower(_b);
    var key = (a < b) ? (a + "|" + b) : (b + "|" + a);
    global.recipe_map[? key] = [_result_a, _result_b];
}

// 100 unique recipes
add_recipe("fire", "earth", "lava");
add_recipe("fire", "water", "boiling_water");
add_recipe("fire", "wind", "smoke");
add_recipe("earth", "water", "mud");
add_recipe("earth", "wind", "dust");
add_recipe("water", "wind", "rain");
add_recipe("lava", "water", "steam");
add_recipe("lava", "wind", "ash");
add_recipe("lava", "earth", "obsidian");
add_recipe("lava", "fire", "plasma");
add_recipe("steam", "wind", "cloud");
add_recipe("steam", "earth", "geyser");
add_recipe("steam", "fire", "engine");
add_recipe("steam", "water", "fog");
add_recipe("smoke", "water", "acid_rain");
add_recipe("smoke", "earth", "soot");
add_recipe("smoke", "wind", "stormfront");
add_recipe("smoke", "fire", "flare");
add_recipe("mud", "fire", "brick");
add_recipe("mud", "lava", "volcano");
add_recipe("mud", "wind", "clay");
add_recipe("mud", "water", "swamp");
add_recipe("mud", "earth", "pottery");
add_recipe("dust", "fire", "ember");
add_recipe("dust", "water", "sludge");
add_recipe("dust", "wind", "sandstorm");
add_recipe("dust", "earth", "sand");
add_recipe("rain", "earth", "plant");
add_recipe("rain", "fire", "rainbow");
add_recipe("rain", "water", "river");
add_recipe("rain", "wind", "hurricane");
add_recipe("obsidian", "earth", "monolith");
add_recipe("obsidian", "fire", "forgeglass");
add_recipe("obsidian", "water", "mirrorpool");
add_recipe("obsidian", "wind", "shardstorm");
add_recipe("ash", "water", "lye");
add_recipe("ash", "earth", "fertilizer");
add_recipe("ash", "wind", "cinder");
add_recipe("ash", "fire", "phoenix");
add_recipe("volcano", "water", "island");
add_recipe("volcano", "wind", "eruption");
add_recipe("volcano", "earth", "mountain");
add_recipe("volcano", "fire", "meteor");
add_recipe("plasma", "wind", "lightning");
add_recipe("plasma", "water", "electrolyte");
add_recipe("plasma", "earth", "crystal");
add_recipe("plasma", "fire", "suncore");
add_recipe("cloud", "water", "downpour");
add_recipe("cloud", "wind", "blizzard");
add_recipe("cloud", "fire", "thunderhead");
add_recipe("cloud", "earth", "shadow");
add_recipe("geyser", "earth", "hot_spring");
add_recipe("geyser", "wind", "mist");
add_recipe("geyser", "fire", "sulfur");
add_recipe("geyser", "water", "spring");
add_recipe("engine", "earth", "tractor");
add_recipe("engine", "water", "turbine");
add_recipe("engine", "wind", "airship");
add_recipe("engine", "fire", "rocket");
add_recipe("fog", "earth", "moss");
add_recipe("fog", "wind", "veil");
add_recipe("fog", "fire", "mirage");
add_recipe("fog", "water", "dew");
add_recipe("brick", "fire", "kiln");
add_recipe("brick", "water", "aqueduct");
add_recipe("brick", "wind", "chimney");
add_recipe("brick", "earth", "wall");
add_recipe("clay", "fire", "ceramic");
add_recipe("clay", "water", "porcelain");
add_recipe("clay", "wind", "sculpture");
add_recipe("clay", "earth", "tablet");
add_recipe("swamp", "fire", "tar");
add_recipe("swamp", "wind", "marsh_gas");
add_recipe("swamp", "earth", "peat");
add_recipe("swamp", "water", "bog");
add_recipe("sand", "fire", "glass");
add_recipe("sand", "water", "beach");
add_recipe("sand", "wind", "dune");
add_recipe("sand", "earth", "desert");
add_recipe("plant", "fire", "charcoal");
add_recipe("plant", "water", "algae");
add_recipe("plant", "wind", "seed");
add_recipe("plant", "earth", "tree");
add_recipe("river", "earth", "canyon");
add_recipe("river", "fire", "boil");
add_recipe("river", "wind", "delta");
add_recipe("river", "water", "ocean");
add_recipe("lightning", "sand", "fulgurite");
add_recipe("lightning", "tree", "emberwood");
add_recipe("lightning", "ocean", "storm");
add_recipe("glass", "fire", "lens");
add_recipe("glass", "water", "ice");
add_recipe("glass", "wind", "chime");
add_recipe("glass", "earth", "gem");
add_recipe("mountain", "wind", "avalanche");
add_recipe("mountain", "water", "glacier");
add_recipe("mountain", "fire", "ore");
add_recipe("mountain", "earth", "plateau");
add_recipe("tree", "fire", "coal");
add_recipe("tree", "water", "willow");

// multi-result recipes
add_recipe_split("steam", "fire", "engine", "cloud");
add_recipe_split("ocean", "fire", "salt", "steam");
add_recipe_split("volcano", "water", "island", "steam");
add_recipe_split("tree", "lightning", "emberwood", "fire");
add_recipe_split("mud", "fire", "brick", "steam");

instance_create_layer(0, 0, "Instances", obj_game);

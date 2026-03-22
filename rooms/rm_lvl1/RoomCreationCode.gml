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

function add_recipe_set(_source, _fire_result, _water_result, _earth_result, _wind_result) {
    add_recipe(_source, "fire", _fire_result);
    add_recipe(_source, "water", _water_result);
    add_recipe(_source, "earth", _earth_result);
    add_recipe(_source, "wind", _wind_result);
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

// shortcut recipes
add_recipe("fire", "fire", "plasma");
add_recipe("water", "water", "ocean");
add_recipe("earth", "earth", "mountain");
add_recipe("wind", "wind", "storm");
add_recipe("mud", "mud", "swamp");
add_recipe("dust", "dust", "sand");
add_recipe("lava", "lava", "volcano");
add_recipe("steam", "steam", "cloud");
add_recipe("cloud", "cloud", "storm");
add_recipe("brick", "brick", "wall");
add_recipe("glass", "glass", "lens");
add_recipe("plant", "plant", "tree");
add_recipe("tree", "tree", "orchard");
add_recipe("rain", "rain", "river");
add_recipe("river", "river", "ocean");
add_recipe("ore", "ore", "molten_metal");

// expanded progression toward Tower of Babylon
add_recipe_set("kiln", "blast_furnace", "cooling_brick", "clay_oven", "smoke_vent");
add_recipe_set("aqueduct", "bathhouse", "canal_lock", "cistern", "spillway");
add_recipe_set("chimney", "beacon_tower", "soot_rain", "brick_flue", "wind_vane");
add_recipe_set("wall", "citadel", "moss_wall", "rampart", "dust_barrier");
add_recipe_set("ceramic", "glazed_tile", "water_jar", "clay_idol", "kiln_whistle");
add_recipe_set("porcelain", "ritual_bowl", "white_lotus", "palace_inlay", "bell_shard");
add_recipe_set("sculpture", "sun_statue", "fountain_court", "stone_relief", "singing_monument");
add_recipe_set("tablet", "cuneiform", "wet_tablet", "law_stone", "whisper_script");
add_recipe_set("tar", "pitch_torch", "sealant", "tar_pit", "smoke_seal");
add_recipe_set("marsh_gas", "gas_flame", "reed_pool", "peat_bank", "vapor_whorl");
add_recipe_set("peat", "ember_briquette", "mire_water", "burial_mound", "turf_gust");
add_recipe_set("bog", "bogfire", "reed_marsh", "sunken_bank", "swamp_mist");
add_recipe_set("beach", "sun_shell", "tide_pool", "sandstone", "shore_breeze");
add_recipe_set("dune", "glasscrest", "oasis", "dune_temple", "sand_devil");
add_recipe_set("desert", "sun_disc", "salt_pan", "mesa", "desert_wind");
add_recipe_set("charcoal", "forge_ink", "charcoal_wash", "carbon_block", "ash_gust");
add_recipe_set("algae", "lamp_oil", "reedwater", "marsh_carpet", "bloom_tide");
add_recipe_set("seed", "harvest", "lotus_pool", "furrow", "pollen_drift");
add_recipe_set("canyon", "ember_gorge", "river_pass", "butte", "echo_wind");
add_recipe_set("boil", "broth", "distillate", "mineral_scale", "steamburst");
add_recipe_set("delta", "reed_city", "floodplain", "silt_field", "river_breeze");
add_recipe_set("ocean", "salt_steam", "coral_garden", "deep_trench", "sea_gale");
add_recipe_set("fulgurite", "sun_spire", "glass_reed", "lightning_rod", "static_hum");
add_recipe_set("emberwood", "torchwood", "steamwood", "heartwood", "sparkseed");
add_recipe_set("storm", "thunderforge", "stormwater", "thunderstone", "cyclone");
add_recipe_set("lens", "sun_beam", "prism_pool", "focus_stone", "sky_scope");
add_recipe_set("ice", "meltwater", "clear_ice", "permafrost", "snow_drift");
add_recipe_set("chime", "songflame", "rain_song", "standing_bell", "wind_harp");
add_recipe_set("gem", "fire_opal", "tear_jewel", "geode", "sky_sapphire");
add_recipe_set("avalanche", "snowmelt", "glacier_face", "mountain_base", "whiteout");
add_recipe_set("glacier", "melt_river", "ice_cavern", "moraine", "frostwind");
add_recipe_set("ore", "molten_metal", "quench_metal", "bedrock_vein", "ringing_anvil");
add_recipe_set("plateau", "sun_altar", "stepwell", "highland", "mesa_wind");
add_recipe_set("coal", "furnace_heat", "coal_slurry", "black_seam", "smoke_plume");
add_recipe_set("willow", "ember_branch", "river_reed", "root_grove", "whisper_leaf");
add_recipe_set("salt", "brine_fire", "pure_water", "salt_road", "dry_gale");
add_recipe_set("tractor", "thresh_engine", "irrigation_cart", "plow_field", "dust_engine");
add_recipe_set("turbine", "heat_turbine", "hydro_turbine", "millstone", "windmill");
add_recipe_set("airship", "skyforge", "cloudship", "skyport", "gale_balloon");
add_recipe_set("rocket", "sun_rocket", "vapor_trail", "launch_pad", "jet_stream");
add_recipe_set("thunderhead", "lightning_rain", "stormcloud", "thunder_peak", "sky_roar");
add_recipe_set("hot_spring", "bath_steam", "mineral_water", "travertine", "warm_breeze");
add_recipe_set("spring", "boiling_spring", "sacred_pool", "river_source", "mist_bell");
add_recipe_set("mirage", "fire_vision", "oasis_vision", "desert_tower", "shimmerwind");
add_recipe_set("moss", "peat_smoke", "dew_moss", "stone_moss", "spore_wind");
add_recipe_set("lye", "soap", "brine_lye", "alkali_clay", "caustic_vapor");
add_recipe_set("fertilizer", "incense_crop", "rice_paddy", "orchard", "chaff_storm");
add_recipe_set("cinder", "brazier", "soot_water", "clinker", "ember_gust");
add_recipe_set("rainbow", "sun_banner", "rain_garden", "color_stone", "sky_bridge");

add_recipe_set("blast_furnace", "bronze", "steam_hammer", "forge_foundation", "spark_chimney");
add_recipe_set("canal_lock", "floodgate", "irrigation", "levee", "sail_lock");
add_recipe_set("citadel", "war_banner", "moat", "palace_wall", "watch_post");
add_recipe_set("glazed_tile", "enamel_brick", "blue_mosaic", "tiled_foundation", "painted_frieze");
add_recipe_set("cuneiform", "epic_poem", "clay_records", "royal_edict", "prayer_chant");
add_recipe_set("pitch_torch", "signal_pyre", "oil_lamp", "torch_post", "smoke_beacon");
add_recipe_set("harvest", "bread", "beer", "granary", "threshing_wind");
add_recipe_set("reed_city", "kiln_quarter", "canal_district", "mud_rampart", "market_breeze");
add_recipe_set("coral_garden", "sun_reef", "pearl_pool", "reef_stone", "sea_song");
add_recipe_set("lightning_rod", "arc_fire", "charged_water", "temple_spire", "storm_call");
add_recipe_set("heartwood", "sacred_firewood", "sap", "grove_pillar", "leafsong");
add_recipe_set("sky_scope", "sun_chart", "rain_reader", "observatory", "stairway_of_heaven");
add_recipe_set("fire_opal", "crown_jewel", "water_gleam", "gem_mine", "lucky_star");
add_recipe_set("molten_metal", "bronze_blade", "tempered_ingot", "foundry", "furnace_draft");
add_recipe_set("highland", "beacon_hill", "terrace_farm", "hill_fort", "ridge_wind");
add_recipe_set("windmill", "flour_mill", "waterwheel", "mill_foundation", "vane_tower");
add_recipe_set("skyport", "signal_fire_dock", "cloud_harbor", "anchor_tower", "messenger_wind");
add_recipe_set("launch_pad", "fire_column", "steam_launch", "stone_dais", "contrail");
add_recipe_set("mineral_water", "tonic", "reflecting_pool", "mineral_bed", "spa_mist");
add_recipe_set("sacred_pool", "incense_pool", "healing_water", "shrine_base", "omen_breeze");
add_recipe_set("orchard", "date_wine", "irrigation_grove", "orchard_terrace", "blossom_wind");
add_recipe_set("sky_bridge", "sunrise_arch", "mist_bridge", "causeway", "cloud_road");
add_recipe_set("ritual_bowl", "incense_rite", "libation", "altar_set", "hymn");
add_recipe_set("palace_inlay", "jeweled_throne", "mirror_hall", "gate_of_the_gods", "curtain_wall");
add_recipe_set("law_stone", "trial_by_fire", "river_oath", "boundary_marker", "herald");
add_recipe_set("dune_temple", "sun_shrine", "oasis_shrine", "sandstone_pillar", "desert_choir");
add_recipe_set("sun_disc", "solar_cult", "sun_pool", "altar_disc", "halo_wind");
add_recipe_set("carbon_block", "steel_seed", "ink_wash", "foundation_block", "sootstorm");
add_recipe_set("lotus_pool", "lotus_lantern", "fish_pond", "mud_sanctuary", "perfume_breeze");
add_recipe_set("river_source", "geyser_altar", "spring_channel", "source_stone", "river_song");
add_recipe_set("bathhouse", "steam_room", "healing_bath", "bath_foundation", "perfumed_air");
add_recipe_set("beacon_tower", "signal_forge", "harbor_light", "tower_base", "warning_wind");
add_recipe_set("white_lotus", "sacred_bloom", "lotus_tea", "garden_terrace", "petal_gale");
add_recipe_set("singing_monument", "flame_hymn", "echo_pool", "stone_choir", "wind_organ");
add_recipe_set("salt_road", "caravan_fire", "salt_cistern", "caravanserai", "desert_route");
add_recipe_set("thresh_engine", "kiln_engine", "pump_cart", "grain_silo", "thresh_draft");
add_recipe_set("hydro_turbine", "dyno_flame", "pumpworks", "river_mill", "mist_turbine");
add_recipe_set("cloudship", "skyforge_dock", "rain_barge", "cloud_port", "jetstream");
add_recipe_set("lightning_rain", "storm_glass", "charged_flood", "thunder_plain", "omen_squall");
add_recipe_set("travertine", "limekiln", "spring_house", "temple_step", "cliff_breeze");
add_recipe_set("desert_tower", "beacon_spire", "oasis_tower", "tower_foundation", "dune_song");
add_recipe_set("stone_moss", "ember_lichen", "moss_spring", "hanging_garden", "spore_gust");
add_recipe_set("soap", "scented_oil", "cleansing_water", "ash_bar", "bubble_breeze");
add_recipe_set("brazier", "hearthfire", "brazier_oil", "bronze_tripod", "incense_smoke");
add_recipe_set("prism_pool", "rainbow_flame", "mirror_pool", "crystal_basin", "light_breeze");
add_recipe_set("geode", "magma_geode", "crystal_water", "jewel_vault", "ringing_shard");
add_recipe_set("moraine", "hearth_stone", "glacier_runoff", "terrace_stone", "alpine_wind");
add_recipe_set("furnace_heat", "smeltery", "boiler", "furnace_core", "heat_haze");
add_recipe_set("pure_water", "holy_steam", "basin", "clay_well", "hymn_rain");

add_recipe("observatory", "fire", "star_beacon");
add_recipe("hanging_garden", "water", "royal_garden");
add_recipe("gate_of_the_gods", "stairway_of_heaven", "tower_of_babylon");

instance_create_layer(0, 0, "Instances", obj_game);

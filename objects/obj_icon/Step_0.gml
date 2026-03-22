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

function resolve_element_sprite(_element_name) {
    switch (string_lower(_element_name)) {
        case "acid_rain": return spr_el_acid_rain;
        case "airship": return spr_el_airship;
        case "algae": return spr_el_algae;
        case "alkali_clay": return spr_el_alkali_clay;
        case "alpine_wind": return spr_el_alpine_wind;
        case "altar_disc": return spr_el_altar_disc;
        case "altar_set": return spr_el_altar_set;
        case "anchor_tower": return spr_el_anchor_tower;
        case "aqueduct": return spr_el_aqueduct;
        case "arc_fire": return spr_el_arc_fire;
        case "ash": return spr_el_ash;
        case "ash_bar": return spr_el_ash_bar;
        case "ash_gust": return spr_el_ash_gust;
        case "avalanche": return spr_el_avalanche;
        case "basin": return spr_el_basin;
        case "bath_foundation": return spr_el_bath_foundation;
        case "bath_steam": return spr_el_bath_steam;
        case "bathhouse": return spr_el_bathhouse;
        case "beach": return spr_el_beach;
        case "beacon_hill": return spr_el_beacon_hill;
        case "beacon_spire": return spr_el_beacon_spire;
        case "beacon_tower": return spr_el_beacon_tower;
        case "bedrock_vein": return spr_el_bedrock_vein;
        case "beer": return spr_el_beer;
        case "bell_shard": return spr_el_bell_shard;
        case "black_seam": return spr_el_black_seam;
        case "blast_furnace": return spr_el_blast_furnace;
        case "blizzard": return spr_el_blizzard;
        case "bloom_tide": return spr_el_bloom_tide;
        case "blossom_wind": return spr_el_blossom_wind;
        case "blue_mosaic": return spr_el_blue_mosaic;
        case "bog": return spr_el_bog;
        case "bogfire": return spr_el_bogfire;
        case "boil": return spr_el_boil;
        case "boiler": return spr_el_boiler;
        case "boiling_spring": return spr_el_boiling_spring;
        case "boiling_water": return spr_el_boiling_water;
        case "boundary_marker": return spr_el_boundary_marker;
        case "brazier": return spr_el_brazier;
        case "brazier_oil": return spr_el_brazier_oil;
        case "bread": return spr_el_bread;
        case "brick": return spr_el_brick;
        case "brick_flue": return spr_el_brick_flue;
        case "brine_fire": return spr_el_brine_fire;
        case "brine_lye": return spr_el_brine_lye;
        case "bronze": return spr_el_bronze;
        case "bronze_blade": return spr_el_bronze_blade;
        case "bronze_tripod": return spr_el_bronze_tripod;
        case "broth": return spr_el_broth;
        case "bubble_breeze": return spr_el_bubble_breeze;
        case "burial_mound": return spr_el_burial_mound;
        case "butte": return spr_el_butte;
        case "canal_district": return spr_el_canal_district;
        case "canal_lock": return spr_el_canal_lock;
        case "canyon": return spr_el_canyon;
        case "caravan_fire": return spr_el_caravan_fire;
        case "caravanserai": return spr_el_caravanserai;
        case "carbon_block": return spr_el_carbon_block;
        case "causeway": return spr_el_causeway;
        case "caustic_vapor": return spr_el_caustic_vapor;
        case "ceramic": return spr_el_ceramic;
        case "chaff_storm": return spr_el_chaff_storm;
        case "charcoal": return spr_el_charcoal;
        case "charcoal_wash": return spr_el_charcoal_wash;
        case "charged_flood": return spr_el_charged_flood;
        case "charged_water": return spr_el_charged_water;
        case "chime": return spr_el_chime;
        case "chimney": return spr_el_chimney;
        case "cinder": return spr_el_cinder;
        case "cistern": return spr_el_cistern;
        case "citadel": return spr_el_citadel;
        case "clay": return spr_el_clay;
        case "clay_idol": return spr_el_clay_idol;
        case "clay_oven": return spr_el_clay_oven;
        case "clay_records": return spr_el_clay_records;
        case "clay_well": return spr_el_clay_well;
        case "cleansing_water": return spr_el_cleansing_water;
        case "clear_ice": return spr_el_clear_ice;
        case "cliff_breeze": return spr_el_cliff_breeze;
        case "clinker": return spr_el_clinker;
        case "cloud": return spr_el_cloud;
        case "cloud_harbor": return spr_el_cloud_harbor;
        case "cloud_port": return spr_el_cloud_port;
        case "cloud_road": return spr_el_cloud_road;
        case "cloudship": return spr_el_cloudship;
        case "coal": return spr_el_coal;
        case "coal_slurry": return spr_el_coal_slurry;
        case "color_stone": return spr_el_color_stone;
        case "contrail": return spr_el_contrail;
        case "cooling_brick": return spr_el_cooling_brick;
        case "coral_garden": return spr_el_coral_garden;
        case "crown_jewel": return spr_el_crown_jewel;
        case "crystal": return spr_el_crystal;
        case "crystal_basin": return spr_el_crystal_basin;
        case "crystal_water": return spr_el_crystal_water;
        case "cuneiform": return spr_el_cuneiform;
        case "curtain_wall": return spr_el_curtain_wall;
        case "cyclone": return spr_el_cyclone;
        case "date_wine": return spr_el_date_wine;
        case "deep_trench": return spr_el_deep_trench;
        case "delta": return spr_el_delta;
        case "desert": return spr_el_desert;
        case "desert_choir": return spr_el_desert_choir;
        case "desert_route": return spr_el_desert_route;
        case "desert_tower": return spr_el_desert_tower;
        case "desert_wind": return spr_el_desert_wind;
        case "dew": return spr_el_dew;
        case "dew_moss": return spr_el_dew_moss;
        case "distillate": return spr_el_distillate;
        case "downpour": return spr_el_downpour;
        case "dry_gale": return spr_el_dry_gale;
        case "dune": return spr_el_dune;
        case "dune_song": return spr_el_dune_song;
        case "dune_temple": return spr_el_dune_temple;
        case "dust": return spr_el_dust;
        case "dust_barrier": return spr_el_dust_barrier;
        case "dust_engine": return spr_el_dust_engine;
        case "dyno_flame": return spr_el_dyno_flame;
        case "earth": return spr_el_earth;
        case "echo_pool": return spr_el_echo_pool;
        case "echo_wind": return spr_el_echo_wind;
        case "electrolyte": return spr_el_electrolyte;
        case "ember": return spr_el_ember;
        case "ember_branch": return spr_el_ember_branch;
        case "ember_briquette": return spr_el_ember_briquette;
        case "ember_gorge": return spr_el_ember_gorge;
        case "ember_gust": return spr_el_ember_gust;
        case "ember_lichen": return spr_el_ember_lichen;
        case "emberwood": return spr_el_emberwood;
        case "enamel_brick": return spr_el_enamel_brick;
        case "engine": return spr_el_engine;
        case "epic_poem": return spr_el_epic_poem;
        case "eruption": return spr_el_eruption;
        case "fertilizer": return spr_el_fertilizer;
        case "fire": return spr_el_fire;
        case "fire_column": return spr_el_fire_column;
        case "fire_opal": return spr_el_fire_opal;
        case "fire_vision": return spr_el_fire_vision;
        case "fish_pond": return spr_el_fish_pond;
        case "flame_hymn": return spr_el_flame_hymn;
        case "flare": return spr_el_flare;
        case "floodgate": return spr_el_floodgate;
        case "floodplain": return spr_el_floodplain;
        case "flour_mill": return spr_el_flour_mill;
        case "focus_stone": return spr_el_focus_stone;
        case "fog": return spr_el_fog;
        case "forge_foundation": return spr_el_forge_foundation;
        case "forge_ink": return spr_el_forge_ink;
        case "forgeglass": return spr_el_forgeglass;
        case "foundation_block": return spr_el_foundation_block;
        case "foundry": return spr_el_foundry;
        case "fountain_court": return spr_el_fountain_court;
        case "frostwind": return spr_el_frostwind;
        case "fulgurite": return spr_el_fulgurite;
        case "furnace_core": return spr_el_furnace_core;
        case "furnace_draft": return spr_el_furnace_draft;
        case "furnace_heat": return spr_el_furnace_heat;
        case "furrow": return spr_el_furrow;
        case "gale_balloon": return spr_el_gale_balloon;
        case "garden_terrace": return spr_el_garden_terrace;
        case "gas_flame": return spr_el_gas_flame;
        case "gate_of_the_gods": return spr_el_gate_of_the_gods;
        case "gem": return spr_el_gem;
        case "gem_mine": return spr_el_gem_mine;
        case "geode": return spr_el_geode;
        case "geyser": return spr_el_geyser;
        case "geyser_altar": return spr_el_geyser_altar;
        case "glacier": return spr_el_glacier;
        case "glacier_face": return spr_el_glacier_face;
        case "glacier_runoff": return spr_el_glacier_runoff;
        case "glass": return spr_el_glass;
        case "glass_reed": return spr_el_glass_reed;
        case "glasscrest": return spr_el_glasscrest;
        case "glazed_tile": return spr_el_glazed_tile;
        case "grain_silo": return spr_el_grain_silo;
        case "granary": return spr_el_granary;
        case "grove_pillar": return spr_el_grove_pillar;
        case "halo_wind": return spr_el_halo_wind;
        case "hanging_garden": return spr_el_hanging_garden;
        case "harbor_light": return spr_el_harbor_light;
        case "harvest": return spr_el_harvest;
        case "healing_bath": return spr_el_healing_bath;
        case "healing_water": return spr_el_healing_water;
        case "hearth_stone": return spr_el_hearth_stone;
        case "hearthfire": return spr_el_hearthfire;
        case "heartwood": return spr_el_heartwood;
        case "heat_haze": return spr_el_heat_haze;
        case "heat_turbine": return spr_el_heat_turbine;
        case "herald": return spr_el_herald;
        case "highland": return spr_el_highland;
        case "hill_fort": return spr_el_hill_fort;
        case "holy_steam": return spr_el_holy_steam;
        case "hot_spring": return spr_el_hot_spring;
        case "hurricane": return spr_el_hurricane;
        case "hydro_turbine": return spr_el_hydro_turbine;
        case "hymn": return spr_el_hymn;
        case "hymn_rain": return spr_el_hymn_rain;
        case "ice": return spr_el_ice;
        case "ice_cavern": return spr_el_ice_cavern;
        case "incense_crop": return spr_el_incense_crop;
        case "incense_pool": return spr_el_incense_pool;
        case "incense_rite": return spr_el_incense_rite;
        case "incense_smoke": return spr_el_incense_smoke;
        case "ink_wash": return spr_el_ink_wash;
        case "irrigation": return spr_el_irrigation;
        case "irrigation_cart": return spr_el_irrigation_cart;
        case "irrigation_grove": return spr_el_irrigation_grove;
        case "island": return spr_el_island;
        case "jet_stream": return spr_el_jet_stream;
        case "jetstream": return spr_el_jetstream;
        case "jewel_vault": return spr_el_jewel_vault;
        case "jeweled_throne": return spr_el_jeweled_throne;
        case "kiln": return spr_el_kiln;
        case "kiln_engine": return spr_el_kiln_engine;
        case "kiln_quarter": return spr_el_kiln_quarter;
        case "kiln_whistle": return spr_el_kiln_whistle;
        case "lamp_oil": return spr_el_lamp_oil;
        case "launch_pad": return spr_el_launch_pad;
        case "lava": return spr_el_lava;
        case "law_stone": return spr_el_law_stone;
        case "leafsong": return spr_el_leafsong;
        case "lens": return spr_el_lens;
        case "levee": return spr_el_levee;
        case "libation": return spr_el_libation;
        case "light_breeze": return spr_el_light_breeze;
        case "lightning": return spr_el_lightning;
        case "lightning_rain": return spr_el_lightning_rain;
        case "lightning_rod": return spr_el_lightning_rod;
        case "limekiln": return spr_el_limekiln;
        case "lotus_lantern": return spr_el_lotus_lantern;
        case "lotus_pool": return spr_el_lotus_pool;
        case "lotus_tea": return spr_el_lotus_tea;
        case "lucky_star": return spr_el_lucky_star;
        case "lye": return spr_el_lye;
        case "magma_geode": return spr_el_magma_geode;
        case "market_breeze": return spr_el_market_breeze;
        case "marsh_carpet": return spr_el_marsh_carpet;
        case "marsh_gas": return spr_el_marsh_gas;
        case "melt_river": return spr_el_melt_river;
        case "meltwater": return spr_el_meltwater;
        case "mesa": return spr_el_mesa;
        case "mesa_wind": return spr_el_mesa_wind;
        case "messenger_wind": return spr_el_messenger_wind;
        case "meteor": return spr_el_meteor;
        case "mill_foundation": return spr_el_mill_foundation;
        case "millstone": return spr_el_millstone;
        case "mineral_bed": return spr_el_mineral_bed;
        case "mineral_scale": return spr_el_mineral_scale;
        case "mineral_water": return spr_el_mineral_water;
        case "mirage": return spr_el_mirage;
        case "mire_water": return spr_el_mire_water;
        case "mirror_hall": return spr_el_mirror_hall;
        case "mirror_pool": return spr_el_mirror_pool;
        case "mirrorpool": return spr_el_mirrorpool;
        case "mist": return spr_el_mist;
        case "mist_bell": return spr_el_mist_bell;
        case "mist_bridge": return spr_el_mist_bridge;
        case "mist_turbine": return spr_el_mist_turbine;
        case "moat": return spr_el_moat;
        case "molten_metal": return spr_el_molten_metal;
        case "monolith": return spr_el_monolith;
        case "moraine": return spr_el_moraine;
        case "moss": return spr_el_moss;
        case "moss_spring": return spr_el_moss_spring;
        case "moss_wall": return spr_el_moss_wall;
        case "mountain": return spr_el_mountain;
        case "mountain_base": return spr_el_mountain_base;
        case "mud": return spr_el_mud;
        case "mud_rampart": return spr_el_mud_rampart;
        case "mud_sanctuary": return spr_el_mud_sanctuary;
        case "oasis": return spr_el_oasis;
        case "oasis_shrine": return spr_el_oasis_shrine;
        case "oasis_tower": return spr_el_oasis_tower;
        case "oasis_vision": return spr_el_oasis_vision;
        case "observatory": return spr_el_observatory;
        case "obsidian": return spr_el_obsidian;
        case "ocean": return spr_el_ocean;
        case "oil_lamp": return spr_el_oil_lamp;
        case "omen_breeze": return spr_el_omen_breeze;
        case "omen_squall": return spr_el_omen_squall;
        case "orchard": return spr_el_orchard;
        case "orchard_terrace": return spr_el_orchard_terrace;
        case "ore": return spr_el_ore;
        case "painted_frieze": return spr_el_painted_frieze;
        case "palace_inlay": return spr_el_palace_inlay;
        case "palace_wall": return spr_el_palace_wall;
        case "pearl_pool": return spr_el_pearl_pool;
        case "peat": return spr_el_peat;
        case "peat_bank": return spr_el_peat_bank;
        case "peat_smoke": return spr_el_peat_smoke;
        case "perfume_breeze": return spr_el_perfume_breeze;
        case "perfumed_air": return spr_el_perfumed_air;
        case "permafrost": return spr_el_permafrost;
        case "petal_gale": return spr_el_petal_gale;
        case "phoenix": return spr_el_phoenix;
        case "pitch_torch": return spr_el_pitch_torch;
        case "plant": return spr_el_plant;
        case "plasma": return spr_el_plasma;
        case "plateau": return spr_el_plateau;
        case "plow_field": return spr_el_plow_field;
        case "pollen_drift": return spr_el_pollen_drift;
        case "porcelain": return spr_el_porcelain;
        case "pottery": return spr_el_pottery;
        case "prayer_chant": return spr_el_prayer_chant;
        case "prism_pool": return spr_el_prism_pool;
        case "pump_cart": return spr_el_pump_cart;
        case "pumpworks": return spr_el_pumpworks;
        case "pure_water": return spr_el_pure_water;
        case "quench_metal": return spr_el_quench_metal;
        case "rain": return spr_el_rain;
        case "rain_barge": return spr_el_rain_barge;
        case "rain_garden": return spr_el_rain_garden;
        case "rain_reader": return spr_el_rain_reader;
        case "rain_song": return spr_el_rain_song;
        case "rainbow": return spr_el_rainbow;
        case "rainbow_flame": return spr_el_rainbow_flame;
        case "rampart": return spr_el_rampart;
        case "reed_city": return spr_el_reed_city;
        case "reed_marsh": return spr_el_reed_marsh;
        case "reed_pool": return spr_el_reed_pool;
        case "reedwater": return spr_el_reedwater;
        case "reef_stone": return spr_el_reef_stone;
        case "reflecting_pool": return spr_el_reflecting_pool;
        case "rice_paddy": return spr_el_rice_paddy;
        case "ridge_wind": return spr_el_ridge_wind;
        case "ringing_anvil": return spr_el_ringing_anvil;
        case "ringing_shard": return spr_el_ringing_shard;
        case "ritual_bowl": return spr_el_ritual_bowl;
        case "river": return spr_el_river;
        case "river_breeze": return spr_el_river_breeze;
        case "river_mill": return spr_el_river_mill;
        case "river_oath": return spr_el_river_oath;
        case "river_pass": return spr_el_river_pass;
        case "river_reed": return spr_el_river_reed;
        case "river_song": return spr_el_river_song;
        case "river_source": return spr_el_river_source;
        case "rocket": return spr_el_rocket;
        case "root_grove": return spr_el_root_grove;
        case "royal_edict": return spr_el_royal_edict;
        case "royal_garden": return spr_el_royal_garden;
        case "sacred_bloom": return spr_el_sacred_bloom;
        case "sacred_firewood": return spr_el_sacred_firewood;
        case "sacred_pool": return spr_el_sacred_pool;
        case "sail_lock": return spr_el_sail_lock;
        case "salt": return spr_el_salt;
        case "salt_cistern": return spr_el_salt_cistern;
        case "salt_pan": return spr_el_salt_pan;
        case "salt_road": return spr_el_salt_road;
        case "salt_steam": return spr_el_salt_steam;
        case "sand": return spr_el_sand;
        case "sand_devil": return spr_el_sand_devil;
        case "sandstone": return spr_el_sandstone;
        case "sandstone_pillar": return spr_el_sandstone_pillar;
        case "sandstorm": return spr_el_sandstorm;
        case "sap": return spr_el_sap;
        case "scented_oil": return spr_el_scented_oil;
        case "sculpture": return spr_el_sculpture;
        case "sea_gale": return spr_el_sea_gale;
        case "sea_song": return spr_el_sea_song;
        case "sealant": return spr_el_sealant;
        case "seed": return spr_el_seed;
        case "shadow": return spr_el_shadow;
        case "shardstorm": return spr_el_shardstorm;
        case "shimmerwind": return spr_el_shimmerwind;
        case "shore_breeze": return spr_el_shore_breeze;
        case "shrine_base": return spr_el_shrine_base;
        case "signal_fire_dock": return spr_el_signal_fire_dock;
        case "signal_forge": return spr_el_signal_forge;
        case "signal_pyre": return spr_el_signal_pyre;
        case "silt_field": return spr_el_silt_field;
        case "singing_monument": return spr_el_singing_monument;
        case "sky_bridge": return spr_el_sky_bridge;
        case "sky_roar": return spr_el_sky_roar;
        case "sky_sapphire": return spr_el_sky_sapphire;
        case "sky_scope": return spr_el_sky_scope;
        case "skyforge": return spr_el_skyforge;
        case "skyforge_dock": return spr_el_skyforge_dock;
        case "skyport": return spr_el_skyport;
        case "sludge": return spr_el_sludge;
        case "smeltery": return spr_el_smeltery;
        case "smoke": return spr_el_smoke;
        case "smoke_beacon": return spr_el_smoke_beacon;
        case "smoke_plume": return spr_el_smoke_plume;
        case "smoke_seal": return spr_el_smoke_seal;
        case "smoke_vent": return spr_el_smoke_vent;
        case "snow_drift": return spr_el_snow_drift;
        case "snowmelt": return spr_el_snowmelt;
        case "soap": return spr_el_soap;
        case "solar_cult": return spr_el_solar_cult;
        case "songflame": return spr_el_songflame;
        case "soot": return spr_el_soot;
        case "soot_rain": return spr_el_soot_rain;
        case "soot_water": return spr_el_soot_water;
        case "sootstorm": return spr_el_sootstorm;
        case "source_stone": return spr_el_source_stone;
        case "spa_mist": return spr_el_spa_mist;
        case "spark_chimney": return spr_el_spark_chimney;
        case "sparkseed": return spr_el_sparkseed;
        case "spillway": return spr_el_spillway;
        case "spore_gust": return spr_el_spore_gust;
        case "spore_wind": return spr_el_spore_wind;
        case "spring": return spr_el_spring;
        case "spring_channel": return spr_el_spring_channel;
        case "spring_house": return spr_el_spring_house;
        case "stairway_of_heaven": return spr_el_stairway_of_heaven;
        case "standing_bell": return spr_el_standing_bell;
        case "star_beacon": return spr_el_star_beacon;
        case "static_hum": return spr_el_static_hum;
        case "steam": return spr_el_steam;
        case "steam_hammer": return spr_el_steam_hammer;
        case "steam_launch": return spr_el_steam_launch;
        case "steam_room": return spr_el_steam_room;
        case "steamburst": return spr_el_steamburst;
        case "steamwood": return spr_el_steamwood;
        case "steel_seed": return spr_el_steel_seed;
        case "stepwell": return spr_el_stepwell;
        case "stone_choir": return spr_el_stone_choir;
        case "stone_dais": return spr_el_stone_dais;
        case "stone_moss": return spr_el_stone_moss;
        case "stone_relief": return spr_el_stone_relief;
        case "storm": return spr_el_storm;
        case "storm_call": return spr_el_storm_call;
        case "storm_glass": return spr_el_storm_glass;
        case "stormcloud": return spr_el_stormcloud;
        case "stormfront": return spr_el_stormfront;
        case "stormwater": return spr_el_stormwater;
        case "sulfur": return spr_el_sulfur;
        case "sun_altar": return spr_el_sun_altar;
        case "sun_banner": return spr_el_sun_banner;
        case "sun_beam": return spr_el_sun_beam;
        case "sun_chart": return spr_el_sun_chart;
        case "sun_disc": return spr_el_sun_disc;
        case "sun_pool": return spr_el_sun_pool;
        case "sun_reef": return spr_el_sun_reef;
        case "sun_rocket": return spr_el_sun_rocket;
        case "sun_shell": return spr_el_sun_shell;
        case "sun_shrine": return spr_el_sun_shrine;
        case "sun_spire": return spr_el_sun_spire;
        case "sun_statue": return spr_el_sun_statue;
        case "suncore": return spr_el_suncore;
        case "sunken_bank": return spr_el_sunken_bank;
        case "sunrise_arch": return spr_el_sunrise_arch;
        case "swamp": return spr_el_swamp;
        case "swamp_mist": return spr_el_swamp_mist;
        case "tablet": return spr_el_tablet;
        case "tar": return spr_el_tar;
        case "tar_pit": return spr_el_tar_pit;
        case "tear_jewel": return spr_el_tear_jewel;
        case "tempered_ingot": return spr_el_tempered_ingot;
        case "temple_spire": return spr_el_temple_spire;
        case "temple_step": return spr_el_temple_step;
        case "terrace_farm": return spr_el_terrace_farm;
        case "terrace_stone": return spr_el_terrace_stone;
        case "thresh_draft": return spr_el_thresh_draft;
        case "thresh_engine": return spr_el_thresh_engine;
        case "threshing_wind": return spr_el_threshing_wind;
        case "thunder_peak": return spr_el_thunder_peak;
        case "thunder_plain": return spr_el_thunder_plain;
        case "thunderforge": return spr_el_thunderforge;
        case "thunderhead": return spr_el_thunderhead;
        case "thunderstone": return spr_el_thunderstone;
        case "tide_pool": return spr_el_tide_pool;
        case "tiled_foundation": return spr_el_tiled_foundation;
        case "tonic": return spr_el_tonic;
        case "torch_post": return spr_el_torch_post;
        case "torchwood": return spr_el_torchwood;
        case "tower_base": return spr_el_tower_base;
        case "tower_foundation": return spr_el_tower_foundation;
        case "tower_of_babylon": return spr_el_tower_of_babylon;
        case "tractor": return spr_el_tractor;
        case "travertine": return spr_el_travertine;
        case "tree": return spr_el_tree;
        case "trial_by_fire": return spr_el_trial_by_fire;
        case "turbine": return spr_el_turbine;
        case "turf_gust": return spr_el_turf_gust;
        case "vane_tower": return spr_el_vane_tower;
        case "vapor_trail": return spr_el_vapor_trail;
        case "vapor_whorl": return spr_el_vapor_whorl;
        case "veil": return spr_el_veil;
        case "volcano": return spr_el_volcano;
        case "wall": return spr_el_wall;
        case "war_banner": return spr_el_war_banner;
        case "warm_breeze": return spr_el_warm_breeze;
        case "warning_wind": return spr_el_warning_wind;
        case "watch_post": return spr_el_watch_post;
        case "water": return spr_el_water;
        case "water_gleam": return spr_el_water_gleam;
        case "water_jar": return spr_el_water_jar;
        case "waterwheel": return spr_el_waterwheel;
        case "wet_tablet": return spr_el_wet_tablet;
        case "whisper_leaf": return spr_el_whisper_leaf;
        case "whisper_script": return spr_el_whisper_script;
        case "white_lotus": return spr_el_white_lotus;
        case "whiteout": return spr_el_whiteout;
        case "willow": return spr_el_willow;
        case "wind": return spr_el_wind;
        case "wind_harp": return spr_el_wind_harp;
        case "wind_organ": return spr_el_wind_organ;
        case "wind_vane": return spr_el_wind_vane;
        case "windmill": return spr_el_windmill;
        default: return -1;
    }
}

var in_mix_screen = !variable_global_exists("game_screen") || (global.game_screen == "mix");

function find_overlapping_icon(_self, _radius) {
    var nearest_icon = noone;
    var nearest_distance = 1000000;

    with (obj_icon) {
        if (id != _self) {
            var dist = point_distance(x, y, _self.x, _self.y);
            if (dist <= _radius) {
                if ((nearest_icon == noone) || (dist < nearest_distance)) {
                    nearest_icon = id;
                    nearest_distance = dist;
                }
            }
        }
    }

    return nearest_icon;
}

var element_lower = string_lower(element_name);
if (icon_resolved_name != element_lower) {
    var sprite_name = "spr_el_" + element_lower;
    icon_sprite = resolve_element_sprite(element_lower);
    has_custom_icon = (icon_sprite != -1) && sprite_exists(icon_sprite);
    if (has_custom_icon) {
        sprite_index = icon_sprite;
    } else {
        sprite_index = -1;
    }
    icon_resolved_name = element_lower;
}

var click_radius = 34;
var combine_radius = 56;

if (!in_mix_screen) {
    dragging = false;
    exit;
}

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

        var other_icon = find_overlapping_icon(id, combine_radius);

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

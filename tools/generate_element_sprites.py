import hashlib
import json
import math
import re
import uuid
from pathlib import Path

from PIL import Image, ImageDraw


ROOT = Path(__file__).resolve().parents[1]
ROOM_CODE = ROOT / "rooms" / "rm_lvl1" / "RoomCreationCode.gml"
STEP_CODE = ROOT / "objects" / "obj_icon" / "Step_0.gml"
PROJECT_FILE = ROOT / "BabilonsTower.yyp"
ORDER_FILE = ROOT / "BabilonsTower.resource_order"
SPRITES_FOLDER_FILE = ROOT / "folders" / "Sprites.yy"
SPRITES_DIR = ROOT / "sprites"

ICON_SIZE = 64
ICON_CENTER = ICON_SIZE // 2


def load_gm_json(path: Path):
    text = path.read_text(encoding="utf-8")
    text = re.sub(r",(\s*[}\]])", r"\1", text)
    return json.loads(text)


def save_gm_json(path: Path, data):
    path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")


def collect_elements():
    text = ROOM_CODE.read_text(encoding="utf-8")
    items = set()

    for a, b, c in re.findall(r'add_recipe\("([^"]+)", "([^"]+)", "([^"]+)"\)', text):
        items.update([a, b, c])

    for a, b, c, d in re.findall(r'add_recipe_split\("([^"]+)", "([^"]+)", "([^"]+)", "([^"]+)"\)', text):
        items.update([a, b, c, d])

    for s, f, w, e, wi in re.findall(
        r'add_recipe_set\("([^"]+)", "([^"]+)", "([^"]+)", "([^"]+)", "([^"]+)"\)',
        text,
    ):
        items.update([s, f, w, e, wi])

    return sorted(items)


def has_token(name: str, token: str) -> bool:
    return token in name


def icon_palette(name: str):
    if any(has_token(name, t) for t in ["fire", "lava", "ember", "flare", "phoenix", "meteor", "sulfur", "boil", "plasma", "suncore", "torch", "hearth", "smelter"]):
        return ((92, 16, 10), (219, 77, 28), (255, 203, 94))
    if any(has_token(name, t) for t in ["water", "rain", "river", "ocean", "dew", "spring", "downpour", "glacier", "ice", "pool", "basin", "cistern"]):
        return ((16, 49, 91), (54, 145, 214), (186, 236, 255))
    if any(has_token(name, t) for t in ["cloud", "fog", "mist", "steam", "smoke", "veil", "blizzard", "vapor"]):
        return ((58, 70, 88), (142, 158, 178), (241, 247, 255))
    if any(has_token(name, t) for t in ["earth", "mud", "dust", "sand", "clay", "brick", "pottery", "tablet", "desert", "dune", "canyon", "mountain", "plateau", "wall", "ore", "stone", "mesa", "terrace", "foundation"]):
        return ((77, 53, 31), (155, 112, 63), (230, 198, 140))
    if any(has_token(name, t) for t in ["obsidian", "ash", "soot", "tar", "shadow", "coal", "black", "night"]):
        return ((22, 24, 30), (74, 78, 90), (182, 189, 198))
    if any(has_token(name, t) for t in ["plant", "tree", "seed", "moss", "willow", "algae", "fertilizer", "peat", "bog", "swamp", "orchard", "garden", "grove", "leaf", "reed", "bloom", "lotus"]):
        return ((22, 67, 29), (74, 168, 74), (196, 242, 150))
    if any(has_token(name, t) for t in ["wind", "storm", "hurricane", "airship", "avalanche", "gale", "sky", "breeze", "cloudship"]):
        return ((30, 58, 84), (113, 172, 221), (229, 246, 255))
    if any(has_token(name, t) for t in ["lightning", "thunder", "electrolyte", "arc", "charged", "static"]):
        return ((44, 49, 84), (255, 214, 71), (255, 247, 186))
    if any(has_token(name, t) for t in ["glass", "crystal", "gem", "lens", "mirror", "porcelain", "ceramic", "fulgurite", "prism", "opal", "jewel"]):
        return ((38, 72, 80), (115, 204, 214), (227, 253, 255))
    if any(has_token(name, t) for t in ["engine", "tractor", "turbine", "rocket", "chimney", "anvil", "forge", "mill", "pump", "gear", "boiler"]):
        return ((56, 57, 62), (146, 151, 160), (247, 196, 73))
    if any(has_token(name, t) for t in ["acid", "sludge", "lye", "marsh_gas", "caustic", "alkali"]):
        return ((42, 65, 15), (132, 192, 46), (229, 255, 120))

    h = int(hashlib.sha1(name.encode("utf-8")).hexdigest(), 16)
    hue = h % 360
    return hsv_triplet(hue)


def hsv_triplet(hue: int):
    import colorsys

    c1 = colorsys.hsv_to_rgb(hue / 360.0, 0.7, 0.35)
    c2 = colorsys.hsv_to_rgb(((hue + 18) % 360) / 360.0, 0.75, 0.78)
    c3 = colorsys.hsv_to_rgb(((hue + 36) % 360) / 360.0, 0.35, 1.0)
    return tuple(tuple(int(channel * 255) for channel in color) for color in (c1, c2, c3))


def icon_motif(name: str):
    if any(has_token(name, t) for t in ["fire", "lava", "ember", "flare", "phoenix", "meteor", "sulfur", "plasma", "suncore", "torch", "hearth"]):
        return "flame"
    if any(has_token(name, t) for t in ["water", "rain", "river", "ocean", "dew", "spring", "downpour", "ice", "pool", "basin", "cistern"]):
        return "drop"
    if any(has_token(name, t) for t in ["cloud", "fog", "mist", "steam", "smoke", "veil", "vapor"]):
        return "cloud"
    if any(has_token(name, t) for t in ["earth", "mud", "dust", "sand", "clay", "brick", "pottery", "tablet", "desert", "dune", "wall", "stone", "foundation"]):
        return "stone"
    if any(has_token(name, t) for t in ["mountain", "volcano", "island", "plateau", "geyser", "mesa", "canyon", "ridge", "hill"]):
        return "peak"
    if any(has_token(name, t) for t in ["plant", "tree", "seed", "moss", "willow", "algae", "orchard", "garden", "grove", "leaf", "lotus", "reed", "bloom"]):
        return "leaf"
    if any(has_token(name, t) for t in ["wind", "storm", "hurricane", "airship", "blizzard", "avalanche", "gale", "breeze", "sky", "cloudship"]):
        return "swirl"
    if any(has_token(name, t) for t in ["lightning", "thunder", "electrolyte", "arc", "charged", "static"]):
        return "bolt"
    if any(has_token(name, t) for t in ["glass", "crystal", "gem", "lens", "mirror", "porcelain", "ceramic", "fulgurite", "prism", "opal", "jewel"]):
        return "crystal"
    if any(has_token(name, t) for t in ["engine", "tractor", "turbine", "rocket", "chimney", "anvil", "forge", "mill", "pump", "boiler"]):
        return "gear"
    if any(has_token(name, t) for t in ["obsidian", "ash", "soot", "tar", "shadow", "coal", "shard"]):
        return "shard"
    if any(has_token(name, t) for t in ["acid", "sludge", "lye", "marsh_gas", "caustic", "alkali"]):
        return "toxic"
    if any(has_token(name, t) for t in ["tower", "spire", "pillar", "monolith", "arch", "gate", "wall", "temple", "ziggurat"]):
        return "tower"
    if any(has_token(name, t) for t in ["road", "route", "bridge", "causeway", "lock", "canal", "aqueduct"]):
        return "road"
    return "sigil"


def draw_badge(draw: ImageDraw.ImageDraw, palette):
    bg, accent, detail = palette
    draw.ellipse((4, 4, 60, 60), fill=bg)
    draw.ellipse((9, 9, 55, 55), fill=accent)
    draw.ellipse((14, 14, 50, 50), fill=detail)


def polygon_points(points):
    return [(int(x), int(y)) for x, y in points]


def draw_motif(draw: ImageDraw.ImageDraw, name: str, palette):
    _, accent, detail = palette
    motif = icon_motif(name)

    if motif == "flame":
        draw.polygon(polygon_points([(32, 12), (20, 42), (30, 32), (44, 42)]), fill=accent)
        draw.polygon(polygon_points([(32, 20), (26, 38), (32, 34), (38, 38)]), fill=detail)
    elif motif == "drop":
        draw.polygon(polygon_points([(32, 12), (22, 30), (42, 30)]), fill=accent)
        draw.ellipse((20, 24, 44, 48), fill=accent)
        draw.ellipse((25, 26, 32, 33), fill=detail)
    elif motif == "cloud":
        draw.ellipse((16, 24, 34, 40), fill=accent)
        draw.ellipse((24, 18, 44, 38), fill=accent)
        draw.ellipse((34, 24, 50, 40), fill=accent)
        draw.rounded_rectangle((16, 28, 48, 42), radius=6, fill=accent)
        draw.rectangle((24, 44, 40, 46), fill=detail)
    elif motif == "stone":
        draw.rounded_rectangle((18, 22, 46, 42), radius=4, fill=accent)
        draw.line((24, 26, 38, 36), fill=detail, width=2)
        draw.line((22, 36, 34, 36), fill=detail, width=2)
    elif motif == "peak":
        draw.polygon(polygon_points([(16, 42), (28, 18), (40, 42)]), fill=accent)
        draw.polygon(polygon_points([(28, 42), (38, 24), (50, 42)]), fill=accent)
        draw.polygon(polygon_points([(26, 24), (30, 18), (34, 24)]), fill=detail)
    elif motif == "leaf":
        draw.ellipse((20, 18, 40, 46), fill=accent)
        draw.line((30, 40, 38, 20), fill=detail, width=2)
        draw.line((31, 32, 38, 28), fill=detail, width=2)
    elif motif == "swirl":
        draw.ellipse((18, 18, 46, 46), fill=accent)
        draw.ellipse((26, 18, 46, 38), fill=palette[2])
        draw.arc((14, 20, 50, 48), start=20, end=250, fill=accent, width=3)
    elif motif == "bolt":
        draw.polygon(polygon_points([(30, 16), (38, 30), (33, 30), (36, 48), (24, 34), (29, 34)]), fill=accent)
        draw.ellipse((40, 18, 46, 24), fill=detail)
    elif motif == "crystal":
        draw.polygon(polygon_points([(32, 14), (20, 28), (26, 48), (38, 48), (44, 28)]), fill=accent)
        draw.line((32, 16, 32, 46), fill=detail, width=2)
    elif motif == "gear":
        draw.ellipse((22, 22, 42, 42), fill=accent)
        for box in [(28, 12, 36, 20), (28, 44, 36, 52), (12, 28, 20, 36), (44, 28, 52, 36)]:
            draw.rectangle(box, fill=accent)
        draw.ellipse((28, 28, 36, 36), fill=detail)
    elif motif == "shard":
        draw.polygon(polygon_points([(22, 48), (28, 14), (36, 40)]), fill=accent)
        draw.polygon(polygon_points([(34, 44), (40, 22), (48, 48)]), fill=accent)
        draw.line((28, 28, 39, 34), fill=detail, width=2)
    elif motif == "toxic":
        draw.ellipse((18, 26, 28, 36), fill=accent)
        draw.ellipse((28, 16, 38, 26), fill=accent)
        draw.ellipse((36, 26, 46, 36), fill=accent)
        draw.ellipse((29, 28, 35, 34), fill=detail)
    elif motif == "tower":
        draw.rounded_rectangle((24, 16, 40, 46), radius=3, fill=accent)
        draw.rectangle((22, 14, 42, 18), fill=detail)
        draw.rectangle((28, 26, 32, 30), fill=detail)
        draw.rectangle((32, 26, 36, 30), fill=detail)
    elif motif == "road":
        draw.polygon(polygon_points([(24, 16), (40, 16), (36, 48), (28, 48)]), fill=accent)
        draw.line((32, 18, 32, 46), fill=detail, width=2)
        draw.line((32, 20, 32, 24), fill=palette[0], width=2)
        draw.line((32, 28, 32, 32), fill=palette[0], width=2)
        draw.line((32, 36, 32, 40), fill=palette[0], width=2)
    else:
        draw.ellipse((22, 22, 42, 42), outline=accent, width=3)
        draw.line((22, 32, 42, 32), fill=detail, width=2)
        draw.line((32, 22, 32, 42), fill=detail, width=2)


def draw_variant_marks(draw: ImageDraw.ImageDraw, name: str, palette):
    h = int(hashlib.md5(name.encode("utf-8")).hexdigest(), 16)
    accent = palette[1]
    detail = palette[2]
    variant = h % 6

    if variant == 0:
        draw.ellipse((10, 10, 16, 16), fill=accent)
        draw.ellipse((48, 48, 54, 54), fill=detail)
    elif variant == 1:
        draw.line((16, 52, 48, 52), fill=accent, width=3)
    elif variant == 2:
        draw.arc((10, 10, 54, 54), start=210, end=330, fill=accent, width=3)
    elif variant == 3:
        draw.line((16, 16, 48, 48), fill=detail, width=2)
        draw.line((16, 48, 48, 16), fill=accent, width=2)
    elif variant == 4:
        for x in (14, 32, 50):
            draw.ellipse((x - 2, 50, x + 2, 54), fill=accent)
    else:
        draw.rectangle((12, 12, 18, 18), fill=detail)
        draw.rectangle((46, 12, 52, 18), fill=accent)


def make_sprite_image(name: str):
    palette = icon_palette(name)
    image = Image.new("RGBA", (ICON_SIZE, ICON_SIZE), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    draw_badge(draw, palette)
    draw_motif(draw, name, palette)
    draw_variant_marks(draw, name, palette)
    return image


def write_sprite_resource(element_name: str):
    sprite_name = f"spr_el_{element_name}"
    sprite_dir = SPRITES_DIR / sprite_name
    sprite_dir.mkdir(parents=True, exist_ok=True)

    frame_id = str(uuid.uuid4())
    layer_id = str(uuid.uuid4())
    keyframe_id = str(uuid.uuid4())

    image = make_sprite_image(element_name)
    image.save(sprite_dir / f"{frame_id}.png")

    layer_dir = sprite_dir / "layers" / layer_id
    layer_dir.mkdir(parents=True, exist_ok=True)
    image.save(layer_dir / f"{frame_id}.png")

    yy = {
        "$GMSprite": "v2",
        "%Name": sprite_name,
        "bboxMode": 0,
        "bbox_bottom": 59,
        "bbox_left": 4,
        "bbox_right": 59,
        "bbox_top": 4,
        "collisionKind": 1,
        "collisionTolerance": 0,
        "DynamicTexturePage": False,
        "edgeFiltering": False,
        "For3D": False,
        "frames": [
            {
                "$GMSpriteFrame": "v1",
                "%Name": frame_id,
                "name": frame_id,
                "resourceType": "GMSpriteFrame",
                "resourceVersion": "2.0",
            }
        ],
        "gridX": 0,
        "gridY": 0,
        "height": 64,
        "HTile": False,
        "layers": [
            {
                "$GMImageLayer": "",
                "%Name": layer_id,
                "blendMode": 0,
                "displayName": "default",
                "isLocked": False,
                "name": layer_id,
                "opacity": 100.0,
                "resourceType": "GMImageLayer",
                "resourceVersion": "2.0",
                "visible": True,
            }
        ],
        "name": sprite_name,
        "nineSlice": None,
        "origin": 4,
        "parent": {"name": "Sprites", "path": "folders/Sprites.yy"},
        "preMultiplyAlpha": False,
        "resourceType": "GMSprite",
        "resourceVersion": "2.0",
        "sequence": {
            "$GMSequence": "v1",
            "%Name": sprite_name,
            "autoRecord": True,
            "backdropHeight": 768,
            "backdropImageOpacity": 0.5,
            "backdropImagePath": "",
            "backdropWidth": 1366,
            "backdropXOffset": 0.0,
            "backdropYOffset": 0.0,
            "events": {
                "$KeyframeStore<MessageEventKeyframe>": "",
                "Keyframes": [],
                "resourceType": "KeyframeStore<MessageEventKeyframe>",
                "resourceVersion": "2.0",
            },
            "eventStubScript": None,
            "eventToFunction": {},
            "length": 1.0,
            "lockOrigin": False,
            "moments": {
                "$KeyframeStore<MomentsEventKeyframe>": "",
                "Keyframes": [],
                "resourceType": "KeyframeStore<MomentsEventKeyframe>",
                "resourceVersion": "2.0",
            },
            "name": sprite_name,
            "playback": 1,
            "playbackSpeed": 30.0,
            "playbackSpeedType": 0,
            "resourceType": "GMSequence",
            "resourceVersion": "2.0",
            "showBackdrop": True,
            "showBackdropImage": False,
            "timeUnits": 1,
            "tracks": [
                {
                    "$GMSpriteFramesTrack": "",
                    "builtinName": 0,
                    "events": [],
                    "inheritsTrackColour": True,
                    "interpolation": 1,
                    "isCreationTrack": False,
                    "keyframes": {
                        "$KeyframeStore<SpriteFrameKeyframe>": "",
                        "Keyframes": [
                            {
                                "$Keyframe<SpriteFrameKeyframe>": "",
                                "Channels": {
                                    "0": {
                                        "$SpriteFrameKeyframe": "",
                                        "Id": {"name": frame_id, "path": f"sprites/{sprite_name}/{sprite_name}.yy"},
                                        "resourceType": "SpriteFrameKeyframe",
                                        "resourceVersion": "2.0",
                                    }
                                },
                                "Disabled": False,
                                "id": keyframe_id,
                                "IsCreationKey": False,
                                "Key": 0.0,
                                "Length": 1.0,
                                "resourceType": "Keyframe<SpriteFrameKeyframe>",
                                "resourceVersion": "2.0",
                                "Stretch": False,
                            }
                        ],
                        "resourceType": "KeyframeStore<SpriteFrameKeyframe>",
                        "resourceVersion": "2.0",
                    },
                    "modifiers": [],
                    "name": "frames",
                    "resourceType": "GMSpriteFramesTrack",
                    "resourceVersion": "2.0",
                    "spriteId": None,
                    "trackColour": 0,
                    "tracks": [],
                    "traits": 0,
                }
            ],
            "visibleRange": None,
            "volume": 1.0,
            "xorigin": 32,
            "yorigin": 32,
        },
        "swatchColours": None,
        "swfPrecision": 0.5,
        "textureGroupId": {"name": "Default", "path": "texturegroups/Default"},
        "type": 0,
        "VTile": False,
        "width": 64,
    }
    save_gm_json(sprite_dir / f"{sprite_name}.yy", yy)


def update_project_files(elements):
    sprite_names = [f"spr_el_{name}" for name in elements]

    yyp = load_gm_json(PROJECT_FILE)
    static_resources = [entry for entry in yyp["resources"] if not entry["id"]["path"].startswith("sprites/") or entry["id"]["name"] == "SPR_Player"]
    sprite_resources = [{"id": {"name": name, "path": f"sprites/{name}/{name}.yy"}} for name in sprite_names]
    yyp["resources"] = static_resources[:-1] + sprite_resources + [static_resources[-1]]
    save_gm_json(PROJECT_FILE, yyp)

    order = load_gm_json(ORDER_FILE)
    static_order = [entry for entry in order["ResourceOrderSettings"] if not entry["path"].startswith("sprites/") or entry["name"] == "SPR_Player"]
    base_count = len(static_order)
    sprite_order = [
        {"name": name, "order": base_count + index + 1, "path": f"sprites/{name}/{name}.yy"}
        for index, name in enumerate(sprite_names)
    ]
    order["ResourceOrderSettings"] = static_order[:-1] + sprite_order + [static_order[-1]]
    save_gm_json(ORDER_FILE, order)

    folders = load_gm_json(SPRITES_FOLDER_FILE)
    folders["children"] = (
        [{"name": "SPR_Player", "path": "sprites/SPR_Player/SPR_Player.yy"}]
        + [{"name": name, "path": f"sprites/{name}/{name}.yy"} for name in sprite_names]
    )
    save_gm_json(SPRITES_FOLDER_FILE, folders)


def update_step_code(elements):
    cases = "\n".join([f'        case "{name}": return spr_el_{name};' for name in elements])
    replacement = (
        "function resolve_element_sprite(_element_name) {\n"
        "    switch (string_lower(_element_name)) {\n"
        f"{cases}\n"
        "        default: return -1;\n"
        "    }\n"
        "}\n"
    )

    text = STEP_CODE.read_text(encoding="utf-8")
    text = re.sub(
        r"function resolve_element_sprite\(_element_name\) \{\n.*?\n\}\n",
        replacement,
        text,
        count=1,
        flags=re.DOTALL,
    )
    text = re.sub(r"\n\s*show_debug_message\(\n.*?\n\s*\);\n", "\n", text, count=1, flags=re.DOTALL)
    STEP_CODE.write_text(text, encoding="utf-8")


def main():
    elements = collect_elements()
    for name in elements:
        write_sprite_resource(name)
    update_project_files(elements)
    update_step_code(elements)
    print(f"Generated {len(elements)} sprite resources.")


if __name__ == "__main__":
    main()

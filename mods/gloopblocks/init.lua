--[[
GloopBlocks
Originally written by GloopMaster
Licensed under WTFPL.

Maintained by VanessaE.

2013-12-15

--]]

-- Nodes

minetest.register_node("gloopblocks:shrubbery_large", {
	description = "Shrubbery",
	drawtype = "allfaces_optional",
	tiles = {"gloopblocks_shrubbery_top.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("gloopblocks:shrubbery", {
	description = "Shrubbery",
	drawtype = "nodebox",
	tiles = {
		"gloopblocks_shrubbery_top.png",
		"gloopblocks_shrubbery_bottom.png",
		"gloopblocks_shrubbery_sides.png"
	},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.312500,-0.500000,0.250000,-0.187500,-0.437500,0.375000}, --NodeBox 1
			{0.187500,-0.500000,-0.125000,0.312500,-0.437500,0.000000}, --NodeBox 2
			{0.000000,-0.500000,-0.312500,0.125000,-0.437500,-0.187500}, --NodeBox 3
			{-0.375000,-0.500000,-0.062500,-0.250000,-0.437500,0.062500}, --NodeBox 4
			{0.000000,-0.500000,-0.250000,0.125000,-0.437500,-0.125000}, --NodeBox 5
			{0.187500,-0.437500,-0.187500,0.375000,-0.375000,0.062500}, --NodeBox 6
			{-0.062500,-0.437500,0.125000,0.187500,-0.375000,0.375000}, --NodeBox 7
			{-0.062500,-0.437500,-0.375000,0.187500,-0.375000,-0.062500}, --NodeBox 8
			{-0.375000,-0.437500,0.187500,-0.125000,-0.375000,0.431179}, --NodeBox 9
			{-0.437500,-0.437500,-0.125000,-0.187500,-0.375000,0.125000}, --NodeBox 10
			{-0.437500,-0.375000,-0.437500,0.439966,-0.312500,0.420887}, --NodeBox 11
			{-0.500000,-0.312500,-0.500000,0.500000,0.500000,0.500000}, --NodeBox 12
			{0.000000,-0.500000,0.187500,0.125000,-0.437500,0.312500}, --NodeBox 13
		}
	}
})

minetest.register_node("gloopblocks:rainbow_block", {
	description = "Rainbow Block",
	tiles = {"gloopblocks_rainbow_block.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("gloopblocks:cement", {
	description = "Cement",
	tiles = {"gloopblocks_cement.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:evil_block", {
	description = "Evil Block",
	tiles = {"gloopblocks_evil_block.png"},
	light_source = 5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:pavement", {
	description = "Pavement",
	tiles = {"gloopblocks_pavement.png"},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:oerkki_block", {
	description = "Oerkki Block",
	paramtype2 = "facedir",
	tiles = {
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_tb.png", 
		"gloopblocks_oerkkiblock_sides.png", 
		"gloopblocks_oerkkiblock_sides.png", 
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_front.png"
	},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_brick_mossy", {
        description = "Mossy Stone Brick",
        tiles = {"gloopblocks_stone_brick_mossy.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_mossy", {
        description = "Mossy Stone",
        tiles = {"gloopblocks_stone_mossy.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
	drop = "default:mossycobble"
})

minetest.register_node("gloopblocks:cobble_road", {
        description = "Cobblestone Road Bed",
        tiles = {"gloopblocks_cobble_road.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:cobble_road_mossy", {
        description = "Mossy Cobblestone Road Bed",
        tiles = {"gloopblocks_cobble_road_mossy.png"},
        groups = {cracky=3, stone=1},
        sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:scaffolding", {
	description = "Wooden Scaffold",
	drawtype = "allfaces",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"gloopblocks_scaffold.png"},
	groups = {choppy=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		if itemstack and itemstack:get_name() == node.name then
			for i = 1,19 do
				if minetest.get_node({x=pos.x,y=pos.y-i,z=pos.z}).name == "gloopblocks:scaffolding" and scafffound ~= 0 and scafffound ~= 1 then
					local scafffound = 1
					return itemstack
				else
					break
				end
			end
			for i = 1,19 do
				if minetest.get_node({x=pos.x,y=pos.y+i,z=pos.z}).name == "air" and scaffworked ~= 1 and scaffworked ~= 0 then
					minetest.set_node({x=pos.x,y=pos.y+i,z=pos.z}, {name="gloopblocks:scaffolding"})
					local scaffworked = 1
					return ItemStack(tostring(itemstack:get_name().." "..tostring(itemstack:get_count()-1)))
				elseif minetest.get_node({x=pos.x,y=pos.y+i,z=pos.z}).name == "gloopblocks:scaffolding" then	
				else
					local scaffworked = 0
				end
			end
			if scaffworked == 1 then
				return ItemStack(tostring(itemstack:get_name().." "..tostring(itemstack:get_count()-1)))
			else
				return itemstack
			end
		else return itemstack end
	end,
})


minetest.register_alias("moreblocks:oerkkiblock", "gloopblocks:oerkki_block")

-- Stairs/slabs defs, conversion of normal -> mossy items

function gloopblocks_register_mossy_conversion(mossyobjects)
	for i in ipairs(mossyobjects) do
		minetest.register_abm({
			nodenames = { mossyobjects[i][1] },
			neighbors = {"default:water_source", "default:water_flowing"},
			interval = 120,
			chance = 50,
			action = function(pos, node)
				if minetest.find_node_near(pos, 2, "air") then
					local fdir = node.param2
					minetest.add_node(pos, {name = mossyobjects[i][2], param2 = fdir})
				end
			end,
		})
	end
end

if minetest.get_modpath("moreblocks") then

	local blocks = {
		{"Cement", "cement", "cement"},
		{"Evil Block", "evil", "evil_block"},
		{"Basalt", "basalt","basalt"},
		{"Pumice", "pumice","pumice"},
		{"Pavement", "pavement", "pavement"},
	}

	for i in ipairs(blocks) do
		local light = 0
		if blocks[i][1] == "Evil Block" then
			light = 5
		end
		register_stair_slab_panel_micro("gloopblocks", blocks[i][3], "gloopblocks:"..blocks[i][3], {cracky=2, not_in_creative_inventory=1}, {"gloopblocks_"..blocks[i][3]..".png"}, blocks[i][1], blocks[i][3], light)	
		table.insert(circular_saw.known_stairs, "gloopblocks:"..blocks[i][3])
	end

	register_stair_slab_panel_micro(
		"gloopblocks",
		"oerkki_block",
		"gloopblocks:oerkki_block",
		{cracky=2, not_in_creative_inventory=1},
		{"gloopblocks_oerkkiblock_tb.png",
		 "gloopblocks_oerkkiblock_tb.png", 
		 "gloopblocks_oerkkiblock_sides.png", 
		 "gloopblocks_oerkkiblock_sides.png", 
		 "gloopblocks_oerkkiblock_sides.png",
		 "gloopblocks_oerkkiblock_front.png"},
		"Oerkki Block",
		"oerkki_block",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:oerkki_block")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"stone_brick_mossy",
		"gloopblocks:stone_brick_mossy",
		{cracky=1, not_in_creative_inventory=1},
		{"gloopblocks_stone_brick_mossy.png"},
		"Mossy Stone Brick",
		"stone_brick_mossy",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:stone_brick_mossy")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"stone_mossy",
		"gloopblocks:stone_mossy",
		{cracky=1, not_in_creative_inventory=1},
		{"gloopblocks_stone_mossy.png"},
		"Mossy Stone",
		"stone_mossy",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:stone_mossy")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"cobble_road",
		"gloopblocks:cobble_road",
		{cracky=3, stone=1, not_in_creative_inventory=1},
		{"gloopblocks_cobble_road.png"},
		"Cobblestone Roadbed",
		"cobble_road",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:cobble_road")

	register_stair_slab_panel_micro(
		"gloopblocks",
		"cobble_road_mossy",
		"gloopblocks:cobble_road_mossy",
		{cracky=3, stone=1, not_in_creative_inventory=1},
		{"gloopblocks_cobble_road_mossy.png"},
		"Mossy Cobblestone Roadbed",
		"cobble_road_mossy",
		0
	)
	table.insert(circular_saw.known_stairs, "gloopblocks:cobble_road_mossy")

	local colorlist = {
		{"white",      "White"},
		{"grey",       "Grey"},
		{"black",      "Black"},
		{"red",        "Red"},
		{"yellow",     "Yellow"},
		{"green",      "Green"},
		{"cyan",       "Cyan"},
		{"blue",       "Blue"},
		{"magenta",    "Magenta"},
		{"orange",     "Orange"},
		{"violet",     "Violet"},
		{"brown",      "Brown"},
		{"pink",       "Pink"},
		{"dark_grey",  "Dark Grey"},
		{"dark_green", "Dark Green"},
	}

	for i in ipairs(colorlist) do
		local color = colorlist[i][1]
		local colordesc = colorlist[i][2]

		register_stair_slab_panel_micro( "wool", color, "wool:"..color,
			{ snappy=2, choppy=2, oddly_breakable_by_hand=3, flammable=3, wool=1, not_in_creative_inventory=1 },
			{ "wool_"..color..".png" },
			colordesc.." Wool",
			color,
			0
		)
		table.insert(circular_saw.known_stairs, "wool:"..color)
	end

	-- ABMs for mossy objects

	gloopblocks_register_mossy_conversion({
		{ "default:cobble", 						"default:mossycobble" },
		{ "default:stair_cobble", 					"default:stair_mossycobble" },
		{ "default:slab_cobble", 					"default:slab_mossycobble" },
		{ "moreblocks:stair_cobble", 				"moreblocks:stair_mossycobble" },
		{ "moreblocks:stair_cobble_inner", 			"moreblocks:stair_mossycobble_inner" },
		{ "moreblocks:stair_cobble_outer", 			"moreblocks:stair_mossycobble_outer" },
		{ "moreblocks:stair_cobble_half", 			"moreblocks:stair_mossycobble_half" },
		{ "moreblocks:slab_cobble_quarter", 		"moreblocks:slab_mossycobble_quarter" },
		{ "moreblocks:slab_cobble", 				"moreblocks:slab_mossycobble" },
		{ "moreblocks:slab_cobble_three_quarter", 	"moreblocks:slab_mossycobble_three_quarter" },
		{ "moreblocks:panel_cobble", 				"moreblocks:panel_mossycobble" },
		{ "moreblocks:micro_cobble", 				"moreblocks:micro_mossycobble" },
		{ "moreblocks:stair_cobble_alt", 			"moreblocks:stair_mossycobble_alt" },

		{ "gloopblocks:cobble_road", 				"gloopblocks:cobble_road_mossy" },
		{ "gloopblocks:stair_cobble_road", 			"gloopblocks:stair_cobble_road_mossy" },
		{ "gloopblocks:slab_cobble_road", 			"gloopblocks:slab_cobble_road_mossy" },
		{ "gloopblocks:stair_cobble_road", 			"gloopblocks:stair_cobble_road_mossy" },
		{ "gloopblocks:stair_cobble_road_inner", 	"gloopblocks:stair_cobble_road_mossy_inner" },
		{ "gloopblocks:stair_cobble_road_outer", 	"gloopblocks:stair_cobble_road_mossy_outer" },
		{ "gloopblocks:stair_cobble_road_half", 	"gloopblocks:stair_cobble_road_mossy_half" },
		{ "gloopblocks:slab_cobble_road_quarter", 	"gloopblocks:slab_cobble_road_mossy_quarter" },
		{ "gloopblocks:slab_cobble_road", 			"gloopblocks:slab_cobble_road_mossy" },
		{ "gloopblocks:slab_cobble_road_three_quarter",	"gloopblocks:slab_cobble_road_mossy_three_quarter" },
		{ "gloopblocks:panel_cobble_road", 			"gloopblocks:panel_cobble_road_mossy" },
		{ "gloopblocks:micro_cobble_road", 			"gloopblocks:micro_cobble_road_mossy" },
		{ "gloopblocks:stair_cobble_road_alt", 		"gloopblocks:stair_cobble_road_mossy_alt" },

		{ "default:stonebrick", 					"gloopblocks:stone_brick_mossy" },
		{ "default:stair_stonebrick", 				"gloopblocks:stair_stone_brick_mossy" },
		{ "default:slab_stonebrick", 				"gloopblocks:slab_stone_brick_mossy" },
		{ "moreblocks:stair_stonebrick", 			"gloopblocks:stair_stone_brick_mossy" },
		{ "moreblocks:stair_stonebrick_inner", 		"gloopblocks:stair_stone_brick_mossy_inner" },
		{ "moreblocks:stair_stonebrick_outer", 		"gloopblocks:stair_stone_brick_mossy_outer" },
		{ "moreblocks:stair_stonebrick_half", 		"gloopblocks:stair_stone_brick_mossy_half" },
		{ "moreblocks:slab_stonebrick_quarter", 	"gloopblocks:slab_stone_brick_mossy_quarter" },
		{ "moreblocks:slab_stonebrick", 			"gloopblocks:slab_stone_brick_mossy" },
		{ "moreblocks:slab_stonebrick_three_quarter", "gloopblocks:slab_stone_brick_mossy_three_quarter" },
		{ "moreblocks:panel_stonebrick", 			"gloopblocks:panel_stone_brick_mossy" },
		{ "moreblocks:micro_stonebrick", 			"gloopblocks:micro_stone_brick_mossy" },
		{ "moreblocks:stair_stonebrick_alt", 		"gloopblocks:stair_stone_brick_mossy_alt" },

		{ "default:stone", 							"gloopblocks:stone_mossy" },
		{ "default:stair_stone", 					"gloopblocks:stair_stone_mossy" },
		{ "default:slab_stone", 					"gloopblocks:slab_stone_mossy" },
		{ "moreblocks:stair_stone", 				"gloopblocks:stair_stone_mossy" },
		{ "moreblocks:stair_stone_inner", 			"gloopblocks:stair_stone_mossy_inner" },
		{ "moreblocks:stair_stone_outer", 			"gloopblocks:stair_stone_mossy_outer" },
		{ "moreblocks:stair_stone_half", 			"gloopblocks:stair_stone_mossy_half" },

		{ "moreblocks:slab_stone_quarter", 			"gloopblocks:slab_stone_mossy_quarter" },
		{ "moreblocks:slab_stone", 					"gloopblocks:slab_stone_mossy" },
		{ "moreblocks:slab_stone_three_quarter",	"gloopblocks:slab_stone_mossy_three_quarter" },
		{ "moreblocks:panel_stone", 				"gloopblocks:panel_stone_mossy" },
		{ "moreblocks:micro_stone", 				"gloopblocks:micro_stone_mossy" },
		{ "moreblocks:stair_stone_alt", 			"gloopblocks:stair_stone_mossy_alt" },
	})

elseif minetest.get_modpath("stairs") then

	--stairs.register_stair(subname, recipeitem, groups, images, description, sounds)

	-- stairs:xxxx_stone_mossy ; xxxx = stair or slab
	stairs.register_stair_and_slab("stone_mossy", "gloopblocks:stone_mossy",
			{cracky=3},
			{"gloopblocks_stone_mossy.png"},
			"Mossy Stone Stair",
			"Mossy Stone Slab",
			default.node_sound_stone_defaults())

	-- stairs:xxxx_mossycobble
	stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
			{cracky=3},
			{"default_mossycobble.png"},
			"Mossy Cobble Stair",
			"Mossy Cobble Slab",
			default.node_sound_stone_defaults())

	-- stairs:xxxx_stone_brick_mossy
	stairs.register_stair_and_slab("stone_brick_mossy", "gloopblocks:stone_brick_mossy",
			{cracky=3},
			{"gloopblocks_stone_brick_mossy.png"},
			"Mossy Stone Brick Stair",
			"Mossy Stone Brick Slab",
			default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road
	stairs.register_stair_and_slab("cobble_road", "gloopblocks:cobble_road",
			{cracky=3},
			{"gloopblocks_cobble_road.png"},
			"Cobble Roadbed Stair",
			"Cobble Roadbed Slab",
			default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road_mossy
	stairs.register_stair_and_slab("cobble_road_mossy", "gloopblocks:cobble_road_mossy",
			{cracky=3},
			{"gloopblocks_cobble_road_mossy.png"},
			"Mossy Cobble Roadbed Stair",
			"Mossy Cobble Roadbed Slab",
			default.node_sound_stone_defaults())

	gloopblocks_register_mossy_conversion({
		{ "default:cobble", 					"default:mossycobble" },
		{ "stairs:stair_cobble", 				"stairs:stair_mossycobble" },
		{ "stairs:slab_cobble", 				"stairs:slab_mossycobble" },
		{ "gloopblocks:cobble_road", 			"gloopblocks:cobble_road_mossy" },
		{ "stairs:stair_cobble_road", 			"stairs:stair_cobble_road_mossy" },
		{ "stairs:slab_cobble_road", 			"stairs:slab_cobble_road_mossy" },
		{ "default:stonebrick", 				"gloopblocks:stone_brick_mossy" },
		{ "stairs:stair_stonebrick", 			"stairs:stair_stone_brick_mossy" },
		{ "stairs:slab_stonebrick", 			"stairs:slab_stone_brick_mossy" },
		{ "default:stone", 						"gloopblocks:stone_mossy" },
		{ "stairs:stair_stone", 				"stairs:stair_stone_mossy" },
		{ "stairs:slab_stone", 					"stairs:slab_stone_mossy" },
	})

	minetest.register_alias("default:stair_mossycobble", "stairs:stair_mossycobble")
	minetest.register_alias("default:slab_mossycobble", "stairs:slab_mossycobble")
	minetest.register_alias("gloopblocks:stair_cobble_road", "stairs:stair_cobble_road")
	minetest.register_alias("gloopblocks:slab_cobble_road", "stairs:slab_cobble_road")
	minetest.register_alias("gloopblocks:stair_cobble_road_mossy", "stairs:stair_cobble_road_mossy")
	minetest.register_alias("gloopblocks:slab_cobble_road_mossy", "stairs:slab_cobble_road_mossy")
	minetest.register_alias("gloopblocks:stair_stone_brick_mossy", "stairs:stair_stone_brick_mossy")
	minetest.register_alias("gloopblocks:slab_stone_brick_mossy", "stairs:slab_stone_brick_mossy")
	minetest.register_alias("gloopblocks:stair_stone_mossy", "stairs:stair_stone_mossy")
	minetest.register_alias("gloopblocks:slab_stone_mossy", "stairs:slab_stone_mossy")

end

-- Tools

minetest.register_tool("gloopblocks:pick_cement", {
	description = "Cement Pickaxe",
	inventory_image = "gloopblocks_cement_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.50, [2]=1.40, [3]=0.90}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:shovel_cement", {
	description = "Cement Shovel",
	inventory_image = "gloopblocks_cement_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.60, [3]=0.45}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:axe_cement", {
	description = "Cement Axe",
	inventory_image = "gloopblocks_cement_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.30, [3]=0.80}, uses=25, maxlevel=2},
			fleshy={times={[2]=1.20, [3]=0.65}, uses=30, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:sword_cement", {
	description = "Cement Sword",
	inventory_image = "gloopblocks_cement_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=1.60, [2]=0.80, [3]=0.40}, uses=15, maxlevel=2},
			snappy={times={[2]=0.75, [3]=0.35}, uses=30, maxlevel=1},
			choppy={times={[3]=0.80}, uses=30, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("gloopblocks:pick_evil", {
	description = "Evil Pickaxe",
	inventory_image = "gloopblocks_evil_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.10, [2]=0.10, [3]=0.10}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:shovel_evil", {
	description = "Evil Shovel",
	inventory_image = "gloopblocks_evil_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:axe_evil", {
	description = "Evil Axe",
	inventory_image = "gloopblocks_evil_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2},
			fleshy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2} 
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:sword_evil", {
	description = "Evil Sword",
	inventory_image = "gloopblocks_evil_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			snappy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			choppy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=8},
	}
})

-- Other items

minetest.register_craftitem("gloopblocks:wet_cement", {
	description = "Wet Cement",
	inventory_image = "gloopblocks_wet_cement.png",
})

minetest.register_craftitem("gloopblocks:evil_stick", {
	description = "Evil Stick",
	inventory_image = "gloopblocks_evil_stick.png",
})

dofile(minetest.get_modpath("gloopblocks").."/crafts.lua")

print("Gloopblocks Loaded!")
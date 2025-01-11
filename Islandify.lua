-- Settings
local colors = {stone = BrickColor.new("Dark stone grey"), 
	dirt = BrickColor.new("Brown"), 
	darkstone = BrickColor.new("Smoky grey"),
	sand = BrickColor.new("Gold"),
	sandstone = BrickColor.new("Bright orange"),
	darksandstone = BrickColor.new("Neon orange"),
	
	snow = BrickColor.new("Institutional white"),
	deepsnow = BrickColor.new("Ghost grey"),
	ice = BrickColor.new("Pastel Blue"),
	deepice = BrickColor.new("Steel blue")
	
	
	}



--ICE DEPTH

local depthRatio = {
	[0] = {snow = 60, deepsnow = 40},
	[1] = {snow = 30, deepsnow = 70},
	[2] = {snow = 5, deepsnow = 85, ice = 10},
	[3] = {deepsnow = 70, ice = 30},
	[4] = {deepsnow = 50, ice = 40, deepice = 10},
	[5] = {deepsnow = 30, ice = 50, deepice = 20},

	["default"] = {deepsnow = 20, ice = 40, deepice = 40}
}



--DESERT DEPTH
--[[
local depthRatio = {
	[0] = {sand = 20, sandstone = 80},
	[1] = {sand = 8, sandstone = 92},
	[2] = {sand = 1, sandstone = 99},
	[3] = {sandstone = 100},
	[4] = {sandstone = 90, darksandstone = 10},
	[5] = {sandstone = 70, darksandstone = 30},

	["default"] = {sand = 0, sandstone = 60, darksandstone = 40}
}
]]



--DIRT DEPTH
	--[[
	local depthRatio = {
	[0] = {dirt = 98, stone = 2},
	[1] = {dirt = 95, stone = 5},
	[2] = {dirt = 85, stone = 15},
	[3] = {dirt = 50, stone = 50},
	[4] = {dirt = 10, stone = 90},
	[5] = {dirt = 3, stone = 70, darkstone = 27},

	["default"] = {dirt = 0, stone = 60, darkstone = 40}
} 
-- ]]



--Plugin stuff
local toolbar = plugin:CreateToolbar("BlockyIslands")
local pluginButton = toolbar:CreateButton(
	"Islandify", --Text that will appear below button
	"Random Blocky Islands", --Text that will appear if you hover your mouse on button
	"rbxassetid://138685274472129") --Button icon

local selection = game:GetService("Selection")



--Picks block type based on probabilty of depth
local function pickBlock(depth)
	local d = depth
	if (depthRatio[depth] == nil) then
		d = "default"
	end
	local t = depthRatio[d]
	
	local prev = nil
	
	for i,v in pairs(t) do
		local r = math.random(1,100)
		if (r <= v) then
			return colors[i]
		end
		prev = i
	end
	return colors[prev]
end

--- Places a column and unions it pretty cool right?
local function placeColumn(x, g_level, z, target_y, folder)
	local mainPart = nil
	local mainPartBool = true
	local partsArray = {}
	for y = 0, target_y do
		local part = Instance.new("Part")
		part.Size = Vector3.new(1,1,1)
		part.Anchored = true
		part.Parent = folder
		part.BrickColor = pickBlock(y)
		part.Position = Vector3.new(x, g_level - 1 - y, z)
		
		if (mainPartBool) then
			mainPart = part
			mainPartBool = false
		else
			table.insert(partsArray, part)
		end
	end
	local success, newUnion = pcall(function()
		return mainPart:UnionAsync(partsArray, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
	end)
	
	if success and newUnion then
		newUnion.Parent = folder
		for _,v in partsArray do
			v:Destroy()
		end
		mainPart:Destroy()
		return newUnion
	end
	return {}
end


--Some ugly logic, but works don't try to fix unless you're having a bad day already
pluginButton.Click:Connect(function()
	local selected = selection:Get()
	if (#selected == 1 and selected[1]:IsA("Part")) then
		local s = selected[1]
		
		s.Position = Vector3.new(math.floor(s.Position.X), math.floor(s.Position.Y), math.floor(s.Position.Z))
		s.Size = Vector3.new(math.floor(s.Size.X), math.floor(s.Size.Y), math.floor(s.Size.Z))
		
		if (s.Size.X % 2 == 0) then
			s.Size = Vector3.new(math.floor(s.Size.X + 1), math.floor(s.Size.Y), math.floor(s.Size.Z))
		end
		
		if (s.Size.Z % 2 == 0) then
			s.Size = Vector3.new(math.floor(s.Size.X), math.floor(s.Size.Y), math.floor(s.Size.Z + 1))
		end
		
		local outerFolder = s.Parent
		local innerFolder = Instance.new("Model")
		innerFolder.Parent = outerFolder
		
		innerFolder.Name = s.Name
		
		s.Parent = innerFolder
		
		local fromX = math.floor((s.Position.X - (s.Size.X - 1) * 0.5))
		local fromZ = math.floor((s.Position.Z - (s.Size.Z - 1) * 0.5))
		local toX = math.floor((s.Position.X + (s.Size.X - 1) * 0.5))
		local toZ =  math.floor((s.Position.Z + (s.Size.Z - 1) * 0.5))
		
		local groundLevel = s.Position.Y
		
		local bigBoyPart = nil
		local bigUnion = {}
		
			for x = fromX, toX  do
			local unionArray = {}
			local mainPart = nil
				for z = fromZ, toZ do
					--float value between 0 - 1 depecting how close it is to center
					local centerX = (fromX + toX) / 2
					local centerZ = (fromZ + toZ) / 2
					
					local distance = math.sqrt((x - centerX) ^ 2 + (z - centerZ) ^ 2)
					
					local ClosenessToCenter = (1 - (distance / ((s.Size.X + s.Size.Z) / 2 )))
										
					local y = math.min(math.random(1, math.floor(ClosenessToCenter * ((s.Size.X + s.Size.Z)))), math.random(1, math.floor(ClosenessToCenter * ((s.Size.X + s.Size.Z)))))
					
					local u = placeColumn(x, groundLevel, z,  y, innerFolder)
					
					if (mainPart == nil) then
						mainPart = u
					else
						table.insert(unionArray, u)
					end
				
				end
				
			local success, newUnion = pcall(function()
				return mainPart:UnionAsync(unionArray, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
			end)

			if success and newUnion then
				newUnion.Parent = innerFolder
				for _,v in unionArray do
					v:Destroy()
				end
				mainPart:Destroy()
			end
			
			if (bigBoyPart == nil) then
				bigBoyPart = newUnion
			else
				table.insert(bigUnion, newUnion)
			end
		end
			
			
		local success, newUnion = pcall(function()
			return bigBoyPart:UnionAsync(bigUnion, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
		end)

		if success and newUnion then
			newUnion.Parent = innerFolder
			for _,v in bigUnion do
				v:Destroy()
			end
			bigBoyPart:Destroy()
		end
			
	end
end)

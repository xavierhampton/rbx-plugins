--SETTINGS
local density = 20
local positionOffset = 3
local sizeOffset = 2

--Plugin stuff
local toolbar = plugin:CreateToolbar("Low Poly Rocks")
local pluginButton = toolbar:CreateButton(
	"LowPolyRocks", --Text that will appear below button
	"Random Blocky Islands", --Text that will appear if you hover your mouse on button
	"rbxassetid://138685274472129") --Button icon

local selection = game:GetService("Selection")
---

pluginButton.Click:Connect(function()
	local selected = selection:Get()
	local partTable = {}
	
	if (#selected == 1 and selected[1]:IsA("Part")) then
		local part = selected[1]
		
		local size = math.max(part.Size.X, part.Size.Y, part.Size.Z)
		part.Size = Vector3.new(size, size, size)
		
		for i = 0, density do
			local clone = part:Clone()
			clone.Parent = part.Parent
			table.insert(partTable, clone)
			
			local pos = CFrame.new(math.random(-positionOffset, positionOffset),0.25 * math.random(-positionOffset, positionOffset), math.random(-positionOffset, positionOffset))
			local ang = CFrame.Angles(math.rad(math.random(0,360)), math.rad(math.random(0,360)), math.rad(math.random(0,360)))
			
			clone.CFrame = part.CFrame * pos * ang
			clone.Size = Vector3.new(size + math.random(-sizeOffset, sizeOffset), size + math.random(-sizeOffset, sizeOffset), size + math.random(-sizeOffset, sizeOffset))
		end
		
		local success, newUnion = pcall(function()
			return part:UnionAsync(partTable, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
		end)
		
		if success and newUnion then
			newUnion.Parent = part.Parent
			for _,v in partTable do
				v:Destroy()
			end
			part:Destroy()
		end
		
	end
end)


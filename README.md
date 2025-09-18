# RBX-Plugins


These plugins are written to help automate repetitive tasks in Roblox Studio.


## Islandify

Create procedurally generated blocky islands. Using a selected part of height 1 as a base, the plugin generates a 3D island model by stacking blocks of varying materials based on depth. The type of island (e.g., icy, sandy, or earthy) can be customized by modifying the depthRatio table in the code. 

### Example
<img src="https://github.com/xavierhampton/rbx-plugins/blob/main/examples/IslandExamples.png">


**Features:**
- Converts a rectangular part into blocky terrain based on the island type.
- Combines parts into unions for better performance.

## LowPolyRocks

Create randomized low poly rocks. When activated, this plugin generates multiple low-poly rock formations based on a selected part's material, giving them a blocky, random appearance with varying sizes and positions.

### Example
<img src="https://github.com/xavierhampton/rbx-plugins/blob/main/examples/RockExamples.png">



**Features:**
- Randomly generates rock union to create a natural, blocky rock formation.
- Supports density settings for the number of rocks and offset options for position and size.
  

## Installation

To install any of the plugins, follow these steps:

1. **Download the Plugin Lua Script**:
   - Download the `.lua` script(s) of the plugin(s) you want to install.

2. **Move the Script to the Roblox Studio Plugins Folder**:
   - Locate the `Plugins` folder on your compute
     - **Windows**: `C:\Users\<YourUserName>\AppData\Local\Roblox\Plugins`
     - **Mac**: `/Users/<YourUserName>/Library/Application Support/Roblox/Plugins`
   
3. **Restart Roblox Studio**:
   - Once the plugin is in the correct folder, restart Roblox Studio to ensure it loads properly.
---

## Usage

Once the plugin is installed, you can access it from the Plugins tab within Roblox Studio. Each plugin will either provide a custom UI or interact with your project in some way, depending on its functionality.

---


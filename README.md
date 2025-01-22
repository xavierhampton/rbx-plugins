# RBX-Plugins

Welcome to my collection of Roblox Studio plugins! This repository is a growing ecosystem of tools and plugins designed to enhance and streamline my Roblox Studio development.

These plugins are written in Lua and are meant to help you automate repetitive tasks, add useful functionality to the Studio, and improve overall productivity.

## Table of Contents

### Plugins

- [Islandify](#islandify)
- [LowPolyRocks](#lowpolyrocks)

### Extra

- [Installation](#installation)
- [Usage](#usage)


---


## Islandify

This plugin is designed to create procedurally generated blocky islands. Using a selected part of height 1 as a base, the plugin generates a 3D island model by stacking blocks of varying materials based on depth. The type of island (e.g., icy, sandy, or earthy) can be customized by modifying the depthRatio table in the code. 

### Example
<img src="https://github.com/xavierhampton/RBX-Plugins/blob/main/examples/IslandExamples.png">


**Features:**
- Dynamic Terrain Generation: Converts a rectangular part into blocky terrain based on the island type.
- Efficient Unioning: Combines parts into unions for better performance and visual coherence.
- Toolbar Integration: Adds a toolbar named BlockyIslands with a button labeled Islandify.

## LowPolyRocks

This plugin allows you to create random low poly rocks by cloning and manipulating parts in your Roblox Studio workspace. When activated, the plugin generates multiple low-poly rock formations based on a selected part, giving them a blocky, random appearance with varying sizes and positions.

### Example


**Features:**
- Randomly adjusts the size, position, and rotation of the generated parts to create a natural, blocky rock formation.
- Supports density settings for the number of rocks and offset options for position and size.
- Automatically merges the generated rocks into a single union for easy handling.
  

**Settings:**
- ```density``` (default: 20): Determines how many rocks will be generated. Increase the number to add more rocks to the formation.
- ```positionOffset``` (default: 3): Controls the maximum variation in position for the generated rocks. Increasing this value will make the rocks spread out more.
- ```sizeOffset``` (default: 2): Controls the size variation of each generated rock. A higher value will create more diverse sizes for the rocks.


## Installation

To install any of the plugins, follow these steps:

1. **Download the Plugin Lua Script**:
   - Download the `.lua` script(s) of the plugin(s) you want to install.

2. **Move the Script to the Roblox Studio Plugins Folder**:
   - Locate the `Plugins` folder on your computer. This is usually located in:
     - **Windows**: `C:\Users\<YourUserName>\AppData\Local\Roblox\Plugins`
     - **Mac**: `/Users/<YourUserName>/Library/Application Support/Roblox/Plugins`
   
   - If the `Plugins` folder doesn't exist, you can manually create it.

3. **Place the Script in the Plugins Folder**:
   - Move the downloaded `.lua` script file into the `Plugins` folder.

4. **Restart Roblox Studio**:
   - Once the plugin is in the correct folder, restart Roblox Studio to ensure it loads properly.
---

## Usage

Once the plugin is installed, you can access it from the Plugins tab within Roblox Studio. Each plugin will either provide a custom UI or interact with your project in some way, depending on its functionality. Follow the instructions for each individual plugin above to learn how to use it effectively

---


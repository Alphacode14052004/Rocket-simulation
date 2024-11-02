# 🚀 2D Rocket Simulator

A simple 2D rocket simulation that demonstrates basic physics concepts using SDL2.

## 📋 Features

- **Vertical Flight Simulation**
  - Real-time physics calculations including:
    - Altitude-dependent gravity
    - Atmospheric drag with exponential density decay
    - Basic thrust mechanics
    - Fuel consumption
  
- **Visual Elements**
  - 2D rocket representation
  - Static cloud backgrounds
  - Fuel gauge
  - Altitude display
  - Crash animation with expanding explosion

- **Physics Parameters**
  - Initial mass: 500.0 kg
  - Fuel burn rate: 2.5 kg/s
  - Initial thrust: 15000.0 N
  - Drag coefficient: 0.1
  - Standard gravity: 9.81 m/s²

## 🛠️ Technical Requirements

- SDL2 library
- SDL2_ttf for text rendering
- C compiler
- TrueType font file (referenced as "your_font.ttf" in code)

## 🎮 Controls

The simulation runs automatically after launch. Close the window to exit.

## 💻 Display

- Window size: 800x600 pixels
- Rocket position scaled (1:10 ratio for altitude display)
- Real-time fuel and altitude indicators

## 🔧 Building the Project

1. Ensure SDL2 and SDL2_ttf are installed
2. Compile with:
   ```bash
   gcc rocket_sim.c -o rocket_sim -lSDL2 -lSDL2_ttf -lm
   ```
3. Place a TrueType font file named "your_font.ttf" in the same directory
4. Run the executable:
   ```bash
   ./rocket_sim
   ```

## 🔍 Technical Notes

- Simulation uses fixed time steps of 0.1 seconds
- Maximum simulation time: 300 seconds
- Sea-level air density: 1.225 kg/m³
- Exponential atmospheric density decay

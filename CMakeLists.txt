cmake_minimum_required(VERSION 3.10)
project(RocketSimulator)

# Set C standard
set(CMAKE_C_STANDARD 11)

# Find SDL2
find_package(SDL2 REQUIRED)

# Add executable
add_executable(rocket_simulator rocket_simulator.c)

# Link SDL2 library
target_link_libraries(rocket_simulator SDL2::SDL2 m)

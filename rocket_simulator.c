#include <SDL2/SDL.h>
#include <stdio.h>
#include <math.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define INITIAL_MASS 500.0
#define FUEL_BURN_RATE 2.5
#define INITIAL_THRUST 15000.0
#define TIME_STEP 0.1
#define MAX_TIME 300
#define DRAG_COEFFICIENT 0.1
#define SEA_LEVEL_DENSITY 1.225
#define GRAVITY 9.81

double calculate_drag(double altitude, double velocity) {
    double density = SEA_LEVEL_DENSITY * exp(-altitude / 8000.0);
    return 0.5 * DRAG_COEFFICIENT * density * velocity * velocity;
}

double calculate_gravity(double altitude) {
    return GRAVITY * pow((6371000.0 / (6371000.0 + altitude)), 2);
}

void draw_rocket(SDL_Renderer *renderer, int y_pos) {
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    SDL_Rect body = {SCREEN_WIDTH / 2 - 10, y_pos, 20, 50};
    SDL_RenderFillRect(renderer, &body);

    SDL_SetRenderDrawColor(renderer, 200, 0, 0, 255);
    SDL_RenderDrawLine(renderer, SCREEN_WIDTH / 2 - 10, y_pos, SCREEN_WIDTH / 2, y_pos - 20);
    SDL_RenderDrawLine(renderer, SCREEN_WIDTH / 2 + 10, y_pos, SCREEN_WIDTH / 2, y_pos - 20);

    SDL_SetRenderDrawColor(renderer, 150, 0, 0, 255);
    SDL_RenderDrawLine(renderer, SCREEN_WIDTH / 2 - 10, y_pos + 50, SCREEN_WIDTH / 2 - 20, y_pos + 70);
    SDL_RenderDrawLine(renderer, SCREEN_WIDTH / 2 + 10, y_pos + 50, SCREEN_WIDTH / 2 + 20, y_pos + 70);
}

void draw_cloud(SDL_Renderer *renderer, int x, int y) {
    SDL_SetRenderDrawColor(renderer, 200, 200, 200, 255);
    SDL_Rect cloud1 = {x, y, 40, 20};
    SDL_Rect cloud2 = {x + 20, y - 10, 50, 30};
    SDL_Rect cloud3 = {x + 40, y, 40, 20};

    SDL_RenderFillRect(renderer, &cloud1);
    SDL_RenderFillRect(renderer, &cloud2);
    SDL_RenderFillRect(renderer, &cloud3);
}

void draw_explosion(SDL_Renderer *renderer, int x, int y, int radius) {
    SDL_SetRenderDrawColor(renderer, 255, 69, 0, 255); // Orange-red color
    for (int r = 0; r < radius; r += 5) {
        for (int w = 0; w < 360; w += 10) {
            int x_offset = x + r * cos(w * M_PI / 180);
            int y_offset = y + r * sin(w * M_PI / 180);
            SDL_RenderDrawPoint(renderer, x_offset, y_offset);
        }
    }
}

int main() {
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "SDL initialization failed: %s\n", SDL_GetError());
        return 1;
    }
    SDL_Window *window = SDL_CreateWindow("Rocket Simulator", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    double altitude = 0.0;
    double velocity = 0.0;
    double time = 0.0;
    double mass = INITIAL_MASS;
    double fuel_mass = 200.0;

    int running = 1;
    int crashed = 0;
    int explosion_radius = 0;

    while (running && time <= MAX_TIME) {
        SDL_Event e;
        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_QUIT) {
                running = 0;
            }
        }

        if (!crashed) {
            double thrust = (fuel_mass > 0) ? INITIAL_THRUST : 0.0;
            if (fuel_mass > 0) {
                fuel_mass -= FUEL_BURN_RATE * TIME_STEP;
                if (fuel_mass < 0) fuel_mass = 0;
            }
            mass = INITIAL_MASS - (200.0 - fuel_mass);

            double gravity = calculate_gravity(altitude) * mass;
            double drag = calculate_drag(altitude, velocity);
            double net_force = thrust - gravity - drag;
            double acceleration = net_force / mass;

            velocity += acceleration * TIME_STEP;
            altitude += velocity * TIME_STEP;
            time += TIME_STEP;

            if (altitude <= 0) {
                crashed = 1;
                altitude = 0;  // Keep altitude zero on crash
            }
        }

        SDL_SetRenderDrawColor(renderer, 135, 206, 235, 255);
        SDL_RenderClear(renderer);

        // Draw higher clouds
        draw_cloud(renderer, 100, SCREEN_HEIGHT - 250);
        draw_cloud(renderer, 300, SCREEN_HEIGHT - 350);
        draw_cloud(renderer, 500, SCREEN_HEIGHT - 300);
        draw_cloud(renderer, 700, SCREEN_HEIGHT - 400);

        int y_pos = SCREEN_HEIGHT - (int)(altitude / 10.0);
        if (y_pos < 0) y_pos = 0;

        if (!crashed) {
            draw_rocket(renderer, y_pos);
        } else {
            draw_explosion(renderer, SCREEN_WIDTH / 2, y_pos, explosion_radius);
            explosion_radius += 5;
            if (explosion_radius > 100) {
                running = 0;  // End simulation after explosion
            }
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(50);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}


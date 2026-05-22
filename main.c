#include "raylib-5.0_macos/include/raylib.h"

int main(void) {
    InitWindow(800, 450, "Raylib Window");
    SetTargetFPS(60);
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawCircle(400, 225, 100, BLUE);
        DrawText("Big circle in the center!", 250, 400, 20, DARKGRAY);
        EndDrawing();
    }
    CloseWindow();
    return 0;
}

#include "raylib-5.0_macos/include/raylib.h"

void start_raylib_window() {
    InitWindow(800, 450, "ECL + Raylib");
    SetTargetFPS(60);
    
    // Usually, you might want to keep the window open for a bit
    // or return control to Lisp. For this test:
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Hello from Raylib + ECL!", 190, 200, 20, DARKGRAY);
        EndDrawing();
    }
    
    CloseWindow();
}
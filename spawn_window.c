#include "raylib-5.0_macos/include/raylib.h"

int main() {
    InitWindow(800, 600, "Simple Window");
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(BLACK);
        EndDrawing();
    }
    CloseWindow();
    return 0;
}

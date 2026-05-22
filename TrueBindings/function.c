#include "include/raylib.h"

void init_my_window(int w, int h, const char* title) { InitWindow(w, h, title); }
void close_my_window() { CloseWindow(); }
bool should_close() { return WindowShouldClose(); }
void begin_draw() { BeginDrawing(); }
void end_draw() { EndDrawing(); }
void clear_bg(unsigned int color) { ClearBackground(GetColor(color)); }
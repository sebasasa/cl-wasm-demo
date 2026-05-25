#include <stdlib.h>
#include "../include/raylib.h"

// Window & Timing
void init_my_window(int w, int h, const char* title) { InitWindow(w, h, title); }
void close_my_window() { CloseWindow(); }
bool should_close() { return WindowShouldClose(); }
void begin_draw() { BeginDrawing(); }
void end_draw() { EndDrawing(); }
float get_frame_time() { return GetFrameTime(); }

// Background
void clear_bg(unsigned int color) { ClearBackground(GetColor(color)); }

// Drawing: Shapes
void draw_rect(int x, int y, int w, int h, unsigned int c) { DrawRectangle(x, y, w, h, GetColor(c)); }
void draw_circle(int x, int y, float r, unsigned int c) { DrawCircle(x, y, r, GetColor(c)); }
void draw_line(int x1, int y1, int x2, int y2, unsigned int c) { DrawLine(x1, y1, x2, y2, GetColor(c)); }

// Drawing: Text
void draw_text(const char* t, int x, int y, int sz, unsigned int c) { DrawText(t, x, y, sz, GetColor(c)); }

// Input
bool is_key_down(int key) { return IsKeyDown(key); }
int get_mouse_x() { return GetMouseX(); }
int get_mouse_y() { return GetMouseY(); }

void set_target_fps(int fps) { SetTargetFPS(fps); }







// Added these ones to draw to a texture

static RenderTexture2D global_canvas;
static bool canvas_initialized = false;

void init_global_canvas(int w, int h) {
    if (!canvas_initialized) {
        global_canvas = LoadRenderTexture(w, h);
        canvas_initialized = true;
    }
}

void begin_global_canvas() { BeginTextureMode(global_canvas); }
void end_global_canvas() { EndTextureMode(); }

void draw_global_canvas(int x, int y) {
    Rectangle source = { 0, 0, (float)global_canvas.texture.width, -(float)global_canvas.texture.height };
    DrawTextureRec(global_canvas.texture, source, (Vector2){(float)x, (float)y}, WHITE);
}
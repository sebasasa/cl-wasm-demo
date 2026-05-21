# 🎨 Quicle (pronounced "Quick-CL")

> **Quick graphics, universal portability, infinite expression.** 

Quicle is a high-performance, ultra-portable creative coding engine built on **Common Lisp**. By leveraging **Embeddable Common Lisp (ECL)** to transpile Lisp code into optimized intermediate **C**, Quicle bridges the gap between the legendary, live-coding flexibility of Lisp and the universal deployment ecosystem of modern hardware and the web.

---

## 🚀 The Core Philosophy

Most creative coding frameworks force you to choose between two compromises:
1. **Dynamic Freedom but Slow/Stuttery:** Languages like JavaScript (p5.js) or Python are expressive but struggle with heavy computational rendering and Garbage Collection (GC) pauses.
2. **High Performance but Rigid/Slow Iteration:** Languages like C++ (openFrameworks) offer raw speed but force you into agonizing "compile-wait-run" feedback loops.

**Quicle offers a third way.** It brings the expressive power, macros, and live-REPL hacking of Common Lisp into a package that compiles down to lightweight, native binaries that can deploy virtually anywhere.

---

## 🏗️ Architectural Overview

Quicle treats C as a universal intermediate assembly language. 

```text
       [ Your Creative Code (Common Lisp) ]
                       │
                       ▼ (Via ECL Transpiler)
              [ Intermediate C Code ] 
                       │
      ┌────────────────┼────────────────┐
      ▼ (Via Native C)  ▼ (Via Emscripten)▼ (Via Clang/GCC)
 [ Desktop Native ]   [ WebAssembly ]   [ High-End Embedded ]
 (Windows/Mac/Linux)  (HTML5 Canvas/GL) (SBCs / Raspberry Pi)
   └─► Raylib/SDL2      └─► WebGL Ports    └─► Projectors/GPIO
```

### 1. The Rendering Backbone: Raylib & SDL2
Instead of reinventing windowing and graphics pipelines, Quicle interfaces directly with native C rendering engines like **Raylib** and **SDL2**. Common Lisp code maps cleanly to these APIs, giving you hardware-accelerated graphics (OpenGL/Vulkan), audio, and input out of the box.

### 2. Universal Web Deployment via WASM
Through Emscripten, Quicle targets WebAssembly (`.wasm`). 
* **Compiled Mode:** Your Lisp logic compiles to `.c`, and Emscripten builds an optimized WASM binary. Emscripten's built-in SDL2 virtual ports automatically translate graphics calls directly to HTML5 Canvas and WebGL.
* **WECL (Interpreted Mode):** For the web, Quicle can run ECL's bytecode interpreter inside the browser, enabling live, web-based REPL evaluation.

### 3. High-End Physical Installations
Because it targets standard C, Quicle runs flawlessly on Single Board Computers (SBCs) like the Raspberry Pi. This makes it perfect for digital art installations, driving projection mapping rigs, or interfacing with external hardware via GPIO pins.

---

## ✨ Features

* **Zero-GC Stutter:** Native compilation bypassing JVM-style runtime lags, guaranteeing a buttery-smooth 60+ FPS for interactive graphics and glitch-free audio generation.
* **True Live-Coding:** Modify math formulas, shader inputs, or logic loops inside a running application via the REPL without closing the window.
* **Deep Metaprogramming:** Utilize the full power of Common Lisp macros to build your own custom Domain Specific Languages (DSLs) for generative art and algorithmic music.
* **Micro-Footprint:** Compiles to tiny, lightweight standalone binaries independent of heavy external runtimes.

---

## 🛠️ Getting Started

*(Note: Detailed installation scripts coming soon as development progresses.)*

### Prerequisites
To build and hack on Quicle, you will need:
* A working C compiler (`gcc` or `clang`)
* [Embeddable Common Lisp (ECL)](https://gitlab.com)
* `raylib` or `libsdl2` development binaries installed on your host system
* [Emscripten SDK](https://emscripten.org) (only if targeting WebAssembly)

### Quick Conceptual Build Flow
To transpile and compile a Quicle sketch using ECL:

```bash
# 1. Transpile your Lisp sketch to standard C code using ECL
ecl -eval '(compile-file "sketch.lisp" :system-p t)'

# 2. Compile and link the intermediate C code with Raylib/SDL2
gcc intermediate_sketch.c -o my_artwork -lraylib -lecl -lm
```

---

## 🗺️ Roadmap & Ecosystem Matrix


| Target Platform | Rendering Engine | Pipeline Status | Live REPL Support |
| :--- | :--- | :--- | :--- |
| **Desktop (Win/Mac/Linux)** | Raylib / SDL2 | 🛠️ In Development | ✅ Full (Swank/Slime) |
| **Web Browser (WASM)** | WebGL (Emscripten) | 🔬 Conceptual | 🟡 Bytecode Interpreter |
| **SBCs (Raspberry Pi)** | Raylib (DRM/KMS) | 🛠️ In Development | ✅ Full |
| **Microcontrollers** | *Target uLisp instead*| ❌ Out of Scope | — |

---

## 🤝 Contributing

Quicle is an ambitious attempt to revitalize the creative coding paradigm. Whether you are an expert in Common Lisp FFIs, an Emscripten wizard, or a generative artist looking for a faster workflow, we welcome your help! 

Check out our [CONTRIBUTING.md](CONTRIBUTING.md) to see how to get started with building bindings and setting up the toolchain.

---

## 📄 License

Quicle is open-source software licensed under the MIT License.



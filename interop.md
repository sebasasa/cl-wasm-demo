# JS-Lisp Interop Capabilities

Based on the codebase, these patterns are effective for JS-Lisp interoperation:

### Available Macros
- `(define-js-variable (name :js-expr "JS_NAME" :type :symbol))`
- `(define-js-method (name :js-expr "JS_METHOD" :type :return-type))`
  - Maps JS methods to Lisp. Works for standard methods and custom methods added to JS objects.
- `(define-js-accessor (name :js-expr "JS_PROP" :type :return-type))`
  - Used to get or set JS object properties. When used with `(setf (name object) value)`, it acts as a property setter.
- `(define-js-getter (name :js-expr "JS_PROP" :type :return-type))`

### Key Discoveries
- **Property Setting:** Use `define-js-accessor` to create properties that can be both read and set via `setf`.
- **Method Calling:** `define-js-method` is highly flexible for calling both native and custom JS methods.
- **Performance:** For performance-critical code (e.g., render loops), minimize cross-language calls (e.g., move style changes outside of particle loops).
- **Naming Conflicts:** Avoid using reserved Common Lisp symbols (like `fill`) for custom functions to prevent package lock errors.

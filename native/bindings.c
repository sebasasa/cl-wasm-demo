/*      Compiler: ECL 24.5.10                                         */
/*      Date: 2026/5/21 18:05 (yyyy/mm/dd)                            */
/*      Machine: Darwin 23.0.0 arm64                                  */
/*      Source: /Users/sebasa/Desktop/Quicle/cl-wasm-demo/native/bindings.lisp */
#include <ecl/ecl-cmp.h>
#include "bindings.eclh"
/*      function definition for INIT-WINDOW                           */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L1init_window(cl_object v1w, cl_object v2h, cl_object v3title)
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  {
   cl_object v4;
   v4 = si_copy_to_simple_base_string(v3title);
   InitWindow((int)ecl_to_int(v1w), (int)ecl_to_int(v2h), (const char*)ecl_base_string_pointer_safe(v4));
   value0 = ECL_NIL;
   cl_env_copy->nvalues = 0;
   return value0;
  }
 }
}
/*      function definition for SET-TARGET-FPS                        */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L2set_target_fps(cl_object v1fps)
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  SetTargetFPS(ecl_to_int(v1fps));
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}
/*      function definition for WINDOW-SHOULD-CLOSE                   */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L3window_should_close()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  value0 = ecl_make_bool(WindowShouldClose());
  cl_env_copy->nvalues = 1;
  return value0;
 }
}
/*      function definition for BEGIN-DRAWING                         */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L4begin_drawing()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  BeginDrawing();
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}
/*      function definition for END-DRAWING                           */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L5end_drawing()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  EndDrawing();
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}
/*      function definition for CLEAR-BACKGROUND                      */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L6clear_background(cl_object v1color)
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  ClearBackground((Color){.r=0, .g=0, .b=0, .a=255});
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}
/*      function definition for DRAW-CIRCLE                           */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L7draw_circle(cl_object v1x, cl_object v2y, cl_object v3radius)
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  DrawCircle(ecl_to_int(v1x), ecl_to_int(v2y), ecl_to_float(v3radius), WHITE);
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}
/*      function definition for GET-MOUSE-X                           */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L8get_mouse_x()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  value0 = ecl_make_int(GetMouseX());
  cl_env_copy->nvalues = 1;
  return value0;
 }
}
/*      function definition for GET-MOUSE-Y                           */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L9get_mouse_y()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  value0 = ecl_make_int(GetMouseY());
  cl_env_copy->nvalues = 1;
  return value0;
 }
}

#include "bindings.data"
#ifdef __cplusplus
extern "C"
#endif
ECL_DLLEXPORT void init_fas_CODE(cl_object flag)
{
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 cl_object *VVtemp;
 if (flag != OBJNULL){
 Cblock = flag;
 #ifndef ECL_DYNAMIC_VV
 flag->cblock.data = VV;
 #endif
 flag->cblock.data_size = VM;
 flag->cblock.temp_data_size = VMtemp;
 flag->cblock.data_text = compiler_data_text;
 flag->cblock.cfuns_size = compiler_cfuns_size;
 flag->cblock.cfuns = compiler_cfuns;
 flag->cblock.source = ecl_make_constant_base_string("/Users/sebasa/Desktop/Quicle/cl-wasm-demo/native/bindings.lisp",-1);
 return;}
 #ifdef ECL_DYNAMIC_VV
 VV = Cblock->cblock.data;
 #endif
 Cblock->cblock.data_text = (const cl_object *)"@EcLtAg:init_fas_CODE@";
 VVtemp = Cblock->cblock.temp_data;
 ECL_DEFINE_SETF_FUNCTIONS
  si_load_foreign_module(VVtemp[0]);
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LOCATION",1862), VVtemp[1], VVtemp[2]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, VVtemp[3]) /*  ANNOTATE */;
  ecl_cmp_defun(VV[9]);                           /*  INIT-WINDOW     */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[1], ECL_SYM("LOCATION",1862), VVtemp[4], VVtemp[5]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[1], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, VVtemp[6]) /*  ANNOTATE */;
  ecl_cmp_defun(VV[10]);                          /*  SET-TARGET-FPS  */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[2], ECL_SYM("LOCATION",1862), VVtemp[7], VVtemp[8]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[2], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[11]);                          /*  WINDOW-SHOULD-CLOSE */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[3], ECL_SYM("LOCATION",1862), VVtemp[9], VVtemp[10]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[3], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[12]);                          /*  BEGIN-DRAWING   */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[4], ECL_SYM("LOCATION",1862), VVtemp[11], VVtemp[12]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[4], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[13]);                          /*  END-DRAWING     */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[5], ECL_SYM("LOCATION",1862), VVtemp[13], VVtemp[14]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[5], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, VVtemp[15]) /*  ANNOTATE */;
  ecl_cmp_defun(VV[14]);                          /*  CLEAR-BACKGROUND */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[6], ECL_SYM("LOCATION",1862), VVtemp[16], VVtemp[17]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[6], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, VVtemp[18]) /*  ANNOTATE */;
  ecl_cmp_defun(VV[15]);                          /*  DRAW-CIRCLE     */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[7], ECL_SYM("LOCATION",1862), VVtemp[19], VVtemp[20]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[7], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[16]);                          /*  GET-MOUSE-X     */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[8], ECL_SYM("LOCATION",1862), VVtemp[21], VVtemp[22]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[8], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[17]);                          /*  GET-MOUSE-Y     */
}

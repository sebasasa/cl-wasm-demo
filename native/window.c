/*      Compiler: ECL 24.5.10                                         */
/*      Date: 2026/5/21 20:52 (yyyy/mm/dd)                            */
/*      Machine: Darwin 23.0.0 arm64                                  */
/*      Source: /Users/sebasa/Desktop/Quicle/cl-wasm-demo/native/window.lisp */
#include <ecl/ecl-cmp.h>
#include "window.eclh"
/*      function definition for INIT-WINDOW                           */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L1init_window(cl_object v1width, cl_object v2height, cl_object v3title)
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
   InitWindow(ecl_to_int(v1width),ecl_to_int(v2height),ecl_base_string_pointer_safe(v4));
   value0 = ECL_NIL;
   cl_env_copy->nvalues = 0;
   return value0;
  }
 }
}
/*      function definition for CLOSE-WINDOW                          */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L2close_window()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  CloseWindow();
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
  value0 = ecl_make_int(WindowShouldClose());
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
/*      function definition for SPAWN-WINDOW                          */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L6spawn_window()
{
 cl_object T0;
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  L1init_window(ecl_make_fixnum(800), ecl_make_fixnum(600), VV[6]);
L3:;
  T0 = L3window_should_close();
  if (ecl_number_equalp(ecl_make_fixnum(0),T0)) { goto L5; }
  goto L4;
L5:;
  L4begin_drawing();
  L5end_drawing();
  goto L3;
L4:;
  value0 = L2close_window();
  return value0;
 }
}

#include "window.data"
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
 flag->cblock.source = ecl_make_constant_base_string("/Users/sebasa/Desktop/Quicle/cl-wasm-demo/native/window.lisp",-1);
 return;}
 #ifdef ECL_DYNAMIC_VV
 VV = Cblock->cblock.data;
 #endif
 Cblock->cblock.data_text = (const cl_object *)"@EcLtAg:init_fas_CODE@";
 VVtemp = Cblock->cblock.temp_data;
 ECL_DEFINE_SETF_FUNCTIONS
  si_select_package(VVtemp[0]);
 {
  cl_object T0;
  cl_object volatile env0 = ECL_NIL;
  T0 = cl_merge_pathnames(2, VVtemp[1], ecl_symbol_value(ECL_SYM("*DEFAULT-PATHNAME-DEFAULTS*",34)));
  si_load_foreign_module(T0);
 }
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LOCATION",1862), VVtemp[2], VVtemp[3]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, VVtemp[4]) /*  ANNOTATE */;
  ecl_cmp_defun(VV[7]);                           /*  INIT-WINDOW     */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[1], ECL_SYM("LOCATION",1862), VVtemp[5], VVtemp[6]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[1], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[8]);                           /*  CLOSE-WINDOW    */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[2], ECL_SYM("LOCATION",1862), VVtemp[7], VVtemp[8]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[2], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[9]);                           /*  WINDOW-SHOULD-CLOSE */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[3], ECL_SYM("LOCATION",1862), VVtemp[9], VVtemp[10]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[3], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[10]);                          /*  BEGIN-DRAWING   */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[4], ECL_SYM("LOCATION",1862), VVtemp[11], VVtemp[12]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[4], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[11]);                          /*  END-DRAWING     */
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[5], ECL_SYM("LOCATION",1862), VVtemp[13], VVtemp[14]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[5], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[12]);                          /*  SPAWN-WINDOW    */
  L6spawn_window();
}

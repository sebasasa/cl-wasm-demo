/*      Compiler: ECL 24.5.10                                         */
/*      Date: 2026/5/21 21:01 (yyyy/mm/dd)                            */
/*      Machine: Darwin 23.0.0 arm64                                  */
/*      Source: /Users/sebasa/Desktop/Quicle/cl-wasm-demo/cffi-test/bridge.lisp */
#include <ecl/ecl-cmp.h>
#include "bridge.eclh"
/*      function definition for CALL-PRINT-PLANET                     */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L1call_print_planet()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  print_planet();;
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}

#include "bridge.data"
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
 flag->cblock.source = ecl_make_constant_base_string("/Users/sebasa/Desktop/Quicle/cl-wasm-demo/cffi-test/bridge.lisp",-1);
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
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[1]);                           /*  CALL-PRINT-PLANET */
  (cl_env_copy->function=(ECL_SYM("COMPILE",235)->symbol.gfdef))->cfun.entry(1, VV[0]) /*  COMPILE */;
  L1call_print_planet();
  si_quit(0);
}

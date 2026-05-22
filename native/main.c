/*      Compiler: ECL 24.5.10                                         */
/*      Date: 2026/5/21 18:05 (yyyy/mm/dd)                            */
/*      Machine: Darwin 23.0.0 arm64                                  */
/*      Source: /Users/sebasa/Desktop/Quicle/cl-wasm-demo/native/main.lisp */
#include <ecl/ecl-cmp.h>
#include "main.eclh"
/*      function definition for MAIN                                  */
/*      optimize speed 3, debug 0, space 0, safety 2                  */
static cl_object L12main()
{
 cl_object env0 = ECL_NIL;
 const cl_env_ptr cl_env_copy = ecl_process_env();
 cl_object value0;
 ecl_cs_check(cl_env_copy,value0);
 {
TTL:
  ecl_function_dispatch(cl_env_copy,VV[2])(0)     /*  SETUP           */;
L3:;
  if (Null(ecl_function_dispatch(cl_env_copy,VV[3])(0) /*  WINDOW-SHOULD-CLOSE */)) { goto L5; }
  goto L4;
L5:;
  ecl_function_dispatch(cl_env_copy,VV[4])(0)     /*  DRAW            */;
  goto L3;
L4:;
  CloseWindow();
  value0 = ECL_NIL;
  cl_env_copy->nvalues = 0;
  return value0;
 }
}

#include "main.data"
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
 flag->cblock.source = ecl_make_constant_base_string("/Users/sebasa/Desktop/Quicle/cl-wasm-demo/native/main.lisp",-1);
 return;}
 #ifdef ECL_DYNAMIC_VV
 VV = Cblock->cblock.data;
 #endif
 Cblock->cblock.data_text = (const cl_object *)"@EcLtAg:init_fas_CODE@";
 VVtemp = Cblock->cblock.temp_data;
 ECL_DEFINE_SETF_FUNCTIONS
  cl_load(1, VVtemp[0]);
  cl_load(1, VVtemp[1]);
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LOCATION",1862), VVtemp[2], VVtemp[3]) /*  ANNOTATE */;
  ecl_function_dispatch(cl_env_copy,ECL_SYM("ANNOTATE",1856))(4, VV[0], ECL_SYM("LAMBDA-LIST",1000), ECL_NIL, ECL_NIL) /*  ANNOTATE */;
  ecl_cmp_defun(VV[1]);                           /*  MAIN            */
  L12main();
}

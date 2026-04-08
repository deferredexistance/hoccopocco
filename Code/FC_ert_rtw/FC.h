/*
 * File: FC.h
 *
 * Code generated for Simulink model 'FC'.
 *
 * Model version                  : 1.2
 * Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
 * C/C++ source code generated on : Wed Apr  8 10:40:06 2026
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. Traceability
 * Validation result: Not run
 */

#ifndef FC_h_
#define FC_h_
#ifndef FC_COMMON_INCLUDES_
#define FC_COMMON_INCLUDES_
#include <stdbool.h>
#include <stdint.h>
#endif                                 /* FC_COMMON_INCLUDES_ */

/* External inputs (root inport signals with default storage) */
typedef struct {
  float In1;                           /* '<Root>/In1' */
  float In2;                           /* '<Root>/In2' */
} ExtU;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  float Out1;                          /* '<Root>/Out1' */
} ExtY;

/* External inputs (root inport signals with default storage) */
extern ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY rtY;

/* Model entry point functions */
extern void FC_initialize(void);
extern void FC_step(void);

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'FC'
 */

/*-
 * Requirements for '<Root>': FC

 */
#endif                                 /* FC_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc4ca3437 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Elsik/Desktop/DYPLOM/Freq_constant/instru_tb.vhd";
static const char *ng1 = "Function conv_to_char ended without a return statement";
extern char *STD_STANDARD;
extern char *STD_TEXTIO;



static void work_a_1386672713_3709375518_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;

LAB0:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 5128);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(45, ng0);
    t7 = (10 * 1LL);
    t2 = (t0 + 4040);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 5128);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(47, ng0);
    t7 = (10 * 1LL);
    t2 = (t0 + 4040);
    xsi_process_wait(t2, t7);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1386672713_3709375518_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;

LAB0:    t1 = (t0 + 4480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 5192);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(53, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t3 = t2;
    memset(t3, (unsigned char)2, 8U);
    t4 = (t0 + 5256);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 5320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(55, ng0);
    t9 = (50 * 1LL);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 5192);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(57, ng0);
    t9 = (50 * 1LL);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t9);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 5320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(59, ng0);
    t9 = (50 * 1LL);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t9);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 5320);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(61, ng0);
    t9 = (50 * 1LL);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t9);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 5256);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 7U, 1, 0LL);
    xsi_set_current_line(63, ng0);
    t9 = (200 * 1000LL);
    t2 = (t0 + 4288);
    xsi_process_wait(t2, t9);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(64, ng0);
    if ((unsigned char)0 == 0)
        goto LAB24;

LAB25:    goto LAB2;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    t2 = (t0 + 8433);
    xsi_report(t2, 19U, (unsigned char)3);
    goto LAB25;

}

unsigned char work_a_1386672713_3709375518_sub_4075125876_1041207877(char *t1, unsigned char t2)
{
    char t4[8];
    unsigned char t0;
    char *t5;
    char *t6;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB4, &&LAB3, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t5 = (t4 + 4U);
    *((unsigned char *)t5) = t2;
    t6 = (char *)((nl0) + t2);
    goto **((char **)t6);

LAB2:    xsi_error(ng1);
    t0 = 0;

LAB1:    return t0;
LAB3:    t0 = (unsigned char)49;
    goto LAB1;

LAB4:    t0 = (unsigned char)48;
    goto LAB1;

LAB5:    t0 = (unsigned char)90;
    goto LAB1;

LAB6:    t0 = (unsigned char)88;
    goto LAB1;

LAB7:    goto LAB2;

LAB8:    goto LAB2;

LAB9:    goto LAB2;

LAB10:    goto LAB2;

}

char *work_a_1386672713_3709375518_sub_3521064911_1041207877(char *t1, char *t2, char *t3, char *t4, int t5, int t6)
{
    char t7[152];
    char t8[32];
    char t11[16];
    char *t0;
    int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    int t37;
    int t38;
    int t39;
    int t40;
    char *t41;
    int t42;
    char *t43;
    int t44;
    int t45;
    unsigned int t46;
    char *t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned char t52;
    unsigned char t53;
    char *t54;
    char *t55;
    int t56;
    int t57;
    char *t58;
    int t59;
    int t60;
    unsigned int t61;
    char *t62;
    int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;

LAB0:    t9 = (t6 - 1);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t10 = (t10 * 1U);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 1;
    t13 = (t12 + 4U);
    *((int *)t13) = t6;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (t6 - 1);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t7 + 4U);
    t16 = ((STD_STANDARD) + 1008);
    t17 = (t13 + 88U);
    *((char **)t17) = t16;
    t18 = xsi_get_memory(t10);
    t19 = (t13 + 56U);
    *((char **)t19) = t18;
    xsi_type_set_default_value(t16, t18, t11);
    t20 = (t13 + 64U);
    *((char **)t20) = t11;
    t21 = (t13 + 80U);
    *((unsigned int *)t21) = t10;
    t22 = (t13 + 136U);
    *((char **)t22) = t18;
    t23 = (t13 + 124U);
    *((int *)t23) = 0;
    t24 = (t13 + 128U);
    t25 = (t11 + 12U);
    t15 = *((unsigned int *)t25);
    t26 = (t15 - 1);
    *((int *)t24) = t26;
    t27 = (t13 + 120U);
    t29 = (t10 > 2147483644);
    if (t29 == 1)
        goto LAB2;

LAB3:    t30 = (t10 + 3);
    t31 = (t30 / 16);
    t28 = t31;

LAB4:    *((unsigned int *)t27) = t28;
    t32 = (t8 + 4U);
    t33 = (t3 != 0);
    if (t33 == 1)
        goto LAB6;

LAB5:    t34 = (t8 + 12U);
    *((char **)t34) = t4;
    t35 = (t8 + 20U);
    *((int *)t35) = t5;
    t36 = (t8 + 24U);
    *((int *)t36) = t6;
    t37 = (t6 - 1);
    t38 = (t5 - 1);
    t39 = t38;
    t40 = t37;

LAB7:    if (t39 <= t40)
        goto LAB8;

LAB10:    t12 = (t13 + 56U);
    t16 = *((char **)t12);
    t12 = (t11 + 12U);
    t10 = *((unsigned int *)t12);
    t10 = (t10 * 1U);
    t0 = xsi_get_transient_memory(t10);
    memcpy(t0, t16, t10);
    t17 = (t11 + 0U);
    t9 = *((int *)t17);
    t18 = (t11 + 4U);
    t14 = *((int *)t18);
    t19 = (t11 + 8U);
    t26 = *((int *)t19);
    t20 = (t2 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = t9;
    t21 = (t20 + 4U);
    *((int *)t21) = t14;
    t21 = (t20 + 8U);
    *((int *)t21) = t26;
    t37 = (t14 - t9);
    t15 = (t37 * t26);
    t15 = (t15 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t15;

LAB1:    t12 = (t13 + 80);
    t9 = *((int *)t12);
    t16 = (t13 + 136U);
    t17 = *((char **)t16);
    xsi_put_memory(t9, t17);
    return t0;
LAB2:    t28 = 2147483647;
    goto LAB4;

LAB6:    *((char **)t32) = t3;
    goto LAB5;

LAB8:    t41 = (t4 + 0U);
    t42 = *((int *)t41);
    t43 = (t4 + 8U);
    t44 = *((int *)t43);
    t45 = (t39 - t42);
    t46 = (t45 * t44);
    t47 = (t4 + 4U);
    t48 = *((int *)t47);
    xsi_vhdl_check_range_of_index(t42, t48, t44, t39);
    t49 = (1U * t46);
    t50 = (0 + t49);
    t51 = (t3 + t50);
    t52 = *((unsigned char *)t51);
    t53 = work_a_1386672713_3709375518_sub_4075125876_1041207877(t1, t52);
    t54 = (t13 + 56U);
    t55 = *((char **)t54);
    t56 = (t6 - t39);
    t54 = (t11 + 0U);
    t57 = *((int *)t54);
    t58 = (t11 + 8U);
    t59 = *((int *)t58);
    t60 = (t56 - t57);
    t61 = (t60 * t59);
    t62 = (t11 + 4U);
    t63 = *((int *)t62);
    xsi_vhdl_check_range_of_index(t57, t63, t59, t56);
    t64 = (1U * t61);
    t65 = (0 + t64);
    t66 = (t55 + t65);
    *((unsigned char *)t66) = t53;

LAB9:    if (t39 == t40)
        goto LAB10;

LAB11:    t9 = (t39 + 1);
    t39 = t9;
    goto LAB7;

LAB12:;
}

static void work_a_1386672713_3709375518_p_2(char *t0)
{
    char t9[16];
    char t12[16];
    char t20[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t10;
    unsigned char t11;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;

LAB0:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:    t1 = (t0 + 5048);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 4536);
    t5 = (t0 + 3432U);
    t6 = (t0 + 3648U);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t9, t8, 9U);
    t7 = (t0 + 8280U);
    std_textio_write7(STD_TEXTIO, t1, t5, t9, t7, (unsigned char)0, 0);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 4536);
    t2 = (t0 + 3256U);
    t5 = (t0 + 3432U);
    std_textio_writeline(STD_TEXTIO, t1, t2, t5);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB3;

LAB5:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t2 = (t0 + 8264U);
    t7 = work_a_1386672713_3709375518_sub_3521064911_1041207877(t0, t12, t6, t2, 4, 12);
    t8 = (t0 + 3648U);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    t15 = (1 - 1);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t14 + t17);
    t18 = (t12 + 12U);
    t19 = *((unsigned int *)t18);
    t19 = (t19 * 1U);
    memcpy(t13, t7, t19);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 4536);
    t2 = (t0 + 3432U);
    t5 = (t0 + 3648U);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t20, t7, 9U);
    t6 = (t0 + 8280U);
    std_textio_write7(STD_TEXTIO, t1, t2, t20, t6, (unsigned char)0, 0);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 4536);
    t2 = (t0 + 3256U);
    t5 = (t0 + 3432U);
    std_textio_writeline(STD_TEXTIO, t1, t2, t5);
    goto LAB6;

LAB8:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB10;

}


extern void work_a_1386672713_3709375518_init()
{
	static char *pe[] = {(void *)work_a_1386672713_3709375518_p_0,(void *)work_a_1386672713_3709375518_p_1,(void *)work_a_1386672713_3709375518_p_2};
	static char *se[] = {(void *)work_a_1386672713_3709375518_sub_4075125876_1041207877,(void *)work_a_1386672713_3709375518_sub_3521064911_1041207877};
	xsi_register_didat("work_a_1386672713_3709375518", "isim/instrument_tb_isim_beh.exe.sim/work/a_1386672713_3709375518.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}

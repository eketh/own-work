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
static const char *ng0 = "C:/Users/Elsik/Desktop/DYPLOM/Freq_constant/spi.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_1686183789_3735760319_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 8128);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 7904);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1686183789_3735760319_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 8192);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 7920);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1686183789_3735760319_p_2(char *t0)
{
    char t9[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB6};

LAB0:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 8256);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 7936);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(99, ng0);
    t4 = (t0 + 8256);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    goto LAB2;

LAB4:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 8256);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 12332U);
    t4 = (t0 + 12508);
    t6 = (t9 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 4;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t10 = (4 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t11;
    t12 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t9);
    if (t12 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB2;

LAB6:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 12316U);
    t4 = (t0 + 4248U);
    t5 = *((char **)t4);
    t10 = *((int *)t5);
    t15 = (t10 - 1);
    t3 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t2, t1, t15);
    if (t3 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 8256);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(106, ng0);
    t13 = (t0 + 8256);
    t18 = (t13 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast(t13);
    goto LAB9;

LAB11:    t7 = (t0 + 2792U);
    t8 = *((char **)t7);
    t7 = (t0 + 12316U);
    t13 = (t0 + 3888U);
    t14 = *((char **)t13);
    t15 = *((int *)t14);
    t16 = (t15 - 1);
    t17 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t8, t7, t16);
    t3 = t17;
    goto LAB13;

LAB14:    xsi_set_current_line(110, ng0);
    t4 = (t0 + 8256);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    *((unsigned char *)t13) = (unsigned char)0;
    xsi_driver_first_trans_fast(t4);
    goto LAB15;

}

static void work_a_1686183789_3735760319_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(119, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 7952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 8320);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2472U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t2 = (t0 + 8320);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t11;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB7:    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

}

static void work_a_1686183789_3735760319_p_4(char *t0)
{
    char t22[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    int t19;
    int t20;
    unsigned char t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(128, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 7968);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(129, ng0);
    t1 = xsi_get_transient_memory(36U);
    memset(t1, 0, 36U);
    t5 = t1;
    memset(t5, (unsigned char)2, 36U);
    t6 = (t0 + 8384);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 36U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t15 = *((unsigned char *)t6);
    t16 = (t15 == (unsigned char)2);
    if (t16 == 1)
        goto LAB16;

LAB17:    t2 = (t0 + 2312U);
    t7 = *((char **)t2);
    t17 = *((unsigned char *)t7);
    t18 = (t17 == (unsigned char)3);
    t14 = t18;

LAB18:    if (t14 == 1)
        goto LAB13;

LAB14:    t13 = (unsigned char)0;

LAB15:    if (t13 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(134, ng0);
    t1 = xsi_get_transient_memory(36U);
    memset(t1, 0, 36U);
    t2 = t1;
    memset(t2, (unsigned char)2, 36U);
    t5 = (t0 + 8384);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 36U);
    xsi_driver_first_trans_fast(t5);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(132, ng0);
    t9 = (t0 + 2792U);
    t23 = *((char **)t9);
    t9 = (t0 + 12316U);
    t24 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t22, t23, t9, 1);
    t25 = (t0 + 8384);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t24, 36U);
    xsi_driver_first_trans_fast(t25);
    goto LAB11;

LAB13:    t2 = (t0 + 2792U);
    t8 = *((char **)t2);
    t2 = (t0 + 12316U);
    t9 = (t0 + 3888U);
    t10 = *((char **)t9);
    t19 = *((int *)t10);
    t20 = (t19 - 1);
    t21 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t8, t2, t20);
    t13 = t21;
    goto LAB15;

LAB16:    t14 = (unsigned char)1;
    goto LAB18;

}

static void work_a_1686183789_3735760319_p_5(char *t0)
{
    char t18[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    int t15;
    int t16;
    unsigned char t17;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(141, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 7984);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(142, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t5 = t1;
    memset(t5, (unsigned char)2, 5U);
    t6 = (t0 + 8448);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 2792U);
    t7 = *((char **)t2);
    t2 = (t0 + 12316U);
    t8 = (t0 + 3888U);
    t9 = *((char **)t8);
    t15 = *((int *)t9);
    t16 = (t15 - 1);
    t17 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t7, t2, t16);
    if (t17 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(146, ng0);
    t8 = (t0 + 2952U);
    t10 = *((char **)t8);
    t8 = (t0 + 12332U);
    t19 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t18, t10, t8, 1);
    t20 = (t0 + 8448);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 5U);
    xsi_driver_first_trans_fast(t20);
    goto LAB14;

}

static void work_a_1686183789_3735760319_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(157, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 8000);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(158, ng0);
    t1 = (t0 + 8512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 == (unsigned char)2);
    if (t13 == 1)
        goto LAB13;

LAB14:    t11 = (unsigned char)0;

LAB15:    if (t11 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(163, ng0);
    t1 = (t0 + 8512);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(161, ng0);
    t8 = (t0 + 8512);
    t17 = (t8 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB11;

LAB13:    t2 = (t0 + 2792U);
    t7 = *((char **)t2);
    t2 = (t0 + 12316U);
    t8 = (t0 + 4008U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t7, t2, t15);
    t11 = t16;
    goto LAB15;

}

static void work_a_1686183789_3735760319_p_7(char *t0)
{
    char t21[16];
    char t23[16];
    char t28[16];
    char t33[16];
    char t35[16];
    char t43[16];
    char t45[16];
    char t54[16];
    char t56[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t22;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    char *t29;
    int t30;
    char *t31;
    char *t32;
    char *t34;
    char *t36;
    char *t37;
    int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t44;
    char *t46;
    char *t47;
    int t48;
    unsigned int t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t55;
    char *t57;
    char *t58;
    int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(170, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 8016);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(171, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t5 = t1;
    memset(t5, (unsigned char)2, 32U);
    t6 = (t0 + 8576);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(173, ng0);
    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)1);
    if (t14 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t11 = (t4 == (unsigned char)2);
    if (t11 == 1)
        goto LAB15;

LAB16:    t3 = (unsigned char)0;

LAB17:    if (t3 != 0)
        goto LAB13;

LAB14:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 4128U);
    t7 = *((char **)t2);
    t15 = (7 - 7);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t2 = (t7 + t17);
    t8 = (t0 + 4368U);
    t9 = *((char **)t8);
    t18 = (3 - 3);
    t19 = (t18 * 1U);
    t20 = (0 + t19);
    t8 = (t9 + t20);
    t22 = ((IEEE_P_2592010699) + 4024);
    t24 = (t23 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 7;
    t25 = (t24 + 4U);
    *((int *)t25) = 0;
    t25 = (t24 + 8U);
    *((int *)t25) = -1;
    t26 = (0 - 7);
    t27 = (t26 * -1);
    t27 = (t27 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t27;
    t25 = (t28 + 0U);
    t29 = (t25 + 0U);
    *((int *)t29) = 3;
    t29 = (t25 + 4U);
    *((int *)t29) = 0;
    t29 = (t25 + 8U);
    *((int *)t29) = -1;
    t30 = (0 - 3);
    t27 = (t30 * -1);
    t27 = (t27 + 1);
    t29 = (t25 + 12U);
    *((unsigned int *)t29) = t27;
    t10 = xsi_base_array_concat(t10, t21, t22, (char)97, t2, t23, (char)97, t8, t28, (char)101);
    t29 = (t0 + 12513);
    t34 = ((IEEE_P_2592010699) + 4024);
    t36 = (t35 + 0U);
    t37 = (t36 + 0U);
    *((int *)t37) = 0;
    t37 = (t36 + 4U);
    *((int *)t37) = 3;
    t37 = (t36 + 8U);
    *((int *)t37) = 1;
    t38 = (3 - 0);
    t27 = (t38 * 1);
    t27 = (t27 + 1);
    t37 = (t36 + 12U);
    *((unsigned int *)t37) = t27;
    t32 = xsi_base_array_concat(t32, t33, t34, (char)97, t10, t21, (char)97, t29, t35, (char)101);
    t37 = (t0 + 1032U);
    t39 = *((char **)t37);
    t27 = (11 - 11);
    t40 = (t27 * 1U);
    t41 = (0 + t40);
    t37 = (t39 + t41);
    t44 = ((IEEE_P_2592010699) + 4024);
    t46 = (t45 + 0U);
    t47 = (t46 + 0U);
    *((int *)t47) = 11;
    t47 = (t46 + 4U);
    *((int *)t47) = 0;
    t47 = (t46 + 8U);
    *((int *)t47) = -1;
    t48 = (0 - 11);
    t49 = (t48 * -1);
    t49 = (t49 + 1);
    t47 = (t46 + 12U);
    *((unsigned int *)t47) = t49;
    t42 = xsi_base_array_concat(t42, t43, t44, (char)97, t32, t33, (char)97, t37, t45, (char)101);
    t47 = (t0 + 4128U);
    t50 = *((char **)t47);
    t49 = (7 - 3);
    t51 = (t49 * 1U);
    t52 = (0 + t51);
    t47 = (t50 + t52);
    t55 = ((IEEE_P_2592010699) + 4024);
    t57 = (t56 + 0U);
    t58 = (t57 + 0U);
    *((int *)t58) = 3;
    t58 = (t57 + 4U);
    *((int *)t58) = 0;
    t58 = (t57 + 8U);
    *((int *)t58) = -1;
    t59 = (0 - 3);
    t60 = (t59 * -1);
    t60 = (t60 + 1);
    t58 = (t57 + 12U);
    *((unsigned int *)t58) = t60;
    t53 = xsi_base_array_concat(t53, t54, t55, (char)97, t42, t43, (char)97, t47, t56, (char)101);
    t58 = (t0 + 8576);
    t61 = (t58 + 56U);
    t62 = *((char **)t61);
    t63 = (t62 + 56U);
    t64 = *((char **)t63);
    memcpy(t64, t53, 32U);
    xsi_driver_first_trans_fast(t58);
    goto LAB11;

LAB13:    xsi_set_current_line(177, ng0);
    t6 = (t0 + 2632U);
    t8 = *((char **)t6);
    t15 = (31 - 30);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t6 = (t8 + t17);
    t10 = ((IEEE_P_2592010699) + 4024);
    t22 = (t23 + 0U);
    t24 = (t22 + 0U);
    *((int *)t24) = 30;
    t24 = (t22 + 4U);
    *((int *)t24) = 0;
    t24 = (t22 + 8U);
    *((int *)t24) = -1;
    t38 = (0 - 30);
    t18 = (t38 * -1);
    t18 = (t18 + 1);
    t24 = (t22 + 12U);
    *((unsigned int *)t24) = t18;
    t9 = xsi_base_array_concat(t9, t21, t10, (char)97, t6, t23, (char)99, (unsigned char)2, (char)101);
    t24 = (t0 + 8576);
    t25 = (t24 + 56U);
    t29 = *((char **)t25);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t9, 32U);
    xsi_driver_first_trans_fast(t24);
    goto LAB11;

LAB15:    t1 = (t0 + 2792U);
    t5 = *((char **)t1);
    t1 = (t0 + 12316U);
    t6 = (t0 + 3888U);
    t7 = *((char **)t6);
    t26 = *((int *)t7);
    t30 = (t26 - 1);
    t12 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t5, t1, t30);
    t3 = t12;
    goto LAB17;

}

static void work_a_1686183789_3735760319_p_8(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(182, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 8640);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 8032);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1686183789_3735760319_p_9(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)1);
    t1 = t8;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t13 = (t0 + 8704);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 8048);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 8704);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB9:    goto LAB2;

}


extern void work_a_1686183789_3735760319_init()
{
	static char *pe[] = {(void *)work_a_1686183789_3735760319_p_0,(void *)work_a_1686183789_3735760319_p_1,(void *)work_a_1686183789_3735760319_p_2,(void *)work_a_1686183789_3735760319_p_3,(void *)work_a_1686183789_3735760319_p_4,(void *)work_a_1686183789_3735760319_p_5,(void *)work_a_1686183789_3735760319_p_6,(void *)work_a_1686183789_3735760319_p_7,(void *)work_a_1686183789_3735760319_p_8,(void *)work_a_1686183789_3735760319_p_9};
	xsi_register_didat("work_a_1686183789_3735760319", "isim/instrument_tb_isim_beh.exe.sim/work/a_1686183789_3735760319.didat");
	xsi_register_executes(pe);
}

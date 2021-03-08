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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/BorjaAday/Desktop/Programas de Desarrollo/ISE/Practica1/multifuncion/multifucion.vhd";
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_2479218856_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_2720006528_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_2720078402_1035706684(char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3273568981_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3666533564_1035706684(char *, char *, int , char *, char *);


static void work_a_1787768600_3212880686_p_0(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    int t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned char t27;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 1928U);
    t3 = *((char **)t1);
    t4 = xsi_mem_cmp(t3, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB9:    t1 = (t0 + 2048U);
    t5 = *((char **)t1);
    t6 = xsi_mem_cmp(t5, t2, 3U);
    if (t6 == 1)
        goto LAB4;

LAB10:    t1 = (t0 + 2168U);
    t7 = *((char **)t1);
    t8 = xsi_mem_cmp(t7, t2, 3U);
    if (t8 == 1)
        goto LAB5;

LAB11:    t1 = (t0 + 2288U);
    t9 = *((char **)t1);
    t10 = xsi_mem_cmp(t9, t2, 3U);
    if (t10 == 1)
        goto LAB6;

LAB12:    t1 = (t0 + 2408U);
    t11 = *((char **)t1);
    t12 = xsi_mem_cmp(t11, t2, 3U);
    if (t12 == 1)
        goto LAB7;

LAB13:
LAB8:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6424U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 6440U);
    t7 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t13, t2, t1, t5, t3);
    t9 = (t13 + 12U);
    t19 = *((unsigned int *)t9);
    t20 = (1U * t19);
    t21 = (32U != t20);
    if (t21 == 1)
        goto LAB30;

LAB31:    t11 = (t0 + 3792);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t7, 32U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t1 = (t0 + 3712);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1032U);
    t14 = *((char **)t1);
    t1 = (t0 + 6424U);
    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t15 = (t0 + 6440U);
    t17 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t13, t14, t1, t16, t15);
    t18 = (t13 + 12U);
    t19 = *((unsigned int *)t18);
    t20 = (1U * t19);
    t21 = (32U != t20);
    if (t21 == 1)
        goto LAB15;

LAB16:    t22 = (t0 + 3792);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t17, 32U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB2;

LAB4:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6424U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 6440U);
    t7 = ieee_p_1242562249_sub_3273568981_1035706684(IEEE_P_1242562249, t13, t2, t1, t5, t3);
    t9 = (t13 + 12U);
    t19 = *((unsigned int *)t9);
    t20 = (1U * t19);
    t21 = (32U != t20);
    if (t21 == 1)
        goto LAB17;

LAB18:    t11 = (t0 + 3792);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t7, 32U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

LAB5:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6424U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 6440U);
    t21 = ieee_p_1242562249_sub_2720006528_1035706684(IEEE_P_1242562249, t2, t1, t5, t3);
    if (t21 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 3792);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB20:    goto LAB2;

LAB6:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6440U);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 6424U);
    t21 = ieee_p_1242562249_sub_2720078402_1035706684(IEEE_P_1242562249, t2, t1, t5, t3);
    if (t21 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 3792);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6424U);
    t21 = ieee_p_1242562249_sub_2479218856_1035706684(IEEE_P_1242562249, t2, t1, 0);
    if (t21 != 0)
        goto LAB25;

LAB27:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 3792);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB26:    goto LAB2;

LAB14:;
LAB15:    xsi_size_not_matching(32U, t20, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(32U, t20, 0);
    goto LAB18;

LAB19:    xsi_set_current_line(35, ng0);
    t7 = (t0 + 1032U);
    t9 = *((char **)t7);
    t7 = (t0 + 3792);
    t11 = (t7 + 56U);
    t14 = *((char **)t11);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 32U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB20;

LAB22:    xsi_set_current_line(41, ng0);
    t7 = (t0 + 1192U);
    t9 = *((char **)t7);
    t7 = (t0 + 3792);
    t11 = (t7 + 56U);
    t14 = *((char **)t11);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 32U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB23;

LAB25:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 6424U);
    t7 = ieee_p_1242562249_sub_3666533564_1035706684(IEEE_P_1242562249, t13, 0, t5, t3);
    t9 = (t13 + 12U);
    t19 = *((unsigned int *)t9);
    t20 = (1U * t19);
    t27 = (32U != t20);
    if (t27 == 1)
        goto LAB28;

LAB29:    t11 = (t0 + 3792);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t7, 32U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB26;

LAB28:    xsi_size_not_matching(32U, t20, 0);
    goto LAB29;

LAB30:    xsi_size_not_matching(32U, t20, 0);
    goto LAB31;

}


extern void work_a_1787768600_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1787768600_3212880686_p_0};
	xsi_register_didat("work_a_1787768600_3212880686", "isim/tb_multifuncion_isim_beh.exe.sim/work/a_1787768600_3212880686.didat");
	xsi_register_executes(pe);
}

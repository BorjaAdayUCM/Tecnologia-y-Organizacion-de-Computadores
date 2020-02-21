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
static const char *ng0 = "C:/Users/BorjaAday/Desktop/Programas de Desarrollo/ISE/Practica1/multifuncion/tb_multifuncion.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );
unsigned char ieee_p_1242562249_sub_2720042465_1035706684(char *, char *, char *, char *, char *);


static void work_a_3089642630_0318166943_p_0(char *t0)
{
    char t16[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    int t12;
    int t13;
    int64 t14;
    char *t15;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    char *t23;
    unsigned char t24;
    char *t25;

LAB0:    t1 = (t0 + 3312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2088U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = (t0 + 6928);
    *((int *)t2) = 0;
    t5 = (t0 + 6932);
    *((int *)t5) = t4;
    t6 = 0;
    t7 = t4;

LAB4:    if (t6 <= t7)
        goto LAB5;

LAB7:    xsi_set_current_line(120, ng0);

LAB76:    *((char **)t1) = &&LAB77;

LAB1:    return;
LAB5:    xsi_set_current_line(81, ng0);
    t8 = (t0 + 2088U);
    t9 = *((char **)t8);
    t10 = *((int *)t9);
    t8 = (t0 + 6936);
    *((int *)t8) = 0;
    t11 = (t0 + 6940);
    *((int *)t11) = t10;
    t12 = 0;
    t13 = t10;

LAB8:    if (t12 <= t13)
        goto LAB9;

LAB11:
LAB6:    t2 = (t0 + 6928);
    t6 = *((int *)t2);
    t3 = (t0 + 6932);
    t7 = *((int *)t3);
    if (t6 == t7)
        goto LAB7;

LAB73:    t4 = (t6 + 1);
    t6 = t4;
    t5 = (t0 + 6928);
    *((int *)t5) = t6;
    goto LAB4;

LAB9:    xsi_set_current_line(82, ng0);
    t14 = (90 * 1000LL);
    t15 = (t0 + 3120);
    xsi_process_wait(t15, t14);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:    t2 = (t0 + 6936);
    t12 = *((int *)t2);
    t3 = (t0 + 6940);
    t13 = *((int *)t3);
    if (t12 == t13)
        goto LAB11;

LAB72:    t4 = (t12 + 1);
    t12 = t4;
    t5 = (t0 + 6936);
    *((int *)t5) = t12;
    goto LAB8;

LAB12:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 6928);
    t3 = (t0 + 1968U);
    t5 = *((char **)t3);
    t4 = *((int *)t5);
    t3 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, *((int *)t2), t4);
    t8 = (t16 + 12U);
    t17 = *((unsigned int *)t8);
    t17 = (t17 * 1U);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB16;

LAB17:    t9 = (t0 + 3696);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t3, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 6936);
    t3 = (t0 + 1968U);
    t5 = *((char **)t3);
    t4 = *((int *)t5);
    t3 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, *((int *)t2), t4);
    t8 = (t16 + 12U);
    t17 = *((unsigned int *)t8);
    t17 = (t17 * 1U);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB18;

LAB19:    t9 = (t0 + 3760);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t3, 32U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 6944);
    t5 = (t0 + 3824);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 6928);
    t3 = (t0 + 6936);
    t4 = *((int *)t2);
    t10 = *((int *)t3);
    t21 = (t4 + t10);
    t5 = (t0 + 1968U);
    t8 = *((char **)t5);
    t22 = *((int *)t8);
    t5 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, t21, t22);
    t9 = (t16 + 12U);
    t17 = *((unsigned int *)t9);
    t17 = (t17 * 1U);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB20;

LAB21:    t11 = (t0 + 3888);
    t15 = (t11 + 56U);
    t19 = *((char **)t15);
    t20 = (t19 + 56U);
    t23 = *((char **)t20);
    memcpy(t23, t5, 32U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(87, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_size_not_matching(32U, t17, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(32U, t17, 0);
    goto LAB19;

LAB20:    xsi_size_not_matching(32U, t17, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6740U);
    t5 = (t0 + 1672U);
    t8 = *((char **)t5);
    t5 = (t0 + 6756U);
    t18 = ieee_p_1242562249_sub_2720042465_1035706684(IEEE_P_1242562249, t3, t2, t8, t5);
    if (t18 == 0)
        goto LAB26;

LAB27:    xsi_set_current_line(91, ng0);
    t14 = (90 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

LAB26:    t9 = (t0 + 6947);
    xsi_report(t9, 27U, (unsigned char)2);
    goto LAB27;

LAB28:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 6974);
    t5 = (t0 + 3824);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 6928);
    t3 = (t0 + 6936);
    t4 = *((int *)t2);
    t10 = *((int *)t3);
    t21 = (t4 - t10);
    t5 = (t0 + 1968U);
    t8 = *((char **)t5);
    t22 = *((int *)t8);
    t5 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, t21, t22);
    t9 = (t16 + 12U);
    t17 = *((unsigned int *)t9);
    t17 = (t17 * 1U);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB32;

LAB33:    t11 = (t0 + 3888);
    t15 = (t11 + 56U);
    t19 = *((char **)t15);
    t20 = (t19 + 56U);
    t23 = *((char **)t20);
    memcpy(t23, t5, 32U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(94, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_size_not_matching(32U, t17, 0);
    goto LAB33;

LAB34:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6740U);
    t5 = (t0 + 1672U);
    t8 = *((char **)t5);
    t5 = (t0 + 6756U);
    t18 = ieee_p_1242562249_sub_2720042465_1035706684(IEEE_P_1242562249, t3, t2, t8, t5);
    if (t18 == 0)
        goto LAB38;

LAB39:    xsi_set_current_line(98, ng0);
    t14 = (90 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

LAB38:    t9 = (t0 + 6977);
    xsi_report(t9, 27U, (unsigned char)2);
    goto LAB39;

LAB40:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 7004);
    t5 = (t0 + 3824);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 6928);
    t3 = (t0 + 6936);
    t4 = *((int *)t2);
    t10 = *((int *)t3);
    t18 = (t4 > t10);
    if (t18 != 0)
        goto LAB44;

LAB46:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 6936);
    t3 = (t0 + 1968U);
    t5 = *((char **)t3);
    t4 = *((int *)t5);
    t3 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, *((int *)t2), t4);
    t8 = (t16 + 12U);
    t17 = *((unsigned int *)t8);
    t17 = (t17 * 1U);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB49;

LAB50:    t9 = (t0 + 3888);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t3, 32U);
    xsi_driver_first_trans_fast(t9);

LAB45:    xsi_set_current_line(105, ng0);
    t14 = (90 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB53:    *((char **)t1) = &&LAB54;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(101, ng0);
    t5 = (t0 + 6928);
    t8 = (t0 + 1968U);
    t9 = *((char **)t8);
    t21 = *((int *)t9);
    t8 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, *((int *)t5), t21);
    t11 = (t16 + 12U);
    t17 = *((unsigned int *)t11);
    t17 = (t17 * 1U);
    t24 = (32U != t17);
    if (t24 == 1)
        goto LAB47;

LAB48:    t15 = (t0 + 3888);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    t23 = (t20 + 56U);
    t25 = *((char **)t23);
    memcpy(t25, t8, 32U);
    xsi_driver_first_trans_fast(t15);
    goto LAB45;

LAB47:    xsi_size_not_matching(32U, t17, 0);
    goto LAB48;

LAB49:    xsi_size_not_matching(32U, t17, 0);
    goto LAB50;

LAB51:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 7007);
    t5 = (t0 + 3824);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 6928);
    t3 = (t0 + 6936);
    t4 = *((int *)t2);
    t10 = *((int *)t3);
    t18 = (t4 > t10);
    if (t18 != 0)
        goto LAB55;

LAB57:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 6928);
    t3 = (t0 + 1968U);
    t5 = *((char **)t3);
    t4 = *((int *)t5);
    t3 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, *((int *)t2), t4);
    t8 = (t16 + 12U);
    t17 = *((unsigned int *)t8);
    t17 = (t17 * 1U);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB60;

LAB61:    t9 = (t0 + 3888);
    t11 = (t9 + 56U);
    t15 = *((char **)t11);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t3, 32U);
    xsi_driver_first_trans_fast(t9);

LAB56:    xsi_set_current_line(112, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB64:    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB52:    goto LAB51;

LAB54:    goto LAB52;

LAB55:    xsi_set_current_line(108, ng0);
    t5 = (t0 + 6936);
    t8 = (t0 + 1968U);
    t9 = *((char **)t8);
    t21 = *((int *)t9);
    t8 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t16, *((int *)t5), t21);
    t11 = (t16 + 12U);
    t17 = *((unsigned int *)t11);
    t17 = (t17 * 1U);
    t24 = (32U != t17);
    if (t24 == 1)
        goto LAB58;

LAB59:    t15 = (t0 + 3888);
    t19 = (t15 + 56U);
    t20 = *((char **)t19);
    t23 = (t20 + 56U);
    t25 = *((char **)t23);
    memcpy(t25, t8, 32U);
    xsi_driver_first_trans_fast(t15);
    goto LAB56;

LAB58:    xsi_size_not_matching(32U, t17, 0);
    goto LAB59;

LAB60:    xsi_size_not_matching(32U, t17, 0);
    goto LAB61;

LAB62:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6740U);
    t5 = (t0 + 1672U);
    t8 = *((char **)t5);
    t5 = (t0 + 6756U);
    t18 = ieee_p_1242562249_sub_2720042465_1035706684(IEEE_P_1242562249, t3, t2, t8, t5);
    if (t18 == 0)
        goto LAB66;

LAB67:    xsi_set_current_line(116, ng0);
    t14 = (90 * 1000LL);
    t2 = (t0 + 3120);
    xsi_process_wait(t2, t14);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB63:    goto LAB62;

LAB65:    goto LAB63;

LAB66:    t9 = (t0 + 7010);
    xsi_report(t9, 27U, (unsigned char)2);
    goto LAB67;

LAB68:    goto LAB10;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

LAB74:    goto LAB2;

LAB75:    goto LAB74;

LAB77:    goto LAB75;

}


extern void work_a_3089642630_0318166943_init()
{
	static char *pe[] = {(void *)work_a_3089642630_0318166943_p_0};
	xsi_register_didat("work_a_3089642630_0318166943", "isim/tb_multifuncion_isim_beh.exe.sim/work/a_3089642630_0318166943.didat");
	xsi_register_executes(pe);
}

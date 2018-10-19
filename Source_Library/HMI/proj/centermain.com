;***********************MASK23:程序选项界面:panel_23**********************
//M(MASK23/$85027/"panel_23_6_chs.png"/)

	;内螺纹:
	DEF NEI_JISHU=(I///$85227,$85227,,$85228/WR2//"/NC/_N_NC_GD2_ACX/INI[74]"/200,10,100/300,10,110/);磨削工件计数(磨削完毕后累加)
	DEF NEI_PILIANG=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2//"/NC/_N_NC_GD2_ACX/INI[27]"/200,30,100/300,30,80/);单件/批量磨削方式选择
	DEF NEI_ZHONGJIN=(R///$85174,$85174,,/WR2//"/NC/_N_NC_GD2_ACX/GRIND[5]"/200,50,100/300,50,60/);单次中径调整值
	DEF NEI_PIANDAO=(R/-100,100//$85175,$85175,,/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[43]"/200,70,100/300,70,60/);Z轴偏刀调整
	DEF NEI_MOXUEZHONGLIANG=(R///$85222,$85222,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[15]"/200,90,100/300,90,60/);累计磨削总量显示
	DEF NEI_GONGYIZHONGLIANG=(R///$85219,$85219,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[13]"/200,110,100/300,110,60/);工艺磨削总量显示

	DEF NEI_XINSHALUN=(I/*0=$85327,1=$85328//$85350,,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[6]"/0,0,0/390,70,60/);砂轮状态
	DEF NEI_CHUXIU=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[26]"/390,90,100/490,90,60/);粗修次数
	DEF NEI_SHALUNDANGQIAN=(R/0,1000//$85320,$85320,,/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[25]"/390,110,100/490,110,60/);砂轮当前直径
	DEF NEI_SHALUNXIN=(R/0,1000//$85319,$85319,,/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF NEI_GONGYI=(I/*0=$85710,1=$85710/0/$85710,$85710,,/WR2///0,0,0/390,30,70/);工艺界面

	DEF BAIN_ENABLE=(I/*0=$85546,1=$85547//$85538,$85538,,/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[60]"/0,0,0/480,10,70/);使能

	;外圆：
	DEF WAI_PILIANG=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2//"/NC/_N_NC_GD2_ACX/INI[98]"/200,170,100/300,170,80/);单件/批量磨削方式选择
	DEF WAI_MOXUEZHONGLIANG=(R///$85222,$85222,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[59]"/200,190,100/300,190,60/);累计磨削总量显示
	DEF WAI_GONGYIZHONGLIANG=(R///$85220,$85219,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[115]"/200,210,100/300,210,60/);界面设定磨削总量显示
	DEF WAI_CHUXIU=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[83]"/200,230,100/300,230,60/);粗修次数

	DEF WAI_GONGYI=(I/*0=$85710,1=$85710/0/$85710,$85710,,/WR2///0,0,0/390,170,70/);工艺界面

	;端面：
	DEF DUANMIAN_PILAING=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2//"/NC/_N_NC_GD2_ACX/INI[104]"/200,280,100/300,280,80/);单件/批量磨削方式选择
	DEF ZDUANMIAN_MOXUEZHONGLIANG=(R///$85235,$85235,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[61]"/200,300,100/300,300,60/);累计磨削总量显示
	DEF ZDUANMIAN_GONGYIZHONGLIANG=(R///$85235,$85236,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[117]"/200,320,100/300,320,60/);界面设定磨削总量显示
	DEF DUANMIAN_CHUXIU=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[95]"/200,340,100/300,340,60/);粗修次数
	DEF YDUANMIAN_MOXUEZHONGLIANG=(R///$85237,$85237,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[62]"/390,300,100/490,300,60/);累计磨削总量显示
	DEF YDUANMIAN_GONGYIZHONGLIANG=(R///$85238,$85238,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[118]"/390,320,100/490,320,60/);界面设定磨削总量显示

	DEF DUAN_GONGYI=(I/*0=$85710,1=$85710/0/$85710,$85710,,/WR2///0,0,0/390,280,70/);工艺界面


	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/60,10,60/);X_IM
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,30,20/60,30,60/);Z_IM
	DEF C_IM=(R///$85120,$85120,,/WR1//"$AA_IM[C]"/10,50,20/60,50,60/);C_IM
	DEF U_IM=(R///$85121,$85121,,/WR1//"$AA_IM[U]"/10,70,20/60,70,60/);U_IM
	DEF A_IM=(R///$85122,$85122,,/WR1//"$AA_IM[A]"/10,90,20/60,90,60/);A_IM

	DEF X_DRF=(R///$85116,$85116,,/WR1//"$AC_DRF[X]"/10,120,50/60,120,60/);DRF_X
	DEF Z_DRF=(R///$85117,$85117,,/WR1//"$AC_DRF[Z]"/10,140,50/60,140,60/);DRF_Z

	DEF NEI_CS=(R///$85180,$85180,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[14]"/10,170,100/110,170,60/);初始磨削接触位
	DEF NEI_DQ=(R///$85181,$85181,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[5]"/10,190,100/110,190,60/);当前磨削接触位

	DEF WAI_ZD=(R///$85182,$85182,,/WR1//"/NC/_N_NC_GD2_ACX/TOOL_SET[44]"/10,215,100/110,215,60/);自动对刀测量外圆面初始接触位
	DEF WAI_CS=(R///$85183,$85183,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[47]"/10,235,100/110,235,60/);初始磨削接触位
	DEF WAI_DQ=(R///$85184,$85184,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[21]"/10,255,100/110,255,60/);当前磨削接触位

	DEF ZUO_CS=(R///$85185,$85185,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[49]"/10,280,100/110,280,60/);初始磨削接触位
	DEF ZUO_DQ=(R///$85186,$85186,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[35]"/10,300,100/110,300,60/);当前磨削接触位

	DEF YOU_CS=(R///$85187,$85187,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[48]"/10,325,100/110,325,60/);初始磨削接触位
	DEF YOU_DQ=(R///$85188,$85188,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[38]"/10,345,100/110,345,60/);当前磨削接触位
	DEF VAR1=(I///$85032,$85032,,/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[44]"/320,85,100/440,85,60);外圆磨削开关
	DEF VAR2=(I///$85034,$85034,,/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[46]"/320,137,100/440,137,60);右端面磨削开关
	DEF VAR3=(I///$85033,$85033,,/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[45]"/320,190,100/440,190,60);左端面磨削开关
	DEF VAR4=(I///$85030,$85030,,/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[95]"/320,240,150/440,240,60);台阶磨削开关
	DEF VAR5=(I///$85031,$85031,,/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[42]"/320,290,100/440,290,60);内螺纹磨削开关
	
	;DEF VAR10=(V///,$85725,,/WR4///0,0,400,300/0,0,0);
	;DEF VAR11=(V///,$85726,,/WR4///0,0,400,300/0,0,0);
	;DEF VAR12=(V///,$85727,,/WR4///0,0,400,300/0,0,0);
	;DEF VAR13=(V///,$85728,,/WR4///0,0,400,300/0,0,0);
	;DEF VAR14=(V///,$85729,,/WR4///0,0,400,300/0,0,0);

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se3);程序选项界面
	HS8=($85005,ac7,se1);返回
	
	VS3=($85032,ac7,se1);外圆
	VS4=($85034,ac7,se1);左端面
	VS5=($85033,ac7,se1);右端面
	VS6=($85030,ac7,se1);台阶
	VS7=($85031,ac7,se1);内磨

	LOAD
		IF VAR1.VAL==1
			VS3.SE=3
			VAR10.WR=1
		ENDIF
		IF VAR2.VAL==1
			VS4.SE=3
			VAR11.WR=1
		ENDIF
		IF VAR3.VAL==1
			VS5.SE=3
			VAR12.WR=1
		ENDIF
		IF VAR4.VAL==1
			VS6.SE=3
			VAR13.WR=1
		ENDIF
		IF VAR5.VAL==1
			VS7.SE=3
			VAR14.WR=1
		ENDIF
	END_LOAD
	
	PRESS(VS3)
		IF VAR1.VAL==0
			VAR1.VAL=1
			VAR10.WR=1
			VS3.SE=3
		ELSE
			VAR1.VAL=0
			VAR10.WR=4
			VS3.SE=1
		ENDIF	
	END_PRESS
	
	PRESS(VS4)
		IF VAR2.VAL==0
			VAR2.VAL=1
			VAR11.WR=1
			VS4.SE=3
		ELSE
			VAR2.VAL=0
			VAR11.WR=4
			VS4.SE=1
		ENDIF	
	END_PRESS
	
	PRESS(VS5)
		IF VAR3.VAL==0
			VAR3.VAL=1
			VAR12.WR=1
			VS5.SE=3
		ELSE
			VAR3.VAL=0
			VAR12.WR=4
			VS5.SE=1
		ENDIF	
	END_PRESS
	
	PRESS(VS6)
		IF VAR4.VAL==0
			VAR4.VAL=1
			VAR13.WR=1
			VS6.SE=3
		ELSE
			VAR4.VAL=0
			VAR13.WR=4
			VS6.SE=1
		ENDIF	
	END_PRESS

	PRESS(VS7)
		IF VAR5.VAL==0
			VAR5.VAL=1
			VAR14.WR=1
			VS7.SE=3
		ELSE
			VAR5.VAL=0
			VAR14.WR=4
			VS7.SE=1
		ENDIF	
	END_PRESS
	
	PRESS(HS1)
		LM("MASK18","grind.com")
	END_PRESS

	PRESS(HS2)
		IF TECH.VAL==0;基本工艺
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK29","process.com")
			ELSE
				LM("MASK2","process.com")
			ENDIF
		ELSE
			IF PIECE_VOLUME.VAL==0;单件
				LM("MASK30","process.com")
			ELSE
				LM("MASK20","process.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(HS3)
		LM("MASK3","dress.com")
	END_PRESS
	
    PRESS(HS4)
		LM("MASK21","auto.com")
	END_PRESS
	
	PRESS(HS5)
		LM("MASK31","centerwaiyuan.com")
	END_PRESS
	
	PRESS(HS6)
		LM("MASK32","centerduanmian.com")
	END_PRESS
	
	PRESS(HS7)
		LM("MASK23","centermain.com")
	END_PRESS
	
	PRESS(HS8)
		EXIT
	END_PRESS

	CHANGE(VAR1)
		IF VAR1.VAL==0
			VAR10.WR=4
			VS3.SE=1
		ELSE
			VAR10.WR=1
			VS3.SE=3
		ENDIF	
	END_CHANGE

	CHANGE(VAR2)
		IF VAR2.VAL==0
			VAR11.WR=4
			VS4.SE=1
		ELSE
			VAR11.WR=1
			VS4.SE=3
		ENDIF	
	END_CHANGE

	CHANGE(VAR3)
		IF VAR3.VAL==0
			VAR12.WR=4
			VS5.SE=1
		ELSE
			VAR12.WR=1
			VS5.SE=3
		ENDIF	
	END_CHANGE

	CHANGE(VAR4)
		IF VAR4.VAL==0
			VAR13.WR=4
			VS6.SE=1
		ELSE
			VAR13.WR=1
			VS6.SE=3
		ENDIF	
	END_CHANGE

	CHANGE(VAR5)
		IF VAR5.VAL==0
			VAR14.WR=4
			VS7.SE=1
		ELSE
			VAR14.WR=1
			VS7.SE=3
		ENDIF	
	END_CHANGE

	CHANGE(NEI_XINSHALUN)
		IF NEI_XINSHALUN.VAL==0
			NEI_SHALUNDANGQIAN.VAL=NEI_SHALUNXIN.VAL
		ENDIF
	END_CHANGE

	CHANGE(NEI_GONGYI)
		IF NEI_GONGYI.VAL==1
			IF NEI_PILIANG.VAL==1
				LM("MASK2","process.com")
			ELSE
				LM("MASK29","process.com")
			ENDIF
		ENDIF
	END_CHANGE

	CHANGE(WAI_GONGYI)
		IF WAI_GONGYI.VAL==1
			LM("MASK24","centerwaiyuan.com")
		ENDIF
	END_CHANGE

	CHANGE(DUAN_GONGYI)
		IF DUAN_GONGYI.VAL==1
			LM("MASK25","centerduanmian.com")
		ENDIF
	END_CHANGE

//END
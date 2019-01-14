;***********************MASK32:端面磨削参数:panel_32**********************
//M(MASK32/$85709/"panel_32_1_chs.png"/)

	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,10,20/30,10,60/3);Z_IM

	DEF VAR1=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2/"panel_32_1_chs.png"/"/NC/_N_NC_GD2_ACX/INI[104]"/360,10,70/460,10,80//"UserGuide/section_27.html","S27D3");单件/批量磨削方式选择

	;左端面参数
	DEF VAR2=(R///$85801,$85801,,$85043/WR2/"panel_32_2_chs.png"/"/NC/_N_NC_GD2_ACX/INI[44]"/60,40,202/160,40,110//"UserGuide/section_27.html","S27D1");耳高
	DEF VAR3=(R///$85700,$85700,,/WR1///60,70,202/160,70,60//"UserGuide/section_27.html","S27D4");磨削起点
	DEF VAR4=(R///$85701,$85701,,/WR1///60,90,202/160,90,60//"UserGuide/section_27.html","S27D5");磨削终点
	DEF VAR6=(R///$85169,$85169,,/WR2/"panel_32_4_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[49]"/60,120,202/160,120,60/6/"UserGuide/section_27.html","S27D6");初始磨削接触位
	DEF VAR5=(R///$85158,$85158,,/WR2/"panel_32_4_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[35]"/60,140,202/160,140,60//"UserGuide/section_27.html","S27D7");当前磨削接触位

	;右端面参数
	DEF VAR7=(R///$85800,$85800,,$85043/WR2/"panel_32_3_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[28]"/360,40,202/460,40,110//"UserGuide/section_27.html","S27D2");孔厚
	DEF VAR8=(R///$85700,$85700,,/WR1///360,70,202/460,70,60//"UserGuide/section_27.html","S27D8");磨削起点
	DEF VAR9=(R///$85701,$85701,,/WR1///360,90,202/460,90,60//"UserGuide/section_27.html","S27D9");磨削终点
	DEF VAR11=(R///$85169,$85169,,/WR2/"panel_32_5_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[48]"/360,120,202/460,120,60/6/"UserGuide/section_27.html","S27D10");初始磨削接触位
	DEF VAR10=(R///$85158,$85158,,/WR2/"panel_32_5_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[38]"/360,140,202/460,140,60//"UserGuide/section_27.html","S27D11");当前磨削接触位

	DEF VAR12=(R////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[21]"/0,0,0/0,0,0/);外圆当前接触
	DEF VAR13=(R////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[58]"/0,0,0/0,0,0/);外圆轴类型(u:1x:-1)
	
	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se3);端面
	HS7=($85011,ac7,se1);程序选项界面

	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se3);磨削
	VS2=($85710,ac7,se1);工艺
	VS3=($85711,ac7,se1);修整

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

	PRESS(VS1)
		LM("MASK32","centerduanmian.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK25","centerduanmian.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK27","centerduanmian.com")
	END_PRESS

	CHANGE(VAR2)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR7)
		CALL("UP1")
	END_CHANGE

	SUB(UP1)
		VAR4.VAL=VAR12.VAL+VAR13.VAL*VAR2.VAL+VAR13.VAL*1
		VAR3.VAL=VAR12.VAL+VAR13.VAL*0.1
		VAR9.VAL=VAR12.VAL+VAR13.VAL*1
		VAR8.VAL=VAR12.VAL-VAR13.VAL*VAR7.VAL
	END_SUB

//END

;***********************MASK25:端面工艺参数:panel_25**********************
//M(Mask25/$85710/"panel_25_0_chs.png"/)

	;单双磨削选择
	DEF VAR10=(I/*0=$85233,1=$85234/1/$85203,,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[73]"/0,0,0/132,103,60);左端面粗磨
	DEF VAR11=(I/*0=$85233,1=$85234/1/$85204,,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[74]"/0,0,0/222,103,60);左端面精磨
	DEF VAR12=(I/*0=$85233,1=$85234/1/$85205,,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[75]"/0,0,0/312,103,60);右端面粗磨
	DEF VAR13=(I/*0=$85233,1=$85234/1/$85206,,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[76]"/0,0,0/402,103,60);右端面精磨

	;循环次数
	DEF VAR15=(I///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[100]"/0,0,0/132,129,60//"UserGuide/section_27.html","S27D14");左端面粗磨次数
	DEF VAR16=(I///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[244]"/0,0,0/222,129,60//"UserGuide/section_27.html","S27D14");左端面精磨次数
	DEF VAR17=(I///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[102]"/0,0,0/312,129,60//"UserGuide/section_27.html","S27D14");右端面粗磨次数
	DEF VAR18=(I///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[245]"/0,0,0/402,129,60//"UserGuide/section_27.html","S27D14");右端面精磨次数
	
	;进给深度
	DEF VAR19=(R///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[79]"/0,0,0/132,154,60//"UserGuide/section_27.html","S27D15");左端面粗磨进给量
	DEF VAR20=(R///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[80]"/0,0,0/222,154,60//"UserGuide/section_27.html","S27D15");左端面精磨进给量
	DEF VAR21=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[81]"/0,0,0/312,154,60//"UserGuide/section_27.html","S27D15");右端面粗磨进给量
	DEF VAR22=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[82]"/0,0,0/402,154,60//"UserGuide/section_27.html","S27D15");右端面精磨进给量
	
	;磨削速度
	DEF VAR27=(R///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[85]"/0,0,0/132,179,60//"UserGuide/section_27.html","S27D16");左端面粗磨速度
	DEF VAR28=(R///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[86]"/0,0,0/222,179,60//"UserGuide/section_27.html","S27D16");左端面精磨速度
	DEF VAR29=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[87]"/0,0,0/312,179,60//"UserGuide/section_27.html","S27D16");右端面粗磨速度
	DEF VAR30=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[88]"/0,0,0/402,179,60//"UserGuide/section_27.html","S27D16");右端面精磨速度

	;磨削几次修整设定
	DEF VAR41=(I///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[256]"/0,0,0/132,203,60//"UserGuide/section_27.html","S27D17");左端面粗磨
	DEF VAR42=(I///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[257]"/0,0,0/222,203,60//"UserGuide/section_27.html","S27D17");左端面精磨
	DEF VAR43=(I///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[258]"/0,0,0/312,203,60//"UserGuide/section_27.html","S27D17");右端面粗磨
	DEF VAR44=(I///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[259]"/0,0,0/402,203,60//"UserGuide/section_27.html","S27D17");右端面精磨
	
	;砂轮线速度设定
	DEF VAR37=(R///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[67]"/0,0,0/132,229,60//"UserGuide/section_27.html","S27D18");左端面粗磨砂轮线速度
	DEF VAR38=(R///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[68]"/0,0,0/222,229,60//"UserGuide/section_27.html","S27D18");左端面精磨砂轮线速度
	DEF VAR39=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[69]"/0,0,0/312,229,60//"UserGuide/section_27.html","S27D18");右端面粗磨砂轮线速度
	DEF VAR40=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[70]"/0,0,0/402,229,60//"UserGuide/section_27.html","S27D18");右端面精磨砂轮线速度
	
	;头架转速显示
	DEF VAR23=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[91]"/0,0,0/132,269,60//"UserGuide/section_27.html","S27D19");左端面粗磨头架转速
	DEF VAR24=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[92]"/0,0,0/222,269,60//"UserGuide/section_27.html","S27D19");左端面精磨头架转速
	DEF VAR25=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[93]"/0,0,0/312,269,60//"UserGuide/section_27.html","S27D19");右端面粗磨头架转速
	DEF VAR26=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[94]"/0,0,0/402,269,60//"UserGuide/section_27.html","S27D19");右端面精磨头架转速

	;砂轮转速显示
	DEF VAR32=(R///,,,/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[92]"/0,0,0/0,0,0/);当前砂轮直径调用
	DEF VAR33=(I///,,,/WR1//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[260]"/0,0,0/132,290,60/);左端面粗磨砂轮转速
	DEF VAR34=(I///,,,/WR1//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[261]"/0,0,0/222,290,60/);左端面精磨砂轮转速
	DEF VAR35=(I///,,,/WR1//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[262]"/0,0,0/312,290,60/);右端面粗磨砂轮转速
	DEF VAR36=(I///,,,/WR1//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[263]"/0,0,0/402,290,60/);右端面精磨砂轮转速

	;界面设定磨削总量计算
	DEF VAR100=(R///$85222,$85222,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[61]"/30,5,190/120,5,60/);累计磨削总量显示
	DEF VAR101=(R///$85220,$85219,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[117]"/30,25,190/120,25,60/);界面设定磨削总量显示
	DEF VAR102=(R///$85222,$85222,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[62]"/215,5,190/305,5,60/);累计磨削总量显示
	DEF VAR103=(R///$85220,$85219,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[118]"/215,25,190/305,25,60/);界面设定磨削总量显示
	;磨削几件后修整
	DEF WORK_CUMU=(I///$85227,$85227,,$85228/WR2//"/NC/_N_NC_GD2_ACX/INI[99]"/400,5,110/470,5,110//"UserGuide/section_27.html","S27D12");磨削工件计数(磨削完毕后累加)
	DEF WORK_DRESS=(I///$85229,$85229,,$85228/WR2//"/NC/_N_NC_GD2_ACX/INI[100]"/400,25,110/470,25,110//"UserGuide/section_27.html","S27D13");磨削几件后修整(次数到达后,下一次开始时修整)

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se3);端面
	HS7=($85011,ac7,se1);程序选项界面

	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se1);磨削
	VS2=($85710,ac7,se3);工艺
	VS3=($85711,ac7,se1);修整

	PRESS(HS1)
	IF TYPE.VAL==1
		LM("MASK18","grind.com")
	ELSE
		LM("MASK1","grind.com")
	ENDIF
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

	PRESS(VS1)
		LM("MASK32","centerduanmian.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK25","centerduanmian.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK27","centerduanmian.com")
	END_PRESS

	CHANGE(VAR15);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR16);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR19);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR20);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR17);界面设定磨削总量计算
		CALL("UP4")
	END_CHANGE

	CHANGE(VAR18);界面设定磨削总量计算
		CALL("UP4")
	END_CHANGE

	CHANGE(VAR21);界面设定磨削总量计算
		CALL("UP4")
	END_CHANGE

	CHANGE(VAR22);界面设定磨削总量计算
		CALL("UP4")
	END_CHANGE

	CHANGE(VAR37);砂轮转速计算
		VAR33.VAL=VAR37.VAL*60000/(PI*VAR32.VAL)
	END_CHANGE

	CHANGE(VAR38)
		VAR34.VAL=VAR38.VAL*60000/(PI*VAR32.VAL)
	END_CHANGE

	CHANGE(VAR39)
		VAR35.VAL=VAR39.VAL*60000/(PI*VAR32.VAL)
	END_CHANGE

	CHANGE(VAR40)
		VAR36.VAL=VAR40.VAL*60000/(PI*VAR32.VAL)
	END_CHANGE

	SUB(UP3)
		VAR101.VAL=VAR15.VAL*VAR19.VAL+VAR16.VAL*VAR20.VAL
	END_SUB

	SUB(UP4)
		VAR103.VAL=VAR17.VAL*VAR21.VAL+VAR18.VAL*VAR22.VAL
	END_SUB

//END

;***********************MASK27:侧面修整参数:panel_27**********************
//M(MASK27/$85711/"panel_27_1_chs.png"/)

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM ifIsNotHasU
	DEF U_IM=(R///$85121,$85121,,/WR1//"$AA_IM[U]"/10,10,20/30,10,60/3);U_IM ifIsHasU
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,30,20/30,30,60/3);Z_IM

	DEF VAR0=(R///$85366,$85366,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[129]"/110,10,110/200,10,110//"UserGuide/section_27.html","S27D20");累计修整量
	DEF ZUIDU=(R///$85724,$85724,,$85043/WR2/"panel_27_4_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[137]"/110,40,110/200,40,110//"UserGuide/section_27.html","S27D21");端面修整锥度微调(正 前大后小/负 前小后大)

	DEF WHEEL_STATUS=(I/*0=$85327,1=$85328//$85350,$85350,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[130]"/330,10,110/440,10,60//"UserGuide/section_27.html","S27D22");砂轮状态

	DEF VAR2=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[95]"/330,40,110/440,40,60//"UserGuide/section_27.html","S27D23");粗修次数
	DEF VAR3=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[97]"/330,60,110/440,60,110//"UserGuide/section_27.html","S27D24");粗修量
	DEF VAR4=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[103]"/330,80,110/440,80,110//"UserGuide/section_27.html","S27D25");粗修速度

	DEF VAR5=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[96]"/330,110,120/440,110,60//"UserGuide/section_27.html","S27D26");精修次数
	DEF VAR6=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[98]"/330,130,110/440,130,110//"UserGuide/section_27.html","S27D27");精修量
	DEF VAR7=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[104]"/330,150,110/440,150,110//"UserGuide/section_27.html","S27D28");精修速度

	DEF VAR8=(R///$85715,$85715,,/WR2/"panel_27_2_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[101]"/330,180,110/440,180,60//"UserGuide/section_27.html","S27D29");U轴修整起点
	DEF VAR9=(R///$85716,$85716,,/WR2/"panel_27_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[102]"/330,200,110/440,200,60//"UserGuide/section_27.html","S27D30");U轴修整深度
	
	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS[42]"/330,230,110/440,230,110//"UserGuide/section_27.html","S27D31");砂轮线速度
	DEF VAR16=(I///$85318,$85318,,$85044/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[131]"/330,250,110/440,250,110/);修整时砂轮转速

    DEF VAR11=(R///$85718,$85718,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[109]"/330,280,110/440,280,60//"UserGuide/section_27.html","S27D32");Z轴修整当前位置
	DEF VAR10=(R///$85717,$85717,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[127]"/330,300,110/440,300,60//"UserGuide/section_27.html","S27D33");Z轴修整初始位置

	DEF VAR14=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[92]"/0,0,0/0,0,0/);砂轮当前直径
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se3);端面
	HS7=($85011,ac7,se1);程序选项界面


	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se1);磨削
	VS2=($85710,ac7,se1);工艺
	VS3=($85711,ac7,se3);修整

	PRESS(HS1)
		IF TYPE.VAL==1
			LM("MASK18","grind.com")
		ELSE
			LM("MASK1","grind.com")
		ENDIF
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

	PRESS(VS1)
		LM("MASK32","centerduanmian.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK25","centerduanmian.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK27","centerduanmian.com")
	END_PRESS

	CHANGE(VAR2)
		call("UP4")
	END_CHANGE

	CHANGE(QCHECK)
		call("UP4")
	END_CHANGE

	CHANGE(VAR15)
		VAR16.VAL=VAR15.VAL*60000/(PI*VAR14.VAL);修整时砂轮转速计算
	END_CHANGE

	CHANGE(VAR10)
		VAR0.VAL=ABS(VAR10.VAL-VAR11.VAL)
	END_CHANGE

	CHANGE(VAR11)
		VAR0.VAL=ABS(VAR10.VAL-VAR11.VAL)
	END_CHANGE

	SUB(UP4)
		IF QCHECK.VAL==1
			VAR3.WR=1
			VAR6.WR=1
			VAR8.WR=1
			VAR9.WR=1
			VAR10.WR=1			
		ELSE
			VAR3.WR=2
			VAR6.WR=2
			VAR8.WR=2
			VAR9.WR=2
			VAR10.WR=2			
		ENDIF
	END_SUB

//END

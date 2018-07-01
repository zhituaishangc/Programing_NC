;ifIsVWSRBegin
;***********************MASK4:修整参数_VW单滚轮:panel_4**********************
//M(Mask4/$85380/"panel_4_1_chs.png"/)

	DEF VAR0=(R/0,300//$85614,$85614,,$85043/WR4//""/330,60,110/440,60,110/);滚轮间距

	DEF VAR1=(R/0,10//$85612,$85612,,$85043/WR2/"panel_4_2_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[5]"/330,90,110/440,90,110/);圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[6]"/330,110,110/440,110,110/);右圆弧半径

	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR2/"panel_4_3_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,140,110/440,140,110/);初始接触位置
	DEF VAR4=(R/-500,500//$85617,$85617,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR2/"panel_4_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前接触位置
	DEF VAR6=(R/-500,500//$85619,$85619,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_4_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_4_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度
	
	DEF DWHEEL_RPM=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF VAR11=(R/-2000,2000//$85608,$85608,,$85043/WR2/"panel_4_1_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,40,110/440,40,110/);砂轮修整轮中心
	DEF para_switch=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_4_1_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[1]"/0,0,0/530,40,18/);参数锁定开关

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se1);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se3);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se1);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se1);"双滚轮" ifIsSide
	VS7=($85379,ac7,se2);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR1)
		VAR2.VAL=VAR1.VAL
	END_CHANGE

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE

	CHANGE(VAR7);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(para_switch)
		CALL("UP1")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR1.WR=1
			VAR3.WR=1
			VAR5.WR=1
			VAR7.WR=1
			VAR11.WR=1
			para_switch.WR=1
		ELSE
			VAR1.WR=2
			VAR3.WR=2
			VAR5.WR=2
			VAR7.WR=2
			para_switch.WR=2
			CALL("UP1")
		ENDIF
	END_CHANGE

	SUB(UP1)
		IF para_switch.VAL==0
			VAR11.WR=2
		ELSE
			VAR11.WR=1
		ENDIF
	END_SUB

//END

;**********************MASK6:修整参数_VW方滚轮:panel_6:;**********************
//M(Mask6/$85382//)

	DEF VAR11=(R/-500,500//$85608,$85608,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,40,110/440,40,110/);砂轮修整轮中心
	DEF VAR0=(R/0,100//$85615,$85615,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[4]"/330,60,110/440,60,110/);方滚轮厚度

	DEF VAR1=(R/0,10//$85610,$85610,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[9]"/330,90,110/440,90,110/);左圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[10]"/330,110,110/440,110,110/);右圆弧半径

	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,140,110/440,140,110/);初始接触位置
	DEF VAR4=(R/-500,500//$85617,$85617,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前接触位置
	DEF VAR6=(R/-500,500//$85619,$85619,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85045/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度

	DEF VAR9=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速
	
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se1);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se3);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se1);"双滚轮" ifIsSide
	VS7=($85379,ac7,se2);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE
	
	CHANGE(VAR7);修整轮转速计算
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL)
	END_CHANGE	

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR1.WR=1
			VAR2.WR=1
			VAR3.WR=1
			VAR4.WR=1
			VAR5.WR=1
			VAR6.WR=1
			VAR7.WR=1
			VAR11.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=2
			VAR5.WR=2
			VAR6.WR=2
			VAR7.WR=2
			VAR11.WR=2
		ENDIF
	END_CHANGE	

//END
;ifIsVWSREnd

;ifIsVWSideBegin
;**********************MASK5:修整参数_VW双滚轮:panel_5:;**********************
//M(Mask5/$85381//)

	DEF VAR11=(R/-500,500//$85609,$85608,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,20,110/440,20,110/);砂轮修整轮中心
	DEF para_switch=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2//"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[2]"/0,0,0/530,20,18/);参数锁定开关

	DEF VAR0=(R/0,300//$85614,$85614,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[3]"/330,40,110/440,40,110/);双滚轮间距

	DEF VAR1=(R/0,10//$85610,$85610,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[7]"/330,70,110/440,70,110/);左圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[8]"/330,90,110/440,90,110/);右圆弧半径

	DEF VAR9=(R/-5,5//$85613,$85613,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[16]"/330,120,110/440,120,110/);左右轮高度差
	DEF VAR3=(R/-500,500//$85616,$85616,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,140,110/440,140,110/);初始左端接触位置
	DEF VAR4=(R/-500,500//$85617,$85617,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85618,$85618,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前左端接触位置
	DEF VAR6=(R/-500,500//$85619,$85619,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85045/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度

	DEF DWHEEL_RPM=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速
	
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se1);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se1);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se3);"双滚轮" ifIsSide
	VS7=($85379,ac7,se2);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR3)
		call("UP2")
	END_CHANGE

	CHANGE(VAR5)
		call("UP2")
	END_CHANGE

	CHANGE(VAR9)
		call("UP2")
	END_CHANGE

	CHANGE(VAR7);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(para_switch)
		CALL("UP1")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR1.WR=1
			VAR2.WR=1
			VAR9.WR=1
			VAR3.WR=1
			VAR4.WR=1
			VAR5.WR=1
			VAR6.WR=1
			VAR7.WR=1
			VAR11.WR=1
			para_switch.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR9.WR=2
			VAR3.WR=2
			VAR4.WR=1
			VAR5.WR=2
			VAR6.WR=1
			VAR7.WR=2
			para_switch.WR=2
			CALL("UP1")
		ENDIF
	END_CHANGE

	SUB(UP2)
		VAR4.VAL=VAR3.VAL+VAR9.VAL
		VAR6.VAL=VAR5.VAL+VAR9.VAL
	END_SUB

	SUB(UP1)
		IF para_switch.VAL==0
			VAR11.WR=2
		ELSE
			VAR11.WR=1
		ENDIF
	END_SUB

//END
;ifIsVWSideEnd

;ifIsVBegin
;**********************MASK11:修整参数_滚压轮V:panel_11:;**********************
//M(Mask11/$85379/"panel_11_1_chs.png"/)

	DEF VAR11=(R/0,80//$85604,$85604,,$85047/WR2/"panel_11_1_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[19]"/330,70,110/440,70,110/);滚压轮停留时间
	
	DEF VAR1=(R/-500,500//$85603,$85603,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,90,110/440,90,110/);NC用初始接触
	DEF VAR2=(R/0,50//$85602,$85602,,$85043/WR2/"panel_11_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[2]"/330,110,110/440,110,110/);齿高

	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/330,140,110/440,140,110/);初始接触位置

	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR2/"panel_11_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_11_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_11_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度
	DEF VAR9=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速

	;+++++++++++++++++++++++++++++++
	DEF Z_CENTER=(R/-2000,2000//$85608,$85608,,$85043/WR2/"panel_4_1_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,40,110/440,40,110/);砂轮修整轮中心 ifIsVW

	DEF VAR10=(R///,,,/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测
	
	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se2);"三角" ifIsAllShape
	VS2=($85384,ac7,se2);"梯形" ifIsAllShape
	VS3=($85385,ac7,se2);"双圆弧" ifIsArc
	VS4=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se2);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se2);"双滚轮" ifIsSide
	VS7=($85379,ac7,se3);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR3)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR2)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR7)
		CALL("UP1")
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR8);修整轮转速计算
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(para_switch)
		CALL("UP2")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR3.WR=1
			VAR2.WR=1
			VAR5.WR=1
			VAR7.WR=1
			para_switch.WR=1
		ELSE
			VAR3.WR=2
			VAR2.WR=2
			VAR5.WR=2
			VAR7.WR=2
			para_switch.WR=2
			CALL("UP2")
		ENDIF
	END_CHANGE

	SUB(UP1)
		VAR1.VAL=VAR3.VAL-VAR2.VAL;NC用初始接触位
	END_SUB

//END
;ifIsVEnd

;ifIsXZSRBegin
;**********************MASK12:修整参数_XZ单滚轮:panel_12:;**********************
//M(Mask12/$85380/"panel_12_1_chs.png"/)

	DEF VAR12=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_12_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/330,20,110/440,20,110);回零时砂轮与修整轮中间距
	DEF para_switch2=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_12_7_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[11]"/0,0,0/530,20,18/);参数锁定开关

	DEF VAR11=(R/-2000,2000//$85607,$85608,,$85043/WR2/"panel_12_1_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,40,110/440,40,110/);砂轮修整轮中心
	DEF para_switch=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_12_1_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[4]"/0,0,0/530,40,18/);参数锁定开关

	DEF VAR0=(R/0,300//$85614,$85614,,$85043/WR4//""/330,60,110/440,60,110/);滚轮间距

	DEF VAR1=(R/0,10//$85612,$85612,,$85043/WR2/"panel_12_2_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[5]"/330,90,110/440,90,110/);圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[6]"/330,110,110/440,110,110/);右圆弧半径

	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR1/"panel_12_3_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,140,110/440,140,110/);初始接触位置
	DEF VAR4=(R/-500,500//$85617,$85617,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR2/"panel_12_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前接触位置
	DEF VAR6=(R/-500,500//$85619,$85619,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_12_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_12_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度
	
	DEF DWHEEL_RPM=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速

	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径
	DEF GRIND_TYPE=(R////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型变量的引用

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se1);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se3);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se1);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se1);"双滚轮" ifIsSide
	VS7=($85379,ac7,se2);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR1)
		VAR2.VAL=VAR1.VAL
	END_CHANGE

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE

	CHANGE(VAR12)
		call("UP3")
	END_CHANGE

	CHANGE(VAR7);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
		call("UP3")
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(para_switch)
		call("UP1")
	END_CHANGE

	CHANGE(para_switch2)
		call("UP2")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR1.WR=1
			VAR3.WR=1
			VAR5.WR=1
			VAR7.WR=1
			VAR11.WR=1
			VAR12.WR=1
			para_switch.WR=1
			para_switch2.WR=1
		ELSE
			VAR1.WR=2
			VAR3.WR=1
			VAR5.WR=2
			VAR7.WR=2
			para_switch.WR=2
			para_switch2.WR=2
			CALL("UP1")
			CALL("UP2")
		ENDIF
	END_CHANGE

	SUB(UP1)
		IF para_switch.VAL==0
			VAR11.WR=2
		ELSE
			VAR11.WR=1
		ENDIF
	END_SUB

	SUB(UP2)
		IF para_switch2.VAL==0
			VAR12.WR=2
		ELSE
			VAR12.WR=1
		ENDIF
	END_SUB

	SUB(UP3)
		IF GRIND_TYPE.VAL<>1;不是内螺纹
			VAR3.VAL=-(VAR12.VAL-VAR7.VAL/2-VAR10.VAL/2);初始接触
		ELSE
			VAR3.VAL=-(VAR12.VAL+VAR7.VAL/2+VAR10.VAL/2);初始接触位
		ENDIF
		VAR4.VAL=VAR3.VAL
	END_SUB

//END

;**********************MASK14:修整参数_XZ方滚轮:panel_14:;**********************
//M(Mask14/$85382//)

	DEF VAR12=(R/-800,800//$85601,$85601,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/330,20,110/440,20,110);回零时砂轮与修整轮中间距
	DEF para_switch2=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2//"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[11]"/0,0,0/530,20,18/);参数锁定开关

	DEF VAR11=(R/-2000,2000//$85608,$85608,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,40,110/440,40,110/);砂轮修整轮中心
	DEF para_switch=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2//"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[4]"/0,0,0/530,40,18/);参数锁定开关

	DEF VAR0=(R/0,100//$85615,$85615,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[4]"/330,60,110/440,60,110/);方滚轮厚度

	DEF VAR1=(R/0,10//$85610,$85610,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[9]"/330,90,110/440,90,110/);左圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[10]"/330,110,110/440,110,110/);右圆弧半径

	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,140,110/440,140,110/);初始接触位置
	DEF VAR4=(R/-500,500//$85617,$85617,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前接触位置
	DEF VAR6=(R/-500,500//$85619,$85619,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85045/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度

	DEF VAR9=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速
	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径
	
	DEF GRIND_TYPE=(R////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型变量的引用
	
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se1);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se3);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se1);"双滚轮" ifIsSide
	VS7=($85379,ac7,se2);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE
	
	CHANGE(VAR7);修整轮转速计算
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL)
		CALL("UP3")
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL)
	END_CHANGE

	CHANGE(VAR12)
		CALL("UP3")
	END_CHANGE

	CHANGE(para_switch)
		call("UP1")
	END_CHANGE

	CHANGE(para_switch2)
		call("UP2")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR1.WR=1
			VAR2.WR=1
			VAR3.WR=1
			VAR4.WR=1
			VAR5.WR=1
			VAR6.WR=1
			VAR7.WR=1
			VAR11.WR=1
			VAR12.WR=1
			para_switch.WR=1
			para_switch2.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR3.WR=1
			VAR4.WR=1
			VAR5.WR=1
			VAR6.WR=1
			VAR7.WR=2
			para_switch.WR=2
			para_switch2.WR=2
			CALL("UP1")
			CALL("UP2")
		ENDIF
	END_CHANGE	
	
	SUB(UP1)
		IF para_switch.VAL==0
			VAR11.WR=2
		ELSE
			VAR11.WR=1
		ENDIF
	END_SUB

	SUB(UP2)
		IF para_switch2.VAL==0
			VAR12.WR=2
		ELSE
			VAR12.WR=1
		ENDIF
	END_SUB

	SUB(UP3)
		IF GRIND_TYPE.VAL<>1;不是内螺纹
			VAR3.VAL=-(VAR12.VAL-VAR7.VAL/2-VAR10.VAL/2);初始接触
		ELSE
			VAR3.VAL=-(VAR12.VAL+VAR7.VAL/2+VAR10.VAL/2);初始接触位
		ENDIF
		VAR4.VAL=VAR3.VAL
	END_SUB

//END
;ifIsXZSREnd

;ifIsXZSideBegin
;**********************MASK13:修整参数_XZ双滚轮:panel_13:;**********************
//M(Mask13/$85381//)

	DEF VAR11=(R/-2000,2000//$85608,$85608,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[22]"/330,20,110/440,20,110/);砂轮修整轮中心
	DEF VAR0=(R/0,300//$85614,$85614,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[3]"/330,40,110/440,40,110/);双滚轮间距

	DEF VAR1=(R/0,10//$85610,$85610,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[7]"/330,70,110/440,70,110/);左圆弧半径
	DEF VAR2=(R/0,10//$85611,$85611,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[8]"/330,90,110/440,90,110/);右圆弧半径

	DEF VAR9=(R/-5,5//$85613,$85613,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[16]"/330,120,110/440,120,110/);左右轮高度差
	DEF VAR3=(R/-500,500//$85616,$85616,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,140,110/440,140,110/);初始左端接触位置
	DEF VAR4=(R/-500,500//$85617,$85617,,$85043/WR3//"/NC/_N_NC_GD2_ACX/WHEEL[14]"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85618,$85618,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前左端接触位置
	DEF VAR6=(R/-500,500//$85619,$85619,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[12]"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85045/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度

	DEF DWHEEL_RPM=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/330,280,110/440,280,110/);修整轮转速
	
	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se1);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se1);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se3);"双滚轮" ifIsSide
	VS7=($85379,ac7,se2);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR3)
		call("UP2")
	END_CHANGE

	CHANGE(VAR7);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(VAR8);修整轮转速计算
		DWHEEL_RPM.VAL=60000*VAR8.VAL/(PI*VAR7.VAL)
	END_CHANGE
	
	CHANGE(VAR9)
		call("UP2")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR1.WR=1
			VAR2.WR=1
			VAR9.WR=1
			VAR3.WR=1
			VAR4.WR=1
			VAR5.WR=1
			VAR6.WR=1
			VAR7.WR=1
			VAR11.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR9.WR=2
			VAR3.WR=2
			VAR4.WR=2
			VAR5.WR=2
			VAR6.WR=2
			VAR7.WR=2
			VAR11.WR=2
		ENDIF
	END_CHANGE

	SUB(UP2)
		VAR4.VAL=VAR3.VAL+VAR9.VAL
	END_SUB

//END
;ifIsXZSideEnd

;ifIsXWaiBegin
;**********************MASK16:修整参数_滚压轮X_外:panel_16:;**********************
//M(Mask16/$85379/"panel_16_1_chs.png"/)

	DEF VAR0=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_16_2_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/325,40,110/440,40,110);回零时两轮中间距
	DEF para_switch=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_16_2_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[6]"/0,0,0/530,40,18/);参数锁定开关

	DEF VAR12=(R/-2000,2000//$85608,$85608,,$85043/WR2/"panel_16_7_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[22]"/325,70,110/440,70,110/);砂轮修整轮中心
	;DEF VAR20=(R/-2000,2000//$85624,$85624,,$85043/WR2/"panel_16_8_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[48]"/325,90,115/440,90,110/);砂轮开到修整端面位置
	;DEF VAR21=(R/-100,100//$85625,$85625,,$85043/WR2/"panel_16_9_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[49]"/325,110,115/440,110,110/);修整轮齿槽到修整端面距离

	DEF VAR11=(R/0,80//$85604,$85604,,$85047/WR2/"panel_16_1_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[19]"/325,140,110/440,140,110/);滚压轮停留时间
	
	DEF VAR2=(R/0,50//$85602,$85602,,$85043/WR2/"panel_16_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,170,110/440,170,110/);齿高
	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_16_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/325,190,110/440,190,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_16_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/325,210,110/440,210,110/);修整轮线速度
	DEF VAR9=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/325,230,110/440,230,110/);修整轮转速

	DEF VAR1=(R/-500,500//$85603,$85603,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/325,260,110/440,260,110/);NC用初始接触
	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/325,280,110/440,280,110/);初始接触位置
	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR1/"panel_16_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/325,300,110/440,300,110/);当前接触位置

	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se2);"三角" ifIsAllShape
	VS2=($85384,ac7,se2);"梯形" ifIsAllShape
	VS3=($85385,ac7,se2);"双圆弧" ifIsArc
	VS4=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se2);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se2);"双滚轮" ifIsSide
	VS7=($85379,ac7,se3);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR0)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR2)
		CALL("UP1")
	END_CHANGE

	CHANGE(VAR7)
		CALL("UP1")
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR8)
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE
	
	CHANGE(VAR20)
		call("UP2")
	END_CHANGE

	CHANGE(VAR21)
		call("UP2")
	END_CHANGE

	CHANGE(para_switch)
		CALL("UP3")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR2.WR=1
			VAR7.WR=1
			VAR12.WR=1
			VAR20.WR=1
			VAR21.WR=1
			para_switch.WR=1
		ELSE
			VAR2.WR=2
			VAR7.WR=2
			VAR12.WR=2
			VAR20.WR=2
			VAR21.WR=2
			para_switch.WR=2
			CALL("UP3")
		ENDIF
	END_CHANGE

	SUB(UP1)
		VAR3.VAL=-(VAR0.VAL-VAR7.VAL/2-VAR10.VAL/2);初始接触
		VAR1.VAL=VAR3.VAL-VAR2.VAL;NC用初始接触
	END_SUB

	SUB(UP2)
		;VAR12.VAL=VAR20.VAL+VAR21.VAL
	END_SUB

	SUB(UP3)
		IF para_switch.VAL==0
			VAR0.WR=2
		ELSE
			VAR0.WR=1
		ENDIF
	END_SUB

//END
;ifIsXWaiEnd

;ifIsXNeiFrontBegin
;**********************MASK17:修整参数_滚压轮X_内_前:panel_17:;**********************
//M(Mask17/$85379/"panel_17_1_chs.png"/)

	DEF VAR0=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_17_2_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/325,40,110/440,40,110);回零时砂轮与修整轮中间距
	DEF para_switch1=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_17_2_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[7]"/0,0,0/530,40,18/);参数锁定开关

	DEF VAR12=(R/-2000,2000//$85608,$85608,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[22]"/325,70,110/440,70,110/);砂轮与修整轮Z中心

	DEF VAR20=(R/-2000,2000//$85624,$85624,,$85043/WR2/"panel_17_8_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[48]"/325,90,115/440,90,110/);砂轮开到修整端面位置
	DEF para_switch2=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_17_8_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[8]"/0,0,0/530,90,18/);参数锁定开关

	DEF VAR21=(R/-100,100//$85625,$85625,,$85043/WR2/"panel_17_9_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[49]"/325,110,115/440,110,110/);修整轮齿槽到修整端面距离
	DEF para_switch3=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_17_9_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[9]"/0,0,0/530,110,18/);参数锁定开关

	DEF VAR11=(R/0,80//$85604,$85604,,$85047/WR2/"panel_17_1_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[19]"/325,140,110/440,140,110/);滚压轮停留时间

	DEF VAR2=(R/0,50//$85602,$85602,,$85043/WR2/"panel_17_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,170,110/440,170,110/);齿高
	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_17_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/325,190,110/440,190,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_17_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/325,210,110/440,210,110/);修整轮线速度
	DEF VAR9=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/325,230,110/440,230,110/);修整轮转速

	DEF VAR1=(R/-500,500//$85603,$85603,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/325,260,130/440,260,110/);NC用初始接触
	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/325,280,130/440,280,110/);初始接触位置
	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR1/"panel_17_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/325,300,130/440,300,110/);当前接触位置

	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se2);"三角" ifIsAllShape
	VS2=($85384,ac7,se2);"梯形" ifIsAllShape
	VS3=($85385,ac7,se2);"双圆弧" ifIsArc
	VS4=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se2);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se2);"双滚轮" ifIsSide
	VS7=($85379,ac7,se3);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR0)
		call("UP1")
	END_CHANGE

	CHANGE(VAR2)
		call("UP1")
	END_CHANGE

	CHANGE(VAR3)
		call("UP1")
	END_CHANGE

	CHANGE(VAR7)
		call("UP1")
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR8)
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR20)
		call("UP2")
	END_CHANGE

	CHANGE(VAR21)
		call("UP2")
	END_CHANGE

	CHANGE(para_switch1)
		call("UP3")
	END_CHANGE

	CHANGE(para_switch2)
		call("UP4")
	END_CHANGE

	CHANGE(para_switch3)
		call("UP5")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR2.WR=1
			VAR7.WR=1
			VAR20.WR=1
			VAR21.WR=1
			para_switch1.WR=1
			para_switch2.WR=1
			para_switch3.WR=1
		ELSE
			VAR2.WR=2
			VAR7.WR=2
			para_switch1.WR=2
			para_switch2.WR=2
			para_switch3.WR=2
			CALL("UP3")
			CALL("UP4")
			CALL("UP5")
		ENDIF
	END_CHANGE

	SUB(UP1)
		VAR3.VAL=-(VAR0.VAL+VAR7.VAL/2+VAR10.VAL/2);初始接触位
		VAR1.VAL=VAR3.VAL+VAR2.VAL;NC用初始接触
	END_SUB

	SUB(UP2)
		VAR12.VAL=VAR20.VAL+VAR21.VAL
	END_SUB

	SUB(UP3)
		IF para_switch1.VAL==0
			VAR0.WR=2
		ELSE
			VAR0.WR=1
		ENDIF
	END_SUB

	SUB(UP4)
		IF para_switch2.VAL==0
			VAR20.WR=2
		ELSE
			VAR20.WR=1
		ENDIF
	END_SUB

	SUB(UP5)
		IF para_switch3.VAL==0
			VAR21.WR=2
		ELSE
			VAR21.WR=1
		ENDIF
	END_SUB

//END
;ifIsXNeiFrontEnd

;ifIsXNeiBackBegin
;**********************MASK19:修整参数_滚压轮X_内_后:panel_19:;**********************
//M(Mask19/$85379/"panel_19_1_chs.png"/)

	DEF VAR0=(R/-800,800//$85601,$85601,,$85043/WR2/"panel_19_2_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[3]"/325,40,110/440,40,110);回零时砂轮与修整轮中间距
	DEF para_switch=(I/*0=$85058,1=$85059//$85063,$85063,,/WR2/"panel_19_2_chs.png"/"/NC/_N_NC_GD2_ACX/PARA_LOCK_SWITCH[10]"/0,0,0/530,40,18/);参数锁定开关

	DEF VAR11=(R/0,80//$85604,$85604,,$85047/WR2/"panel_19_1_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[19]"/325,140,110/440,140,110/);滚压轮停留时间

	DEF VAR2=(R/0,50//$85602,$85602,,$85043/WR2/"panel_19_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[2]"/325,170,110/440,170,110/);齿高
	DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2/"panel_19_5_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[1]"/325,190,110/440,190,110/);修整轮直径
	DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2/"panel_19_6_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[2]"/325,210,110/440,210,110/);修整轮线速度
	DEF VAR9=(I///$85600,$85600,,$85044/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[20]"/325,230,110/440,230,110/);修整轮转速

	DEF VAR1=(R/-500,500//$85603,$85603,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/325,260,130/440,260,110/);NC用初始接触
	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/325,280,130/440,280,110/);初始接触位置
	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR1/"panel_19_4_chs.png"/"/NC/_N_NC_GD2_ACX/WHEEL[11]"/325,300,130/440,300,110/);当前接触位置

	DEF VAR10=(R////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/0,0,0/0,0,0/);新砂轮直径

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85383,ac7,se2);"三角" ifIsAllShape
	VS2=($85384,ac7,se2);"梯形" ifIsAllShape
	VS3=($85385,ac7,se2);"双圆弧" ifIsArc
	VS4=($85380,ac7,se2);"单滚轮" ifIsSingleAndRound
	VS6=($85382,ac7,se2);"方滚轮" ifIsSingleAndRound
	VS5=($85381,ac7,se2);"双滚轮" ifIsSide
	VS7=($85379,ac7,se3);"滚压轮"
	VS8=($85378,ac7,se1);"摆缸"  ifIsVH

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR0)
		call("UP1")
	END_CHANGE

	CHANGE(VAR2)
		call("UP1")
	END_CHANGE

	CHANGE(VAR3)
		call("UP1")
	END_CHANGE

	CHANGE(VAR7)
		call("UP1")
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(VAR8)
		VAR9.VAL=VAR8.VAL*60000/(PI*VAR7.VAL);修整轮转速计算
	END_CHANGE

	CHANGE(para_switch)
		CALL("UP2")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR2.WR=1
			VAR7.WR=1
		ELSE
			VAR2.WR=2
			VAR7.WR=2
			para_switch.WR=2
			CALL("UP2")
		ENDIF
	END_CHANGE

	SUB(UP1)
		VAR3.VAL=-(VAR0.VAL-VAR7.VAL/2-VAR10.VAL/2);初始接触位
		VAR1.VAL=VAR3.VAL-VAR2.VAL;NC用初始接触
	END_SUB

	SUB(UP2)
		IF para_switch.VAL==0
			VAR0.WR=2
		ELSE
			VAR0.WR=1
		ENDIF
	END_SUB

//END
;ifIsXNeiBackEnd

;ifIsVHBegin
;**********************MASK15:修整参数_摆缸:panel_15:;**********************
//M(Mask15/$85379//)

	;DEF VAR0=(R/0,800//$85601,$85601,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[3]"/330,60,110/440,60,110/);两轮中间距

	DEF VAR1=(R/-500,500//$85603,$85603,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[13]"/330,90,110/440,90,110/);NC用初始接触
	DEF VAR2=(R/0,50//$85602,$85602,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[2]"/330,110,110/440,110,110/);齿高

	DEF VAR3=(R/-500,500//$85622,$85622,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[15]"/330,140,110/440,140,110/);初始接触位置

	DEF VAR5=(R/-500,500//$85623,$85623,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[11]"/330,190,110/440,190,110/);当前接触位置

	;DEF VAR7=(R/0,500//$85620,$85620,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[1]"/330,240,110/440,240,110/);修整轮直径
	;DEF VAR8=(R/0,60//$85621,$85621,,$85046/WR2//"/NC/_N_NC_GD2_ACX/WHEEL[2]"/330,260,110/440,260,110/);修整轮线速度

	;DEF VAR10=(R/0,1000//$85319,$85319,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[24]"/330,250,110/440,250,110/);新砂轮直径
	
	DEF VAR20=(R///,,,/WR4//"/Plc/DB4900.DBX23.0"/0,0,0/0,0,0/);左开关
	DEF VAR21=(R///,,,/WR4//"/Plc/DB4900.DBX24.0"/0,0,0/0,0,0/);右开关

	DEF VAR22=(I/*0=$85014,1=$85013//$85605,$85605,,/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[17]"/330,240,110/440,240,50/);液压左
	DEF VAR23=(I/*0=$85014,1=$85013//$85606,$85606,,/WR1//"/NC/_N_NC_GD2_ACX/WHEEL[18]"/330,260,110/440,260,50/);液压右

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测	
	
	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF WARE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se3);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS8=($85378,ac7,se3);"摆缸"

	PRESS(HS1)
		IF TYPE.VAL<>1
			LM("MASK1","grind.com")
		ELSE
			LM("MASK18","grind.com")
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
		LM("MASK7","shape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK8","shape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK9","shape.com")
	END_PRESS

	PRESS(VS4)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK4","dressware.com")
		ELSE;XZ/X
			LM("MASK12","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS5)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK5","dressware.com")
		ELSE;XZ/X
			LM("MASK13","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS6)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK6","dressware.com")
		ELSE;XZ/X
			LM("MASK14","dressware.com")
		ENDIF
	END_PRESS

	PRESS(VS7)
		IF (WARE.VAL==0) OR (WARE.VAL==2);VW/V
			LM("MASK11","dressware.com")
		ELSE;XZ/X
			IF GRIND_TYPE.VAL==0;WAI
				LM("MASK16","dressware.com")
			ELSE;NEI
				IF N_CX_X_TYPE.VAL==0;NEI-QIAN
					LM("MASK17","dressware.com")
				ELSE
					LM("MASK19","dressware.com")
				ENDIF
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS8)
		LM("MASK15","dressware.com")
	END_PRESS

	CHANGE(VAR2)
		VAR1.VAL=VAR3.VAL-VAR2.VAL
	END_CHANGE

	CHANGE(VAR3)
		VAR1.VAL=VAR3.VAL-VAR2.VAL
	END_CHANGE

	CHANGE(VAR20)
		VAR22.VAL=VAR20.VAL
	END_CHANGE

	CHANGE(VAR21)
		VAR23.VAL=VAR21.VAL
	END_CHANGE
	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR2.WR=1
			VAR3.WR=1
			VAR5.WR=1
		ELSE
			VAR2.WR=2
			VAR3.WR=2
			VAR5.WR=2
		ENDIF
	END_CHANGE

//END
;ifIsVHEnd


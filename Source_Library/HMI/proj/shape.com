;ifIsAllShapeBegin
;**********************MASK7:齿形参数_三角:panel_7:;**********************
//M(Mask7/$85383//)

	DEF VAR0=(R/0,100//$85417,$85417,,$85043/WR2/"panel_7_1_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[1]"/330,30,110/440,30,110/);齿高

	DEF VAR1=(R/0,90//$85402,$85402,,$85042/WR2/"panel_7_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[2]"/330,60,110/440,60,110/);初始左角
	DEF VAR2=(R/0,90//$85403,$85403,,$85042/WR2/"panel_7_2_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[3]"/330,80,110/440,80,110/);初始右角

	DEF VAR3=(R/0,50//$85422,$85422,,$85043/WR2/"panel_7_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[4]"/330,110,110/440,110,110/);左圆弧
	DEF VAR4=(R/0,50//$85419,$85419,,$85043/WR4/"panel_7_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[5]"/330,130,110/440,130,110/);右圆弧
	DEF RL=(R/-50,50//$85427,$85427,,$85043/WR2/"panel_7_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[12]"/330,130,110/440,130,110/);左圆弧调整
	DEF RR=(R/-50,50//$85428,$85428,,$85043/WR2/"panel_7_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[13]"/330,150,110/440,150,110/);右圆弧调整

	DEF VAR5=(R/0,50//$85429,$85420,,$85043/WR2/"panel_7_5_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[6]"/330,185,110/440,185,110/);过渡左圆弧
	DEF VAR6=(R/0,50//$85429,$85421,,$85043/WR2/"panel_7_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[7]"/330,205,110/440,205,110/);过渡右圆弧

	DEF VAR7=(R/-90,90//$85445,$85445,,$85042/WR2/"panel_7_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[8]"/330,240,110/440,240,110/);调整左角
	DEF VAR8=(R/-90,90//$85446,$85446,,$85042/WR2/"panel_7_2_chs.png"/"/NC/_N_NC_GD2_ACX/TRI[9]"/330,260,110/440,260,110/);调整右角
	DEF VAR9=(R/0,90//$85447,$85447,,$85042/WR3//"/NC/_N_NC_GD2_ACX/TRI[10]"/330,280,110/440,280,110/);当前左角
	DEF VAR10=(R/0,90//$85448,$85448,,$85042/WR3//"/NC/_N_NC_GD2_ACX/TRI[11]"/330,300,110/440,300,110/);当前右角

	DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[4]"/0,0,0/0,0,0/);修整轮类型
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[5]"/0,0,0/0,0,0/);单滚轮左圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[6]"/0,0,0/0,0,0/);单滚轮右圆弧半径
	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[7]"/0,0,0/0,0,0/);双滚轮圆弧半径
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[8]"/0,0,0/0,0,0/);双滚轮右圆弧半径
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[9]"/0,0,0/0,0,0/);方滚轮左圆弧半径
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[10]"/0,0,0/0,0,0/);方滚轮右圆弧半径
	
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

	VS1=($85383,ac7,se3);"三角" ifIsAllShape
	VS2=($85384,ac7,se1);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
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

	CHANGE(VAR20)
		call("UP1")
	END_CHANGE

	CHANGE(VAR1)
		call("UP2")
	END_CHANGE

	CHANGE(VAR2)
		call("UP2")
	END_CHANGE
	
	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL;齿底右圆弧=齿底左圆弧
	END_CHANGE

	CHANGE(VAR7)
		call("UP2")
	END_CHANGE

	CHANGE(VAR8)
		call("UP2")
	END_CHANGE

	CHANGE(VAR5)
		call("UP3")
	END_CHANGE

	CHANGE(VAR6)
		call("UP3")
	END_CHANGE

	CHANGE(QCHECK)
		IF QCHECK.VAL==1
			VAR0.WR=1
			VAR1.WR=1
			VAR2.WR=1
			VAR3.WR=1
			VAR4.WR=4
			VAR5.WR=1
			VAR6.WR=1
			VAR7.WR=1
			VAR8.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=4
			VAR5.WR=2
			VAR6.WR=2
			VAR7.WR=2
			VAR8.WR=2
		ENDIF
	END_CHANGE	
	
	SUB(UP2)
		VAR9.VAL=VAR1.VAL+VAR7.VAL
		VAR10.VAL=VAR2.VAL+VAR8.VAL
	END_SUB

	SUB(UP3)

		IF VAR20.VAL==0
			IF VAR5.VAL<VAR21.VAL
				VAR5.VAL=VAR21.VAL
			ENDIF
			IF VAR6.VAL<VAR22.VAL
				VAR6.VAL=VAR22.VAL
			ENDIF
		ELSE
			IF VAR20.VAL==1
				IF VAR5.VAL<VAR23.VAL
					VAR5.VAL=VAR23.VAL
				ENDIF
				IF VAR6.VAL<VAR24.VAL
					VAR6.VAL=VAR24.VAL
				ENDIF
			ELSE
				IF VAR20.VAL==2
					IF VAR5.VAL<VAR25.VAL
						VAR5.VAL=VAR25.VAL
					ENDIF
					IF VAR6.VAL<VAR26.VAL
						VAR6.VAL=VAR26.VAL
					ENDIF
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END

;**********************MASK8:齿形参数_梯形:panel_8:;**********************
//M(Mask8/$85384/"panel_8_1_chs.png"/)

	DEF VAR0=(R/0,100//$85417,$85417,,$85043/WR2/"panel_8_1_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[1]"/330,30,110/440,30,110/);齿高
	DEF VAR12=(R/0,100//$85423,$85423,,$85043/WR2/"panel_8_2_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[2]"/330,50,110/440,50,110/);齿根高度
	DEF VAR7=(R/0,200//$85416,$85416,,$85043/WR2/"panel_8_9_chs.png"/"/NC/_N_NC_GD2_ACX/INI[5]"/330,80,110/440,80,110/);螺距

	DEF VAR3=(R/0,50//$85418,$85418,,$85043/WR2/"panel_8_5_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[5]"/330,110,110/440,110,110/);齿底左圆弧
	DEF VAR4=(R/0,50//$85419,$85419,,$85043/WR2/"panel_8_6_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[6]"/330,130,110/440,130,110/);齿底右圆弧

	DEF VAR5=(R/0,50//$85420,$85420,,$85043/WR2/"panel_8_7_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[7]"/330,160,110/440,160,110/);过渡左圆弧
	DEF VAR6=(R/0,50//$85421,$85421,,$85043/WR2/"panel_8_8_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[8]"/330,180,110/440,180,110/);过渡右圆弧
	
	DEF VAR1=(R/0,90//$85402,$85402,,$85042/WR2/"panel_8_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[3]"/330,210,110/440,210,110/);初始左角
	DEF VAR2=(R/0,90//$85403,$85403,,$85042/WR2/"panel_8_4_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[4]"/330,230,110/440,230,110/);初始右角

	DEF VAR8=(R/0,90//$85445,$85445,,$85042/WR2/"panel_8_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[10]"/330,250,110/440,250,110/);调整左角
	DEF VAR9=(R/0,90//$85446,$85446,,$85042/WR2/"panel_8_4_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[11]"/330,270,110/440,270,110/);调整右角
	DEF VAR10=(R/0,90//$85447,$85447,,$85042/WR1/"panel_8_3_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[12]"/330,290,110/440,290,110/);当前左角
	DEF VAR11=(R/0,90//$85448,$85448,,$85042/WR1/"panel_8_4_chs.png"/"/NC/_N_NC_GD2_ACX/TRAP[13]"/330,310,110/440,310,110/);当前右角

	DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[4]"/0,0,0/0,0,0/);修整轮
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[5]"/0,0,0/0,0,0/);圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[6]"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[7]"/0,0,0/0,0,0/);圆弧半径
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[8]"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[9]"/0,0,0/0,0,0/);圆弧半径
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[10]"/0,0,0/0,0,0/);右圆弧半径
	
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
	VS2=($85384,ac7,se3);"梯形" ifIsAllShape
	VS3=($85385,ac7,se1);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
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

	CHANGE(VAR20)
		call("UP1")
	END_CHANGE

	CHANGE(VAR1)
		call("UP2")
	END_CHANGE

	CHANGE(VAR2)
		call("UP2")
	END_CHANGE

	CHANGE(VAR8)
		call("UP2")
	END_CHANGE

	CHANGE(VAR9)
		call("UP2")
	END_CHANGE

	CHANGE(VAR5)
		call("UP3")
	END_CHANGE

	CHANGE(VAR6)
		call("UP3")
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
			VAR8.WR=1
			VAR9.WR=1
			VAR12.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=2
			VAR5.WR=2
			VAR6.WR=2
			VAR7.WR=2
			VAR8.WR=2
			VAR9.WR=2
			VAR12.WR=2
		ENDIF
	END_CHANGE	
	

	SUB(UP2)
		VAR10.VAL=VAR1.VAL+VAR8.VAL
		VAR11.VAL=VAR2.VAL+VAR9.VAL
	END_SUB

	SUB(UP3)

		IF VAR20.VAL==0
			IF VAR5.VAL<VAR21.VAL
				VAR5.VAL=VAR21.VAL
			ENDIF
			IF VAR6.VAL<VAR22.VAL
				VAR6.VAL=VAR22.VAL
			ENDIF
		ELSE
			IF VAR20.VAL==1
				IF VAR5.VAL<VAR23.VAL
					VAR5.VAL=VAR23.VAL
				ENDIF
				IF VAR6.VAL<VAR24.VAL
					VAR6.VAL=VAR24.VAL
				ENDIF
			ELSE
				IF VAR20.VAL==2
					IF VAR5.VAL<VAR25.VAL
						VAR5.VAL=VAR25.VAL
					ENDIF
					IF VAR6.VAL<VAR26.VAL
						VAR6.VAL=VAR26.VAL
					ENDIF
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END
;ifIsAllShapeEnd
;+++++++++++++++++++++++++++++++

;**********************MASK9:齿形参数_双圆弧:panel_9:;**********************
//M(Mask9/$85385/"panel_9_1_chs.png"/)

	;DEF VAR0=(R/0,200//$85430,$85430,,$85043/WR2/"panel_9_1_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[2]"/330,30,110/440,30,110/);外圆直径
	;DEF VAR1=(R/0,200//$85431,$85431,,$85043/WR2/"panel_9_2_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[3]"/330,60,110/440,60,110/);公称直径

	;DEF VAR2=(R/0,50//$85440,$85440,,$85043/WR2/"panel_9_3_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[12]"/330,80,110/440,80,110/);过渡圆弧半径

	DEF VAR3=(R/0,90//$85433,$85433,,$85042/WR2/"panel_9_4_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[5]"/350,30,125/470,30,110/);接触角
	DEF VAR4=(R/0,50//$85432,$85432,,$85043/WR2/"panel_9_5_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[4]"/350,50,125/470,50,110/);钢球直径

	DEF VAR5=(R/0,50//$85434,$85434,,$85043/WR2/"panel_9_6_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[6]"/350,80,125/470,80,110/);初始左滚道
	DEF VAR6=(R/0,50//$85435,$85435,,$85043/WR2/"panel_9_7_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[7]"/350,100,125/470,100,110/);初始右滚道
	DEF VAR9=(R/0,50//$85438,$85438,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DARC[10]"/350,120,125/470,120,110/);当前左滚道
	DEF VAR10=(R/0,50//$85439,$85439,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DARC[11]"/350,140,125/470,140,110/);当前右滚道
	DEF VAR7=(R/-10,50//$85436,$85436,,$85043/WR2/"panel_9_8_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[8]"/350,160,125/470,160,110/);调整左滚道
	DEF VAR8=(R/-10,50//$85437,$85437,,$85043/WR2/"panel_9_9_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[9]"/350,180,125/470,180,110/);调整右滚道

	DEF VAR11=(R///$85441,$85441,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DARC[21]"/20,270,150/160,270,110/);原始左滚道水平偏心
	DEF VAR12=(R///$85442,$85442,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DARC[22]"/20,290,150/160,290,110/);原始右滚道水平偏心
	DEF VAR13=(R///$85443,$85443,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DARC[23]"/20,310,150/160,310,110/);原始左滚道垂直偏心
	DEF VAR14=(R///$85444,$85444,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DARC[24]"/20,330,150/160,330,110/);原始右滚道垂直偏心

	DEF VAR15=(R///$85449,$85449,,$85043/WR2/"panel_9_11_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[17]"/320,270,150/470,270,110/);左滚道水平偏心调整
	DEF VAR16=(R///$85450,$85450,,$85043/WR2/"panel_9_10_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[18]"/320,290,150/470,290,110/);右滚道水平偏心调整
	DEF VAR17=(R///$85451,$85451,,$85043/WR2/"panel_9_13_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[19]"/320,310,150/470,310,110/);左滚道垂直偏心调整
	DEF VAR18=(R///$85452,$85452,,$85043/WR2/"panel_9_12_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[20]"/320,330,150/470,330,110/);右滚道垂直偏心调整
	
    DEF VAR31=(R///$85453,$85453,,$85043/WR1/"panel_9_11_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[13]"/20,270,150/160,270,110/);当前左滚道水平偏心
	DEF VAR32=(R///$85454,$85454,,$85043/WR1/"panel_9_10_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[14]"/20,290,150/160,290,110/);当前右滚道水平偏心
	DEF VAR33=(R///$85455,$85455,,$85043/WR1/"panel_9_13_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[15]"/20,310,150/160,310,110/);当前左滚道垂直偏心
	DEF VAR34=(R///$85456,$85456,,$85043/WR1/"panel_9_12_chs.png"/"/NC/_N_NC_GD2_ACX/DARC[16]"/20,330,150/160,330,110/);当前右滚道垂直偏心
	
	DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[4]"/0,0,0/0,0,0/);修整轮
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[5]"/0,0,0/0,0,0/);圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[6]"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[7]"/0,0,0/0,0,0/);圆弧半径
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[8]"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[9]"/0,0,0/0,0,0/);圆弧半径
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/WHEEL[10]"/0,0,0/0,0,0/);右圆弧半径

	DEF VAR30=(R////WR4//"/NC/_N_NC_GD2_ACX/DARC[1]"/0,0,0/0,0,0/);齿高
	
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
	VS3=($85385,ac7,se3);"双圆弧" ifIsArc
	VS4=($85380,ac7,se1);"单滚轮" ifIsSingleAndRound
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
	
	CHANGE(VAR3)
		call("UP2")
	END_CHANGE	
	
	CHANGE(VAR4)
		call("UP1")
		call("UP2")
	END_CHANGE

    CHANGE(VAR5)
	    VAR30.VAL=VAR5.VAL
	    VAR9.VAL=VAR5.VAL+VAR7.VAL
		
	END_CHANGE	
	
	CHANGE(VAR6)
	    VAR10.VAL=VAR6.VAL+VAR8.VAL
		
	END_CHANGE
	
	CHANGE(VAR7)
		VAR9.VAL=VAR5.VAL+VAR7.VAL
		
	END_CHANGE

    CHANGE(VAR8)
		VAR10.VAL=VAR6.VAL+VAR8.VAL
		
	END_CHANGE

    CHANGE(VAR15)
		VAR31.VAL=VAR15.VAL+VAR11.VAL
	END_CHANGE

    CHANGE(VAR16)
		VAR32.VAL=VAR16.VAL+VAR12.VAL
	END_CHANGE	
	
	CHANGE(VAR17)
		VAR33.VAL=VAR17.VAL+VAR13.VAL
	END_CHANGE
	
	CHANGE(VAR18)
		VAR34.VAL=VAR18.VAL+VAR14.VAL
	END_CHANGE
	
	CHANGE(VAR20)
		call("UP3")
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
			VAR8.WR=1
			VAR15.WR=1
			VAR16.WR=1
			VAR17.WR=1
			VAR18.WR=1
		ELSE
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=2
			VAR7.WR=2
			VAR8.WR=2
			VAR15.WR=2
			VAR16.WR=2
			VAR17.WR=2
			VAR18.WR=2
		ENDIF
	END_CHANGE
	
    SUB(UP1)
		IF VAR4.VAL==1.588 OR VAR4.VAL==2.381 OR VAR4.VAL==3.175 OR VAR4.VAL==3.969 OR VAR4.VAL==4.763 OR VAR4.VAL==5.953 OR VAR4.VAL==7.144 OR VAR4.VAL==9.525 OR VAR4.VAL==12.7
			IF VAR3.VAL==45
				IF VAR4.VAL==1.588
					VAR5.VAL=0.881
					VAR6.VAL=0.881
				ELSE
					IF VAR4.VAL==2.381
						VAR5.VAL=1.321
						VAR6.VAL=1.321
					ELSE
						IF VAR4.VAL==3.175
							VAR5.VAL=1.762
							VAR6.VAL=1.762
						ELSE
							IF VAR4.VAL==3.969
								VAR5.VAL=2.203
								VAR6.VAL=2.203
							ELSE
								IF VAR4.VAL==4.763
									VAR5.VAL=2.643
									VAR6.VAL=2.643
								ELSE
									IF VAR4.VAL==5.953
										VAR5.VAL=3.304
										VAR6.VAL=3.304
									ELSE
										IF VAR4.VAL==7.144
											VAR5.VAL=3.965
											VAR6.VAL=3.965
										ELSE
											IF VAR4.VAL==9.525
												VAR5.VAL=5.286
												VAR6.VAL=5.286
											ELSE
												IF VAR4.VAL==12.7
													VAR5.VAL=7.049
													VAR6.VAL=7.049
												ENDIF
											ENDIF
										ENDIF
									ENDIF
								ENDIF
							ENDIF
						ENDIF
					ENDIF
				ENDIF
			ENDIF
			VAR9.VAL=VAR5.VAL+VAR7.VAL
			VAR10.VAL=VAR6.VAL+VAR8.VAL
			VAR5.WR=1
			VAR6.WR=1
		ELSE
			VAR5.WR=2
			VAR6.WR=2
			VAR9.VAL=VAR5.VAL+VAR7.VAL
			VAR10.VAL=VAR6.VAL+VAR8.VAL
		ENDIF	
	END_SUB
	
    SUB(UP2)
		IF VAR5.VAL<>0
			IF VAR6.VAL<>0
				VAR11.VAL=(VAR5.VAL-VAR4.VAL/2)*SIN(VAR3.VAL*PI/180)
				VAR12.VAL=(VAR6.VAL-VAR4.VAL/2)*SIN(VAR3.VAL*PI/180)
				VAR13.VAL=(VAR5.VAL-VAR4.VAL/2)*COS(VAR3.VAL*PI/180)
				VAR14.VAL=(VAR6.VAL-VAR4.VAL/2)*COS(VAR3.VAL*PI/180)
				VAR31.VAL=VAR11.VAL
				VAR32.VAL=VAR12.VAL
				VAR33.VAL=VAR13.VAL
				VAR34.VAL=VAR14.VAL
			ENDIF
		ENDIF 
	END_SUB
	
//END

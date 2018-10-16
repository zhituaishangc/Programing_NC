;调用通用齿形步骤：
;将下面对应界面替换到shape.com中
;变量表修改DRESSER[114]=1
;dress.com内激活对应VAR3对应变量DRESSER[115](界面调用为：DRESSER[116])

;ifIsAllShapeBegin
;**********************MASK7:三角:panel_7:;**********************
//M(Mask7/$85424//)

	DEF VAR0=(R/0,20//$85465,$85465,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[101]"/325,10,120/440,10,110/);齿底圆弧半径

	DEF VAR1=(R/0,90//$85413,$85413,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[102]"/325,40,120/440,40,110/);左斜面角度
	DEF VAR2=(R/0,90//$85414,$85414,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[103]"/325,60,120/440,60,110/);右斜面角度

	DEF VAR3=(R/0,50//$85417,$85417,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[104]"/325,90,120/440,90,110/);齿高

	DEF VAR4=(R/0,90//$85415,$85415,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[105]"/325,120,120/440,120,110/);延长线角度

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

//END

;**********************MASK8:梯形:panel_8:;**********************
//M(Mask8/$85401//)

	DEF VAR0=(R/0,20//$85410,$85410,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[91]"/325,10,120/440,10,110/);齿底长度

	DEF VAR1=(R/0,20//$85411,$85411,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[92]"/325,40,120/440,40,110/);齿底左圆弧半径
	DEF VAR2=(R/0,20//$85412,$85412,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[93]"/325,60,120/440,60,110/);齿底右圆弧半径

	DEF VAR3=(R/0,90//$85413,$85413,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[94]"/325,90,120/440,90,110/);左斜面角度
	DEF VAR4=(R/0,90//$85414,$85414,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[95]"/325,110,120/440,110,110/);右斜面角度

	DEF VAR5=(R/0,50//$85417,$85417,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[96]"/325,140,120/440,140,110/);齿高

	DEF VAR6=(R/0,90//$85415,$85415,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[97]"/325,170,120/440,170,110/);延长线角度

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

//END
;ifIsAllShapeEnd

;**********************MASK9:双圆弧:panel_9:;**********************
//M(Mask9/$85400//)

	DEF VAR0=(R/0,20//$85404,$85404,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[81]"/325,10,120/440,10,110/);左圆弧半径
	DEF VAR1=(R/0,20//$85405,$85405,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[82]"/325,30,120/440,30,110/);右圆弧半径

	DEF VAR2=(R/0,90//$85406,$85406,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[83]"/325,60,120/440,60,110/);左偏心
	DEF VAR3=(R/0,90//$85407,$85407,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[84]"/325,80,120/440,80,110/);右偏心

	DEF VAR4=(R/0,90//$85408,$85408,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[85]"/325,110,120/440,110,110/);过度1斜线角度
	DEF VAR5=(R//0.1//WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[86]"/0,0,0/0,0,0/);过度1斜线长度延长

	DEF VAR6=(R////WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[87]"/0,0,0/0,0,0/);过度2斜线角度
	DEF VAR7=(R/0,20//$85409,$85409,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[88]"/325,130,120/440,130,110/);过度2斜线长度

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

	CHANGE(VAR4)
		VAR6.VAL=VAR4.VAL
	END_CHANGE

//END

;**********************MASK40:齿形1:panel_40:;**********************
//M(Mask40/$85459//)

	DEF VAR0=(R4/0,10//$85499,$85499,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[1]"/325,10,120/440,10,110/);齿顶长度
	DEF VAR1=(R4/0,90//$85468,$85468,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[2]"/325,40,120/440,40,110/);左斜线角度
	DEF VAR2=(R4/0,90//$85469,$85469,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[3]"/325,60,120/440,60,110/);右斜线角度

	DEF VAR3=(R4/-90,90//$85470,$85470,,$85042/WR1//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[4]"/325,90,110/440,90,110/);锥度
	DEF VAR10=(R4/-90,90//$85470,$85470,,/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[111]"/325,110,110/440,110,60/);锥度

	DEF VAR4=(R4/0,90//$85471,$85471,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[5]"/325,140,110/440,140,110/);螺距

	DEF VAR5=(R4/0,90//$85458,$85458,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[6]"/325,170,110/440,170,110/);齿高
	DEF VAR6=(R4/0,90//$85426,$85426,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[7]"/325,190,110/440,190,110/);槽高

	DEF VAR8=(R4/0,90//$85487,$85487,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[9]"/325,240,110/440,240,110/);底部延长长度(水平)
	DEF VAR9=(R4/0,90//$85475,$85475,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[10]"/325,270,110/440,270,110/);过度线角度(0-90)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se3);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

	CHANGE(VAR10)
		VAR3.VAL=SDEG(ATAN(VAR10.VAL/2,1))
	END_CHANGE

//END

;**********************MASK41:齿形2:panel_41:;**********************
//M(Mask41/$85460//)

	DEF VAR0=(R4/0,10//$85465,$85465,,$85043/WR1//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[11]"/325,10,120/440,10,110/);齿底圆弧半径
	DEF VAR1=(R4/0,10//$85466,$85466,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[12]"/325,40,120/440,40,110/);齿顶左圆弧半径
	DEF VAR2=(R4/0,10//$85467,$85467,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[13]"/325,60,120/440,60,110/);齿顶右圆弧半径
	DEF VAR3=(R4/0,90//$85468,$85468,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[14]"/325,90,120/440,90,110/);左斜线角度
	DEF VAR4=(R4/0,90//$85469,$85469,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[15]"/325,110,120/440,110,110/);右斜线角度

	DEF VAR5=(R4/-90,90//$85470,$85470,,$85042/WR1//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[16]"/325,140,110/440,140,110/);锥度
	DEF VAR12=(R4/-90,90//$85470,$85470,,/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[112]"/325,160,110/440,160,60/);锥度
	
	DEF VAR6=(R4/0,90//$85471,$85471,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[17]"/325,190,110/440,190,110/);螺距

	DEF VAR7=(R4/0,90//$85472,$85472,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[18]"/325,220,110/440,220,110/);齿高
	
	DEF VAR9=(R4/0,90//$85474,$85474,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[20]"/325,270,110/440,270,110/);底部圆弧延长长度(水平)
	DEF VAR10=(R4/0,90//$85475,$85475,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[21]"/325,290,110/440,290,110/);过度线角度(0-90)
	DEF VAR11=(R4/0,90//$85476,$85476,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[22]"/325,310,110/440,310,110/);过度线长度(水平)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se3);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

	CHANGE(VAR12)
		VAR5.VAL=SDEG(ATAN(VAR12.VAL/2,1))
	END_CHANGE

//END

;**********************MASK42:齿形3:panel_42:;**********************
//M(Mask42/$85461//)

	DEF VAR0=(R4/0,10//$85477,$85477,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[31]"/325,10,120/440,10,110/);齿底圆弧半径
	DEF VAR1=(R4/0,90//$85478,$85478,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[32]"/325,40,120/440,40,110/);第一斜边左角度
	DEF VAR2=(R4/0,90//$85479,$85479,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[33]"/325,60,120/440,60,110/);第一斜边右角度
	DEF VAR3=(R4/0,90//$85480,$85480,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[34]"/325,90,120/440,90,110/);第二斜边左角度
	DEF VAR4=(R4/0,90//$85481,$85481,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[35]"/325,110,120/440,110,110/);第二斜边右角度
	DEF VAR5=(R4/-90,90//$85482,$85482,,$85042/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[36]"/325,140,120/440,140,110/);锥度
	DEF VAR6=(R4/0,90//$85483,$85483,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[37]"/325,170,120/440,170,110/);螺距

	DEF VAR7=(R4/0,90//$85484,$85484,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[38]"/325,200,120/440,200,110/);齿高
	DEF VAR8=(R4/0,90//$85485,$85485,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[39]"/325,220,120/440,220,110/);中径小径距
	
	DEF VAR10=(R4/0,10//$85487,$85487,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[41]"/325,270,120/440,270,110/);底部斜线延长长度(水平)
	DEF VAR11=(R4/0,90//$85488,$85488,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[42]"/325,290,120/440,290,110/);过度线角度(0-90)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se3);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

//END

;**********************MASK43:齿形4:panel_43:;**********************
//M(Mask43/$85462//)

	DEF VAR0=(R4/0,90//$85489,$85489,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[51]"/325,10,120/440,10,110/);左侧斜线角度
	DEF VAR1=(R4/0,90//$85490,$85490,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[52]"/325,30,120/440,30,110/);右侧斜线角度
	DEF VAR2=(R4/-90,90//$85491,$85491,,$85042/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[53]"/325,60,120/440,60,110/);锥度
	DEF VAR3=(R4/0,90//$85492,$85492,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[54]"/325,90,120/440,90,110/);螺距

	DEF VAR4=(R4/0,90//$85493,$85493,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[55]"/325,120,120/440,120,110/);齿高
	DEF VAR5=(R4/0,90//$85494,$85494,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[56]"/325,140,120/440,140,110/);中径小径距
	
	DEF VAR7=(R4/0,10//$85496,$85496,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[58]"/325,190,120/440,190,110/);底部斜线延长长度(水平)
	DEF VAR8=(R4/0,90//$85497,$85497,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[59]"/325,220,120/440,220,110/);过度线角度(0-90)
	DEF VAR9=(R4/0,10//$85498,$85498,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[60]"/325,240,120/440,240,110/);过度线长度(水平)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se3);"齿形4"
	VS5=($85463,ac7,se1);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

//END

;**********************MASK44:齿形5:panel_44:;**********************
//M(Mask44/$85463//)

	DEF VAR0=(R4/0,90//$85499,$85499,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[61]"/325,10,120/440,10,110/);顶部长度
	DEF VAR1=(R4/0,90//$85489,$85489,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[62]"/325,40,120/440,40,110/);左侧斜线角度
	DEF VAR2=(R4/0,90//$85490,$85490,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[63]"/325,60,120/440,60,110/);右侧斜线角度
	DEF VAR3=(R4/-90,90//$85491,$85491,,$85042/WR4//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[64]"/325,90,120/440,90,110/);锥度
	DEF VAR4=(R4/0,90//$85492,$85492,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[65]"/325,120,120/440,120,110/);螺距

	DEF VAR5=(R4/0,90//$85493,$85493,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[66]"/325,150,120/440,150,110/);齿高
	DEF VAR6=(R4/0,90//$85494,$85494,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[67]"/325,170,120/440,170,110/);中径小径距
	
	DEF VAR8=(R4/0,10//$85496,$85496,,$85043/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[69]"/325,220,120/440,220,110/);底部斜线延长长度(水平)
	DEF VAR9=(R4/0,90//$85497,$85497,,$85042/WR2//"/NC/_N_NC_GD2_ACX/SHAPE_MODEL[70]"/325,250,120/440,250,110/);过度线角度(0-90)

	DEF DRESS_TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/DRESSER[1]"/0,0,0/0,0,0/);修整器

	HS1=($85380,ac7,se1);"单滚轮"

	VS1=($85459,ac7,se1);"齿形1"
	VS2=($85460,ac7,se1);"齿形2"
	VS3=($85461,ac7,se1);"齿形3"
	VS4=($85462,ac7,se1);"齿形4"
	VS5=($85463,ac7,se3);"齿形5"
	VS6=($85464,ac7,se1);"齿形6"
	VS7=($85368,ac7,se1);"齿形7"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		IF DRESS_TYPE.VAL==0
			LM("MASK4","dressware.com")
		ELSE
			IF DRESS_TYPE.VAL==1
				LM("MASK12","dressware.com")
			ENDIF
		ENDIF
	END_PRESS

	PRESS(VS1)
		LM("MASK40","commonshape.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK41","commonshape.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK42","commonshape.com")
	END_PRESS

	PRESS(VS4)
		LM("MASK43","commonshape.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK44","commonshape.com")
	END_PRESS

	PRESS(VS6)
		LM("MASK45","commonshape.com")
	END_PRESS

	PRESS(VS7)
		LM("MASK46","commonshape.com")
	END_PRESS

	PRESS(VS8)
		LM("MASK3","dress.com")
	END_PRESS

//END

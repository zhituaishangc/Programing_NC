;**************MASK21:内/外/磨削中心自动对刀:panel_21********************
//M(Mask21/$85026/"panel_21_2_chs.png"/)
	;+++++++++++++++++++++++++++++++++++++++
	;ifIsKaiGuanCeLiangBegin
	DEF KAIGUAN=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[32]"/0,0,0/0,0,0);自动对刀是否有接近开关测量机构
	DEF KAIGUAN_1=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[52]"/0,0,0/0,0,0);接近开关(0-测量机构1/1-测量机构2)
	DEF CETOU=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[50]"/0,0,0/0,0,0);自动对刀是否有测量头测量结构
	;ifIsKaiGuanCeLiangEnd

	;ifIsCeTouCeLiangBegin
	DEF KAIGUAN=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[32]"/0,0,0/0,0,0);自动对刀是否有接近开关测量机构
	DEF CETOU=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[50]"/0,0,0/0,0,0);自动对刀是否有测量头测量结构
	DEF CETOU_1=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[53]"/0,0,0/0,0,0);测量头(0-测量机构1/1-测量机构2)
	;ifIsCeTouCeLiangEnd

	;ifIsKaiGuanAndCeTouCeLiangBegin
	DEF KAIGUAN=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[32]"/0,0,0/0,0,0);自动对刀是否有接近开关测量机构
	DEF KAIGUAN_1=(I//0//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[52]"/0,0,0/0,0,0);接近开关(0-测量机构1/1-测量机构2)
	DEF CETOU=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[50]"/0,0,0/0,0,0);自动对刀是否有测量头测量结构
	DEF CETOU_1=(I//1//WR4//"/NC/_N_NC_GD2_ACX/TOOL_SET[53]"/0,0,0/0,0,0);测量头(0-测量机构1/1-测量机构2)
	;ifIsKaiGuanAndCeTouCeLiangEnd

	;如果是磨削中心屏蔽下面参数++++++++++++++++++
	;ifIsNotCenterBegin
	DEF VAR3=(R/-500,500//$85505,$85505,,$85043/WR4/"panel_21_6_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[24]"/330,70,110/440,70,110/7,10/"UserGuide/section_5.html","S5D18");内螺纹测头球中心/接近开关探测面与磨杆距离(X向)
	;ifIsNotCenterEnd

	;ifIsCenterBegin
	DEF YUANKONGWEIZHI=(I/*0=$85549,1=$85550//$85548,$85548,,/WR4/"panel_21_26_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[70]"/330,300,110/440,300,60//"UserGuide/section_5.html","S5D19");磨削中心：自动对刀圆孔测量在左端面(0否1是)

	DEF YUANDUCELIANG=(I/*0=$85014,1=$85013//$85555,$85555,,/WR2/"panel_21_27_chs.png"/"/NC/_N_NC_GD2_ACX/INI[139]"/10,190,130/140,190,30//"UserGuide/section_5.html","S5D36");外圆是否测量圆度(0否1是)
	DEF VAR25=(R/0,0.5//$85553,$85553,,$85043/WR4/"panel_21_27_chs.png"/"/NC/_N_NC_GD2_ACX/INI[128]"/10,210,130/140,210,110//"UserGuide/section_5.html","S5D20");外圆跳动阈值设置
	DEF DANGQIANTIAODONG=(R///$85561,$85561,,/WR1/"panel_21_27_chs.png"/"/NC/_N_NC_GD2_ACX/INI[134]"/0,0,0/230,210,60/6);外圆当前跳动

	DEF YOUDUANSHEZHI=(R///$85558,$85558,,/WR2/"panel_21_32_chs.png"/"/NC/_N_NC_GD2_ACX/INI[137]"/10,230,130/140,230,60//"UserGuide/section_5.html","S5D37");右端面测量安全值
	DEF YOUDUANJIEGUO=(R///$85560,$85560,,/WR1/"panel_21_32_chs.png"/"/NC/_N_NC_GD2_ACX/INI[51]"/0,0,0/230,230,60/6);右端面测量结果
	DEF YOUDUANYUZHI=(R/0,0.5//$85559,$85559,,$85043/WR2/"panel_21_32_chs.png"/"/NC/_N_NC_GD2_ACX/INI[138]"/10,250,130/140,250,110//"UserGuide/section_5.html","S5D38");右端测量阈值
	DEF YOUDUANWUCHA=(R///$85562,$85562,,/WR1/"panel_21_32_chs.png"/"/NC/_N_NC_GD2_ACX/INI[140]"/0,0,0/230,250,60/6);磨削中心右端测量与设置当前差值

	DEF VAR27=(R/0,360//$85551,$85551,,$85042/WR4/"panel_21_30_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[59]"/10,270,130/140,270,110//"UserGuide/section_5.html","S5D22");端面测量角度
	DEF VAR28=(R/0,360//$85552,$85552,,$85042/WR4/"panel_21_29_chs.png"/"/NC/_N_NC_GD2_ACX/INI[132]"/10,290,130/140,290,110//"UserGuide/section_5.html","S5D23");外圆测量角度

	DEF VAR20=(R///$85517,$85517,,$85043/WR4/"panel_21_13_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[54]"/10,310,130/140,310,110/7,10/"UserGuide/section_5.html","S5D24");磨削中心自动对刀测头顶部在工件中心时X轴坐标

	DEF VAR23=(R/0,100//$85801,$85801,,$85043/WR4/"panel_21_16_chs.png"/"/NC/_N_NC_GD2_ACX/INI[44]"/10,330,130/140,330,110//"UserGuide/section_5.html","S5D27");工件耳高
	DEF VAR24=(R/0,500//$85706,$85706,,$85043/WR4/"panel_21_17_chs.png"/"/NC/_N_NC_GD2_ACX/INI[31]"/10,350,130/140,350,110//"UserGuide/section_5.html","S5D28");工件外圆长度设置
	DEF CHANGDUCELIANG=(R///$85706,$85706,,/WR1/"panel_21_17_chs.png"/"/NC/_N_NC_GD2_ACX/INI[141]"/0,0,0/230,350,60/6);工件外圆长度测量
	;ifIsCenterEnd

	DEF VAR0=(R/-100,100//$85529,$85529,,$85043/WR2/"panel_21_31_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[42]"/320,10,150/440,10,110//"UserGuide/section_5.html","S5D1");对刀结果调整

	DEF VAR1=(R/-2000,2000//$85528,$85528,,$85043/WR4/"panel_21_1_chs.png"/"/NC/_N_NC_GD2_ACX/INI[43]"/320,40,150/440,40,110/7,10/"UserGuide/section_5.html","S5D2");砂轮中心与接近开关重合Z坐标，外螺纹自动对刀用
	DEF VAR16=(R/-2000,2000//$85535,$85535,,$85043/WR4/"panel_21_1_chs.png"/"/NC/_N_NC_GD2_ACX/INI[43]"/320,40,150/440,40,110/7,10/"UserGuide/section_5.html","S5D3");砂轮中心与测头中心重合Z坐标，外螺纹自动对刀用

	DEF VAR17=(R/-2000,2000//$85536,$85536,,$85043/WR4/"panel_21_1_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[51]"/320,70,150/440,70,110/7,10/"UserGuide/section_5.html","S5D4");外螺纹自动对刀测量头中心(左)到接近开关(右)的水平距离

	DEF VAR2=(R/-2000,2000//$85503,$85503,,$85043/WR4/"panel_21_4_chs.png"/"/NC/_N_NC_GD2_ACX/INI[49]"/330,40,110/440,40,110//"UserGuide/section_5.html","S5D5");内螺纹自动对刀测头Z轴方向起始位置

	DEF VAR4=(R/-500,500//$85527,$85527,,$85043/WR4/"panel_21_7_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[11]"/330,90,110/440,90,110/7,10/"UserGuide/section_5.html","S5D6");内螺纹测头/开关与砂轮距离(Z向)

	DEF VAR7=(R/-2000,2000//$85513,$85513,,$85043/WR4/"panel_21_10_chs.png"/"/NC/_N_NC_GD2_ACX/INI[53]"/330,120,110/440,120,110//"UserGuide/section_5.html","S5D7");内螺纹自动对刀开关测量方式下，开关进入工件开始测量Z起始位置
	DEF VAR8=(R/0,359//$85504,$85504,,$85042/WR4/"panel_21_5_chs.png"/"/NC/_N_NC_GD2_ACX/INI[50]"/330,120,110/440,120,110//"UserGuide/section_5.html","S5D8");内螺纹测头自动对刀工件C方向合适角度

	DEF VAR5=(R/0,500//$85512,$85512,,$85043/WR4/"panel_21_9_chs.png"/"/NC/_N_NC_GD2_ACX/INI[52]"/330,150,110/440,150,110//"UserGuide/section_5.html","S5D9");内螺纹工件小径(开关)
	DEF VAR6=(R/0,500//$85506,$85506,,$85043/WR4/"panel_21_8_chs.png"/"/NC/_N_NC_GD2_ACX/INI[35]"/330,150,110/440,150,110//"UserGuide/section_5.html","S5D10");内螺纹工件大径(测量头)

	DEF VAR9=(R/0,10//$85507,$85507,,$85043/WR4/"panel_21_11_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[10]"/330,180,110/440,180,110//"UserGuide/section_5.html","S5D11");测头半径

	DEF VAR10=(R/0,500//$85508,$85508,,$85043/WR4/"panel_21_12_chs.png"/"/NC/_N_NC_GD2_ACX/INI[36]"/330,210,110/440,210,110//"UserGuide/section_5.html","S5D12");工件端面到反相器孔距离

	DEF VAR15=(R/0,100//$85531,$85531,,$85043/WR2/"panel_21_23_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[55]"/330,240,110/440,240,110//"UserGuide/section_5.html","S5D13");缺口的深度

	DEF VAR11=(I/*0=$85510,1=$85511//$85509,,,/WR4/"panel_21_3_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[23]"/0,0,0/440,270,60//"UserGuide/section_5.html","S5D14");(0=圆形孔,1=腰型孔)

	DEF VAR12=(R/0,359//$85514,$85514,,$85042/WR4/"panel_21_20_chs.png"/"/NC/_N_NC_GD2_ACX/INI[32]"/330,300,110/440,300,110//"UserGuide/section_5.html","S5D15");腰型孔角度(展开图尺寸)
	DEF VAR13=(R/0,100//$85515,$85515,,$85043/WR4/"panel_21_21_chs.png"/"/NC/_N_NC_GD2_ACX/INI[33]"/330,320,110/440,320,110//"UserGuide/section_5.html","S5D16");腰型孔长(展开图尺寸)
	DEF VAR14=(R/0,100//$85516,$85516,,$85043/WR4/"panel_21_22_chs.png"/"/NC/_N_NC_GD2_ACX/INI[34]"/330,340,110/440,340,110//"UserGuide/section_5.html","S5D17");腰型孔宽(展开图尺寸)

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	DEF SIGNAL=(I/*0=$85014,1=$85013//$85534,$85534,,/WR1//"/Plc/DB2700.DBX1.0"/10,10,40/50,10,50/);测头信号

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	;
	HS4=($85010,ac7,se3);自动对刀 ifIsAuto

	;ifIsCenterBegin
	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	;ifIsCenterEnd

	HS8=($85005,ac7,se1);返回

	VS1=($85537,ac7,se1);螺距变换 ifIsCenter

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
		LM("MASK50","auto.com")
	END_PRESS
	
	CHANGE(CETOU)
		call("UP1")
	END_CHANGE

	CHANGE(KAIGUAN)
		call("UP1")
	END_CHANGE

	CHANGE(VAR11)
		call("UP1")
	END_CHANGE

	SUB(UP1)
		IF TYPE.VAL<>1;不是内螺纹
			IF CETOU.VAL==0
				VAR1.WR=2
				VAR16.WR=4
				VAR17.WR=4
			ELSE
				VAR1.WR=4
				VAR16.WR=2
				IF KAIGUAN.VAL==0
					VAR17.WR=4
				ELSE
					VAR17.WR=2
				ENDIF
			ENDIF
			VAR2.WR=4
			VAR3.WR=4
			VAR4.WR=4
			VAR5.WR=4
			VAR6.WR=4
			VAR7.WR=4
			VAR8.WR=4
			VAR9.WR=4
			VAR10.WR=4
			VAR11.WR=4
			VAR12.WR=4
			VAR13.WR=4
			VAR14.WR=4
			VAR15.WR=4
			VAR20.WR=4
			VAR21.WR=4
			VAR22.WR=4
			VAR23.WR=4
			VAR24.WR=4
			VAR25.WR=4
			VAR26.WR=4
			VAR27.WR=4
			VAR28.WR=4
		ELSE
			VAR1.WR=4
			VAR16.WR=4
			VAR17.WR=4
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=2
			IF (KAIGUAN.VAL==1) AND (CETOU.VAL==0);接近开关测量结构
				VAR5.WR=2
				VAR6.WR=4
				VAR7.WR=2
				VAR8.WR=4
				VAR9.WR=4
				VAR10.WR=4
				VAR11.WR=4
				VAR12.WR=4
				VAR13.WR=4
				VAR14.WR=4
				VAR15.WR=4
				VAR20.WR=4
				VAR21.WR=4
				VAR22.WR=4
				VAR23.WR=4
				VAR24.WR=4
				VAR25.WR=4
				VAR26.WR=4
				VAR27.WR=4
				VAR28.WR=4
			ELSE
				IF (KAIGUAN.VAL==0) AND (CETOU.VAL==1);测量头测量结构
					VAR5.WR=4
					VAR6.WR=2
					VAR7.WR=4
					VAR8.WR=2
					VAR9.WR=2
					VAR10.WR=2
					VAR11.WR=2
					VAR15.WR=2
					VAR20.WR=2
					VAR21.WR=2
					VAR22.WR=2
					VAR23.WR=2
					VAR24.WR=2
					VAR25.WR=2
					VAR26.WR=2
					VAR27.WR=2
					VAR28.WR=2
					IF VAR11.VAL==0;圆形孔
						YUANKONGWEIZHI.WR=2
						VAR12.WR=4
						VAR13.WR=4
						VAR14.WR=4
					ELSE
						YUANKONGWEIZHI.WR=4
						YUANKONGWEIZHI.VAL=0
						VAR12.WR=2
						VAR13.WR=2
						VAR14.WR=2
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	END_SUB

//END

;ifIsCenterBegin
;**********************MASK50:内螺纹变螺距参数:panel_50:**********************
//M(Mask50/$85537/"panel_50_0_chs.png"/)

	DEF BAIN_ENABLE=(I/*0=$85014,1=$85013//$85538,$85538,,/WR2/"panel_50_0_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[60]"/320,10,150/440,10,30//"UserGuide/section_5.html","S5D29");使能

	DEF LUOJU_BIAN=(R/0,100//$85545,$85545,,$85043/WR2/"panel_50_0_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[67]"/320,30,150/440,30,110//"UserGuide/section_5.html","S5D30");螺距

	DEF JULI_1=(R/0,500//$85539,$85539,,$85043/WR2/"panel_50_1_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[61]"/320,60,150/440,60,110//"UserGuide/section_5.html","S5D31");距离1
	DEF JIAODU_1=(R/0,360//$85541,$85541,,$85042/WR2/"panel_50_3_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[63]"/320,80,150/440,80,110//"UserGuide/section_5.html","S5D32");角度1

	DEF BIAN_ANG=(R/0,360//$85542,$85542,,$85042/WR2/"panel_50_0_chs.png"/"/NC/_N_NC_GD2_ACX/TOOL_SET[68]"/320,130,150/440,130,110//"UserGuide/section_5.html","S5D33");角度

	DEF WEIZHI_1=(R///$85543,$85543,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET[65]"/320,160,150/440,160,110//"UserGuide/section_5.html","S5D34");位置1
	DEF WEIZHI_2=(R///$85544,$85544,,$85043/WR1//"/NC/_N_NC_GD2_ACX/TOOL_SET[66]"/320,180,150/440,180,110//"UserGuide/section_5.html","S5D35");位置2

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数

	HS4=($85010,ac7,se3);自动对刀

	HS5=($85012,ac7,se1);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面


	HS8=($85005,ac7,se1);返回

	VS1=($85537,ac7,se3);螺距变换

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
		LM("MASK50","auto.com")
	END_PRESS

	CHANGE(WEIZHI_1)
		call("UP1")
	END_CHANGE

	CHANGE(LUOJU_BIAN)
		call("UP1")
	END_CHANGE

	CHANGE(BIAN_ANG)
		call("UP1")
	END_CHANGE

	SUB(UP1)
		WEIZHI_2.VAL=WEIZHI_1.VAL-LUOJU_BIAN.VAL/360*BIAN_ANG.VAL;
	END_SUB

//END
;ifIsCenterEnd

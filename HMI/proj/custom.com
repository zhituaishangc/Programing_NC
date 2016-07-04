//S(Start)

	HS7=($85000,ac7,se1)
	VS1=($85006,ac7,se1) 

	PRESS(HS7)
		LM("Mask1")
	END_PRESS

	PRESS(VS1)
		LM("Mask0")
	END_PRESS

//END

;;;;;;;;;;;;;MASK0:出厂信息;;;;;;;;;;;;;;;;
	;(名称/[标题]/[图形]/[尺寸]/[系统或用户变量]/[图形位置]/[属性])
	//M(Mask0/$85024//)
	;(元素类型/极限值或选项栏/预设值/文本/属性/帮助画面/变量/短文本位置/输出栏位置/颜色)
	DEF VAR1=(B///,,,/WR1///0,0,0/0,0,0/);辅助画面选中

	HS8=($85005,ac7,se1);返回

	PRESS(HS8)
		EXIT
	END_PRESS

//END

;;;;;;;;;;;;;MASK1:磨削参数;;;;;;;;;;;;;;;;
//M(Mask1/$85020//)

	DEF VAR1=(I/*0=$85135,1=$85136,2=$85137,3=$85138,4=$85139//$85134,,,/WR2//"/NC/_N_NC_GD2_ACX/G_TYPE"/0,0,0/40,10,60/);磨削类型
	DEF VAR2=(I/*0=$85014,1=$85013//$85162,$85162,,/WR2//"/NC/_N_NC_GD2_ACX/DRESS_STA"/140,10,40/190,10,60/);是否修整
	DEF VAR3=(I/*0=$85014,1=$85013//$85163,$85163,,/WR2//"/NC/_N_NC_GD2_ACX/OPERA_STA"/240,10,40/290,10,60/);是否对刀
	DEF VAR4=(I/*0=$85100,1=$85140//$85141,,,/WR2//"/NC/_N_NC_GD2_ACX/OPERA_MODEL"/0,0,0/340,10,65/);对刀类型
	DEF VAR5=(I/*0=$85142,1=$85143//$85144,,,/WR2//"/NC/_N_NC_GD2_ACX/OPERA_METHOD"/0,0,0/440,10,63/);对刀方式
	DEF SCREW_R=(I/*0=$85124,1=$85125//$85103,$85103,,/WR2//"/NC/_N_NC_GD2_ACX/ROTATION"/340,35,70/440,35,60/);螺纹旋向
	DEF VAR6=(I///$85102,$85102,,/WR2//"/NC/_N_NC_GD2_ACX/WORK_TH"/340,60,70/440,60,60/);工件头数
	DEF VAR7=(R4///$85104,$85104,,/WR2//"/NC/_N_NC_GD2_ACX/SCREW_PITCH"/340,85,80/440,85,60/);工件螺距
	DEF VAR8=(R4///$85108,$85108,,/WR2//"/NC/_N_NC_GD2_ACX/L_POS"/340,110,80/440,110,60/);工件左端
	DEF VAR9=(R4///$85109,$85109,,/WR2//"/NC/_N_NC_GD2_ACX/R_POS"/340,135,80/440,135,60/);工件右端
	DEF VAR10=(R///$85106,$85106,,/WR2//"/NC/_N_NC_GD2_ACX/QUIT_X"/340,160,80/440,160,60/);退刀距离
	DEF VAR11=(I/*0=$85146,1=$85147,2=$85148,3=$85149//$85145,,,/WR2//"/NC/_N_NC_GD2_ACX/TOOL_SET_POS"/0,0,0/240,35,70/);对刀位置
	DEF VAR12=(R///$85151,$85150,,/WR2//"/NC/_N_NC_GD2_ACX/TOUCH_X"/335,185,85/440,185,60/);测头接触位
	DEF VAR13=(R///$85153,$85152,,/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_TOUCH_X"/335,210,85/440,210,60/);砂轮接触位
	DEF VAR14=(R///,,,/WR4//"/Plc/Q116.4"/0,0,0/0,0,0/);TEMP
	DEF VAR15=(R///$85155,$85154,,/WR2//"/NC/_N_NC_GD2_ACX/WORK_DEPTH_INIT"/340,235,85/440,235,60/);工件槽深
	DEF VAR16=(R///$85156,$85156,,/WR1//"$AC_DRF[X]"/20,295,85/105,295,60/);DRF_X
	DEF VAR17=(R///$85157,$85157,,/WR1//"$AC_DRF[Z]"/20,320,85/105,320,60/);DRF_Z
	DEF VAR18=(R///,,,/WR4//"/Plc/Q116.5"/0,0,0/0,0,0/);TEMP

	HS1=($85001,ac7,se3);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS8=($85005,ac7,se1);返回

	VS1=("")

	PRESS(HS1)
		LM("MASK1")
	END_PRESS

	PRESS(HS2)
		LM("MASK2")
	END_PRESS

	PRESS(HS3)
		LM("MASK3")
	END_PRESS

	PRESS(HS7)
		LM("MASK7")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS
	CHANGE(VAR14);由面板按键判断修整相关参数的显示
		IF VAR14.VAL==1
			VAR2.VAL=1;修整
		ELSE
			VAR2.VAL=0;不修整
		ENDIF
	END_CHANGE
	CHANGE(VAR18)
		IF VAR18.VAL==1;对刀按键有效
			VAR3.VAL=1
		ELSE
			VAR3.VAL=0;对刀按键无效
		ENDIF
	END_CHANGE
	CHANGE(VAR3)
		IF VAR3.VAL==0
			VAR4.WR=1
			VAR5.WR=1
			VAR11.WR=4
			VAR12.WR=4
			VAR13.WR=4
			VAR15.WR=4
		ELSE
			VAR4.WR=2
			VAR5.WR=2
			IF VAR5.VAL==1
				VAR11.WR=4
				VAR12.WR=2
				VAR13.WR=2
				VAR15.WR=2
			ELSE
				VAR11.WR=2
			ENDIF
		ENDIF
	END_CHANGE
	CHANGE(VAR5);由对刀方式(手动/自动),判断显示
		IF VAR5.VAL==0;若选择手动对刀
			VAR11.WR=2;对刀位置(中点,任意点)
			VAR12.WR=4;测头接触位不显示
			VAR13.WR=4;砂轮接触位不显示
			VAR15.WR=4;工件槽深不显示
		ELSE
			VAR11.WR=0
			VAR12.WR=2
			VAR13.WR=2
			VAR15.WR=2
		ENDIF
	END_CHANGE
	CHANGE(VAR4);由对刀类型(首次/二次),判断对刀方式(手动/自动)
		IF VAR4.VAL==1;若选则二次对刀
			VAR5.VAL=0;对刀方式为手动
			VAR5.WR=1;不可更改
			VAR11.WR=2;对刀位置
			VAR12.WR=4;测头接触位不显示
			VAR13.WR=4;砂轮接触位不显示
			VAR15.WR=4;工件槽深不显示
		ELSE
			VAR5.WR=2
			IF VAR5.VAL==1
				VAR12.WR=2;测头接触位显示
				VAR13.WR=2;砂轮接触位显示
				VAR15.WR=2;工件槽深显示
			ELSE
				VAR12.WR=4;测头接触位不显示
				VAR13.WR=4;砂轮接触位不显示
				VAR15.WR=4;工件槽深不显示
			ENDIF
		ENDIF
	END_CHANGE

//END

;;;;;;;;;;;;;;;;;;;MASK2:工艺参数;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask2/$85021/"panel_2_0.png"/)

	DEF VAR0=(I/*0=$85217,1=$85216//$85218,,,/WR2//"/NC/_N_NC_GD2_ACX/TECH_MODEL"/0,0,0/45,53,65/1,9);DIY

	;DEF TECH_PAR_VAR1=(R/%TECH_PAR1///WR1////3,30,115,30)
	DEF TECH_GRID_VAR=(R/%TECH_GRID///WR2////115,51,750,210)

	;DEF TECH_PAR_VAR1=(R///,$85214,,/WR1,AL1///2,53,110/0,0,0/)
	DEF TECH_PAR_VAR2=(R///,$85213,,/WR1,AL1///2,74,110/0,0,0/)
	DEF TECH_PAR_VAR3=(R///,$85209,,/WR1,AL1///2,92,110/0,0,0/)
	DEF TECH_PAR_VAR4=(R///,$85208,,/WR1,AL1///2,111,110/0,0,0/)
	DEF TECH_PAR_VAR5=(R///,$85215,,/WR1,AL1///2,129,110/0,0,0/)
	DEF TECH_PAR_VAR6=(R///,$85210,,/WR1,AL1///2,147,110/0,0,0/)
	DEF TECH_PAR_VAR7=(R///,$85211,,/WR1,AL1///2,166,110/0,0,0/)

	HS1=($85001,ac7,se1);"磨削参数"
	HS2=($85002,ac7,se3);"工艺参数"
	HS3=($85003,ac7,se1);"修整参数"
	HS8=($85005,ac7,se1);"返回"

	VS1=("")

	LOAD
		LG("TECH_GRID","TECH_GRID_VAR","custom.com")
		;LG("TECH_PAR1","TECH_PAR_VAR1","custom.com")
	END_LOAD
	;
	PRESS(HS1)
		LM("MASK1")
	END_PRESS

	PRESS(HS2)
		LM("MASK2")
	END_PRESS

	PRESS(HS3)
		LM("MASK3")
	END_PRESS

	PRESS(HS7)
		LM("MASK7")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	CHANGE(VAR0)
		IF VAR0.VAL==1
			TECH_GRID_VAR.WR=1
		ELSE
			TECH_GRID_VAR.WR=2
		ENDIF
	END_CHANGE

//END

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK3:修整参数;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask3/$85022//)

	DEF VAR0=(R///$85366,$85366,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESS_CUMU"/110,10,110/200,10,110/);累计修整量

	DEF VAR1=(I/*0=$85344,1=$85345,2=$85346,3=$85347//$85387,,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSWARE"/0,0,0/335,10,60/);修整器
	DEF VAR2=(I/*0=$85380,1=$85381,2=$85382//$85388,,,/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_MODE"/0,0,0/440,10,60/);修整轮
	DEF VAR3=(I/*0=$85383,1=$85384,2=$85385//$85389,,,/WR2//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/335,30,60/);齿形
	DEF VAR4=(I/*0=$85327,1=$85328//$85350,,,/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_STA"/0,0,0/440,30,60/);砂轮状态

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_R"/330,60,110/440,60,60/);粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_R"/330,80,110/440,80,110/);粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_R"/330,100,110/440,100,110/);粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_F"/330,130,110/440,130,60/);精修次数
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_F"/330,150,110/440,150,110/);精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_F"/330,170,110/440,170,110/);精修速度

	DEF VAR11=(R/-500,500//$85342,$85342,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_MID"/330,200,110/440,200,110/);砂轮修整轮中心

	DEF VAR12=(R/0,200//$85316,$85316,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_WIDTH"/330,230,110/440,230,110/);砂轮宽度
	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_DIA"/330,250,110/440,250,110/);新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_DIACURNT"/330,270,110/440,270,110/);砂轮当前直径
	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS_D"/330,290,110/440,290,110/);砂轮线速度

	DEF VAR20=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_VER"/0,0,0/50,10,20/);垂直轴
	DEF VAR21=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_HORI"/0,0,0/50,25,20/);水平轴

	HS1=($85380,ac7,se2);"单滚轮"
	HS2=($85381,ac7,se2);"双滚轮"
	HS3=($85382,ac7,se2);"方滚轮"

	VS1=($85383,ac7,se1);"三角"
	VS2=($85384,ac7,se1);"梯形"
	VS3=($85385,ac7,se1);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(HS4)
		LM("MASK11")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK10")
	END_PRESS

	CHANGE(VAR2)
		call("UP1")
	END_CHANGE

	;CHANGE(VAR3)
		;call("UP2")
	;END_CHANGE

	CHANGE(VAR14)
		VAR0.VAL=VAR13.VAL-VAR14.VAL
	END_CHANGE

	CHANGE(VAR4)
		IF VAR4.VAL==0
			VAR14.VAL=VAR13.VAL
		ENDIF
	END_CHANGE

	CHANGE(VAR1)
		IF VAR1.VAL==2
			LM("MASK12")
		ENDIF
		call("UP3")
	END_CHANGE

	SUB(UP1)

		IF VAR2.VAL==0
			HS1.se=1
			HS2.se=2
			HS3.se=2
		ELSE
			IF VAR2.VAL==1
				HS1.se=2
				HS2.se=1
				HS3.se=2
			ELSE
				IF VAR2.VAL==2
					HS1.se=2
					HS2.se=2
					HS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

	SUB(UP2)

		IF VAR3.VAL==0
			VS1.se=1
			VS2.se=2
			VS3.se=2
		ELSE
			IF VAR3.VAL==1
				VS1.se=2
				VS2.se=1
				VS3.se=2
			ELSE
				IF VAR3.VAL==2
					VS1.se=2
					VS2.se=2
					VS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

	SUB(UP3)

		IF VAR1.VAL==0
			VAR20.VAL="V"
			VAR21.VAL="W"
		ELSE
			IF VAR1.VAL==1
				VAR20.VAL="X"
				VAR21.VAL="Z"
			ELSE
				IF VAR1.VAL==2
					VAR20.VAL="V"
					VAR21.VAL=""
				ELSE
					IF VAR1.VAL==3
						VAR20.VAL="V"
						VAR21.VAL=""
					ENDIF
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK12:修整参数:成型;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask12/$85022//)

	DEF VAR0=(R///$85366,$85366,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESS_CUMU"/110,10,110/200,10,110/);累计修整量

	DEF VAR1=(I/*0=$85344,1=$85345,2=$85346,3=$85347//$85387,,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSWARE"/0,0,0/335,10,60/);修整器
	DEF VAR2=(I/*0=$85379,1=$85379/0/$85388,,,/WR1///0,0,0/440,10,60/);修整轮
	DEF VAR3=(I/*0=$85383,1=$85384,2=$85385//$85389,,,/WR4//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/335,30,60/);齿形
	DEF VAR4=(I/*0=$85327,1=$85328//$85350,,,/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_STA"/0,0,0/440,30,60/);砂轮状态

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_R"/330,60,110/440,60,60/);粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_R"/330,80,110/440,80,110/);粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_R"/330,100,110/440,100,110/);粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_F"/330,130,110/440,130,60/);精修次数
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_F"/330,150,110/440,150,110/);精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_F"/330,170,110/440,170,110/);精修速度

	DEF VAR11=(R/-500,500//$85342,$85342,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL_MID"/330,200,110/440,200,110/);砂轮修整轮中心

	DEF VAR12=(R/0,200//$85316,$85316,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL_WIDTH"/330,230,110/440,230,110/);砂轮宽度
	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_DIA"/330,250,110/440,250,110/);新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_DIACURNT"/330,270,110/440,270,110/);砂轮当前直径
	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS_D"/330,290,110/440,290,110/);砂轮线速度

	DEF VAR20=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_VER"/0,0,0/50,10,20/);垂直轴
	DEF VAR21=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_HORI"/0,0,0/50,25,20/);水平轴

	HS1=($85379,ac7,se1);"滚压轮"

	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK11")
	END_PRESS

	PRESS(VS8)
		LM("MASK13")
	END_PRESS

	CHANGE(VAR14)
		VAR0.VAL=VAR13.VAL-VAR14.VAL
	END_CHANGE

	CHANGE(VAR4)
		IF VAR4.VAL==0
			VAR14.VAL=VAR13.VAL
		ENDIF
	END_CHANGE

	CHANGE(VAR1)
		IF VAR1.VAL<>2
			LM("MASK3")
		ENDIF
		call("UP3")
	END_CHANGE

	SUB(UP3)

		IF VAR1.VAL==0
			VAR20.VAL="V"
			VAR21.VAL="W"
		ELSE
			IF VAR1.VAL==1
				VAR20.VAL="X"
				VAR21.VAL="Z"
			ELSE
				IF VAR1.VAL==2
					VAR20.VAL="V"
					VAR21.VAL=""
				ELSE
					IF VAR1.VAL==3
						VAR20.VAL="V"
						VAR21.VAL=""
					ENDIF
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK4:修整参数_单滚轮;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask4/$85380//)

	DEF VAR0=(R/0,300//$85390,$85390,,$85043/WR4//""/330,60,110/440,60,110/);滚轮间距

	DEF VAR1=(R/0,10//$85358,$85358,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_L"/330,90,110/440,90,110/);圆弧半径
	DEF VAR2=(R/0,10//$85356,$85356,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_R"/330,110,110/440,110,110/);右圆弧半径

	DEF VAR3=(R/-500,500//$85398,$85398,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_L"/330,140,110/440,140,110/);初始接触位置
	DEF VAR4=(R/-500,500//$85393,$85393,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_R"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85399,$85399,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_L"/330,190,110/440,190,110/);当前接触位置
	DEF VAR6=(R/-500,500//$85395,$85395,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_R"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85396,$85396,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_DIA"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85397,$85397,,$85046/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_LINESPEED"/330,260,110/440,260,110/);修整轮线速度

	;DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/0,0,0/);齿形

	HS1=($85380,ac7,se3);"单滚轮"
	HS2=($85381,ac7,se2);"双滚轮"
	HS3=($85382,ac7,se2);"方滚轮"

	VS1=($85383,ac7,se1);"三角"
	VS2=($85384,ac7,se1);"梯形"
	VS3=($85385,ac7,se1);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK3")
	END_PRESS

	;CHANGE(VAR20)
		;call("UP1")
	;END_CHANGE

	CHANGE(VAR1)
		VAR2.VAL=VAR1.VAL
	END_CHANGE

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE

	SUB(UP1)

		IF VAR20.VAL==0
			VS1.se=1
			VS2.se=2
			VS3.se=2
		ELSE
			IF VAR20.VAL==1
				VS1.se=2
				VS2.se=1
				VS3.se=2
			ELSE
				IF VAR20.VAL==2
					VS1.se=2
					VS2.se=2
					VS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK5:修整参数_双滚轮;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask5/$85381//)

	DEF VAR0=(R/0,300//$85390,$85390,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_D_INTER"/330,40,110/440,40,110/);双滚轮间距

	DEF VAR1=(R/0,10//$85355,$85355,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_L"/330,70,110/440,70,110/);左圆弧半径
	DEF VAR2=(R/0,10//$85356,$85356,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_R"/330,90,110/440,90,110/);右圆弧半径

	DEF VAR9=(R/-5,5//$85376,$85376,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_VER_DISTANCE"/330,120,110/440,120,110/);左右轮高度差
	DEF VAR3=(R/-500,500//$85392,$85392,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_L"/330,140,110/440,140,110/);初始左端接触位置
	DEF VAR4=(R/-500,500//$85393,$85393,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_R"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85394,$85394,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_L"/330,190,110/440,190,110/);当前左端接触位置
	DEF VAR6=(R/-500,500//$85395,$85395,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_R"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85396,$85396,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_DIA"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85397,$85397,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_LINESPEED"/330,260,110/440,260,110/);修整轮线速度

	;DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/0,0,0/);齿形

	HS1=($85380,ac7,se2);"单滚轮"
	HS2=($85381,ac7,se3);"双滚轮"
	HS3=($85382,ac7,se2);"方滚轮"

	VS1=($85383,ac7,se1);"三角"
	VS2=($85384,ac7,se1);"梯形"
	VS3=($85385,ac7,se1);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK3")
	END_PRESS

	CHANGE(VAR3)
		call("UP2")
	END_CHANGE

	CHANGE(VAR9)
		call("UP2")
	END_CHANGE

	;CHANGE(VAR20)
		;call("UP1")
	;END_CHANGE

	SUB(UP1)

		IF VAR20.VAL==0
			VS1.se=1
			VS2.se=2
			VS3.se=2
		ELSE
			IF VAR20.VAL==1
				VS1.se=2
				VS2.se=1
				VS3.se=2
			ELSE
				IF VAR20.VAL==2
					VS1.se=2
					VS2.se=2
					VS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

	SUB(UP2)
		VAR4.VAL=VAR3.VAL+VAR9.VAL
	END_SUB

//END

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK6:修整参数_方滚轮;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask6/$85382//)

	DEF VAR0=(R/0,100//$85391,$85391,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_W_WIDTH"/330,60,110/440,60,110/);方滚轮厚度

	DEF VAR1=(R/0,10//$85355,$85355,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_L"/330,90,110/440,90,110/);左圆弧半径
	DEF VAR2=(R/0,10//$85356,$85356,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_R"/330,110,110/440,110,110/);右圆弧半径

	DEF VAR3=(R/-500,500//$85398,$85398,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_L"/330,140,110/440,140,110/);初始接触位置
	DEF VAR4=(R/-500,500//$85393,$85393,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_R"/330,160,110/440,160,110/);初始右端接触位置

	DEF VAR5=(R/-500,500//$85399,$85399,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_L"/330,190,110/440,190,110/);当前接触位置
	DEF VAR6=(R/-500,500//$85395,$85395,,$85043/WR4//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_R"/330,210,110/440,210,110/);当前右端接触位置

	DEF VAR7=(R/0,500//$85396,$85396,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_DIA"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85397,$85397,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_LINESPEED"/330,260,110/440,260,110/);修整轮线速度

	;DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/0,0,0/);齿形

	HS1=($85380,ac7,se2);"单滚轮"
	HS2=($85381,ac7,se2);"双滚轮"
	HS3=($85382,ac7,se3);"方滚轮"

	VS1=($85383,ac7,se1);"三角"
	VS2=($85384,ac7,se1);"梯形"
	VS3=($85385,ac7,se1);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK3")
	END_PRESS

	;CHANGE(VAR20)
		;call("UP1")
	;END_CHANGE

	CHANGE(VAR3)
		VAR4.VAL=VAR3.VAL
	END_CHANGE

	CHANGE(VAR5)
		VAR6.VAL=VAR5.VAL
	END_CHANGE

	SUB(UP1)

		IF VAR20.VAL==0
			VS1.se=1
			VS2.se=2
			VS3.se=2
		ELSE
			IF VAR20.VAL==1
				VS1.se=2
				VS2.se=1
				VS3.se=2
			ELSE
				IF VAR20.VAL==2
					VS1.se=2
					VS2.se=2
					VS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK11:修整参数_滚压轮;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask11/$85379//)

	DEF VAR0=(R/0,800//$85329,$85329,,$85043/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_DWHEEL_INTER"/330,60,110/440,60,110/);两轮中间距

	DEF VAR1=(R/-500,500//$85331,$85331,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DWHEEL_TOUCH_L"/330,90,110/440,90,110/);NC用初始接触
	DEF VAR2=(R/0,50//$85330,$85330,,$85043/WR2//"/NC/_N_NC_GD2_ACX/ROLLING_VER"/330,110,110/440,110,110/);齿高

	DEF VAR3=(R/-500,500//$85398,$85398,,$85043/WR1//"/NC/_N_NC_GD2_ACX/ROLLING_TOUCH"/330,140,110/440,140,110/);初始接触位置

	DEF VAR5=(R/-500,500//$85399,$85399,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESS_VER_INIT_L"/330,190,110/440,190,110/);当前接触位置

	DEF VAR7=(R/0,500//$85396,$85396,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_DIA"/330,240,110/440,240,110/);修整轮直径
	DEF VAR8=(R/0,60//$85397,$85397,,$85046/WR2//"/NC/_N_NC_GD2_ACX/DWHEEL_LINESPEED"/330,260,110/440,260,110/);修整轮线速度

	DEF VAR10=(R/0,1000//$85319,$85319,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL_DIA"/330,250,110/440,250,110/);新砂轮直径

	HS1=($85379,ac7,se3);"滚压轮"

	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK11")
	END_PRESS

	PRESS(VS8)
		LM("MASK12")
	END_PRESS

	CHANGE(VAR2)
		VAR1.VAL=VAR3.VAL-VAR2.VAL
	END_CHANGE

	CHANGE(VAR3)
		VAR1.VAL=VAR3.VAL-VAR2.VAL
	END_CHANGE

	CHANGE(VAR0)
		VAR3.VAL=VAR0.VAL-VAR7.VAL/2-VAR10.VAL/2
	END_CHANGE

	CHANGE(VAR7)
		VAR3.VAL=VAR0.VAL-VAR7.VAL/2-VAR10.VAL/2
	END_CHANGE

	CHANGE(VAR10)
		VAR3.VAL=VAR0.VAL-VAR7.VAL/2-VAR10.VAL/2
	END_CHANGE

//END


;;;;;;;;;;;;;;;;;;;;;;;;;;MASK7:齿形参数_三角;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask7/$85383//)

	DEF VAR0=(R/0,100//$85417,$85417,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_VER"/330,30,110/440,30,110/);齿高

	DEF VAR1=(R/0,90//$85402,$85402,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_ANG_LINIT"/330,60,110/440,60,110/);初始左角
	DEF VAR2=(R/0,90//$85403,$85403,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_ANG_RINIT"/330,80,110/440,80,110/);初始右角

	DEF VAR3=(R/0,50//$85418,$85418,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_RND_L"/330,110,110/440,110,110/);左圆弧
	DEF VAR4=(R/0,50//$85419,$85419,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_RND_R"/330,130,110/440,130,110/);右圆弧

	DEF VAR5=(R/0,50//$85420,$85420,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_RND_TL"/330,160,110/440,160,110/);过渡左圆弧
	DEF VAR6=(R/0,50//$85421,$85421,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_RND_TR"/330,180,110/440,180,110/);过渡右圆弧

	DEF VAR7=(R/0,90//$85445,$85445,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_ANG_LADD"/330,210,110/440,210,110/);调整左角
	DEF VAR8=(R/0,90//$85446,$85446,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRIANGLE_ANG_RADD"/330,230,110/440,230,110/);调整右角
	DEF VAR9=(R/0,90//$85447,$85447,,$85042/WR3//"/NC/_N_NC_GD2_ACX/TRIANGLE_ANG_L"/330,250,110/440,250,110/);当前左角
	DEF VAR10=(R/0,90//$85448,$85448,,$85042/WR3//"/NC/_N_NC_GD2_ACX/TRIANGLE_ANG_R"/330,270,110/440,270,110/);当前右角

	DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_MODE"/0,0,0/0,0,0/);修整轮
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_R"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_R"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_R"/0,0,0/0,0,0/);右圆弧半径

	HS1=($85380,ac7,se2);"单滚轮"
	HS2=($85381,ac7,se2);"双滚轮"
	HS3=($85382,ac7,se2);"方滚轮"

	VS1=($85383,ac7,se3);"三角"
	VS2=($85384,ac7,se1);"梯形"
	VS3=($85385,ac7,se1);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK3")
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

	SUB(UP1)

		IF VAR20.VAL==0
			HS1.se=1
			HS2.se=2
			HS3.se=2
		ELSE
			IF VAR20.VAL==1
				HS1.se=2
				HS2.se=1
				HS3.se=2
			ELSE
				IF VAR20.VAL==2
					HS1.se=2
					HS2.se=2
					HS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

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

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK8:齿形参数_梯形;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask8/$85384//)

	DEF VAR0=(R/0,100//$85417,$85417,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_VER"/330,10,110/440,10,110/);齿高
	DEF VAR12=(R/0,100//$85423,$85423,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_VER_BOTM"/330,30,110/440,30,110/);齿根高度

	DEF VAR1=(R/0,90//$85402,$85402,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRAP_ANG_LINIT"/330,60,110/440,60,110/);初始左角
	DEF VAR2=(R/0,90//$85403,$85403,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRAP_ANG_RINIT"/330,80,110/440,80,110/);初始右角

	DEF VAR3=(R/0,50//$85418,$85418,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_RND_L"/330,110,110/440,110,110/);左圆弧
	DEF VAR4=(R/0,50//$85419,$85419,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_RND_R"/330,130,110/440,130,110/);右圆弧

	DEF VAR5=(R/0,50//$85420,$85420,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_RND_TL"/330,160,110/440,160,110/);过渡左圆弧
	DEF VAR6=(R/0,50//$85421,$85421,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_RND_TR"/330,180,110/440,180,110/);过渡右圆弧

	DEF VAR7=(R/0,200//$85416,$85416,,$85043/WR2//"/NC/_N_NC_GD2_ACX/TRAP_PITCH"/330,210,110/440,210,110/);螺距

	DEF VAR8=(R/0,90//$85445,$85445,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRAP_ANG_LADD"/330,240,110/440,240,110/);调整左角
	DEF VAR9=(R/0,90//$85446,$85446,,$85042/WR2//"/NC/_N_NC_GD2_ACX/TRAP_ANG_RADD"/330,260,110/440,260,110/);调整右角
	DEF VAR10=(R/0,90//$85447,$85447,,$85042/WR3//"/NC/_N_NC_GD2_ACX/TRAP_ANG_L"/330,280,110/440,280,110/);当前左角
	DEF VAR11=(R/0,90//$85448,$85448,,$85042/WR3//"/NC/_N_NC_GD2_ACX/TRAP_ANG_R"/330,300,110/440,300,110/);当前右角

	DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_MODE"/0,0,0/0,0,0/);修整轮
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_R"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_R"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_R"/0,0,0/0,0,0/);右圆弧半径

	HS1=($85380,ac7,se2);"单滚轮"
	HS2=($85381,ac7,se2);"双滚轮"
	HS3=($85382,ac7,se2);"方滚轮"

	VS1=($85383,ac7,se1);"三角"
	VS2=($85384,ac7,se3);"梯形"
	VS3=($85385,ac7,se1);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK3")
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

	SUB(UP1)

		IF VAR20.VAL==0
			HS1.se=1
			HS2.se=2
			HS3.se=2
		ELSE
			IF VAR20.VAL==1
				HS1.se=2
				HS2.se=1
				HS3.se=2
			ELSE
				IF VAR20.VAL==2
					HS1.se=2
					HS2.se=2
					HS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

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

;;;;;;;;;;;;;;;;;;;;;;;;;;MASK9:齿形参数_双圆弧;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask9/$85385//)

	DEF VAR0=(R/0,200//$85430,$85430,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_DIA_FACE"/330,30,110/440,30,110/);外圆直径
	DEF VAR1=(R/0,200//$85431,$85431,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_DIA_PERFORM"/330,50,110/440,50,110/);公称直径

	DEF VAR2=(R/0,50//$85440,$85440,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_RND_T"/330,80,110/440,80,110/);过渡圆弧

	DEF VAR3=(R/0,90//$85433,$85433,,$85042/WR2//"/NC/_N_NC_GD2_ACX/DARC_ANG_TOUCH"/330,110,110/440,110,110/);接触角
	DEF VAR4=(R/0,50//$85432,$85432,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_DIA_BALL"/330,130,110/440,130,110/);钢球直径
	DEF VAR5=(R/0,50//$85434,$85434,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_RND_LINIT"/330,150,110/440,150,110/);初始左滚道
	DEF VAR6=(R/0,50//$85435,$85435,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_RND_RINIT"/330,170,110/440,170,110/);初始右滚道

	DEF VAR7=(R/0,50//$85436,$85436,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_RND_LADD"/330,200,110/440,200,110/);调整左滚道
	DEF VAR8=(R/0,50//$85437,$85437,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DARC_RND_RADD"/330,220,110/440,220,110/);调整右滚道
	DEF VAR9=(R/0,50//$85438,$85438,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DARC_RND_L"/330,240,110/440,240,110/);当前左滚道
	DEF VAR10=(R/0,50//$85439,$85439,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DARC_RND_R"/330,260,110/440,260,110/);当前右滚道
	DEF VAR11=(R///$85441,$85441,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DARC_RND_LTRANS_HORI"/100,290,110/210,290,110/);左滚道水平偏心
	DEF VAR12=(R///$85442,$85442,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DARC_RND_RTRANS_HORI"/100,310,110/210,310,110/);右滚道水平偏心
	DEF VAR13=(R///$85443,$85443,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DARC_RND_LTRANS_VER"/330,290,110/440,290,110/);左滚道垂直偏心
	DEF VAR14=(R///$85444,$85444,,$85043/WR3//"/NC/_N_NC_GD2_ACX/DARC_RND_RTRANS_VER"/330,310,110/440,310,110/);右滚道垂直偏心

	DEF VAR20=(I////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_MODE"/0,0,0/0,0,0/);修整轮
	DEF VAR21=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR22=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_S_RND_R"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_D_RND_R"/0,0,0/0,0,0/);右圆弧半径
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_L"/0,0,0/0,0,0/);圆弧半径
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/DWHEEL_W_RND_R"/0,0,0/0,0,0/);右圆弧半径

	DEF VAR30=(R////WR4//"/NC/_N_NC_GD2_ACX/DARC_VER"/0,0,0/0,0,0/);齿高


	HS1=($85380,ac7,se2);"单滚轮"
	HS2=($85381,ac7,se2);"双滚轮"
	HS3=($85382,ac7,se2);"方滚轮"

	VS1=($85383,ac7,se1);"三角"
	VS2=($85384,ac7,se1);"梯形"
	VS3=($85385,ac7,se3);"双圆弧"
	VS8=($85386,ac7,se1);"返回"

	PRESS(HS1)
		LM("MASK4")
	END_PRESS

	PRESS(HS2)
		LM("MASK5")
	END_PRESS

	PRESS(HS3)
		LM("MASK6")
	END_PRESS

	PRESS(VS1)
		LM("MASK7")
	END_PRESS

	PRESS(VS2)
		LM("MASK8")
	END_PRESS

	PRESS(VS3)
		LM("MASK9")
	END_PRESS

	PRESS(VS8)
		LM("MASK3")
	END_PRESS

	CHANGE(VAR20)
		call("UP1")
	END_CHANGE

	CHANGE(VAR5)
		VAR30.VAL=VAR5.VAL
		call("UP2")
	END_CHANGE

	CHANGE(VAR6)
		call("UP2")
	END_CHANGE

	CHANGE(VAR7)
		call("UP2")
	END_CHANGE

	CHANGE(VAR8)
		call("UP2")
	END_CHANGE

	CHANGE(VAR4)
		call("UP3")
		call("UP4")
	END_CHANGE

	CHANGE(VAR3)
		call("UP4")
	END_CHANGE

	CHANGE(VAR9)
		call("UP4")
	END_CHANGE

	CHANGE(VAR10)
		call("UP4")
	END_CHANGE

	CHANGE(VAR2)
		call("UP5")
	END_CHANGE

	SUB(UP1)

		IF VAR20.VAL==0
			HS1.se=1
			HS2.se=2
			HS3.se=2
		ELSE
			IF VAR20.VAL==1
				HS1.se=2
				HS2.se=1
				HS3.se=2
			ELSE
				IF VAR20.VAL==2
					HS1.se=2
					HS2.se=2
					HS3.se=1
				ENDIF
			ENDIF
		ENDIF

	END_SUB

	SUB(UP2)
		VAR9.VAL=VAR5.VAL+VAR7.VAL
		VAR10.VAL=VAR6.VAL+VAR8.VAL
	END_SUB

	SUB(UP3)

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

	END_SUB

	SUB(UP4)

		IF VAR9.VAL<>0
			IF VAR10.VAL<>0
				VAR11.VAL=(VAR9.VAL-VAR4.VAL/2)*COS(VAR3.VAL*PI/180)
				VAR12.VAL=(VAR10.VAL-VAR4.VAL/2)*COS(VAR3.VAL*PI/180)
				VAR13.VAL=(VAR9.VAL-VAR4.VAL/2)*SIN(VAR3.VAL*PI/180)
				VAR14.VAL=(VAR10.VAL-VAR4.VAL/2)*SIN(VAR3.VAL*PI/180)
			ENDIF
		ENDIF

	END_SUB

	SUB(UP5)

		IF VAR20.VAL==0
			IF VAR2.VAL<VAR21.VAL
				VAR2.VAL=VAR21.VAL
			ENDIF
		ELSE
			IF VAR20.VAL==1
				IF VAR2.VAL<VAR23.VAL
					VAR2.VAL=VAR23.VAL
				ENDIF
			ELSE
				IF VAR20.VAL==2
					IF VAR2.VAL<VAR25.VAL
						VAR2.VAL=VAR25.VAL
					ENDIF
				ENDIF
			ENDIF
		ENDIF

	END_SUB

//END

;;;;;;;;;;;;;;;;;;;MASK10:修整返回;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask10/$85022/)

	DEF VAR0=(R///$85366,$85366,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESS_CUMU"/110,10,110/200,10,110/);累计修整量

	DEF VAR1=(I/*0=$85344,1=$85345,2=$85346,3=$85347//$85387,,,/WR1//"/NC/_N_NC_GD2_ACX/DRESSWARE"/0,0,0/335,10,60/);修整器
	DEF VAR2=(I/*0=$85380,1=$85381,2=$85382//$85388,,,/WR1//"/NC/_N_NC_GD2_ACX/DWHEEL_MODE"/0,0,0/440,10,60/);修整轮
	DEF VAR3=(I/*0=$85383,1=$85384,2=$85385//$85389,,,/WR1//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/335,30,60/);齿形
	DEF VAR4=(I/*0=$85327,1=$85328//$85350,,,/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_STA"/0,0,0/440,30,60/);砂轮状态

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_R"/330,60,110/440,60,60/);粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_R"/330,80,110/440,80,110/);粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_R"/330,100,110/440,100,110/);粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_F"/330,130,110/440,130,60/);精修次数
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_F"/330,150,110/440,150,110/);精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_F"/330,170,110/440,170,110/);精修速度

	DEF VAR11=(R/-500,500//$85342,$85342,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_MID"/330,200,110/440,200,110/);砂轮修整轮中心

	DEF VAR12=(R/0,200//$85316,$85316,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_WIDTH"/330,230,110/440,230,110/);砂轮宽度
	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_DIA"/330,250,110/440,250,110/);新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_DIACURNT"/330,270,110/440,270,110/);砂轮当前直径
	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS_D"/330,290,110/440,290,110/);砂轮线速度

	DEF VAR20=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_VER"/0,0,0/50,10,20/);垂直轴
	DEF VAR21=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_HORI"/0,0,0/50,25,20/);水平轴

	HS1=($85001,ac7,se1);"磨削参数"
	HS2=($85002,ac7,se1);"工艺参数"
	HS3=($85003,ac7,se1);"修整参数"
	HS8=($85005,ac7,se1);"返回"

	VS1=("")

	PRESS(HS1)
		LM("MASK1")
	END_PRESS

	PRESS(HS2)
		LM("MASK2")
	END_PRESS

	PRESS(HS3)
		LM("MASK3")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

//END

;;;;;;;;;;;;;;;;;;;MASK13:修整返回:成型;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//M(Mask13/$85022/)

	DEF VAR0=(R///$85366,$85366,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESS_CUMU"/110,10,110/200,10,110/);累计修整量

	DEF VAR1=(I/*0=$85344,1=$85345,2=$85346,3=$85347//$85387,,,/WR1//"/NC/_N_NC_GD2_ACX/DRESSWARE"/0,0,0/335,10,60/);修整器
	DEF VAR2=(I/*0=$85379,1=$85379/0/$85388,,,/WR1///0,0,0/440,10,60/);修整轮
	DEF VAR3=(I/*0=$85383,1=$85384,2=$85385//$85389,,,/WR4//"/NC/_N_NC_GD2_ACX/DSHAPE"/0,0,0/335,30,60/);齿形
	DEF VAR4=(I/*0=$85327,1=$85328//$85350,,,/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_STA"/0,0,0/440,30,60/);砂轮状态

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_R"/330,60,110/440,60,60/);粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_R"/330,80,110/440,80,110/);粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_R"/330,100,110/440,100,110/);粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_TIME_F"/330,130,110/440,130,60/);精修次数
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_DEEP_F"/330,150,110/440,150,110/);精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR1//"/NC/_N_NC_GD2_ACX/D_DRESS_FEED_F"/330,170,110/440,170,110/);精修速度

	DEF VAR11=(R/-500,500//$85342,$85342,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL_MID"/330,200,110/440,200,110/);砂轮修整轮中心

	DEF VAR12=(R/0,200//$85316,$85316,,$85043/WR4//"/NC/_N_NC_GD2_ACX/WHEEL_WIDTH"/330,230,110/440,230,110/);砂轮宽度
	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_DIA"/330,250,110/440,250,110/);新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_DIACURNT"/330,270,110/440,270,110/);砂轮当前直径
	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR1//"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS_D"/330,290,110/440,290,110/);砂轮线速度

	DEF VAR20=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_VER"/0,0,0/50,10,20/);垂直轴
	DEF VAR21=(S1////WR1//"/NC/_N_NC_GD2_ACX/AXIS_HORI"/0,0,0/50,25,20/);水平轴

	HS1=($85001,ac7,se1);"磨削参数"
	HS2=($85002,ac7,se1);"工艺参数"
	HS3=($85003,ac7,se1);"修整参数"
	HS8=($85005,ac7,se1);"返回"

	VS1=("")

	PRESS(HS1)
		LM("MASK1")
	END_PRESS

	PRESS(HS2)
		LM("MASK2")
	END_PRESS

	PRESS(HS3)
		LM("MASK12")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

//END

;;;;;;;;;;;;;;;;;;;工艺表格;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//G(TECH_GRID/0/7)

	(R3///$85203,$85203/WR2//"/NC/_N_NC_GD2_ACX/TECH_R[1]"/103/,1)
	(R3///$85204,$85204/WR2//"/NC/_N_NC_GD2_ACX/TECH_MR[1]"/103/,1)
	(R3///$85205,$85205/WR2//"/NC/_N_NC_GD2_ACX/TECH_MF[1]"/103/,1)
	(R3///$85206,$85206/WR2//"/NC/_N_NC_GD2_ACX/TECH_F[1]"/103/,1)

//END

;//G(TECH_PAR1/0/1)
;(I///,$85214/WR1///110/1)
;//END

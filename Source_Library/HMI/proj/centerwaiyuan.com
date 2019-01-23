;***********************MASK31:外圆磨削参数:panel_31**********************
//M(MASK31/$85709/"panel_31_1_chs.png"/)
	DEF VAR20=(I/*0=$85166,1=$85167//$85170,$85170,,/WR2/"panel_31_1_chs.png"/"/NC/_N_NC_GD2_ACX/INI[98]"/360,10,70/460,10,80//"UserGuide/section_26.html","S26D3");单件/批量磨削方式选择

	DEF VAR9=(R///$85712,$85712,,/WR1///360,80,202/460,80,60//"UserGuide/section_26.html","S26D4");工件起点
	DEF VAR8=(R///$85713,$85713,,/WR1///360,100,202/460,100,60//"UserGuide/section_26.html","S26D5");工件终点
	DEF VAR1=(R////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[49]"/0,0,0/0,0,0/);左端面初始接触
	DEF VAR2=(R////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[48]"/0,0,0/0,0,0/);右端面初始接触

	DEF TUIDAOCAO=(R/0,10//$85702,$85702,,/WR2/"panel_31_2_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[113]"/360,130,202/460,130,60//"UserGuide/section_26.html","S26D6");退刀槽长度

	DEF WHELL_POS_INI=(R///$85169,$85169,,/WR2/"panel_31_4_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[47]"/360,180,202/460,180,60/6/"UserGuide/section_26.html","S26D8");初始磨削接触位
	DEF VAR19=(R///$85158,$85158,,/WR2/"panel_31_3_chs.png"/"/NC/_N_NC_GD2_ACX/PROCESS[21]"/360,200,202/460,200,60//"UserGuide/section_26.html","S26D9");当前磨削接触位

	DEF X_QUIT=(R/-800,800//$85714,$85714,,/WR2/"panel_31_5_chs.png"/"/NC/_N_NC_GD2_ACX/INI[108]"/360,240,202/460,240,60//"UserGuide/section_26.html","S26D1");退刀位置
	DEF Z_INIT=(R/-2000,2000//$85101,$85101,,/WR2/"panel_31_6_chs.png"/"/NC/_N_NC_GD2_ACX/INI[109]"/360,260,202/460,260,60//"UserGuide/section_26.html","S26D2");磨外圆部分时台面起始位置

	DEF AXIS_EW=(S1//"X"//WR4//"/NC/_N_NC_GD2_ACX/AXIS_EW"/0,0,0/0,0,0/);外圆轴  ifIsNotHasU
	DEF AXIS_ORI=(R//-1//WR4//"/NC/_N_NC_GD2_ACX/PROCESS[58]"/0,0,0/0,0,0/);外圆砂轮轴方向(后正1/后负-1)   ifIsNotHasU

	DEF AXIS_EW=(S1//"U"//WR4//"/NC/_N_NC_GD2_ACX/AXIS_EW"/0,0,0/0,0,0/);外圆轴   ifIsHasU
	DEF AXIS_ORI=(R//1//WR4//"/NC/_N_NC_GD2_ACX/PROCESS[58]"/0,0,0/0,0,0/);外圆砂轮轴方向(后正1/后负-1)   ifIsHasU

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM ifIsNotHasU
	DEF U_IM=(R///$85121,$85121,,/WR1//"$AA_IM[U]"/10,10,20/30,10,60/3);U_IM ifIsHasU
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,30,20/30,30,60/3);Z_IM

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto
	HS5=($85012,ac7,se3);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se3);磨削
	VS2=($85710,ac7,se1);工艺
	VS3=($85711,ac7,se1);修整
	VS5=($85028,ac7,se1);台阶

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
		LM("MASK31","centerwaiyuan.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK24","centerwaiyuan.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK26","centerwaiyuan.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK33","centerwaiyuan.com")
	END_PRESS

	CHANGE(VAR1)
		VAR9.VAL=VAR1.VAL+0.2
		VAR8.VAL=VAR2.VAL+0.2
	END_CHANGE

	CHANGE(VAR2)
		VAR9.VAL=VAR1.VAL+0.2
		VAR8.VAL=VAR2.VAL+0.2
	END_CHANGE

	CHANGE(VAR9)
		IF Z_INIT.VAL<VAR9.VAL+30
			;Z_INIT.VAL=VAR9.VAL+30
		ENDIF
	END_CHANGE

	CHANGE(Z_INIT)
		IF Z_INIT.VAL<VAR9.VAL+30
			;Z_INIT.VAL=VAR9.VAL+30
		ENDIF
	END_CHANGE

//END

;***********************MASK24:外磨工艺参数:panel_24**********************
//M(MASK24/$85710/"panel_24_0_chs.png"/)

	;循环次数
	DEF VAR15=(I///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[79]"/0,0,0/132,104,60//"UserGuide/section_26.html","S26D12");粗磨次数
	DEF VAR16=(I///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[84]"/0,0,0/222,104,60//"UserGuide/section_26.html","S26D12");半精磨次数
	DEF VAR17=(I///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[89]"/0,0,0/312,104,60//"UserGuide/section_26.html","S26D12");精磨次数
	DEF VAR18=(I///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[94]"/0,0,0/402,104,60//"UserGuide/section_26.html","S26D12");终磨次数
	
	;进给深度
	DEF VAR19=(R///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[81]"/0,0,0/132,129,60//"UserGuide/section_26.html","S26D13");粗磨进给量
	DEF VAR20=(R///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[86]"/0,0,0/222,129,60//"UserGuide/section_26.html","S26D13");半精磨进给量
	DEF VAR21=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[91]"/0,0,0/312,129,60//"UserGuide/section_26.html","S26D13");精磨进给量
	DEF VAR22=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[96]"/0,0,0/402,129,60//"UserGuide/section_26.html","S26D13");终磨进给量
	
	;磨削速度
	DEF VAR27=(R///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[82]"/0,0,0/132,154,60//"UserGuide/section_26.html","S26D14");粗磨速度
	DEF VAR28=(R///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[87]"/0,0,0/222,154,60//"UserGuide/section_26.html","S26D14");半精磨速度
	DEF VAR29=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[92]"/0,0,0/312,154,60//"UserGuide/section_26.html","S26D14");精磨速度
	DEF VAR30=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[97]"/0,0,0/402,154,60//"UserGuide/section_26.html","S26D14");终磨速度

	;磨削几次修整设定
	DEF VAR41=(I///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[80]"/0,0,0/132,179,60//"UserGuide/section_26.html","S26D15");粗磨
	DEF VAR42=(I///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[85]"/0,0,0/222,179,60//"UserGuide/section_26.html","S26D15");半精磨
	DEF VAR43=(I///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[90]"/0,0,0/312,179,60//"UserGuide/section_26.html","S26D15");精磨
	DEF VAR44=(I///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[95]"/0,0,0/402,179,60//"UserGuide/section_26.html","S26D15");终磨
	
	;砂轮线速度设定
	DEF VAR37=(R///$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[83]"/0,0,0/132,203,60//"UserGuide/section_26.html","S26D16");粗磨砂轮线速度
	DEF VAR38=(R///$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[88]"/0,0,0/222,203,60//"UserGuide/section_26.html","S26D16");半粗磨砂轮线速度
	DEF VAR39=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[93]"/0,0,0/312,203,60//"UserGuide/section_26.html","S26D16");半精磨砂轮线速度
	DEF VAR40=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[98]"/0,0,0/402,203,60//"UserGuide/section_26.html","S26D16");精磨砂轮线速度
	
	;头架转速显示
	DEF VAR23=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[31]"/0,0,0/132,245,60//"UserGuide/section_26.html","S26D17");粗磨头架转速
	DEF VAR24=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[32]"/0,0,0/222,245,60//"UserGuide/section_26.html","S26D17");半粗磨头架转速
	DEF VAR25=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[33]"/0,0,0/312,245,60//"UserGuide/section_26.html","S26D17");半精磨头架转速
	DEF VAR26=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[34]"/0,0,0/402,245,60//"UserGuide/section_26.html","S26D17");精磨头架转速

	;砂轮转速显示
	DEF VAR32=(R///,,,/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[92]"/0,0,0/0,0,0/);当前砂轮直径调用
	DEF VAR33=(I///,,,/WR1///0,0,0/132,266,60/);粗磨砂轮转速
	DEF VAR34=(I///,,,/WR1///0,0,0/222,266,60/);半粗磨砂轮转速
	DEF VAR35=(I///,,,/WR1///0,0,0/312,266,60/);半精磨砂轮转速
	DEF VAR36=(I///,,,/WR1///0,0,0/402,266,60/);精磨砂轮转速

	;来回/保持磨削选择
	DEF VAR10=(I/*0=$85703,1=$85704//$85203,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[240]"/0,0,0/132,78,60//"UserGuide/section_26.html","S26D36");
	DEF VAR11=(I/*0=$85703,1=$85704//$85204,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[241]"/0,0,0/222,78,60//"UserGuide/section_26.html","S26D36");
	DEF VAR12=(I/*0=$85703,1=$85704//$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[242]"/0,0,0/312,78,60//"UserGuide/section_26.html","S26D36");
	DEF VAR13=(I/*0=$85703,1=$85704//$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[243]"/0,0,0/402,78,60//"UserGuide/section_26.html","S26D36");	

	;界面设定磨削总量计算
	DEF GRID_TOTAL_ACC=(R///$85222,$85222,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[59]"/30,5,190/120,5,60/);累计磨削总量显示
	DEF VAR14=(R///$85220,$85219,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[115]"/30,25,190/120,25,60/);界面设定磨削总量显示
	;磨削几件后修整
	DEF WORK_CUMU=(I///$85227,$85227,,$85228/WR2//"/NC/_N_NC_GD2_ACX/INI[94]"/230,5,110/300,5,110//"UserGuide/section_26.html","S26D10");磨削工件计数(磨削完毕后累加)
	DEF WORK_DRESS=(I///$85229,$85229,,$85228/WR2//"/NC/_N_NC_GD2_ACX/INI[95]"/230,25,110/300,25,110//"UserGuide/section_26.html","S26D11");磨削几件后修整(次数到达后,下一次开始时修整)

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测
	DEF TECH_CHECK=(I///$85220,$85219,$85043,/WR4//"/NC/_N_NC_GD2_ACX/PROCESS[19]"/0,0,0/0,0,0);当前执行那道工艺检测
	
	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

    HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto
	HS5=($85012,ac7,se3);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se1);磨削
	VS2=($85710,ac7,se3);工艺
	VS3=($85711,ac7,se1);修整
	VS5=($85028,ac7,se1);台阶
	
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
		LM("MASK31","centerwaiyuan.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK24","centerwaiyuan.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK26","centerwaiyuan.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK33","centerwaiyuan.com")
	END_PRESS

	CHANGE(VAR15);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR16);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR17);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR18);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR19);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR20);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR21);界面设定磨削总量计算
		CALL("UP3")
	END_CHANGE

	CHANGE(VAR22);界面设定磨削总量计算
		CALL("UP3")
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

	CHANGE(ISGRIND);根据是否选择外磨工序判断界面是否可用(借用DIY设置函数)
		CALL("Q_DIY_SET")
	END_CHANGE
	
	CHANGE(QCHECK)
		CALL("Q_DIY_SET")
	END_CHANGE
	
	CHANGE(TECH_CHECK)
		CALL("Q_DIY_SET")
	END_CHANGE

	SUB(UP3)
		VAR14.VAL=VAR15.VAL*VAR19.VAL+VAR16.VAL*VAR20.VAL+VAR17.VAL*VAR21.VAL+VAR18.VAL*VAR22.VAL
	END_SUB
	
	SUB(DIY_ON)
		;单双磨禁止选择
		VAR10.WR=1
		VAR11.WR=1
		VAR12.WR=1
		VAR13.WR=1
		;循环次数
		VAR15.WR=1
		VAR16.WR=1
		VAR17.WR=1
		VAR18.WR=1
		;进给深度
		VAR19.WR=1
		VAR20.WR=1
		VAR21.WR=1
		VAR22.WR=1
		;磨削速度
		VAR27.WR=1
		VAR28.WR=1
		VAR29.WR=1
		VAR30.WR=1
		;磨削几次修整设定
		VAR41.WR=1
		VAR42.WR=1
		VAR43.WR=1
		VAR44.WR=1
		;头架转速
		VAR23.WR=1
		VAR24.WR=1
		VAR25.WR=1
		VAR26.WR=1
		;砂轮线速度设定
		VAR37.WR=1
		VAR38.WR=1
		VAR39.WR=1
		VAR40.WR=1
		
	END_SUB	

	SUB(DIY_OFF)
		;单双磨
		VAR10.WR=2
		VAR11.WR=2
		VAR12.WR=2
		VAR13.WR=2
		;循环次数
		VAR15.WR=2
		VAR16.WR=2
		VAR17.WR=2
		VAR18.WR=2
		;进给深度
		VAR19.WR=2
		VAR20.WR=2
		VAR21.WR=2
		VAR22.WR=2
		;磨削速度
		VAR27.WR=2
		VAR28.WR=2
		VAR29.WR=2
		VAR30.WR=2
		;磨削几次修整设定
		VAR41.WR=2
		VAR42.WR=2
		VAR43.WR=2
		VAR44.WR=2
		;头架转速
		VAR23.WR=2
		VAR24.WR=2
		VAR25.WR=2
		VAR26.WR=2
		;砂轮线速度设定
		VAR37.WR=2
		VAR38.WR=2
		VAR39.WR=2
		VAR40.WR=2

	END_SUB

	SUB(Q_DIY_SET)
		IF ISGRIND.VAL==0
			VAR14.WR=4
			GRIND_MSG.WR=1
			CALL("DIY_ON")
		ELSE
			VAR14.WR=1
			GRIND_MSG.WR=4
			CALL("DIY_OFF")
			IF QCHECK.VAL==1
				IF TECH_CHECK.VAL==0
					VAR10.WR=1
					VAR19.WR=1
					VAR50.WR=1
				ELSE
					VAR10.WR=2
					VAR19.WR=2
					VAR50.WR=2
				ENDIF
				IF TECH_CHECK.VAL==1
					VAR11.WR=1
					VAR20.WR=1
					VAR51.WR=1
				ELSE
					VAR11.WR=2
					VAR20.WR=2
					VAR51.WR=2
				ENDIF
				IF TECH_CHECK.VAL==2
					VAR12.WR=1
					VAR21.WR=1
					VAR52.WR=1
				ELSE
					VAR12.WR=2
					VAR21.WR=2
					VAR52.WR=2
				ENDIF
				IF TECH_CHECK.VAL==3
					VAR13.WR=1
					VAR22.WR=1
					VAR53.WR=1
				ELSE
					VAR13.WR=2
					VAR22.WR=2
					VAR53.WR=2
				ENDIF
			ELSE
				VAR10.WR=2
				VAR11.WR=2
				VAR12.WR=2
				VAR13.WR=2
				VAR19.WR=2
				VAR20.WR=2
				VAR21.WR=2
				VAR22.WR=2
				VAR50.WR=2
				VAR51.WR=2
				VAR52.WR=2
				VAR53.WR=2
			ENDIF
		ENDIF	
	END_SUB

//END

;*****************MASK26:外磨修整参数:panel_26:;*****************
//M(MASK26/$85711/"panel_26_1_chs.png"/)

	DEF VAR0=(R///$85366,$85366,,$85043/WR1//"/NC/_N_NC_GD2_ACX/DRESSER[128]"/110,10,110/200,10,110//"UserGuide/section_26.html","S26D18");累计修整量
	DEF ZUIDU=(R///$85724,$85724,,$85043/WR2/"panel_26_4_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[133]"/110,40,110/200,40,110//"UserGuide/section_26.html","S26D19");外圆修整锥度微调(正 左低右高/负 左高右低)

	DEF VAR4=(I/*0=$85327,1=$85328//$85350,$85350,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[90]"/330,10,110/440,10,60//"UserGuide/section_26.html","S26D20");砂轮状态

	DEF VAR5=(I/0,1000//$85340,$85340,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[83]"/330,40,110/440,40,60//"UserGuide/section_26.html","S26D21");粗修次数
	DEF VAR6=(R/0,0.5//$85308,$85308,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[85]"/330,60,110/440,60,110//"UserGuide/section_26.html","S26D22");粗修量
	DEF VAR7=(R/0,1000//$85306,$85306,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[87]"/330,80,110/440,80,110//"UserGuide/section_26.html","S26D23");粗修速度

	DEF VAR8=(I/0,1000//$85341,$85341,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[84]"/330,110,120/440,110,60//"UserGuide/section_26.html","S26D24");精修次数
	DEF VAR9=(R/0,0.5//$85309,$85309,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[86]"/330,130,110/440,130,110//"UserGuide/section_26.html","S26D25");精修量
	DEF VAR10=(R/0,1000//$85307,$85307,,$85045/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[88]"/330,150,110/440,150,110//"UserGuide/section_26.html","S26D26");精修速度

	DEF DRESS_START=(R///$85715,$85715,,$85043/WR2/"panel_26_2_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[94]"/330,180,110/440,180,110//"UserGuide/section_26.html","S26D27");修整起点
	DEF DRESS_END=(R///$85716,$85716,,$85043/WR2/"panel_26_3_chs.png"/"/NC/_N_NC_GD2_ACX/DRESSER[73]"/330,200,110/440,200,110//"UserGuide/section_26.html","S26D28");修整终点

	DEF VAR13=(R/0,1000//$85319,$85319,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[91]"/330,230,110/440,230,110//"UserGuide/section_26.html","S26D29");新砂轮直径
	DEF VAR14=(R/0,1000//$85320,$85320,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[92]"/330,250,110/440,250,110//"UserGuide/section_26.html","S26D30");砂轮当前直径
	DEF VAR15=(R/0,80//$85317,$85317,,$85046/WR2//"/NC/_N_NC_GD2_ACX/WHEEL_LINESPEED_DRESS[16]"/330,270,110/440,270,110//"UserGuide/section_26.html","S26D31");砂轮线速度
	DEF VAR16=(I///$85318,$85318,,$85044/WR1///330,290,110/440,290,110/);修整时砂轮转速

	DEF DQJC=(R///$85718,$85718,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[89]"/330,320,110/440,320,60//"UserGuide/section_26.html","S26D32");当前接触
	DEF CSJC=(R///$85717,$85717,,/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[120]"/330,340,110/440,340,60//"UserGuide/section_26.html","S26D33");初始接触
	
	DEF VAR17=(R/0,1000//$85303,$85303,,$85043/WR2//"/NC/_N_NC_GD2_ACX/DRESSER[138]"/70,340,150/200,340,110//"UserGuide/section_26.html","S26D34");外圆砂轮最小磨削直径

	DEF X_IM=(R///$85118,$85118,,/WR1//"$AA_IM[X]"/10,10,20/30,10,60/3);X_IM ifIsNotHasU
	DEF U_IM=(R///$85121,$85121,,/WR1//"$AA_IM[U]"/10,10,20/30,10,60/3);U_IM ifIsHasU
	DEF Z_IM=(R///$85119,$85119,,/WR1//"$AA_IM[Z]"/10,30,20/30,30,60/3);Z_IM

	DEF QCHECK=(I////WR4//"/Plc/Q113.5"/0,0,0/0,0,0);循环启动Q点检测

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto
	HS5=($85012,ac7,se3);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se1);磨削
	VS2=($85710,ac7,se1);工艺
	VS3=($85711,ac7,se3);修整
	VS5=($85028,ac7,se1);台阶

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
		LM("MASK31","centerwaiyuan.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK24","centerwaiyuan.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK26","centerwaiyuan.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK33","centerwaiyuan.com")
	END_PRESS

	CHANGE(VAR2)
		call("UP4")
	END_CHANGE

	CHANGE(VAR4)
		IF VAR4.VAL==0
			VAR14.VAL=VAR13.VAL
		ENDIF
	END_CHANGE

	CHANGE(VAR13)
		IF VAR4.VAL==0
			VAR14.VAL=VAR13.VAL
		ENDIF
	END_CHANGE

	CHANGE(VAR14)
		VAR16.VAL=VAR15.VAL*60000/(PI*VAR14.VAL);修整时砂轮转速计算
	END_CHANGE
	
	CHANGE(VAR15)
		VAR16.VAL=VAR15.VAL*60000/(PI*VAR14.VAL);修整时砂轮转速计算
	END_CHANGE

	CHANGE(CSJC)
		VAR0.VAL=ABS(CSJC.VAL-DQJC.VAL)
	END_CHANGE

	CHANGE(DQJC)
		VAR0.VAL=ABS(CSJC.VAL-DQJC.VAL)
	END_CHANGE

	CHANGE(QCHECK)
		call("UP4")
	END_CHANGE

	SUB(UP4)
		IF QCHECK.VAL==1
			VAR4.WR=1
			VAR6.WR=1
			VAR9.WR=1
			VAR13.WR=1
			VAR14.WR=1
		ELSE
			VAR4.WR=2
			VAR6.WR=2
			VAR9.WR=2
			VAR13.WR=2
			VAR14.WR=2
		ENDIF
	END_SUB

//END

;*****************MASK33:台阶参数:panel_33:;*****************
//M(MASK33/$85028/"panel_33_0_chs.png"/)

	DEF VAR5=(R/0,100//$85719,$85719,,$85043/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[56]"/10,103,110/110,103,110//"UserGuide/section_26.html","S26D35");台阶距左端面距离

	DEF VAR9=(R///$85712,$85712,,/WR1///10,129,202/110,129,60/);工件起点
	DEF VAR8=(R///$85713,$85713,,/WR1///10,154,202/110,154,60/);工件终点
	DEF VAR1=(R////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[35]"/0,0,0/0,0,0/);左端面当前接触
	DEF VAR2=(R////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[48]"/0,0,0/0,0,0/);右端面初始接触

	DEF VAR19=(R///$85158,$85158,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[109]"/10,179,202/110,179,60/);当前磨削接触位
	DEF WHELL_POS_INI=(R///$85169,$85169,,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[21]"/10,203,202/110,203,60/);初始磨削接触位

	;来回/保持磨削选择
	DEF VAR12=(I/*0=$85703,1=$85704//$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[106]"/0,0,0/312,103,60);
	DEF VAR13=(I/*0=$85703,1=$85704//$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[107]"/0,0,0/402,103,60);	

	;循环次数
	DEF VAR17=(I///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[266]"/0,0,0/312,129,60/);精磨次数
	DEF VAR18=(I///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/TECHNOLOGY[267]"/0,0,0/402,129,60/);终磨次数
	
	;进给深度
	DEF VAR21=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[100]"/0,0,0/312,154,60);精磨进给量
	DEF VAR22=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[101]"/0,0,0/402,154,60);终磨进给量
	
	;磨削速度
	DEF VAR29=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[103]"/0,0,0/312,179,60/);精磨速度
	DEF VAR30=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[104]"/0,0,0/402,179,60/);终磨速度

	;砂轮线速度设定
	DEF VAR39=(R///$85205,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[111]"/0,0,0/312,203,60/);半精磨砂轮线速度
	DEF VAR40=(R///$85206,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[112]"/0,0,0/402,203,60/);精磨砂轮线速度
	
	;头架转速显示
	DEF VAR25=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[97]"/0,0,0/312,269,60/);半精磨头架转速
	DEF VAR26=(R///,,,/WR2//"/NC/_N_NC_GD2_ACX/PROCESS[98]"/0,0,0/402,269,60/);精磨头架转速

	;砂轮转速显示
	DEF VAR32=(R///,,,/WR4//"/NC/_N_NC_GD2_ACX/DRESSER[92]"/0,0,0/0,0,0/);当前砂轮直径调用
	DEF VAR35=(I///,,,/WR1///0,0,0/312,290,60/);半精磨砂轮转速
	DEF VAR36=(I///,,,/WR1///0,0,0/402,290,60/);精磨砂轮转速

	;界面设定磨削总量计算
	DEF VAR102=(R///$85222,$85222,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[108]"/355,20,190/445,20,60/);累计磨削总量显示
	DEF VAR103=(R///$85220,$85219,$85043,/WR1//"/NC/_N_NC_GD2_ACX/PROCESS[116]"/355,40,190/445,40,60/);界面设定磨削总量显示

	DEF TYPE=(I////WR4//"/NC/_N_NC_GD2_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型
	DEF TECH=(I////WR4//"/NC/_N_NC_GD2_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数
	DEF PIECE_VOLUME=(I////WR4//"/NC/_N_NC_GD2_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择

	HS1=($85001,ac7,se1);磨削参数
	HS2=($85002,ac7,se1);工艺参数
	HS3=($85003,ac7,se1);修整参数
	HS4=($85010,ac7,se1);自动对刀  ifIsAuto
	HS5=($85012,ac7,se3);外圆
	HS6=($85017,ac7,se1);端面
	HS7=($85011,ac7,se1);程序选项界面
	HS8=($85005,ac7,se1);返回

	VS1=($85709,ac7,se1);磨削
	VS2=($85710,ac7,se1);工艺
	VS3=($85711,ac7,se1);修整
	VS5=($85028,ac7,se3);台阶

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
		LM("MASK31","centerwaiyuan.com")
	END_PRESS

	PRESS(VS2)
		LM("MASK24","centerwaiyuan.com")
	END_PRESS

	PRESS(VS3)
		LM("MASK26","centerwaiyuan.com")
	END_PRESS

	PRESS(VS5)
		LM("MASK33","centerwaiyuan.com")
	END_PRESS

	CHANGE(VAR1)
		VAR9.VAL=VAR1.VAL+VAR5.VAL
		VAR8.VAL=VAR2.VAL+0.1
	END_CHANGE

	CHANGE(VAR5)
		VAR9.VAL=VAR1.VAL+VAR5.VAL
		VAR8.VAL=VAR2.VAL+0.1
	END_CHANGE

	CHANGE(VAR2)
		VAR9.VAL=VAR1.VAL+VAR5.VAL
		VAR8.VAL=VAR2.VAL+0.1
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

	CHANGE(VAR39)
		VAR35.VAL=VAR39.VAL*60000/(PI*VAR32.VAL)
	END_CHANGE

	CHANGE(VAR40)
		VAR36.VAL=VAR40.VAL*60000/(PI*VAR32.VAL)
	END_CHANGE

	SUB(UP4)
		VAR103.VAL=VAR17.VAL*VAR21.VAL+VAR18.VAL*VAR22.VAL
	END_SUB

//END


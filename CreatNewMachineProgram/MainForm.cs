/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-12
 * Time: 13:51
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using System.IO;
using System.Text;
namespace CreatNewMachineProgram
{
	/// <summary>
	/// Description of MainForm.
	/// </summary>
	public partial class MainForm : Form
	{
		bool isRunFormAdd=false;//为了使外螺纹时程序运行结束时NQ不被选中,而增加的变量
		//机床信息全局变量
		string machineNumber=string.Empty;
		string machineName=string.Empty;
		string selledNumber=string.Empty;
		string userName=string.Empty;
		string userAddress=string.Empty;
		string deBugName=string.Empty;
		string selledTime=string.Empty;
		string softVersion=string.Empty;
		//
		BasicInformationForm basicInfoForm;//基本信息窗口
		//
		bool shape=true;//选中滚压轮时值为false,用于使三种齿形对应的垂直方向按键不显示
		string grindType;//存储磨削类型的变量
		string dressType;//存储修整器类型的变量,变量值举例:"修整器V_W"
		string wheelType="6666";//存储滚轮类型的变量
		public MainForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		void CreateFileClick(object sender, EventArgs e)
		{
			//程序开始前先清除 NewMachineProgram文件夹中的所有内容
			if(Directory.Exists("NewMachineProgram")) Directory.Delete("NewMachineProgram",true);
			//生成临时需要的分割后的界面文件
			SplitCustomFile spc=new SplitCustomFile();
			SplitCustomFile.FormSplit();
			
			bool flag=false;//有文件被选择时的标记
			//获得下拉框输入的磨削类型
			#region
			try
			{
				grindType=grindTypeComboBox.SelectedItem.ToString();
			}
			
			catch(Exception e1)
			{
				MessageBox.Show("请选择正确的磨削类型","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Error);
				goto endLabel;
			}
			#endregion
			//删除原有的temp_custom.com"文件
			if(File.Exists(@"temp_custom.com"))
			{
				File.Delete(@"temp_custom.com");
			}
			//checkbox处理
			#region//checkbox处理
			if(welcomeCheckBox.Checked)
			{
				FormAdd.AddWelcomeForm(grindType);
				flag=true;
			}
			
			if(machineMessageCheckBox.Checked)
			{
				FormAdd.AddMachineMessageForm();
				flag=true;
			}
			
			if(grindParameterCheckBox.Checked)//磨削参数
			{
				FormAdd.AddGrindParameterForm(grindType);
				flag=true;
			}
			
			if(techniqueCheckBox.Checked)//工艺参数
			{
				FormAdd.AddTechniqueForm();
				flag=true;
			}
			
			if(dressParameterCheckBox.Checked)//修整参数
			{
				FormAdd.AddDressParameterForm();
				flag=true;
			}
			
			if(dressParameterCheckBox_VW_D.Checked)//修整参数VW_D
			{
				FormAdd.AddDressParameterForm_VW_D();
				flag=true;
				dressType="修整器V_W";
				wheelType="修整轮类型:单滚轮";
			}
			
			if(dressParameterCheckBox_VW_S.Checked)//修整参数VW-S
			{
				FormAdd.AddDressParameterForm_VW_S();
				flag=true;
				dressType="修整器V_W";
				wheelType="修整轮类型:双滚轮";
			}
			
			if(dressParameterCheckBox_VW_F.Checked)//修整参数VW-F
			{
				FormAdd.AddDressParameterForm_VW_F();
				flag=true;
				dressType="修整器V_W";
				wheelType="修整轮类型:方滚轮";
			}
			
			if(dressParameterCheckBox_XZ_D.Checked)//修整参数XZ-D
			{
				FormAdd.AddDressParameterForm_XZ_D();
				flag=true;
				dressType="修整器X_Z";
				wheelType="修整轮类型:单滚轮";
			}
			
			if(dressParameterCheckBox_XZ_S.Checked)//修整参数XZ-S
			{
				FormAdd.AddDressParameterForm_XZ_S();
				flag=true;
				dressType="修整器X_Z";
				wheelType="修整轮类型:双滚轮";
			}
			
			if(dressParameterCheckBox_XZ_F.Checked)//修整参数XZ-F
			{
				FormAdd.AddDressParameterForm_XZ_F();
				flag=true;
				dressType="修整器X_Z";
				wheelType="修整轮类型:方滚轮";
			}
			
			if(dressParameterCheckBox_GY_V.Checked)//修整参数滚压V
			{
				FormAdd.AddDressParameterForm_GY_V();
				flag=true;
				dressType="修整器成型V";
				shape=false;//齿形按键关闭
			}
			
			if(dressParameterCheckBox_GY_X_W.Checked)//修整参数滚压X_外
			{
				FormAdd.AddDressParameterForm_GY_X_W();
				flag=true;
				dressType="修整器成型X";
				shape=false;
			}
			
			if(dressParameterCheckBox_GY_X_N_Q.Checked)//修整参数滚压X_内_前
			{
				FormAdd.AddDressParameterForm_GY_X_N_Q();
				flag=true;
				dressType="修整器成型X";
				shape=false;
			}
			
			if(dressParameterCheckBox_GY_X_N_H.Checked)//修整参数滚压X_内_后
			{
				FormAdd.AddDressParameterForm_GY_X_N_H();
				flag=true;
				dressType="修整器成型X";
				shape=false;
			}
			
			if(dressParameterCheckBox_BG.Checked)//修整参数_摆缸
			{
				FormAdd.AddDressParameterCheckBox_BGForm();
				flag=true;
				dressType="修整器摆缸";
				shape=false;
			}
			
			if(dressBackCheckBox.Checked)//修整返回
			{
				FormAdd.AddDressBackForm();
				flag=true;
			}
			
			if(shapeParameterCheckBox_TRI.Checked)//齿形参数_三角
			{
				FormAdd.AddShapeParameterCheckBox_TRIForm();
				flag=true;
			}
			
			
			if(shapeParameterCheckBox_TRA.Checked)//齿形参数_梯形
			{
				FormAdd.AddShapeParameterCheckBox_TRAForm();
				flag=true;
			}
			
			if(shapeParameterCheckBox_DOU.Checked)//齿形参数_双圆弧
			{
				FormAdd.AddShapeParameterCheckBox_DOUForm();
				flag=true;
			}
			#endregion
			//自动对刀画面的添加
			if(autoOperationComboBox.SelectedItem.ToString()=="是")
			{
				FormAdd.AddAutoOperationForm();
			}
			isRunFormAdd=true;
			
			//水平按键处理函数
			ButtonDeal();
			
			/*弹出提示窗口,如果界面文件生成成功则等用户确认后继续运行下一功能,否则弹出
			提示信息,中断本次运行,提示用户重新选择界面块条目*/
			#region
			if(flag)
			{
				MessageBox.Show("custom.com文件已生成","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Information);
				
			}
			else
			{
				MessageBox.Show("未选择条目","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Information);
				goto endLabel;
			}
			#endregion
			
			
			//NC程序相关处理
			//生成去掉注释的程序
			CreatMachineProgram.CopyProgram();
			//DIY程序不需要去掉注释
			File.Copy("Programing_NC\\MPF\\USER_DIY.MPF","NewMachineProgram\\MPF\\USER_DIY.MPF",true);
			//复制HMI文件夹中的内容
			CopyHMI.CopyFileAndFolder(@"Programing_NC\HMI","NewMachineProgram\\HMI");
			
			//处理新生成的custom文件
			#region
			FormAdd.DealForm(shapeParameterCheckBox_TRI,shapeParameterCheckBox_TRA,shapeParameterCheckBox_DOU,dressParameterCheckBox_GY_X_N_Q,dressParameterCheckBox_GY_X_N_H,grindTypeComboBox,autoOperationComboBox,autoOperationTypeComboBox);
			if(File.Exists("custom.com"))//删除当前路径下的customer文件
			{
				File.Delete("custom.com");
			}
			else
			{
				MessageBox.Show("新界面文件生成失败,请重新打开程序");
			}
			#endregion
			//初始化程序中对一些基本变量的赋值
			PAR_INI_Deal();
			//修改INFO_INIT.MPF的内容并改名
			INFO_INIT_Deal();
			//根据机床型号修改语言文本中的信息
			Almc_chs_Deal();
			
			//如果是已经调试过的型号,对保存的ico文件进行复制替换
			IcoReplace();
			//如果是外螺纹磨削,不需要SPF中的夹具磨削程序
			if(grindTypeComboBox.SelectedItem.ToString()=="外螺纹")
			{
				File.Delete("NewMachineProgram\\SPF\\JIAJU_DRESS.SPF");
				File.Delete("NewMachineProgram\\SPF\\JIAJU_GRIND.SPF");
			}
			//更改文件夹的名称
			string newFolderName=machineNumber.Replace("×","_");
			if(Directory.Exists(newFolderName))
			{
				Directory.Delete(newFolderName,true);
			}
			Directory.Move("NewMachineProgram",newFolderName);
		endLabel:
			SplitCustomFile.DeleteSplitFiles();
		}
		
		void MainFormLoad(object sender, EventArgs e)
		{
			//默认被选择的条目
			welcomeCheckBox.Checked=true;
			machineMessageCheckBox.Checked=true;
			grindParameterCheckBox.Checked=true;
			techniqueCheckBox.Checked=true;
			dressParameterCheckBox.Checked=true;
			dressBackCheckBox.Checked=true;
			//机床信息默认被选中项
			grindTypeComboBox.SelectedIndex=0;
			wheelDriverTypeComboBox.SelectedIndex=0;
			dressDriverTypeComboBox.SelectedIndex=0;
			helicAngleEnabledComboBox.SelectedIndex=0;
			autoOperationComboBox.SelectedIndex=1;
			autoOperationTypeComboBox.SelectedIndex=0;
			//默认齿形选项都不可选
//			shapeParameterCheckBox_DOU.Enabled=false;
//			shapeParameterCheckBox_TRA.Enabled=false;
//			shapeParameterCheckBox_TRI.Enabled=false;
			
			
			//机床基本信息窗口的加载
			basicInfoForm=new BasicInformationForm();
			basicInfoForm.ShowDialog();
			if(basicInfoForm.DialogResult!=DialogResult.OK) this.Dispose();//程序退出
			
			machineNumber=basicInfoForm.machineNumber;
			machineName=basicInfoForm.machineName;
			selledNumber=basicInfoForm.selledNumber;
			userName=basicInfoForm.userName;
			userAddress=basicInfoForm.userAddress;
			deBugName=basicInfoForm.deBugName;
			selledTime=basicInfoForm.selledTime;
			softVersion=basicInfoForm.softVersion;
			//basicInfoForm.Show();
		}
		void ButtonDeal()
		{
			//定义了一个(检索滚轮类型水平按键关键字的)数组
			//                  单             双            方             滚压          摆缸
			string[] WheelStr={"$85380,ac7,","$85381,ac7,","$85382,ac7,","$85379,ac7,","$85378,ac7,"};
			string oldPath=@"temp_custom.com";
			string newPath=@"custom.com";
			
			
			if(File.Exists(@"temp_custom.com"))
			{
				var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
				StreamReader sr=new StreamReader(oldPath,utf8WithoutBOM,true,512);
				//以覆盖原文件的方式建立一个StreamWriter对象
				StreamWriter sw=new StreamWriter(newPath,false,utf8WithoutBOM,1024);
				
				/*wheelType是一全局变量,其取值在checkBox处理程序段中进行赋值,
				例如 "修整轮类型:单滚轮" 
				 0,1,2,3,4对应数组WheelStr[]中的5个元素,将它传递给FindAndDealStr,
				 用于指定当前给方法中传递的滚轮类型检索关键字*/
				//VW
				FindAndDealStr(dressParameterCheckBox_VW_D,WheelStr,sr,sw,0,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_VW_S,WheelStr,sr,sw,1,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_VW_F,WheelStr,sr,sw,2,shape,dressType,wheelType);
				
				//滚压轮
				FindAndDealStr(dressParameterCheckBox_GY_V,WheelStr,sr,sw,3,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_GY_X_N_H,WheelStr,sr,sw,3,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_GY_X_N_Q,WheelStr,sr,sw,3,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_GY_X_W,WheelStr,sr,sw,3,shape,dressType,wheelType);
				
				//XZ
				FindAndDealStr(dressParameterCheckBox_XZ_D,WheelStr,sr,sw,0,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_XZ_S,WheelStr,sr,sw,1,shape,dressType,wheelType);
				FindAndDealStr(dressParameterCheckBox_XZ_F,WheelStr,sr,sw,2,shape,dressType,wheelType);
				
				FindAndDealStr(dressParameterCheckBox_BG,WheelStr,sr,sw,4,shape,dressType,wheelType);
				sr.Close();
				sw.Close();
				File.Delete(@"temp_custom.com");//删除临时文件
			}
		}
		
		private void FindAndDealStr(CheckBox cbx,string [] WheelStr,StreamReader sr,StreamWriter sw,int t,bool shape,string dressType,string wheelType)
		{
			if(cbx.Checked)
			{
				//数组,用于检索到定义齿形按键的哪一行
				//                  三角           梯形         双圆弧
				string[] shapeStr={"$85383,ac7","$85384,ac7,","$85385,ac7,"};
				string[] dressStr={"修整器V_W","修整器X_Z","修整器成型V","修整器成型X","修整器摆缸"};
				string[] wheelTypeStr={"修整轮类型:单滚轮","修整轮类型:双滚轮","修整轮类型:方滚轮"};
				while(!sr.EndOfStream)
				{
					string oneLineStr=sr.ReadLine();
					for(int i=0;i<5;i++)
					{
						/*t是形参,表示滚轮类型水平按键检索关键字,在形参数组WheelStr[]中查找
						 t,如果找到则表示当前有效的滚轮类型是该类型,其余类型都可屏蔽* */
						if(i!=t)
						{
							int ind=oneLineStr.IndexOf(WheelStr[i]);
							if(ind!=-1)
							{
								oneLineStr="	;"+oneLineStr.Trim();
							}
						}
						
					}
					//以上循环确定水平按键是否显示
					
					//该部分的功能与FormAdd类中的方法FormDeal的功能重复,所以注释掉.
					/*shape是一形参,当选中的修整器类型有齿形选项时,shape=true
					 否则为false* */
//					if(!shape)//shape=false时屏蔽垂直按键栏的齿形按钮
//					{
//						//循环查找shapeStr[i],判断当前行是否是定义齿形按键的一行
						//for(int i=0;i<3;i++)
//						{
//							int ind=oneLineStr.IndexOf(shapeStr[i]);
//							if(ind!=-1) oneLineStr="	;"+oneLineStr.Trim();
//						}
//					}
					//以上循环确定齿形按键是否显示
					
					
					bool isDressType=false;//标记:判断这一行是否是选择修整器类型的一行
					
					/*循环查找数组dressStr[i],判断当前行是否是源文件中重复的5句关于
					 修整器类型的定义*/
					for(int i=0;i<5;i++)
					{
						int ind=oneLineStr.IndexOf(dressStr[i]);
						if(ind!=-1) isDressType=true;
					}
					int ind2=oneLineStr.IndexOf(dressType);/*未找到目标字符串则返回-1
					,说明当前行不包含dressType指定的修整器类型*/
					
					
					bool isWheelType=false;//标记:判断这一行是否是滚轮类型选择的一行
					/*循环查找数组wheelTypeStr[i],判断当前行是否是源文件中重复的3句
					 关于滚轮类型的定义* */
					for(int i=0;i<3;i++)
					{
						int ind=oneLineStr.IndexOf(wheelTypeStr[i]);
						if(ind!=-1) isWheelType=true;
					}
					int ind3=oneLineStr.IndexOf(wheelType);/*未找到返回-1,说明当前行
					 不包含wheelType指定的滚轮类型* */
					
					//如果当前行是修整器类型定义,且不包含dressType指定的类型,则该行跳过不写
					bool isWrite1=(isDressType==true)&&(ind2==-1);
					//如果当前行是滚压轮类型的定义,且不包含wheelType指定的类型,则该行不写
					bool isWrite2=(isWheelType==true)&&(ind3==-1);//不写这一行的两种情况
					
					if(isWrite1||isWrite2) ;
					else
					{
						sw.WriteLine(oneLineStr);
					}
					/*最终得到的文件中关于修整器类型的定义和滚轮类型的定义的变量各自
					只有一行,且是被注释掉的,在后续处理中去掉注释;,关于滚轮类型的水平按键
					的定义也只有一行有效, 其余均被屏蔽*/
				}
			}
		}
		
		void PAR_INI_Deal()
		{
			string path=@"NewMachineProgram\CMA\S_PAR_INI.SPF";
			var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
			StreamReader sr=new StreamReader(path,utf8WithoutBOM,true);
			StreamWriter sw=new StreamWriter("S_PAR_INI.SPF",false,utf8WithoutBOM,512);
			while(!sr.EndOfStream)
			{
				string oneLineStr=sr.ReadLine();
				//螺旋升角使能处理
				int t=oneLineStr.IndexOf("INI[16]=0");
				if(t!=-1)
				{
					string isHelicAngleEnable=helicAngleEnabledComboBox.SelectedItem.ToString();
					if(isHelicAngleEnable=="开")
					{
						oneLineStr="INI[16]=1";
					}
					else
					{
						oneLineStr="INI[16]=0";
					}
				}
				//砂轮驱动类型处理
				t=oneLineStr.IndexOf("INI[36]=0");
				if(t!=-1)
				{
					string wheelDriverType=wheelDriverTypeComboBox.SelectedItem.ToString();
					if(wheelDriverType=="变频器")
					{
						oneLineStr="INI[36]=0";
					}
					else
					{
						oneLineStr="INI[36]=1";
					}
				}
				//修整轮驱动类型处理
				t=oneLineStr.IndexOf("INI[37]=0");
				if(t!=-1)
				{
					string dressDriverType=dressDriverTypeComboBox.SelectedItem.ToString();
					if(dressDriverType=="变频器")
					{
						oneLineStr="INI[37]=0";
					}
					else
					{
						oneLineStr="INI[37]=1";
					}
				}
				//是否有自动对刀对对刀变量赋值方式的选择
				t=oneLineStr.IndexOf("INI[69]=0");
				if(t!=-1)
				{
					string isAutoOperat=autoOperationComboBox.SelectedItem.ToString();
					if(isAutoOperat=="是")
					{
						oneLineStr="INI[69]=1";
					}
					else oneLineStr="INI[69]=0";
				}
				sw.WriteLine(oneLineStr);
			}
			sr.Close();
			sw.Close();
			if(File.Exists("S_PAR_INI.SPF"))
			{
				File.Copy("S_PAR_INI.SPF","NewMachineProgram\\CMA\\S_PAR_INI.SPF",true);
				File.Delete("S_PAR_INI.SPF");
			}
		}
		void INFO_INIT_Deal()
		{
			//生成前刷新一下变量信息
			#region
			machineNumber=basicInfoForm.machineNumber;
			machineName=basicInfoForm.machineName;
			selledNumber=basicInfoForm.selledNumber;
			userName=basicInfoForm.userName;
			userAddress=basicInfoForm.userAddress;
			deBugName=basicInfoForm.deBugName;
			selledTime=basicInfoForm.selledTime;
			softVersion=basicInfoForm.softVersion;
			#endregion
			string path=@"NewMachineProgram\MPF\INFO_INIT.MPF";
			string newFileName=machineNumber.Replace("×","_");
			string newPath="NewMachineProgram\\MPF"+"\\"+newFileName+".MPF";
			var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
			StreamReader sr=new StreamReader(path,utf8WithoutBOM,true);
			StreamWriter sw=new StreamWriter(newPath,false,utf8WithoutBOM,512);
			//定义一个要写入的数据头的数组
			string[] infoArr=new string[10];
			infoArr[0]=";;**********机床信息**********";
			infoArr[1]=";;机床型号: "+machineNumber;
			infoArr[2]=";;机床名称: "+machineName;
			infoArr[3]=";;出厂编号: "+"#"+selledNumber;
			infoArr[4]=";;用户名称: "+userName;
			infoArr[5]=";;用户地址: "+userAddress;
			infoArr[6]=";;调试人员: "+deBugName;
			infoArr[7]=";;出厂时间: "+selledTime;
			infoArr[8]=";;***************************";
			infoArr[9]=";;软件版本: "+softVersion;
			int count=0;
			while(!sr.EndOfStream)
			{
				string oneLineStr=sr.ReadLine();
				bool dealStart=false;
				int t=oneLineStr.IndexOf("**机床信息**");
				if(t!=-1) dealStart=true;
				if(dealStart)
				{
					for(int i=0;i<10;i++)
					{
						sw.WriteLine(infoArr[i]);
					}
				}
				count=count+1;
				if(count>10) sw.WriteLine(oneLineStr);
			}
			sw.Close();
			sr.Close();
			//删除INFO文件
			if(File.Exists(path))
			{
				File.Delete(path);
			}
		}
		void Almc_chs_Deal()
		{
			//生成前刷新一下变量信息
			#region
			machineNumber=basicInfoForm.machineNumber;
			machineName=basicInfoForm.machineName;
			selledNumber=basicInfoForm.selledNumber;
			userName=basicInfoForm.userName;
			userAddress=basicInfoForm.userAddress;
			deBugName=basicInfoForm.deBugName;
			selledTime=basicInfoForm.selledTime;
			softVersion=basicInfoForm.softVersion;
			#endregion
			string oldPath="NewMachineProgram\\HMI\\lng\\almc_chs.txt";
			string newPath="NewMachineProgram\\HMI\\lng\\almc_chs2.txt";
			var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
			StreamReader sr=new StreamReader(oldPath,utf8WithoutBOM,true);
			StreamWriter sw=new StreamWriter(newPath,false,utf8WithoutBOM,512);
			while(!sr.EndOfStream)
			{
				string oneLineStr=sr.ReadLine();
				int t=oneLineStr.IndexOf("85060 0 0 \"机床型号: SK7620A\"  ;");
				if(t!=-1)
				{
					oneLineStr="85060 0 0 \"机床型号: "+machineNumber+"\""+"  ;";
				}
				t=oneLineStr.IndexOf("85061 0 0 \"出厂编号: #009\"  ;");
				if(t!=-1)
				{
					oneLineStr="85061 0 0 \"出厂编号: #"+selledNumber+"\""+"  ;";
				}
				t=oneLineStr.IndexOf("85062 0 0 \"出厂日期: 2016.12\"  ;");
				if(t!=-1)
				{
					oneLineStr="85062 0 0 \"出厂日期: "+selledTime+"\""+"  ;";
				}
				sw.WriteLine(oneLineStr);
			}
			sr.Close();
			sw.Close();
			File.Delete(oldPath);
			Directory.Move(newPath,oldPath);
		}
		void IcoReplace()//如果仓库中Repository文件夹中有对应的首页图片则替换
		{
			//生成前刷新一下变量信息
			#region
			machineNumber=basicInfoForm.machineNumber;
			machineName=basicInfoForm.machineName;
			selledNumber=basicInfoForm.selledNumber;
			userName=basicInfoForm.userName;
			userAddress=basicInfoForm.userAddress;
			deBugName=basicInfoForm.deBugName;
			selledTime=basicInfoForm.selledTime;
			softVersion=basicInfoForm.softVersion;
			#endregion
			string folderName=machineNumber.Replace("×","_");
			string sourcePath="NewMachineProgram\\HMI\\Repository";
			string[] folderNameArr=Directory.GetFileSystemEntries(sourcePath);
			bool isHaveIco=false;
			foreach(string tempFullName in folderNameArr)
			{
				char ch='\\';
				string[] nameSplitArr=tempFullName.Split(ch);
				if(folderName==nameSplitArr[nameSplitArr.Length-1])
				{
					isHaveIco=true;
					MessageBox.Show("仓库中已有该型号对应的首画面和出厂信息图片,\n已进行替换","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Information);
					string[] aimPngNameArr=Directory.GetFileSystemEntries(tempFullName);
					string[] path=new string[3];
					path[2]="NewMachineProgram\\HMI\\ico\\ico640\\splash.png";
					path[0]="NewMachineProgram\\HMI\\ico\\ico800\\panel_0_0_chs.png";
					path[1]="NewMachineProgram\\HMI\\ico\\ico800\\panel_0_1_chs.png";
					for(int i=0;i<3;i++)
					{
						File.Copy(aimPngNameArr[i],path[i],true);
						File.Delete(aimPngNameArr[i]);
					}
					
				}
			}
			if(!isHaveIco) MessageBox.Show("仓库中没有有该型号对应的首画面和出厂信息图片\n请注意手动添加","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Warning);

			//删除Repository"文件夹
			Directory.Delete(sourcePath,true);
		}
		void QuitButtonClick(object sender, EventArgs e)
		{
			this.Dispose();
		}
		
		void DressParameterCheckBox_VW_DCheckedChanged(object sender, EventArgs e)
		{
			if(dressParameterCheckBox_VW_D.Checked==true)
			{
				shapeParameterCheckBox_DOU.Enabled=true;
				shapeParameterCheckBox_TRA.Enabled=true;
				shapeParameterCheckBox_TRI.Enabled=true;
			}
			
		}
		
		void DressParameterCheckBox_VW_SCheckStateChanged(object sender, EventArgs e)
		{
			if(dressParameterCheckBox_VW_S.Checked==true)
			{
				shapeParameterCheckBox_DOU.Enabled=true;
				shapeParameterCheckBox_TRA.Enabled=true;
				shapeParameterCheckBox_TRI.Enabled=true;
			}
			
		}
		
		
		void HelpToolStripMenuItemClick(object sender, EventArgs e)
		{
			MessageBox.Show("1.将此程序与Programing_NC文件夹放于同一目录\n" +
			                "2.运行程序,选择需要的选项\n" +
			                "3.程序运行后会在当前目录生成一新文件夹NewMachineProgram,\n" +
			                "  该文件夹中包含新生成的界面和已去掉注释的NC程序","帮助说明",MessageBoxButtons.OK,MessageBoxIcon.Information);
		}
		
		void AutoOperationComboBoxSelectedIndexChanged(object sender, EventArgs e)
		{
			//如果有自动对刀,自动对刀的类型可选,否则自动对刀类型为灰色
			if(autoOperationComboBox.SelectedItem.ToString()=="是")
			{
				autoOperationTypeComboBox.Enabled=true;
			}
			else autoOperationTypeComboBox.Enabled=false;
		}
		
		void ReturnButtonClick(object sender, EventArgs e)
		{
			basicInfoForm.ShowDialog();
		}
		
		void DressParameterCheckBox_GY_X_N_QCheckedChanged(object sender, EventArgs e)
		{
			//如果和内螺纹相关的修整选项被选中,磨削类型改为内螺纹
			if(dressParameterCheckBox_GY_X_N_Q.Checked&&isRunFormAdd==false)
			{
				grindTypeComboBox.SelectedIndex=1;
			}
		}
		
		void DressParameterCheckBox_GY_X_N_HCheckedChanged(object sender, EventArgs e)
		{
			//如果和内螺纹相关的修整选项被选中,磨削类型改为内螺纹
			if(dressParameterCheckBox_GY_X_N_H.Checked)
			{
				grindTypeComboBox.SelectedIndex=1;
			}
		}
	}
}

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
		bool shape=true;
		string grindType;
		string dressType;
		string wheelType="6666";
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
			//生成临时需要的分割后的界面文件
			SplitCustomFile spc=new SplitCustomFile();
			SplitCustomFile.FormSplit();
			
			bool flag=false;
			try
			{
				grindType=grindTypeComboBox.SelectedItem.ToString();
			}
			
			catch(Exception e1)
			{
				MessageBox.Show("请选择正确的磨削类型","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Error);
				goto endLabel;
			}
			//删除原有的custom.com文件
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
			//水平按键处理函数
			ButtonDeal();
			
			//程序结束前的提示信息
			if(flag)
			{
				MessageBox.Show("custom.com文件已生成","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Information);
				
			}
			else
			{
				MessageBox.Show("未选择条目","提示信息",MessageBoxButtons.OK,MessageBoxIcon.Information);
				goto endLabel;
			}
			
			//程序相关处理
			//生成去掉注释的程序
			CreatMachineProgram.CopyProgram();
			//DIY程序不需要去掉注释
			File.Copy("Programing_NC\\MPF\\USER_DIY.MPF","NewMachineProgram\\MPF\\USER_DIY.MPF",true);
			//复制HMI文件夹中的内容
			CopyHMI.CopyFileAndFolder(@"Programing_NC\HMI","NewMachineProgram\\HMI");
			
			//用新生成的custom替换原有的
			if(File.Exists("custom.com"))
			{
				File.Copy("custom.com","NewMachineProgram\\HMI\\proj\\custom.com",true);
				File.Delete("custom.com");
			}
			else
			{
				MessageBox.Show("新界面文件生成失败,请重新打开程序");
			}
			
			//初始化程序中对机床基本信息的处理
			PAR_INI_Deal();
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
			//机床信息默认被选中项
			grindTypeComboBox.SelectedIndex=0;
			wheelDriverTypeComboBox.SelectedIndex=0;
			dressDriverTypeComboBox.SelectedIndex=0;
			helicAngleEnabledComboBox.SelectedIndex=0;
			xSpeedTextBox.Text="50";
			xQ_Or_N_ComboBox.SelectedIndex=0;
			if(grindTypeComboBox.SelectedItem.ToString()=="外螺纹")
			{
				xQ_Or_N_ComboBox.Visible=false;
				label6.Visible=false;
			}
		}
		void ButtonDeal()
		{
			//                  单             双            方             滚压          摆缸
			string[] WheelStr={"$85380,ac7,","$85381,ac7,","$85382,ac7,","$85379,ac7,","$85378,ac7,"};
			string oldPath=@"temp_custom.com";
			string newPath=@"custom.com";
			
			
			if(File.Exists(@"temp_custom.com"))
			{
				var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
				StreamReader sr=new StreamReader(oldPath,utf8WithoutBOM,true,512);
				StreamWriter sw=new StreamWriter(newPath,false,utf8WithoutBOM,1024);
				
				//XZ
				FindAndAddStr(dressParameterCheckBox_VW_D,WheelStr,sr,sw,0,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_VW_S,WheelStr,sr,sw,1,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_VW_F,WheelStr,sr,sw,2,shape,dressType,wheelType);
				
				//滚压轮
				FindAndAddStr(dressParameterCheckBox_GY_V,WheelStr,sr,sw,3,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_GY_X_N_H,WheelStr,sr,sw,3,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_GY_X_N_Q,WheelStr,sr,sw,3,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_GY_X_W,WheelStr,sr,sw,3,shape,dressType,wheelType);
				
				//XZ
				FindAndAddStr(dressParameterCheckBox_XZ_D,WheelStr,sr,sw,0,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_XZ_S,WheelStr,sr,sw,1,shape,dressType,wheelType);
				FindAndAddStr(dressParameterCheckBox_XZ_F,WheelStr,sr,sw,2,shape,dressType,wheelType);
				
				FindAndAddStr(dressParameterCheckBox_BG,WheelStr,sr,sw,4,shape,dressType,wheelType);
				sr.Close();
				sw.Close();
				File.Delete(@"temp_custom.com");//删除临时文件
			}
		}
		
		private void FindAndAddStr(CheckBox cbx,string [] WheelStr,StreamReader sr,StreamWriter sw,int t,bool shape,string dressType,string wheelType)
		{
			if(cbx.Checked)
			{
				//                  三角           梯形         双圆弧
				string[] shapeStr={"$85383,ac7","$85384,ac7,","$85385,ac7,"};
				string[] dressStr={"修整器V_W","修整器X_Z","修整器成型V","修整器成型X","修整器摆缸"};
				string[] wheelTypeStr={"修整轮类型:单滚轮","修整轮类型:双滚轮","修整轮类型:方滚轮"};
				while(!sr.EndOfStream)
				{
					string oneLineStr=sr.ReadLine();
					for(int i=0;i<5;i++)
					{
						
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
					if(!shape)
					{
						for(int i=0;i<3;i++)
						{
							int ind=oneLineStr.IndexOf(shapeStr[i]);
							if(ind!=-1) oneLineStr="	;"+oneLineStr.Trim();
						}
					}
					//以上循环齿形按键是否显示
					
					bool isDressType=false;//标记:这一行是否是选择修整器类型的一行
					for(int i=0;i<5;i++)
					{
						int ind=oneLineStr.IndexOf(dressStr[i]);
						if(ind!=-1) isDressType=true;
					}
					int ind2=oneLineStr.IndexOf(dressType);
					//以上确定修整器类型
					
					bool isWheelType=false;//标记:这一行是否是滚轮类型选择的一行
					for(int i=0;i<3;i++)
					{
						int ind=oneLineStr.IndexOf(wheelTypeStr[i]);
						if(ind!=-1) isWheelType=true;
					}
					int ind3=oneLineStr.IndexOf(wheelType);
					bool isWrite1=(isDressType==true)&&(ind2==-1);
					bool isWrite2=(isWheelType==true)&&(ind3==-1);//不写这一行的两种情况
					//以上确定滚轮类型
					
					if(isWrite1||isWrite2) ;
					else
					{
						sw.WriteLine(oneLineStr);
					}					
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
				//内螺纹成型X前/后处理
				t=oneLineStr.IndexOf("DRESSER[37]=0");
				if(t!=-1)
				{
					string xQN=xQ_Or_N_ComboBox.SelectedItem.ToString();
					if(xQN=="前")
					{
						oneLineStr="DRESSER[37]=0";
					}
					else
					{
						oneLineStr="DRESSER[37]=1";
					}
				}
				//磨削工件时X进给速度
				t=oneLineStr.IndexOf("PROCESS[11]=50");
				if(t!=-1)
				{
					oneLineStr="PROCESS[11]="+xSpeedTextBox.Text.Trim();
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
		void QuitButtonClick(object sender, EventArgs e)
		{
			this.Dispose();
		}
		
		void GrindTypeComboBoxSelectedIndexChanged(object sender, EventArgs e)
		{
			if(grindTypeComboBox.SelectedItem.ToString()=="内螺纹")
			{
				xQ_Or_N_ComboBox.Visible=true;
				label6.Visible=true;
			}
			else if(grindTypeComboBox.SelectedItem.ToString()=="磨削中心")
			{
				xQ_Or_N_ComboBox.Visible=true;
				label6.Visible=true;
			}
			else
			{
				xQ_Or_N_ComboBox.Visible=false;
				label6.Visible=false;
			}
		}
	}
}

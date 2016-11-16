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
namespace 界面自动拼接
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
			}
		endLabel:
			;
		}
		
		void MainFormLoad(object sender, EventArgs e)
		{
			//默认被选择的条目
			welcomeCheckBox.Checked=true;
			machineMessageCheckBox.Checked=true;
			grindParameterCheckBox.Checked=true;
			techniqueCheckBox.Checked=true;
			dressParameterCheckBox.Checked=true;
			grindTypeComboBox.SelectedIndex=0;
		}
		void ButtonDeal()
		{
			//                  单             双            方             滚压          摆缸
			string[] WheelStr={"$85380,ac7,","$85381,ac7,","$85382,ac7,","$85379,ac7,","$85378,ac7,"};
			string oldPath=@"temp_custom.com";
			string newPath=@"custom.com";
			StreamReader sr=new StreamReader(oldPath,Encoding.UTF8,true,512);
			StreamWriter sw=new StreamWriter(newPath,false,Encoding.UTF8,1024);
			
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
			//删除临时文件
			if(File.Exists(@"temp_custom.com"))
			{
				File.Delete(@"temp_custom.com");
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
		
		void QuitButtonClick(object sender, EventArgs e)
		{
			this.Dispose();
		}
	}
}

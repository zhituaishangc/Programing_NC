/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-12
 * Time: 14:06
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.IO;
using System.Text;
using System.Drawing;
using System.Windows.Forms;
namespace CreatNewMachineProgram
{
	/// <summary>
	/// Description of FormAdd.
	/// </summary>
	public class FormAdd
	{
		public FormAdd()
		{
			//构造函数
		}
		public static void AddWelcomeForm(string grindType)
		{
			//定义了界面块源文件的位置,并调用公共的将界面块写入新文件的方法
			string sourcePath=@"Programing_NC\\temp\\欢迎画面.txt";
			PublicReadAndWrite(sourcePath,grindType);
		}
		public static void AddMachineMessageForm()
		{
			string sourcePath=@"Programing_NC\\temp\\出厂信息.txt";
			PublicReadAndWrite(sourcePath);
		}
		public static void AddGrindParameterForm(string grindType)//磨削参数
		{
			string sourcePath;
			switch(grindType)
			{
				case "外螺纹":
					sourcePath=@"Programing_NC\\temp\\磨削参数_外.txt";
					break;
				case "内螺纹":
					sourcePath=@"Programing_NC\\temp\\磨削参数_内.txt";
					break;
				case "磨削中心":
					sourcePath=@"Programing_NC\\temp\\磨削参数_磨削中心.txt";
					break;
				default:
					sourcePath=@"Programing_NC\\temp\\磨削参数_外.txt";
					break;
			}
			PublicReadAndWrite(sourcePath);
		}
		public static void AddTechniqueForm()
		{
			string sourcePath=@"Programing_NC\\temp\\工艺参数.txt";
			PublicReadAndWrite(sourcePath);
		}
		public static void AddDressParameterForm()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数.txt";
			PublicReadAndWrite(sourcePath);
		}
		public static void AddDressParameterForm_VW_D()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_VW单滚轮.txt";
			PublicReadAndWrite(sourcePath);
		}
		public static void AddDressParameterForm_VW_S()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_VW双滚轮.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_VW_F()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_VW方滚轮.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_XZ_D()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_XZ单滚轮.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_XZ_S()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_XZ双滚轮.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_XZ_F()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_XZ方滚轮.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_GY_V()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_滚压轮V.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_GY_X_W()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_滚压轮_X_外.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_GY_X_N_Q()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_滚压轮_X_内_前.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterForm_GY_X_N_H()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_滚压轮_X_内_后.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressParameterCheckBox_BGForm()
		{
			string sourcePath=@"Programing_NC\\temp\\修整参数_摆缸.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddDressBackForm()
		{
			string sourcePath=@"Programing_NC\\temp\\修整返回.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddShapeParameterCheckBox_TRIForm()//齿形参数_三角
		{
			string sourcePath=@"Programing_NC\\temp\\齿形参数_三角.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddShapeParameterCheckBox_TRAForm()//齿形参数_梯形
		{
			string sourcePath=@"Programing_NC\\temp\\齿形参数_梯形.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddShapeParameterCheckBox_DOUForm()//齿形参数_双圆弧
		{
			string sourcePath=@"Programing_NC\\temp\\齿形参数_双圆弧.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		public static void AddAutoOperationForm()//增加自动对刀界面
		{
			string sourcePath=@"Programing_NC\\temp\\自动对刀.txt";
			PublicReadAndWrite(sourcePath);
		}
		
		//将界面块写入新文件的方法
		private static void PublicReadAndWrite(string sourcePath)
		{
			string customPath=@"temp_custom.com";
			StreamReader sr=new StreamReader(sourcePath,Encoding.UTF8,true);
			//以将数据追加到原文件的方式建立一个StreamWriter对象
			StreamWriter sw=new StreamWriter(customPath,true,Encoding.UTF8,512);
			while(!sr.EndOfStream)
			{
				string tempStr=sr.ReadLine();
				sw.WriteLine(tempStr);
			}
			sr.Close();
			sw.Close();
		}
		//方法重载,用于欢迎界面的处理
		private static void PublicReadAndWrite(string sourcePath,string grindType)
		{
			string customPath=@"temp_custom.com";
			string findStr="LM(\"MASK1\")"+";"+"磨削界面加载";
			string replaceStr="		LM(\"MASK18\")"+";"+"磨削界面加载";
			StreamReader sr=new StreamReader(sourcePath,Encoding.UTF8,true);
			//以将数据追加到原文件的方式建立一个StreamWriter对象
			StreamWriter sw=new StreamWriter(customPath,true,Encoding.UTF8,512);
			while(!sr.EndOfStream)
			{
				string tempStr=sr.ReadLine();
				int ind=tempStr.IndexOf(findStr);
				if(ind!=-1)
				{
					//如果是内螺纹则加载"MASK18",外螺纹加载"MASK1"
					if(grindType=="内螺纹") tempStr=replaceStr;
				}
				sw.WriteLine(tempStr);
			}
			sr.Close();
			sw.Close();
		}
		
		/*对新生成的界面文件进行处理,删除调试界面时使用的可选择的相关变量定义行,
		重复定义的针对不同情况的行,只留下通过checkBox实际选择的项*/
		public  static void DealForm(CheckBox TRI_checkBox,CheckBox TRA_checkBox,CheckBox DOU_checkBox,CheckBox X_N_Q,CheckBox X_N_H,ComboBox grindTypeComBoBox,ComboBox autoOperationComboBox,ComboBox autoOperationTypeComboBox)
		{
			var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
			string oldPath=@"custom.com";
			string newPath="NewMachineProgram\\HMI\\proj\\custom.com";
			StreamReader sr=new StreamReader(oldPath,utf8WithoutBOM,true,512);
			StreamWriter sw=new StreamWriter(newPath,false,utf8WithoutBOM,1024);
			while(!sr.EndOfStream)
			{
				string oneLineStr=sr.ReadLine();
				//磨削类型部分处理,删除调试用的一行，开放实际使用的行
				#region
				int t=oneLineStr.IndexOf("磨削类型,界面调试用");
				if(t!=-1) oneLineStr=string.Empty;
				t=oneLineStr.IndexOf("磨削类型,生成文件用");
				if(t!=-1)//去掉该行前面的分号
				{
					string[] tempArr=oneLineStr.Split(';');
					string str="\t";
					for(int i=1;i<tempArr.Length;i++)
					{
						if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
						str=str+tempArr[i];
					}
					oneLineStr=str;
				}
				#endregion
				//磨削界面中是否修整处理,去掉调试用,留下生成用
				#region
				t=oneLineStr.IndexOf("是否修整,界面调试用");
				if(t!=-1) oneLineStr=string.Empty;
				t=oneLineStr.IndexOf("是否修整,生成程序用");
				if(t!=-1)//去掉该行前面的分号
				{
					string[] tempArr=oneLineStr.Split(';');
					string str="\t";
					for(int i=1;i<tempArr.Length;i++)
					{
						if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
						str=str+tempArr[i];
					}
					oneLineStr=str;
				}
				#endregion
				
				//磨削界面中是否对刀处理,去掉调试用,留下生成用
				#region
				t=oneLineStr.IndexOf("是否对刀,界面调试用");
				if(t!=-1) oneLineStr=string.Empty;
				t=oneLineStr.IndexOf("是否对刀,生成程序用");
				if(t!=-1)//去掉该行前面的分号
				{
					string[] tempArr=oneLineStr.Split(';');
					string str="\t";
					for(int i=1;i<tempArr.Length;i++)
					{
						if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
						str=str+tempArr[i];
					}
					oneLineStr=str;
				}
				#endregion
				//修整界面修整器部分处理,删除调试用的一行，开放实际使用的行
				#region
				t=oneLineStr.IndexOf("修整器,界面调试用");
				if(t!=-1) oneLineStr=string.Empty;
				t=oneLineStr.IndexOf("修整器,生成文件用");
				if(t!=-1)//去掉该行前面的分号
				{
					string[] tempArr=oneLineStr.Split(';');
					string str="\t";
					for(int i=1;i<tempArr.Length;i++)
					{
						if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
						str=str+tempArr[i];
					}
					oneLineStr=str;
				}
				#endregion
				//内螺纹成型修整,前后选择,删除调试用的一行,开放生成文件用的一行
				#region
				t=oneLineStr.IndexOf("内螺纹成型X前/后,界面调试用");
				if(t!=-1) oneLineStr=string.Empty;
				/*根据程序要求,外螺纹时,使选择内前和内后的变量值为0,而内前时变量值为0
				 * ,所以等效于选择内螺纹时暂时使内前被选中,使界面中保留定义该选择
				 * 变量的一行,程序结束后再取消*/
				if(grindTypeComBoBox.SelectedItem.ToString()=="外螺纹") X_N_Q.Checked=true;
				if(X_N_Q.Checked)
				{
					t=oneLineStr.IndexOf("内螺纹成型X前,生成文件用");
					if(t!=-1)//去掉该行前面的分号
					{
						string[] tempArr=oneLineStr.Split(';');
						string str="\t";
						for(int i=1;i<tempArr.Length;i++)
						{
							if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
							str=str+tempArr[i];
						}
						oneLineStr=str;
					}
					//已经选中了内前,所以删除内后
					t=oneLineStr.IndexOf("内螺纹成型X后,生成文件用");
					if(t!=-1) oneLineStr=string.Empty;
				}
				if(X_N_H.Checked)
				{
					t=oneLineStr.IndexOf("内螺纹成型X后,生成文件用");
					if(t!=-1)//去掉该行前面的分号
					{
						string[] tempArr=oneLineStr.Split(';');
						string str="\t";
						for(int i=1;i<tempArr.Length;i++)
						{
							if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
							str=str+tempArr[i];
						}
						oneLineStr=str;
					}
					//已经选中了内后,所以删除内前
					t=oneLineStr.IndexOf("内螺纹成型X前,生成文件用");
					if(t!=-1) oneLineStr=string.Empty;
				}
				#endregion
				//修整界面修整轮部分处理,删除调试用的一行，开放实际使用的行
				#region
				t=oneLineStr.IndexOf("修整轮类型,界面调试用");
				if(t!=-1) oneLineStr=string.Empty;
				t=oneLineStr.IndexOf("修整轮类型,生成文件用");
				if(t!=-1)//去掉该行前面的分号
				{
					string[] tempArr=oneLineStr.Split(';');
					string str="\t";
					for(int i=1;i<tempArr.Length;i++)
					{
						if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
						str=str+tempArr[i];
					}
					oneLineStr=str;
				}
				#endregion
				//修整界面齿形部分处理,删除调试用的一行,删除未被选中的齿形项目开放需要的项
				#region
				bool isgoTo=false;
				t=oneLineStr.IndexOf("齿形,界面调试用");
				if(t!=-1)
				{ 
					if(!(TRI_checkBox.Checked && TRA_checkBox.Checked && DOU_checkBox.Checked)) 
					{
						//如果三种齿形都被选中,直接使用调试界面用的一行
						oneLineStr=string.Empty;
					}
				}
				if(!TRI_checkBox.Checked)//判断三角齿形是否被选中
				{
					int t1=oneLineStr.IndexOf("齿形,三角齿形");
					int t2=oneLineStr.IndexOf("齿形,三角和梯形");
					int t3=oneLineStr.IndexOf("齿形,三角和双圆弧");
					int t4=oneLineStr.IndexOf("VS1=($85383,ac7,se1)");//三角形垂直栏按键是否显示
					if(t1!=-1 || t2!=-1 || t3!=-1 || t4!=-1) 
					{
						oneLineStr=string.Empty;
						isgoTo=true;
					}
					
				}
				if(!TRA_checkBox.Checked)//判断梯形齿形是否被选中
				{
					int t1=oneLineStr.IndexOf("齿形,梯形齿形");
					int t2=oneLineStr.IndexOf("齿形,三角和梯形");
					int t3=oneLineStr.IndexOf("齿形,梯形和双圆弧");
					int t4=oneLineStr.IndexOf("VS2=($85384,ac7,se1)");//梯形垂直栏按键是否显示
					if(t1!=-1 || t2!=-1 || t3!=-1 || t4!=-1) {
						oneLineStr=string.Empty;
						isgoTo=true;
					}
					//if(t4!=-1) isgoTo=false;
				}
				if(!DOU_checkBox.Checked)//判断双圆弧齿形是否被选中
				{
					int t1=oneLineStr.IndexOf("齿形,双圆弧齿形");
					int t2=oneLineStr.IndexOf("齿形,三角和双圆弧");
					int t3=oneLineStr.IndexOf("齿形,梯形和双圆弧");
					int t4=oneLineStr.IndexOf("VS3=($85385,ac7,se1)");//双圆弧按键是否显示
					if(t1!=-1 || t2!=-1 || t3!=-1 || t4!=-1) 
					{
						oneLineStr=string.Empty;
						isgoTo=true;
					}
				}
				//同时选中三角和梯形的处理
				if(TRI_checkBox.Checked && TRA_checkBox.Checked)
				{
					int t1=oneLineStr.IndexOf("齿形,三角齿形");
					int t2=oneLineStr.IndexOf("齿形,梯形齿形");
					if(t1!=-1 || t2!=-1)
					{
						oneLineStr=string.Empty;
						isgoTo=true;
					}
				}
				//同时选中三角和双圆弧的处理
				if(TRI_checkBox.Checked && DOU_checkBox.Checked)
				{
					int t1=oneLineStr.IndexOf("齿形,三角齿形");
					int t2=oneLineStr.IndexOf("齿形,双圆弧齿形");
					if(t1!=-1 || t2!=-1)
					{
						oneLineStr=string.Empty;
						isgoTo=true;
					}
				}
				//同时选中梯形和双圆弧的处理
				if(TRA_checkBox.Checked && DOU_checkBox.Checked)
				{
					int t1=oneLineStr.IndexOf("齿形,梯形齿形");
					int t2=oneLineStr.IndexOf("齿形,双圆弧齿形");
					if(t1!=-1 || t2!=-1)
					{
						oneLineStr=string.Empty;
						isgoTo=true;
					}
				}
				//同时选中三个齿形的处理
				if(TRI_checkBox.Checked && TRA_checkBox.Checked && DOU_checkBox.Checked)
				{
					int t1=oneLineStr.IndexOf("齿形,三角和双圆弧");
					int t2=oneLineStr.IndexOf("齿形,梯形和双圆弧");
					int t3=oneLineStr.IndexOf("齿形,三角和梯形");
					if(t1!=-1 || t2!=-1 || t3!=-1)
					{
						oneLineStr=string.Empty;
						isgoTo=true;
					}
				}
				if(isgoTo) goto WriteLabel;
				
				//删除齿形要显示的行前边的分号
				t=oneLineStr.IndexOf("齿形,生成文件用");
				if(t!=-1)//去掉该行前面的分号
				{
					string[] tempArr=oneLineStr.Split(';');
					string str="\t";
					for(int i=1;i<tempArr.Length;i++)
					{
						if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
						str=str+tempArr[i];
					}
					oneLineStr=str;
				}
				#endregion
				//
				
				//判断各界面上自动对刀的水平按键是否显示
				#region
				if(autoOperationComboBox.SelectedItem.ToString()=="否")
				{
					t=oneLineStr.IndexOf("($85010,ac7,se1);自动对刀");
					if(t!=-1) goto WriteLabel;
				}
				#endregion
				//自动对刀界面内关于是探头还是接近开关方式的处理,删除调试用的一行
				#region
				if(autoOperationComboBox.SelectedItem.ToString()=="是")
				{
					t=oneLineStr.IndexOf("测头类型(0测头/1开关),界面调试用");
					if(t!=-1) oneLineStr=string.Empty;
					if(autoOperationTypeComboBox.SelectedItem.ToString()=="接近开关")
					{
						t=oneLineStr.IndexOf("测头类型(开关),生成文件用");
						if(t!=-1)//去掉该行前面的分号
						{
							string[] tempArr=oneLineStr.Split(';');
							string str="\t";
							for(int i=1;i<tempArr.Length;i++)
							{
								if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
								str=str+tempArr[i];
							}
							oneLineStr=str;
						}
						t=oneLineStr.IndexOf("测头类型(测头),生成文件用");
						if(t!=-1) oneLineStr=string.Empty;
					}
					else if(autoOperationTypeComboBox.SelectedItem.ToString()=="接触测头")
					{
						t=oneLineStr.IndexOf("测头类型(测头),生成文件用");
						if(t!=-1)//去掉该行前面的分号
						{
							string[] tempArr=oneLineStr.Split(';');
							string str="\t";
							for(int i=1;i<tempArr.Length;i++)
							{
								if(i==tempArr.Length-1) tempArr[i]=";"+tempArr[i];
								str=str+tempArr[i];
							}
							oneLineStr=str;
						}
						t=oneLineStr.IndexOf("测头类型(开关),生成文件用");
						if(t!=-1) oneLineStr=string.Empty;
					}
					
				}
				#endregion
				//处理完成,开始写文件
				sw.WriteLine(oneLineStr);
			WriteLabel:;
			}
			/*因为外螺纹时使内前被选中了,所以
			外螺纹时,为了使只有一个修整参数被选中,将内前改为false*/
			if(grindTypeComBoBox.SelectedItem.ToString()=="外螺纹") X_N_Q.Checked=false;
			sr.Close();
			sw.Close();
			
		}
	}
}

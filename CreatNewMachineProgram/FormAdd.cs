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
		
		private static void PublicReadAndWrite(string sourcePath)
		{
			string customPath=@"temp_custom.com";
			StreamReader sr=new StreamReader(sourcePath,Encoding.UTF8,true);
			StreamWriter sw=new StreamWriter(customPath,true,Encoding.UTF8,512);
			while(!sr.EndOfStream)
			{
				string tempStr=sr.ReadLine();
				sw.WriteLine(tempStr);
			}
			sr.Close();
			sw.Close();
		}
		//方法重载
		private static void PublicReadAndWrite(string sourcePath,string grindType)
		{
			string customPath=@"temp_custom.com";
			string findStr="LM(\"MASK1\")"+";"+"磨削界面加载";
			string replaceStr="		LM(\"MASK18\")"+";"+"磨削界面加载";
			StreamReader sr=new StreamReader(sourcePath,Encoding.UTF8,true);
			StreamWriter sw=new StreamWriter(customPath,true,Encoding.UTF8,512);
			while(!sr.EndOfStream)
			{
				string tempStr=sr.ReadLine();
				int ind=tempStr.IndexOf(findStr);
				if(ind!=-1)
				{
					if(grindType=="内螺纹") tempStr=replaceStr;
				}
				sw.WriteLine(tempStr);
			}
			sr.Close();
			sw.Close();
		}
	}
}

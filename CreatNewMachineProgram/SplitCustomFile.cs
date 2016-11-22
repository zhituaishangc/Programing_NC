/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-21
 * Time: 16:18
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.IO;
using System.Text;
namespace CreatNewMachineProgram
{
	/// <summary>
	/// Description of SplitCustomFile.
	/// </summary>
	public class SplitCustomFile
	{
		static string   sourcePath="Programing_NC\\HMI\\proj\\custom.com";		
		public SplitCustomFile()
		{
			//
			Directory.CreateDirectory("Programing_NC\\temp");
			
		}
		public static void FormSplit()
		{
			FormSplit("Programing_NC\\temp\\欢迎画面.txt","start:欢迎画面");
			FormSplit("Programing_NC\\temp\\出厂信息.txt","MASK0:出厂信息");
			FormSplit("Programing_NC\\temp\\磨削参数_外.txt","MASK1:磨削参数_外");
			FormSplit("Programing_NC\\temp\\磨削参数_内.txt","MASK18:磨削参数_内");
			FormSplit("Programing_NC\\temp\\工艺参数.txt","MASK2:工艺参数_基本","MASK20:工艺参数_扩展");
			FormSplit("Programing_NC\\temp\\修整参数.txt","MASK3:修整参数");
			FormSplit("Programing_NC\\temp\\修整参数_VW单滚轮.txt","MASK4:修整参数_VW单滚轮");
			FormSplit("Programing_NC\\temp\\修整参数_VW双滚轮.txt","MASK5:修整参数_VW双滚轮");
			FormSplit("Programing_NC\\temp\\修整参数_VW方滚轮.txt","MASK6:修整参数_VW方滚轮");
			FormSplit("Programing_NC\\temp\\修整参数_XZ单滚轮.txt","MASK12:修整参数_XZ单滚轮");
			FormSplit("Programing_NC\\temp\\修整参数_XZ双滚轮.txt","MASK13:修整参数_XZ双滚轮");
			FormSplit("Programing_NC\\temp\\修整参数_XZ方滚轮.txt","MASK14:修整参数_XZ方滚轮");
			FormSplit("Programing_NC\\temp\\修整参数_滚压轮V.txt","MASK11:修整参数_滚压轮V");
			FormSplit("Programing_NC\\temp\\修整参数_滚压轮_X_外.txt","MASK16:修整参数_滚压轮X_外");
			FormSplit("Programing_NC\\temp\\修整参数_滚压轮_X_内_前.txt","MASK17:修整参数_滚压轮X_内_前");
			FormSplit("Programing_NC\\temp\\修整参数_滚压轮_X_内_后.txt","MASK19:修整参数_滚压轮X_内_后");
			FormSplit("Programing_NC\\temp\\修整参数_摆缸.txt","MASK15:修整参数_摆缸");
			FormSplit("Programing_NC\\temp\\修整返回.txt","MASK10:修整返回");
			FormSplit("Programing_NC\\temp\\齿形参数_三角.txt","MASK7:齿形参数_三角");
			FormSplit("Programing_NC\\temp\\齿形参数_梯形.txt","MASK8:齿形参数_梯形");
			FormSplit("Programing_NC\\temp\\齿形参数_双圆弧.txt","MASK9:齿形参数_双圆弧");
			          
		}
		public static void FormSplit(string aimPath,string searchStr)
		{
			var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
			StreamReader sr=new StreamReader(sourcePath,utf8WithoutBOM,true,512);
			StreamWriter sw=new StreamWriter(aimPath,false,utf8WithoutBOM,1024);
			bool isWrite=false;
			while(!sr.EndOfStream)
			{
				string oneLineStr=sr.ReadLine();
				int t=oneLineStr.IndexOf(searchStr);
				if(t!=-1) isWrite=true;
				//找到关键字开始写文件
				if(isWrite) 
				{
					sw.WriteLine(oneLineStr);
				}
				t=oneLineStr.IndexOf("//END");
				//找到关键字并且找到结尾符号时停止写文件
				if(t!=-1&&isWrite) break;
			}
			sw.Close();
			sr.Close();
		}
		public static void FormSplit(string aimPath,string searchStr,string searchStr2)
		{
			var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
			StreamReader sr=new StreamReader(sourcePath,utf8WithoutBOM,true,512);
			StreamWriter sw=new StreamWriter(aimPath,false,utf8WithoutBOM,1024);
			bool isWrite=false;
			bool isWrite2=false;
			while(!sr.EndOfStream)
			{
				string oneLineStr=sr.ReadLine();
				int t=oneLineStr.IndexOf(searchStr);
				if(t!=-1) isWrite=true;
				t=oneLineStr.IndexOf(searchStr2);
				if(t!=-1) 
				{
					isWrite2=true;
				}
				//找到关键字开始写文件
				if(isWrite) 
				{
					sw.WriteLine(oneLineStr);
				}
				t=oneLineStr.IndexOf("//END");
				//找到关键字并且找到结尾符号时停止写文件
				if(t!=-1&&isWrite&&isWrite2) break;
			}
			sw.Close();
			sr.Close();
		}
		public static void DeleteSplitFiles()
		{
			Directory.Delete("Programing_NC\\temp",true);
		}
	}
}

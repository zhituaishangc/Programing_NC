/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-18
 * Time: 16:41
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.IO;
using System.Text;
namespace CreatNewMachineProgram
{
	/// <summary>
	/// Description of CreatMachineProgram.
	/// </summary>
	public class CreatMachineProgram
	{
		public CreatMachineProgram()
		{
			//构造函数
		}
		public static void CopyProgram()
		{
			string path1=@"Programing_NC\CMA";
			string path2=@"Programing_NC\DEF";
			string path3=@"Programing_NC\MPF";
			string path4=@"Programing_NC\SPF";
			String aimPath1="NewMachineProgram\\CMA";
			String aimPath2="NewMachineProgram\\DEF";
			String aimPath3="NewMachineProgram\\MPF";
			String aimPath4="NewMachineProgram\\SPF";
			Directory.CreateDirectory(aimPath1);
			Directory.CreateDirectory(aimPath2);
			Directory.CreateDirectory(aimPath3);
			Directory.CreateDirectory(aimPath4);
			CreatMachineProgram.DeleteAllNotes(path1,aimPath1);
			CreatMachineProgram.DeleteAllNotes(path2,aimPath2);
			CreatMachineProgram.DeleteAllNotes(path3,aimPath3);
			CreatMachineProgram.DeleteAllNotes(path4,aimPath4);
		}
		public static void DeleteAllNotes(string path,string aimPath)
		{
			Console.WriteLine(aimPath);
			DirectoryInfo rootDirInfo=new DirectoryInfo(path);
			FileInfo[] rootFile=rootDirInfo.GetFiles();
			foreach(FileInfo fileTemp in rootFile)
			{
				var utf8WithoutBOM=new System.Text.UTF8Encoding(false);
				StreamReader sr=new StreamReader(fileTemp.FullName,utf8WithoutBOM,true);
				string opath=aimPath+"\\"+fileTemp.Name;
				StreamWriter sw=new StreamWriter(opath,false,utf8WithoutBOM,512);
				while(!sr.EndOfStream)
				{
					string oneLineStr=sr.ReadLine();
					int flag=oneLineStr.IndexOf(";");
					if(flag!=-1)
					{
						char ch=';';
						string[] oneLineArr=oneLineStr.Split(ch);
						//数组长度大于2表示该行有有效的注释内容
						if(oneLineArr.Length>=2)
						{
							int t=oneLineStr.IndexOf(";;");//表示该行有连续的两个分号,是程序信息的描述行
							if(t==-1) oneLineStr=oneLineArr[0];
						}
						else
						{
							oneLineStr=oneLineArr[0];
						}
						sw.WriteLine(oneLineStr);
					}
					else
					{
						sw.WriteLine(oneLineStr);
					}
				}
				sr.Close();
				sw.Close();
			}
		}
	}
}

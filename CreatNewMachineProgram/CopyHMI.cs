/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-18
 * Time: 16:55
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.IO;
namespace CreatNewMachineProgram
{
	/// <summary>
	/// Description of CopyHMI.
	/// </summary>
	public class CopyHMI
	{
		//string Path=@"Programing_NC\HMI";
		public CopyHMI()
		{
			//
		}
		public static void CopyFileAndFolder(string path,string aimPath)
		{
			string[] fileOrFolderNameArr=Directory.GetFileSystemEntries(path);
			foreach(string name in fileOrFolderNameArr)
			{
				if(Directory.Exists(name))//如果当前名称为目录名
				{
					char ch='\\';
					string[] nameSplitArr=name.Split(ch);
					string newPath=aimPath+"\\"+nameSplitArr[nameSplitArr.Length-1];
					Directory.CreateDirectory(newPath);
					CopyFileAndFolder(name,newPath);
				}
				else
				{
					FileInfo fileInfo=new FileInfo(name);
					string newPath=aimPath+"\\"+fileInfo.Name;
					File.Copy(fileInfo.FullName,newPath,true);
					//Console.WriteLine(fileInfo.Name);
				}
			}

		}
	}
}

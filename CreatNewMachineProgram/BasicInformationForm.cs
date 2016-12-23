/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-12-15
 * Time: 8:56
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Drawing;
using System.Windows.Forms;

namespace CreatNewMachineProgram
{
	/// <summary>
	/// Description of BasicInformationForm.
	/// </summary>
	public partial class BasicInformationForm : Form
	{
		public string machineNumber=string.Empty;
		public string machineName=string.Empty;
		public string selledNumber=string.Empty;
		public string userName=string.Empty;
		public string userAddress=string.Empty;
		public string deBugName=string.Empty;
		public string selledTime=string.Empty;
		public string softVersion=string.Empty;
		
		public BasicInformationForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		
		
		void NextButtonClick(object sender, EventArgs e)
		{
			if(machineNumberTextBox.Text!="")
			{
				this.DialogResult= DialogResult.OK;
			}
				machineNumber=machineNumberTextBox.Text;
				machineName=machineNameTextBox.Text;
				selledNumber=selledNumberTextBox.Text;
				userName=userNameTextBox.Text;
				userAddress=userAddressTextBox.Text;
				deBugName=deBugNameTextBox.Text;
				selledTime=selledTimeTextBox.Text;
				softVersion=softVersionTextBox.Text;
		}
		
		void QuitButtonClick(object sender, EventArgs e)
		{
			this.Dispose();
		}
		
		void BasicInformationFormLoad(object sender, EventArgs e)
		{
			if(machineNumber=="")
			{
				machineNumberTextBox.Text="SK7420×750";
				machineNameTextBox.Text="数控丝杠磨床";
				selledNumberTextBox.Text="009";
				userNameTextBox.Text="重庆秋田";
				userAddressTextBox.Text="重庆";
				deBugNameTextBox.Text="***";
				selledTimeTextBox.Text="2016.12";
				softVersionTextBox.Text="V1.0.0";
			}
			else
			{
//				machineNumberTextBox.Text=machineNumber;
//				userNameTextBox.Text=userName;
//				userAddressTextBox.Text=userAddress;
//				deBugNameTextBox.Text=deBugName;
//				selledTimeTextBox.Text=selledTime;
//				softVersionTextBox.Text=softVersion;
			}
			
		}
		
	}
}

/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-12-15
 * Time: 8:56
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
namespace CreatNewMachineProgram
{
	partial class BasicInformationForm
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BasicInformationForm));
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.selledNumberTextBox = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			this.machineNameTextBox = new System.Windows.Forms.TextBox();
			this.label7 = new System.Windows.Forms.Label();
			this.softVersionTextBox = new System.Windows.Forms.TextBox();
			this.label6 = new System.Windows.Forms.Label();
			this.selledTimeTextBox = new System.Windows.Forms.TextBox();
			this.label5 = new System.Windows.Forms.Label();
			this.deBugNameTextBox = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.userAddressTextBox = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.userNameTextBox = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.machineNumberTextBox = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.quitButton = new System.Windows.Forms.Button();
			this.nextButton = new System.Windows.Forms.Button();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.selledNumberTextBox);
			this.groupBox1.Controls.Add(this.label8);
			this.groupBox1.Controls.Add(this.machineNameTextBox);
			this.groupBox1.Controls.Add(this.label7);
			this.groupBox1.Controls.Add(this.softVersionTextBox);
			this.groupBox1.Controls.Add(this.label6);
			this.groupBox1.Controls.Add(this.selledTimeTextBox);
			this.groupBox1.Controls.Add(this.label5);
			this.groupBox1.Controls.Add(this.deBugNameTextBox);
			this.groupBox1.Controls.Add(this.label4);
			this.groupBox1.Controls.Add(this.userAddressTextBox);
			this.groupBox1.Controls.Add(this.label3);
			this.groupBox1.Controls.Add(this.userNameTextBox);
			this.groupBox1.Controls.Add(this.label2);
			this.groupBox1.Controls.Add(this.machineNumberTextBox);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Location = new System.Drawing.Point(12, 12);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(509, 200);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "机床基本信息";
			// 
			// selledNumberTextBox
			// 
			this.selledNumberTextBox.Location = new System.Drawing.Point(354, 66);
			this.selledNumberTextBox.Name = "selledNumberTextBox";
			this.selledNumberTextBox.Size = new System.Drawing.Size(123, 21);
			this.selledNumberTextBox.TabIndex = 15;
			// 
			// label8
			// 
			this.label8.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label8.Location = new System.Drawing.Point(271, 71);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(117, 34);
			this.label8.TabIndex = 14;
			this.label8.Text = "出厂编号";
			// 
			// machineNameTextBox
			// 
			this.machineNameTextBox.Location = new System.Drawing.Point(354, 36);
			this.machineNameTextBox.Name = "machineNameTextBox";
			this.machineNameTextBox.Size = new System.Drawing.Size(123, 21);
			this.machineNameTextBox.TabIndex = 13;
			// 
			// label7
			// 
			this.label7.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label7.Location = new System.Drawing.Point(270, 40);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(117, 34);
			this.label7.TabIndex = 12;
			this.label7.Text = "机床名称";
			// 
			// softVersionTextBox
			// 
			this.softVersionTextBox.Location = new System.Drawing.Point(354, 142);
			this.softVersionTextBox.Name = "softVersionTextBox";
			this.softVersionTextBox.Size = new System.Drawing.Size(123, 21);
			this.softVersionTextBox.TabIndex = 11;
			// 
			// label6
			// 
			this.label6.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label6.Location = new System.Drawing.Point(269, 145);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(117, 34);
			this.label6.TabIndex = 10;
			this.label6.Text = "软件版本";
			// 
			// selledTimeTextBox
			// 
			this.selledTimeTextBox.Location = new System.Drawing.Point(354, 105);
			this.selledTimeTextBox.Name = "selledTimeTextBox";
			this.selledTimeTextBox.Size = new System.Drawing.Size(123, 21);
			this.selledTimeTextBox.TabIndex = 9;
			// 
			// label5
			// 
			this.label5.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label5.Location = new System.Drawing.Point(270, 109);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(117, 34);
			this.label5.TabIndex = 8;
			this.label5.Text = "出厂时间";
			// 
			// deBugNameTextBox
			// 
			this.deBugNameTextBox.Location = new System.Drawing.Point(126, 140);
			this.deBugNameTextBox.Name = "deBugNameTextBox";
			this.deBugNameTextBox.Size = new System.Drawing.Size(123, 21);
			this.deBugNameTextBox.TabIndex = 7;
			// 
			// label4
			// 
			this.label4.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label4.Location = new System.Drawing.Point(42, 143);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(117, 34);
			this.label4.TabIndex = 6;
			this.label4.Text = "调试人员";
			// 
			// userAddressTextBox
			// 
			this.userAddressTextBox.Location = new System.Drawing.Point(126, 103);
			this.userAddressTextBox.Name = "userAddressTextBox";
			this.userAddressTextBox.Size = new System.Drawing.Size(123, 21);
			this.userAddressTextBox.TabIndex = 5;
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label3.Location = new System.Drawing.Point(42, 107);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(117, 34);
			this.label3.TabIndex = 4;
			this.label3.Text = "地 址";
			// 
			// userNameTextBox
			// 
			this.userNameTextBox.Location = new System.Drawing.Point(126, 66);
			this.userNameTextBox.Name = "userNameTextBox";
			this.userNameTextBox.Size = new System.Drawing.Size(123, 21);
			this.userNameTextBox.TabIndex = 3;
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label2.Location = new System.Drawing.Point(42, 71);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(117, 34);
			this.label2.TabIndex = 2;
			this.label2.Text = "用 户";
			// 
			// machineNumberTextBox
			// 
			this.machineNumberTextBox.Location = new System.Drawing.Point(126, 36);
			this.machineNumberTextBox.Name = "machineNumberTextBox";
			this.machineNumberTextBox.Size = new System.Drawing.Size(123, 21);
			this.machineNumberTextBox.TabIndex = 1;
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label1.Location = new System.Drawing.Point(42, 40);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(117, 34);
			this.label1.TabIndex = 0;
			this.label1.Text = "机床型号";
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.quitButton);
			this.groupBox2.Controls.Add(this.nextButton);
			this.groupBox2.Location = new System.Drawing.Point(12, 235);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(509, 81);
			this.groupBox2.TabIndex = 1;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "操作";
			// 
			// quitButton
			// 
			this.quitButton.Location = new System.Drawing.Point(271, 21);
			this.quitButton.Name = "quitButton";
			this.quitButton.Size = new System.Drawing.Size(128, 39);
			this.quitButton.TabIndex = 1;
			this.quitButton.Text = "退出";
			this.quitButton.UseVisualStyleBackColor = true;
			this.quitButton.Click += new System.EventHandler(this.QuitButtonClick);
			// 
			// nextButton
			// 
			this.nextButton.Location = new System.Drawing.Point(105, 22);
			this.nextButton.Name = "nextButton";
			this.nextButton.Size = new System.Drawing.Size(131, 39);
			this.nextButton.TabIndex = 0;
			this.nextButton.Text = "下一步";
			this.nextButton.UseVisualStyleBackColor = true;
			this.nextButton.Click += new System.EventHandler(this.NextButtonClick);
			// 
			// BasicInformationForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(538, 340);
			this.Controls.Add(this.groupBox2);
			this.Controls.Add(this.groupBox1);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "BasicInformationForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "BasicInformationForm";
			this.Load += new System.EventHandler(this.BasicInformationFormLoad);
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			this.groupBox2.ResumeLayout(false);
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.TextBox selledNumberTextBox;
		private System.Windows.Forms.TextBox machineNameTextBox;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.TextBox softVersionTextBox;
		private System.Windows.Forms.Button quitButton;
		private System.Windows.Forms.Button nextButton;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TextBox selledTimeTextBox;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox userNameTextBox;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox userAddressTextBox;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.TextBox deBugNameTextBox;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox machineNumberTextBox;
		private System.Windows.Forms.GroupBox groupBox1;
	}
}

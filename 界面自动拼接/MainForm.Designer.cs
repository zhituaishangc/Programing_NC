/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-12
 * Time: 13:51
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
namespace 界面自动拼接
{
	partial class MainForm
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.dressBackCheckBox = new System.Windows.Forms.CheckBox();
			this.shapeParameterCheckBox_DOU = new System.Windows.Forms.CheckBox();
			this.shapeParameterCheckBox_TRA = new System.Windows.Forms.CheckBox();
			this.shapeParameterCheckBox_TRI = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_BG = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_GY_X_N_H = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_GY_X_N_Q = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_GY_X_W = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_GY_V = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_XZ_F = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_XZ_S = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_XZ_D = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_VW_F = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_VW_S = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox_VW_D = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox = new System.Windows.Forms.CheckBox();
			this.techniqueCheckBox = new System.Windows.Forms.CheckBox();
			this.machineMessageCheckBox = new System.Windows.Forms.CheckBox();
			this.grindParameterCheckBox = new System.Windows.Forms.CheckBox();
			this.welcomeCheckBox = new System.Windows.Forms.CheckBox();
			this.createFile = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			this.grindTypeComboBox = new System.Windows.Forms.ComboBox();
			this.quitButton = new System.Windows.Forms.Button();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.dressBackCheckBox);
			this.groupBox1.Controls.Add(this.shapeParameterCheckBox_DOU);
			this.groupBox1.Controls.Add(this.shapeParameterCheckBox_TRA);
			this.groupBox1.Controls.Add(this.shapeParameterCheckBox_TRI);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_BG);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_GY_X_N_H);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_GY_X_N_Q);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_GY_X_W);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_GY_V);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_XZ_F);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_XZ_S);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_XZ_D);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_VW_F);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_VW_S);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox_VW_D);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox);
			this.groupBox1.Controls.Add(this.techniqueCheckBox);
			this.groupBox1.Controls.Add(this.machineMessageCheckBox);
			this.groupBox1.Controls.Add(this.grindParameterCheckBox);
			this.groupBox1.Controls.Add(this.welcomeCheckBox);
			this.groupBox1.Location = new System.Drawing.Point(6, 11);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(208, 634);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "界面选择";
			// 
			// dressBackCheckBox
			// 
			this.dressBackCheckBox.Location = new System.Drawing.Point(16, 493);
			this.dressBackCheckBox.Name = "dressBackCheckBox";
			this.dressBackCheckBox.Size = new System.Drawing.Size(160, 24);
			this.dressBackCheckBox.TabIndex = 19;
			this.dressBackCheckBox.Text = "修整返回";
			this.dressBackCheckBox.UseVisualStyleBackColor = true;
			// 
			// shapeParameterCheckBox_DOU
			// 
			this.shapeParameterCheckBox_DOU.Location = new System.Drawing.Point(16, 592);
			this.shapeParameterCheckBox_DOU.Name = "shapeParameterCheckBox_DOU";
			this.shapeParameterCheckBox_DOU.Size = new System.Drawing.Size(160, 24);
			this.shapeParameterCheckBox_DOU.TabIndex = 18;
			this.shapeParameterCheckBox_DOU.Text = "齿形参数_双圆弧";
			this.shapeParameterCheckBox_DOU.UseVisualStyleBackColor = true;
			// 
			// shapeParameterCheckBox_TRA
			// 
			this.shapeParameterCheckBox_TRA.Location = new System.Drawing.Point(16, 558);
			this.shapeParameterCheckBox_TRA.Name = "shapeParameterCheckBox_TRA";
			this.shapeParameterCheckBox_TRA.Size = new System.Drawing.Size(160, 24);
			this.shapeParameterCheckBox_TRA.TabIndex = 17;
			this.shapeParameterCheckBox_TRA.Text = "齿形参数_梯形";
			this.shapeParameterCheckBox_TRA.UseVisualStyleBackColor = true;
			// 
			// shapeParameterCheckBox_TRI
			// 
			this.shapeParameterCheckBox_TRI.Location = new System.Drawing.Point(16, 523);
			this.shapeParameterCheckBox_TRI.Name = "shapeParameterCheckBox_TRI";
			this.shapeParameterCheckBox_TRI.Size = new System.Drawing.Size(160, 24);
			this.shapeParameterCheckBox_TRI.TabIndex = 16;
			this.shapeParameterCheckBox_TRI.Text = "齿形参数_三角";
			this.shapeParameterCheckBox_TRI.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_BG
			// 
			this.dressParameterCheckBox_BG.Location = new System.Drawing.Point(16, 463);
			this.dressParameterCheckBox_BG.Name = "dressParameterCheckBox_BG";
			this.dressParameterCheckBox_BG.Size = new System.Drawing.Size(160, 24);
			this.dressParameterCheckBox_BG.TabIndex = 15;
			this.dressParameterCheckBox_BG.Text = "修整参数_摆缸";
			this.dressParameterCheckBox_BG.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_GY_X_N_H
			// 
			this.dressParameterCheckBox_GY_X_N_H.Location = new System.Drawing.Point(16, 440);
			this.dressParameterCheckBox_GY_X_N_H.Name = "dressParameterCheckBox_GY_X_N_H";
			this.dressParameterCheckBox_GY_X_N_H.Size = new System.Drawing.Size(160, 24);
			this.dressParameterCheckBox_GY_X_N_H.TabIndex = 14;
			this.dressParameterCheckBox_GY_X_N_H.Text = "修整参数_滚压轮X_内_后";
			this.dressParameterCheckBox_GY_X_N_H.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_GY_X_N_Q
			// 
			this.dressParameterCheckBox_GY_X_N_Q.Location = new System.Drawing.Point(16, 410);
			this.dressParameterCheckBox_GY_X_N_Q.Name = "dressParameterCheckBox_GY_X_N_Q";
			this.dressParameterCheckBox_GY_X_N_Q.Size = new System.Drawing.Size(160, 24);
			this.dressParameterCheckBox_GY_X_N_Q.TabIndex = 13;
			this.dressParameterCheckBox_GY_X_N_Q.Text = "修整参数_滚压轮X_内_前";
			this.dressParameterCheckBox_GY_X_N_Q.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_GY_X_W
			// 
			this.dressParameterCheckBox_GY_X_W.Location = new System.Drawing.Point(16, 380);
			this.dressParameterCheckBox_GY_X_W.Name = "dressParameterCheckBox_GY_X_W";
			this.dressParameterCheckBox_GY_X_W.Size = new System.Drawing.Size(145, 24);
			this.dressParameterCheckBox_GY_X_W.TabIndex = 12;
			this.dressParameterCheckBox_GY_X_W.Text = "修整参数_滚压轮X_外";
			this.dressParameterCheckBox_GY_X_W.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_GY_V
			// 
			this.dressParameterCheckBox_GY_V.Location = new System.Drawing.Point(16, 352);
			this.dressParameterCheckBox_GY_V.Name = "dressParameterCheckBox_GY_V";
			this.dressParameterCheckBox_GY_V.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_GY_V.TabIndex = 11;
			this.dressParameterCheckBox_GY_V.Text = "修整参数_滚压轮V";
			this.dressParameterCheckBox_GY_V.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_XZ_F
			// 
			this.dressParameterCheckBox_XZ_F.Location = new System.Drawing.Point(16, 322);
			this.dressParameterCheckBox_XZ_F.Name = "dressParameterCheckBox_XZ_F";
			this.dressParameterCheckBox_XZ_F.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_XZ_F.TabIndex = 10;
			this.dressParameterCheckBox_XZ_F.Text = "修整参数_XZ方滚轮";
			this.dressParameterCheckBox_XZ_F.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_XZ_S
			// 
			this.dressParameterCheckBox_XZ_S.Location = new System.Drawing.Point(16, 292);
			this.dressParameterCheckBox_XZ_S.Name = "dressParameterCheckBox_XZ_S";
			this.dressParameterCheckBox_XZ_S.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_XZ_S.TabIndex = 9;
			this.dressParameterCheckBox_XZ_S.Text = "修整参数_XZ双滚轮";
			this.dressParameterCheckBox_XZ_S.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_XZ_D
			// 
			this.dressParameterCheckBox_XZ_D.Location = new System.Drawing.Point(16, 262);
			this.dressParameterCheckBox_XZ_D.Name = "dressParameterCheckBox_XZ_D";
			this.dressParameterCheckBox_XZ_D.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_XZ_D.TabIndex = 8;
			this.dressParameterCheckBox_XZ_D.Text = "修整参数_XZ单滚轮";
			this.dressParameterCheckBox_XZ_D.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_VW_F
			// 
			this.dressParameterCheckBox_VW_F.Location = new System.Drawing.Point(16, 232);
			this.dressParameterCheckBox_VW_F.Name = "dressParameterCheckBox_VW_F";
			this.dressParameterCheckBox_VW_F.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_VW_F.TabIndex = 7;
			this.dressParameterCheckBox_VW_F.Text = "修整参数_VW方滚轮";
			this.dressParameterCheckBox_VW_F.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_VW_S
			// 
			this.dressParameterCheckBox_VW_S.Location = new System.Drawing.Point(16, 202);
			this.dressParameterCheckBox_VW_S.Name = "dressParameterCheckBox_VW_S";
			this.dressParameterCheckBox_VW_S.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_VW_S.TabIndex = 6;
			this.dressParameterCheckBox_VW_S.Text = "修整参数_VW双滚轮";
			this.dressParameterCheckBox_VW_S.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_VW_D
			// 
			this.dressParameterCheckBox_VW_D.Location = new System.Drawing.Point(16, 172);
			this.dressParameterCheckBox_VW_D.Name = "dressParameterCheckBox_VW_D";
			this.dressParameterCheckBox_VW_D.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_VW_D.TabIndex = 5;
			this.dressParameterCheckBox_VW_D.Text = "修整参数_VW单滚轮";
			this.dressParameterCheckBox_VW_D.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox
			// 
			this.dressParameterCheckBox.Location = new System.Drawing.Point(16, 143);
			this.dressParameterCheckBox.Name = "dressParameterCheckBox";
			this.dressParameterCheckBox.Size = new System.Drawing.Size(104, 24);
			this.dressParameterCheckBox.TabIndex = 4;
			this.dressParameterCheckBox.Text = "修整参数";
			this.dressParameterCheckBox.UseVisualStyleBackColor = true;
			// 
			// techniqueCheckBox
			// 
			this.techniqueCheckBox.Location = new System.Drawing.Point(16, 113);
			this.techniqueCheckBox.Name = "techniqueCheckBox";
			this.techniqueCheckBox.Size = new System.Drawing.Size(104, 24);
			this.techniqueCheckBox.TabIndex = 3;
			this.techniqueCheckBox.Text = "工艺参数";
			this.techniqueCheckBox.UseVisualStyleBackColor = true;
			// 
			// machineMessageCheckBox
			// 
			this.machineMessageCheckBox.Location = new System.Drawing.Point(16, 50);
			this.machineMessageCheckBox.Name = "machineMessageCheckBox";
			this.machineMessageCheckBox.Size = new System.Drawing.Size(104, 24);
			this.machineMessageCheckBox.TabIndex = 2;
			this.machineMessageCheckBox.Text = "出厂信息";
			this.machineMessageCheckBox.UseVisualStyleBackColor = true;
			// 
			// grindParameterCheckBox
			// 
			this.grindParameterCheckBox.Location = new System.Drawing.Point(16, 83);
			this.grindParameterCheckBox.Name = "grindParameterCheckBox";
			this.grindParameterCheckBox.Size = new System.Drawing.Size(104, 24);
			this.grindParameterCheckBox.TabIndex = 1;
			this.grindParameterCheckBox.Text = "磨削参数";
			this.grindParameterCheckBox.UseVisualStyleBackColor = true;
			// 
			// welcomeCheckBox
			// 
			this.welcomeCheckBox.Location = new System.Drawing.Point(16, 20);
			this.welcomeCheckBox.Name = "welcomeCheckBox";
			this.welcomeCheckBox.Size = new System.Drawing.Size(104, 24);
			this.welcomeCheckBox.TabIndex = 0;
			this.welcomeCheckBox.Text = "欢迎画面";
			this.welcomeCheckBox.UseVisualStyleBackColor = true;
			// 
			// createFile
			// 
			this.createFile.Location = new System.Drawing.Point(6, 651);
			this.createFile.Name = "createFile";
			this.createFile.Size = new System.Drawing.Size(208, 32);
			this.createFile.TabIndex = 1;
			this.createFile.Text = "生成文件";
			this.createFile.UseVisualStyleBackColor = true;
			this.createFile.Click += new System.EventHandler(this.CreateFileClick);
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.label1);
			this.groupBox2.Controls.Add(this.grindTypeComboBox);
			this.groupBox2.Location = new System.Drawing.Point(239, 10);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(217, 635);
			this.groupBox2.TabIndex = 2;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "机床信息选择";
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label1.Location = new System.Drawing.Point(6, 28);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(72, 30);
			this.label1.TabIndex = 1;
			this.label1.Text = "磨削类型";
			// 
			// grindTypeComboBox
			// 
			this.grindTypeComboBox.FormattingEnabled = true;
			this.grindTypeComboBox.Items.AddRange(new object[] {
									"外螺纹",
									"内螺纹",
									"磨削中心"});
			this.grindTypeComboBox.Location = new System.Drawing.Point(112, 25);
			this.grindTypeComboBox.Name = "grindTypeComboBox";
			this.grindTypeComboBox.Size = new System.Drawing.Size(97, 20);
			this.grindTypeComboBox.TabIndex = 0;
			// 
			// quitButton
			// 
			this.quitButton.Location = new System.Drawing.Point(240, 651);
			this.quitButton.Name = "quitButton";
			this.quitButton.Size = new System.Drawing.Size(217, 32);
			this.quitButton.TabIndex = 3;
			this.quitButton.Text = "退出";
			this.quitButton.UseVisualStyleBackColor = true;
			this.quitButton.Click += new System.EventHandler(this.QuitButtonClick);
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(477, 688);
			this.Controls.Add(this.quitButton);
			this.Controls.Add(this.groupBox2);
			this.Controls.Add(this.createFile);
			this.Controls.Add(this.groupBox1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Name = "MainForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "界面自动拼接";
			this.Load += new System.EventHandler(this.MainFormLoad);
			this.groupBox1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Button quitButton;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_BG;
		private System.Windows.Forms.CheckBox dressBackCheckBox;
		private System.Windows.Forms.CheckBox shapeParameterCheckBox_TRI;
		private System.Windows.Forms.CheckBox shapeParameterCheckBox_TRA;
		private System.Windows.Forms.CheckBox shapeParameterCheckBox_DOU;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_GY_V;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_GY_X_W;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_GY_X_N_Q;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_GY_X_N_H;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_XZ_D;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_XZ_S;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_XZ_F;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_VW_F;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_VW_S;
		private System.Windows.Forms.CheckBox dressParameterCheckBox_VW_D;
		private System.Windows.Forms.CheckBox dressParameterCheckBox;
		private System.Windows.Forms.CheckBox techniqueCheckBox;
		private System.Windows.Forms.ComboBox grindTypeComboBox;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.CheckBox machineMessageCheckBox;
		private System.Windows.Forms.CheckBox grindParameterCheckBox;
		private System.Windows.Forms.CheckBox welcomeCheckBox;
		private System.Windows.Forms.Button createFile;
		private System.Windows.Forms.GroupBox groupBox1;
	}
}

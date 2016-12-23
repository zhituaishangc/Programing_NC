/*
 * Created by SharpDevelop.
 * User: Administrator
 * Date: 2016-11-12
 * Time: 13:51
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
namespace CreatNewMachineProgram
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
			this.techniqueCheckBox = new System.Windows.Forms.CheckBox();
			this.dressParameterCheckBox = new System.Windows.Forms.CheckBox();
			this.machineMessageCheckBox = new System.Windows.Forms.CheckBox();
			this.grindParameterCheckBox = new System.Windows.Forms.CheckBox();
			this.welcomeCheckBox = new System.Windows.Forms.CheckBox();
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
			this.createFile = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.label7 = new System.Windows.Forms.Label();
			this.autoOperationTypeComboBox = new System.Windows.Forms.ComboBox();
			this.label6 = new System.Windows.Forms.Label();
			this.autoOperationComboBox = new System.Windows.Forms.ComboBox();
			this.label5 = new System.Windows.Forms.Label();
			this.helicAngleEnabledComboBox = new System.Windows.Forms.ComboBox();
			this.label3 = new System.Windows.Forms.Label();
			this.dressDriverTypeComboBox = new System.Windows.Forms.ComboBox();
			this.label2 = new System.Windows.Forms.Label();
			this.wheelDriverTypeComboBox = new System.Windows.Forms.ComboBox();
			this.label1 = new System.Windows.Forms.Label();
			this.grindTypeComboBox = new System.Windows.Forms.ComboBox();
			this.quitButton = new System.Windows.Forms.Button();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.groupBox4 = new System.Windows.Forms.GroupBox();
			this.groupBox5 = new System.Windows.Forms.GroupBox();
			this.returnButton = new System.Windows.Forms.Button();
			this.myMenuStrip = new System.Windows.Forms.MenuStrip();
			this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.groupBox1.SuspendLayout();
			this.groupBox2.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox4.SuspendLayout();
			this.groupBox5.SuspendLayout();
			this.myMenuStrip.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.techniqueCheckBox);
			this.groupBox1.Controls.Add(this.dressParameterCheckBox);
			this.groupBox1.Controls.Add(this.machineMessageCheckBox);
			this.groupBox1.Controls.Add(this.grindParameterCheckBox);
			this.groupBox1.Controls.Add(this.welcomeCheckBox);
			this.groupBox1.Controls.Add(this.dressBackCheckBox);
			this.groupBox1.Location = new System.Drawing.Point(6, 31);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(227, 120);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "基本界面";
			// 
			// techniqueCheckBox
			// 
			this.techniqueCheckBox.Enabled = false;
			this.techniqueCheckBox.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.techniqueCheckBox.Location = new System.Drawing.Point(102, 76);
			this.techniqueCheckBox.Name = "techniqueCheckBox";
			this.techniqueCheckBox.Size = new System.Drawing.Size(104, 24);
			this.techniqueCheckBox.TabIndex = 3;
			this.techniqueCheckBox.Text = "工艺参数";
			this.techniqueCheckBox.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox
			// 
			this.dressParameterCheckBox.Enabled = false;
			this.dressParameterCheckBox.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox.Location = new System.Drawing.Point(102, 20);
			this.dressParameterCheckBox.Name = "dressParameterCheckBox";
			this.dressParameterCheckBox.Size = new System.Drawing.Size(104, 24);
			this.dressParameterCheckBox.TabIndex = 4;
			this.dressParameterCheckBox.Text = "修整参数";
			this.dressParameterCheckBox.UseVisualStyleBackColor = true;
			// 
			// machineMessageCheckBox
			// 
			this.machineMessageCheckBox.Enabled = false;
			this.machineMessageCheckBox.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.machineMessageCheckBox.Location = new System.Drawing.Point(16, 48);
			this.machineMessageCheckBox.Name = "machineMessageCheckBox";
			this.machineMessageCheckBox.Size = new System.Drawing.Size(83, 24);
			this.machineMessageCheckBox.TabIndex = 2;
			this.machineMessageCheckBox.Text = "出厂信息";
			this.machineMessageCheckBox.UseVisualStyleBackColor = true;
			// 
			// grindParameterCheckBox
			// 
			this.grindParameterCheckBox.Enabled = false;
			this.grindParameterCheckBox.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.grindParameterCheckBox.Location = new System.Drawing.Point(16, 76);
			this.grindParameterCheckBox.Name = "grindParameterCheckBox";
			this.grindParameterCheckBox.Size = new System.Drawing.Size(104, 24);
			this.grindParameterCheckBox.TabIndex = 1;
			this.grindParameterCheckBox.Text = "磨削参数";
			this.grindParameterCheckBox.UseVisualStyleBackColor = true;
			// 
			// welcomeCheckBox
			// 
			this.welcomeCheckBox.CausesValidation = false;
			this.welcomeCheckBox.Enabled = false;
			this.welcomeCheckBox.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.welcomeCheckBox.Location = new System.Drawing.Point(16, 20);
			this.welcomeCheckBox.Name = "welcomeCheckBox";
			this.welcomeCheckBox.Size = new System.Drawing.Size(104, 24);
			this.welcomeCheckBox.TabIndex = 0;
			this.welcomeCheckBox.Text = "欢迎画面";
			this.welcomeCheckBox.UseVisualStyleBackColor = true;
			// 
			// dressBackCheckBox
			// 
			this.dressBackCheckBox.Enabled = false;
			this.dressBackCheckBox.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressBackCheckBox.Location = new System.Drawing.Point(102, 48);
			this.dressBackCheckBox.Name = "dressBackCheckBox";
			this.dressBackCheckBox.Size = new System.Drawing.Size(120, 24);
			this.dressBackCheckBox.TabIndex = 19;
			this.dressBackCheckBox.Text = "修整返回";
			this.dressBackCheckBox.UseVisualStyleBackColor = true;
			// 
			// shapeParameterCheckBox_DOU
			// 
			this.shapeParameterCheckBox_DOU.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.shapeParameterCheckBox_DOU.Location = new System.Drawing.Point(14, 76);
			this.shapeParameterCheckBox_DOU.Name = "shapeParameterCheckBox_DOU";
			this.shapeParameterCheckBox_DOU.Size = new System.Drawing.Size(160, 24);
			this.shapeParameterCheckBox_DOU.TabIndex = 18;
			this.shapeParameterCheckBox_DOU.Text = "齿形参数_双圆弧";
			this.shapeParameterCheckBox_DOU.UseVisualStyleBackColor = true;
			// 
			// shapeParameterCheckBox_TRA
			// 
			this.shapeParameterCheckBox_TRA.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.shapeParameterCheckBox_TRA.Location = new System.Drawing.Point(14, 48);
			this.shapeParameterCheckBox_TRA.Name = "shapeParameterCheckBox_TRA";
			this.shapeParameterCheckBox_TRA.Size = new System.Drawing.Size(160, 24);
			this.shapeParameterCheckBox_TRA.TabIndex = 17;
			this.shapeParameterCheckBox_TRA.Text = "齿形参数_梯形";
			this.shapeParameterCheckBox_TRA.UseVisualStyleBackColor = true;
			// 
			// shapeParameterCheckBox_TRI
			// 
			this.shapeParameterCheckBox_TRI.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.shapeParameterCheckBox_TRI.Location = new System.Drawing.Point(14, 20);
			this.shapeParameterCheckBox_TRI.Name = "shapeParameterCheckBox_TRI";
			this.shapeParameterCheckBox_TRI.Size = new System.Drawing.Size(160, 24);
			this.shapeParameterCheckBox_TRI.TabIndex = 16;
			this.shapeParameterCheckBox_TRI.Text = "齿形参数_三角";
			this.shapeParameterCheckBox_TRI.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_BG
			// 
			this.dressParameterCheckBox_BG.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_BG.Location = new System.Drawing.Point(10, 348);
			this.dressParameterCheckBox_BG.Name = "dressParameterCheckBox_BG";
			this.dressParameterCheckBox_BG.Size = new System.Drawing.Size(160, 24);
			this.dressParameterCheckBox_BG.TabIndex = 15;
			this.dressParameterCheckBox_BG.Text = "修整参数_摆缸";
			this.dressParameterCheckBox_BG.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_GY_X_N_H
			// 
			this.dressParameterCheckBox_GY_X_N_H.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_GY_X_N_H.Location = new System.Drawing.Point(10, 316);
			this.dressParameterCheckBox_GY_X_N_H.Name = "dressParameterCheckBox_GY_X_N_H";
			this.dressParameterCheckBox_GY_X_N_H.Size = new System.Drawing.Size(190, 24);
			this.dressParameterCheckBox_GY_X_N_H.TabIndex = 14;
			this.dressParameterCheckBox_GY_X_N_H.Text = "修整参数_滚压轮X_内_后";
			this.dressParameterCheckBox_GY_X_N_H.UseVisualStyleBackColor = true;
			this.dressParameterCheckBox_GY_X_N_H.CheckedChanged += new System.EventHandler(this.DressParameterCheckBox_GY_X_N_HCheckedChanged);
			// 
			// dressParameterCheckBox_GY_X_N_Q
			// 
			this.dressParameterCheckBox_GY_X_N_Q.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_GY_X_N_Q.Location = new System.Drawing.Point(10, 284);
			this.dressParameterCheckBox_GY_X_N_Q.Name = "dressParameterCheckBox_GY_X_N_Q";
			this.dressParameterCheckBox_GY_X_N_Q.Size = new System.Drawing.Size(190, 24);
			this.dressParameterCheckBox_GY_X_N_Q.TabIndex = 13;
			this.dressParameterCheckBox_GY_X_N_Q.Text = "修整参数_滚压轮X_内_前";
			this.dressParameterCheckBox_GY_X_N_Q.UseVisualStyleBackColor = true;
			this.dressParameterCheckBox_GY_X_N_Q.CheckedChanged += new System.EventHandler(this.DressParameterCheckBox_GY_X_N_QCheckedChanged);
			// 
			// dressParameterCheckBox_GY_X_W
			// 
			this.dressParameterCheckBox_GY_X_W.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_GY_X_W.Location = new System.Drawing.Point(10, 252);
			this.dressParameterCheckBox_GY_X_W.Name = "dressParameterCheckBox_GY_X_W";
			this.dressParameterCheckBox_GY_X_W.Size = new System.Drawing.Size(160, 24);
			this.dressParameterCheckBox_GY_X_W.TabIndex = 12;
			this.dressParameterCheckBox_GY_X_W.Text = "修整参数_滚压轮X_外";
			this.dressParameterCheckBox_GY_X_W.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_GY_V
			// 
			this.dressParameterCheckBox_GY_V.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_GY_V.Location = new System.Drawing.Point(10, 220);
			this.dressParameterCheckBox_GY_V.Name = "dressParameterCheckBox_GY_V";
			this.dressParameterCheckBox_GY_V.Size = new System.Drawing.Size(160, 24);
			this.dressParameterCheckBox_GY_V.TabIndex = 11;
			this.dressParameterCheckBox_GY_V.Text = "修整参数_滚压轮V";
			this.dressParameterCheckBox_GY_V.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_XZ_F
			// 
			this.dressParameterCheckBox_XZ_F.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_XZ_F.Location = new System.Drawing.Point(10, 188);
			this.dressParameterCheckBox_XZ_F.Name = "dressParameterCheckBox_XZ_F";
			this.dressParameterCheckBox_XZ_F.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_XZ_F.TabIndex = 10;
			this.dressParameterCheckBox_XZ_F.Text = "修整参数_XZ方滚轮";
			this.dressParameterCheckBox_XZ_F.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_XZ_S
			// 
			this.dressParameterCheckBox_XZ_S.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_XZ_S.Location = new System.Drawing.Point(10, 156);
			this.dressParameterCheckBox_XZ_S.Name = "dressParameterCheckBox_XZ_S";
			this.dressParameterCheckBox_XZ_S.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_XZ_S.TabIndex = 9;
			this.dressParameterCheckBox_XZ_S.Text = "修整参数_XZ双滚轮";
			this.dressParameterCheckBox_XZ_S.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_XZ_D
			// 
			this.dressParameterCheckBox_XZ_D.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_XZ_D.Location = new System.Drawing.Point(10, 124);
			this.dressParameterCheckBox_XZ_D.Name = "dressParameterCheckBox_XZ_D";
			this.dressParameterCheckBox_XZ_D.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_XZ_D.TabIndex = 8;
			this.dressParameterCheckBox_XZ_D.Text = "修整参数_XZ单滚轮";
			this.dressParameterCheckBox_XZ_D.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_VW_F
			// 
			this.dressParameterCheckBox_VW_F.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_VW_F.Location = new System.Drawing.Point(10, 92);
			this.dressParameterCheckBox_VW_F.Name = "dressParameterCheckBox_VW_F";
			this.dressParameterCheckBox_VW_F.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_VW_F.TabIndex = 7;
			this.dressParameterCheckBox_VW_F.Text = "修整参数_VW方滚轮";
			this.dressParameterCheckBox_VW_F.UseVisualStyleBackColor = true;
			// 
			// dressParameterCheckBox_VW_S
			// 
			this.dressParameterCheckBox_VW_S.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_VW_S.Location = new System.Drawing.Point(10, 60);
			this.dressParameterCheckBox_VW_S.Name = "dressParameterCheckBox_VW_S";
			this.dressParameterCheckBox_VW_S.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_VW_S.TabIndex = 6;
			this.dressParameterCheckBox_VW_S.Text = "修整参数_VW双滚轮";
			this.dressParameterCheckBox_VW_S.UseVisualStyleBackColor = true;
			this.dressParameterCheckBox_VW_S.CheckStateChanged += new System.EventHandler(this.DressParameterCheckBox_VW_SCheckStateChanged);
			// 
			// dressParameterCheckBox_VW_D
			// 
			this.dressParameterCheckBox_VW_D.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.dressParameterCheckBox_VW_D.Location = new System.Drawing.Point(10, 28);
			this.dressParameterCheckBox_VW_D.Name = "dressParameterCheckBox_VW_D";
			this.dressParameterCheckBox_VW_D.Size = new System.Drawing.Size(131, 24);
			this.dressParameterCheckBox_VW_D.TabIndex = 5;
			this.dressParameterCheckBox_VW_D.Text = "修整参数_VW单滚轮";
			this.dressParameterCheckBox_VW_D.UseVisualStyleBackColor = true;
			this.dressParameterCheckBox_VW_D.CheckedChanged += new System.EventHandler(this.DressParameterCheckBox_VW_DCheckedChanged);
			// 
			// createFile
			// 
			this.createFile.Location = new System.Drawing.Point(36, 57);
			this.createFile.Name = "createFile";
			this.createFile.Size = new System.Drawing.Size(174, 32);
			this.createFile.TabIndex = 1;
			this.createFile.Text = "生成文件";
			this.createFile.UseVisualStyleBackColor = true;
			this.createFile.Click += new System.EventHandler(this.CreateFileClick);
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.label7);
			this.groupBox2.Controls.Add(this.autoOperationTypeComboBox);
			this.groupBox2.Controls.Add(this.label6);
			this.groupBox2.Controls.Add(this.autoOperationComboBox);
			this.groupBox2.Controls.Add(this.label5);
			this.groupBox2.Controls.Add(this.helicAngleEnabledComboBox);
			this.groupBox2.Controls.Add(this.label3);
			this.groupBox2.Controls.Add(this.dressDriverTypeComboBox);
			this.groupBox2.Controls.Add(this.label2);
			this.groupBox2.Controls.Add(this.wheelDriverTypeComboBox);
			this.groupBox2.Controls.Add(this.label1);
			this.groupBox2.Controls.Add(this.grindTypeComboBox);
			this.groupBox2.Location = new System.Drawing.Point(255, 169);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(247, 250);
			this.groupBox2.TabIndex = 2;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "机床信息选择";
			// 
			// label7
			// 
			this.label7.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label7.Location = new System.Drawing.Point(6, 217);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(115, 30);
			this.label7.TabIndex = 13;
			this.label7.Text = "自动对刀类型";
			// 
			// autoOperationTypeComboBox
			// 
			this.autoOperationTypeComboBox.Enabled = false;
			this.autoOperationTypeComboBox.FormattingEnabled = true;
			this.autoOperationTypeComboBox.Items.AddRange(new object[] {
									"接近开关",
									"接触测头"});
			this.autoOperationTypeComboBox.Location = new System.Drawing.Point(127, 215);
			this.autoOperationTypeComboBox.Name = "autoOperationTypeComboBox";
			this.autoOperationTypeComboBox.Size = new System.Drawing.Size(97, 20);
			this.autoOperationTypeComboBox.TabIndex = 12;
			// 
			// label6
			// 
			this.label6.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label6.Location = new System.Drawing.Point(6, 179);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(115, 30);
			this.label6.TabIndex = 11;
			this.label6.Text = "是否自动对刀";
			// 
			// autoOperationComboBox
			// 
			this.autoOperationComboBox.FormattingEnabled = true;
			this.autoOperationComboBox.Items.AddRange(new object[] {
									"是",
									"否"});
			this.autoOperationComboBox.Location = new System.Drawing.Point(127, 177);
			this.autoOperationComboBox.Name = "autoOperationComboBox";
			this.autoOperationComboBox.Size = new System.Drawing.Size(97, 20);
			this.autoOperationComboBox.TabIndex = 10;
			this.autoOperationComboBox.SelectedIndexChanged += new System.EventHandler(this.AutoOperationComboBoxSelectedIndexChanged);
			// 
			// label5
			// 
			this.label5.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label5.Location = new System.Drawing.Point(6, 145);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(115, 30);
			this.label5.TabIndex = 8;
			this.label5.Text = "螺旋升角使能";
			// 
			// helicAngleEnabledComboBox
			// 
			this.helicAngleEnabledComboBox.FormattingEnabled = true;
			this.helicAngleEnabledComboBox.Items.AddRange(new object[] {
									"关",
									"开"});
			this.helicAngleEnabledComboBox.Location = new System.Drawing.Point(127, 139);
			this.helicAngleEnabledComboBox.Name = "helicAngleEnabledComboBox";
			this.helicAngleEnabledComboBox.Size = new System.Drawing.Size(97, 20);
			this.helicAngleEnabledComboBox.TabIndex = 7;
			// 
			// label3
			// 
			this.label3.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label3.Location = new System.Drawing.Point(6, 106);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(115, 30);
			this.label3.TabIndex = 5;
			this.label3.Text = "修整轮驱动类型";
			// 
			// dressDriverTypeComboBox
			// 
			this.dressDriverTypeComboBox.FormattingEnabled = true;
			this.dressDriverTypeComboBox.Items.AddRange(new object[] {
									"变频器",
									"伺服主轴"});
			this.dressDriverTypeComboBox.Location = new System.Drawing.Point(127, 105);
			this.dressDriverTypeComboBox.Name = "dressDriverTypeComboBox";
			this.dressDriverTypeComboBox.Size = new System.Drawing.Size(97, 20);
			this.dressDriverTypeComboBox.TabIndex = 4;
			// 
			// label2
			// 
			this.label2.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
			this.label2.Location = new System.Drawing.Point(6, 67);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(100, 30);
			this.label2.TabIndex = 3;
			this.label2.Text = "砂轮驱动类型";
			// 
			// wheelDriverTypeComboBox
			// 
			this.wheelDriverTypeComboBox.FormattingEnabled = true;
			this.wheelDriverTypeComboBox.Items.AddRange(new object[] {
									"变频器",
									"伺服主轴"});
			this.wheelDriverTypeComboBox.Location = new System.Drawing.Point(127, 63);
			this.wheelDriverTypeComboBox.Name = "wheelDriverTypeComboBox";
			this.wheelDriverTypeComboBox.Size = new System.Drawing.Size(97, 20);
			this.wheelDriverTypeComboBox.TabIndex = 2;
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
			this.grindTypeComboBox.Location = new System.Drawing.Point(127, 25);
			this.grindTypeComboBox.Name = "grindTypeComboBox";
			this.grindTypeComboBox.Size = new System.Drawing.Size(97, 20);
			this.grindTypeComboBox.TabIndex = 0;
			// 
			// quitButton
			// 
			this.quitButton.Location = new System.Drawing.Point(36, 99);
			this.quitButton.Name = "quitButton";
			this.quitButton.Size = new System.Drawing.Size(174, 32);
			this.quitButton.TabIndex = 3;
			this.quitButton.Text = "退出";
			this.quitButton.UseVisualStyleBackColor = true;
			this.quitButton.Click += new System.EventHandler(this.QuitButtonClick);
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.shapeParameterCheckBox_TRI);
			this.groupBox3.Controls.Add(this.shapeParameterCheckBox_DOU);
			this.groupBox3.Controls.Add(this.shapeParameterCheckBox_TRA);
			this.groupBox3.Location = new System.Drawing.Point(255, 31);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(247, 120);
			this.groupBox3.TabIndex = 4;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "齿形选择";
			// 
			// groupBox4
			// 
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_BG);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_VW_S);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_GY_X_N_H);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_VW_F);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_XZ_D);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_GY_X_N_Q);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_XZ_S);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_XZ_F);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_VW_D);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_GY_V);
			this.groupBox4.Controls.Add(this.dressParameterCheckBox_GY_X_W);
			this.groupBox4.Location = new System.Drawing.Point(12, 169);
			this.groupBox4.Name = "groupBox4";
			this.groupBox4.Size = new System.Drawing.Size(224, 400);
			this.groupBox4.TabIndex = 5;
			this.groupBox4.TabStop = false;
			this.groupBox4.Text = "修整界面";
			// 
			// groupBox5
			// 
			this.groupBox5.Controls.Add(this.returnButton);
			this.groupBox5.Controls.Add(this.createFile);
			this.groupBox5.Controls.Add(this.quitButton);
			this.groupBox5.Location = new System.Drawing.Point(258, 425);
			this.groupBox5.Name = "groupBox5";
			this.groupBox5.Size = new System.Drawing.Size(244, 144);
			this.groupBox5.TabIndex = 6;
			this.groupBox5.TabStop = false;
			this.groupBox5.Text = "操作";
			// 
			// returnButton
			// 
			this.returnButton.Location = new System.Drawing.Point(35, 13);
			this.returnButton.Name = "returnButton";
			this.returnButton.Size = new System.Drawing.Size(174, 32);
			this.returnButton.TabIndex = 4;
			this.returnButton.Text = "上一步";
			this.returnButton.UseVisualStyleBackColor = true;
			this.returnButton.Click += new System.EventHandler(this.ReturnButtonClick);
			// 
			// myMenuStrip
			// 
			this.myMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
									this.helpToolStripMenuItem});
			this.myMenuStrip.Location = new System.Drawing.Point(0, 0);
			this.myMenuStrip.Name = "myMenuStrip";
			this.myMenuStrip.Size = new System.Drawing.Size(514, 24);
			this.myMenuStrip.TabIndex = 7;
			this.myMenuStrip.Text = "myMenuStrip";
			// 
			// helpToolStripMenuItem
			// 
			this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
			this.helpToolStripMenuItem.Size = new System.Drawing.Size(41, 20);
			this.helpToolStripMenuItem.Text = "帮助";
			this.helpToolStripMenuItem.Click += new System.EventHandler(this.HelpToolStripMenuItemClick);
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoScroll = true;
			this.ClientSize = new System.Drawing.Size(514, 582);
			this.Controls.Add(this.groupBox5);
			this.Controls.Add(this.groupBox4);
			this.Controls.Add(this.groupBox3);
			this.Controls.Add(this.groupBox2);
			this.Controls.Add(this.groupBox1);
			this.Controls.Add(this.myMenuStrip);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MainMenuStrip = this.myMenuStrip;
			this.MaximizeBox = false;
			this.Name = "MainForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "创建新机床程序";
			this.Load += new System.EventHandler(this.MainFormLoad);
			this.groupBox1.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			this.groupBox3.ResumeLayout(false);
			this.groupBox4.ResumeLayout(false);
			this.groupBox5.ResumeLayout(false);
			this.myMenuStrip.ResumeLayout(false);
			this.myMenuStrip.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();
		}
		private System.Windows.Forms.Button returnButton;
		private System.Windows.Forms.ComboBox autoOperationTypeComboBox;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
		private System.Windows.Forms.MenuStrip myMenuStrip;
		private System.Windows.Forms.ComboBox autoOperationComboBox;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.GroupBox groupBox5;
		private System.Windows.Forms.GroupBox groupBox4;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.ComboBox helicAngleEnabledComboBox;
		private System.Windows.Forms.ComboBox wheelDriverTypeComboBox;
		private System.Windows.Forms.ComboBox dressDriverTypeComboBox;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
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

![Icon](https://i.imgur.com/4MfwYqL.jpg)

workstation only for HJMT Programing segment

## Intro

* The project design to quick build the machine program which may has different spicificaton.
* There has an friendly interface to guide you creat you special needs, all you needed were type few word and choice the machine sctructs and then process it.

## Features

* 机床可选类型
    * 机床类型: 外螺纹 内螺纹
    * 修整器类型: vw v xz x_后(内螺纹) 液压修整
    * 修整轮类型: 单滚轮/方滚轮 双滚轮
    * 选择齿形: 三角/梯形/双圆弧 双圆弧
    * 是否有自动对刀
        * 自动对刀机构类型: 接近开关 测量头 开关和测头
    * 是否是磨削中心
        * 是否有U轴
    * 是否有A轴
        * A轴转完是否关闭液压
    * 砂轮驱动器类型: 西门子伺服 变频器/普通电机
    * 修整轮驱动器类型: 西门子伺服 变频器/普通电机
    * 螺纹磨削工艺界面中,粗磨进给量是否自动计算

## Build Guide

* 视频演示: [Youtube](https://youtu.be/YIN5JHb4B0E). [bilibili](https://www.bilibili.com/video/av34441063/). [Youku](https://v.youku.com/v_show/id_XMzg4MzI3MDM0NA==.html?spm=a2h3j.8428770.3416059.1)
* 程序生成
    1. 运行HorizonJuicer
    2. 选择`1.配置机床`
    3. 输入机床型号编号及用户信息
    4. 选择机床界面显示语言
    5. 仓库地址及配置打包地址(默认则生成在D:\MachineProgram)
    6. 选择机床配置
    7. 选择是否删除程序内注释
    8. 开始按照设定自动配置机床
    9. **结束后观察app内提示信息，是否有全局变量需要在导入机床后手动初始化值**
    10. 回车键退出程序
* 机床导入
    * 配置好的文件夹内有四个文件夹(MPF CMA DEF HMI)
    * 使用AMM连接机床后将对应文件夹内文件导入机床
    * HMI内文件夹**proj**导入Siemens目录，其他导入oem目录即可
    * DEF文件导入机床后激活
    * 如果程序生成后提示有变量需要手动赋值则激活def后处理
    * 导入程序后重启NC，导入界面后重启HMI
    * `NC_PLC-variates.xml`文件
        * 导入位置: `HMI数据 -> 模板 -> 用户 -> 变量表` 或者 `user\sinumerik\hmi\template\variables`
        * 使用: 诊断 -> NC/PLC变量 -> 载入变量表
    * 若在线帮助hlp进行了修改，需删除`siemens\sinumerik\sys_cache\hmi\`目录下hlp文件夹，重启HMI

## Quick Links

* [参数含义索引表](https://github.com/nie11kun/Programing_NC/blob/master/Source_Library/Parameter_Index.md)
* [M代码标准](https://github.com/nie11kun/Programing_NC/blob/master/Source_Library/M-sympol_Index.md)
* [wiki百科](https://github.com/nie11kun/Programing_NC/wiki)
* [更新历史及下载](https://github.com/nie11kun/Programing_NC/releases)
* [SinuTrain配置样例](https://github.com/nie11kun/Programing_NC/wiki/SinuTrain导出文件样例)
* [出厂机床信息](https://github.com/nie11kun/Programing_NC/blob/master/Source_Library/Sell_Log.md)

## Contribute

* Group Members: [Marco Nie](https://github.com/nie11kun), [zhituaishangc](https://github.com/zhituaishangc), [guanzhenhao](https://github.com/guanzhenhao), [wangting3215](https://github.com/wangting3215)
* [Develop Stats](https://nie11kun.github.io/Programing_NC/)-->*截止 2017-01-24 08:40:45*
---
* As the project still in develop, there may have some bugs or unfriend parts, we are keeping in touch on it.
* Group members has promission to join develops, if you'd have any suggestion or idea, just let us know and pull you request.
* [反馈通道](https://github.com/nie11kun/Programing_NC/issues)(请详细描述问题或意见细节)

## Contact

* Email: nie11kun@outlook.com
* Follow me at [Twitter](https://twitter.com/marco_nie). [Weibo](https://weibo.com/nie11kun). [Instagram](https://www.instagram.com/marco_nie_/). [Facebook](https://www.facebook.com/nie11kun)
* My Blog: [niekun.ml](https://marcosvps.ml)


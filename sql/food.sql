/*
Navicat SQL Server Data Transfer

Source Server         : localhost2
Source Server Version : 110000
Source Host           : :1433
Source Database       : takeout
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2023-01-31 22:47:48
*/


-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE [dbo].[food]
GO
CREATE TABLE [dbo].[food] (
[name] nvarchar(MAX) NOT NULL ,
[intro] nvarchar(MAX) NULL ,
[price] float(53) NOT NULL ,
[num] int NULL ,
[buyNum] int NULL ,
[pic] nvarchar(MAX) NULL ,
[type] int NOT NULL 
)


GO

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'糟卤鸭掌鸭信', N'糟卤汁充分浸入鸭掌和鸭信，是席上的佐酒佳品', N'36', N'17', N'2', N'1', N'1')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'冰镇木瓜盅', N'选木瓜与阿胶入水，加入纯正老山蜂蜜炖煮一盅', N'18', N'20', N'0', N'2', N'1')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'小葱河虾仁炖蛋', N'家常菜', N'38', N'3', N'6', N'3', N'1')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'荷塘月色', N'虾仁嫩藕四季豆茭白与虾仁爆炒起香', N'36', N'15', N'3', N'4', N'1')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'老味道熏鱼', N'炸制后用冰凉卤汁浸泡口感甘香正宗老味道', N'28', N'19', N'1', N'5', N'2')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'招牌盐水鸭', N'炒盐复卤挂凉浸渍十多道工序招牌之菜', N'28', N'20', N'0', N'6', N'2')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'花雕冰醉龙虾', N'家常菜', N'158', N'20', N'0', N'7', N'2')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'老坛酱香肉', N'家常菜', N'28', N'20', N'0', N'8', N'2')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'砂锅花生脆芽', N'家常菜', N'38', N'18', N'0', N'9', N'3')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'招牌虾黄豆腐', N'鲜嫰虾仁点缀香葱与鸡蛋蒸制，香软滑嫩', N'28', N'20', N'0', N'10', N'3')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'金蒜铁板烤大虾', N'家常菜', N'68', N'20', N'0', N'11', N'3')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'酥香芝麻鱼排', N'家常菜', N'42', N'20', N'0', N'12', N'3')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'清炖狮子头', N'家常菜', N'28', N'20', N'0', N'13', N'4')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'鸭血粉丝砂锅', N'家常菜', N'25', N'20', N'0', N'14', N'4')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'鱼汤手擀面', N'家常菜', N'18', N'20', N'0', N'15', N'5')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'酒酿赤豆元宵', N'家常菜', N'6', N'20', N'0', N'16', N'5')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'状元大春卷', N'以春卷皮包裹春韭香干虾皮入锅炸至金黄', N'16', N'20', N'0', N'17', N'6')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'石婆婆麻团', N'家常菜', N'5', N'20', N'0', N'18', N'6')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'金牌煎饺', N'家常菜', N'12', N'20', N'0', N'19', N'6')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'金牌梅香排骨', N'传统特色名菜排骨入口香甜', N'58', N'20', N'0', N'20', N'7')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'冰镇酒酿', N'家常菜', N'6', N'20', N'0', N'21', N'7')
GO
GO
INSERT INTO [dbo].[food] ([name], [intro], [price], [num], [buyNum], [pic], [type]) VALUES (N'鸡汁回卤干', N'家常菜', N'17', N'12', N'0', N'22', N'7')
GO
GO

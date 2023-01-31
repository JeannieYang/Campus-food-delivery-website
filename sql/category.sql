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

Date: 2023-01-31 22:47:43
*/


-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE [dbo].[category]
GO
CREATE TABLE [dbo].[category] (
[type] int NOT NULL ,
[sort] nvarchar(MAX) NOT NULL 
)


GO

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'1', N'时令菜')
GO
GO
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'2', N'烧卤冷味')
GO
GO
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'3', N'秦淮小厨')
GO
GO
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'4', N'传家煲')
GO
GO
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'5', N'淮阳戏点')
GO
GO
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'6', N'煎炸小杂件')
GO
GO
INSERT INTO [dbo].[category] ([type], [sort]) VALUES (N'7', N'金陵什锦')
GO
GO

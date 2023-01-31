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

Date: 2023-01-31 22:48:08
*/


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE [dbo].[user]
GO
CREATE TABLE [dbo].[user] (
[userName] nvarchar(MAX) NOT NULL ,
[userPwd] nvarchar(MAX) NOT NULL ,
[phone] nvarchar(MAX) NOT NULL ,
[mail] nvarchar(MAX) NOT NULL ,
[address] nvarchar(MAX) NOT NULL ,
[identity] nvarchar(MAX) NOT NULL 
)


GO

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO [dbo].[user] ([userName], [userPwd], [phone], [mail], [address], [identity]) VALUES (N'admin', N'123456', N'15152394850', N'admin@qq.com', N'南京', N'管理员')
GO
GO
INSERT INTO [dbo].[user] ([userName], [userPwd], [phone], [mail], [address], [identity]) VALUES (N'aaa', N'123456', N'17283829304', N'aaa@qq.com', N'上海', N'用户')
GO
GO
INSERT INTO [dbo].[user] ([userName], [userPwd], [phone], [mail], [address], [identity]) VALUES (N'bbb', N'123456', N'13962350537', N'981471905@qq.com', N'明日星城绿山路47号菜鸟驿站', N'用户')
GO
GO

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

Date: 2023-01-31 22:47:36
*/


-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE [dbo].[address]
GO
CREATE TABLE [dbo].[address] (
[No] int NOT NULL ,
[Name] char(10) NOT NULL ,
[Sex] char(10) NOT NULL ,
[Number] char(11) NOT NULL ,
[Dizhi] varchar(100) NOT NULL ,
[Province] char(10) NOT NULL ,
[City] char(10) NOT NULL ,
[Area] char(10) NOT NULL 
)


GO

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO [dbo].[address] ([No], [Name], [Sex], [Number], [Dizhi], [Province], [City], [Area]) VALUES (N'1', N'erfg      ', N'先生      ', N'sas        ', N'qw', N'江苏省    ', N'南京市    ', N'江宁区    ')
GO
GO
INSERT INTO [dbo].[address] ([No], [Name], [Sex], [Number], [Dizhi], [Province], [City], [Area]) VALUES (N'2', N'admin     ', N'先生      ', N'12323245674', N'fea大赛', N'江苏省    ', N'南京市    ', N'江宁区    ')
GO
GO

-- ----------------------------
-- Indexes structure for table address
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table address
-- ----------------------------
ALTER TABLE [dbo].[address] ADD PRIMARY KEY ([No])
GO

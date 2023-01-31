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

Date: 2023-01-31 22:47:53
*/


-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE [dbo].[help]
GO
CREATE TABLE [dbo].[help] (
[name] nvarchar(MAX) NOT NULL ,
[mail] nvarchar(MAX) NOT NULL ,
[info] nvarchar(MAX) NOT NULL 
)


GO

-- ----------------------------
-- Records of help
-- ----------------------------
INSERT INTO [dbo].[help] ([name], [mail], [info]) VALUES (N'小王', N'1920371829@qq.com', N'继续加油！')
GO
GO

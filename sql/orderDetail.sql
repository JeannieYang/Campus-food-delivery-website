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

Date: 2023-01-31 22:48:03
*/


-- ----------------------------
-- Table structure for orderDetail
-- ----------------------------
DROP TABLE [dbo].[orderDetail]
GO
CREATE TABLE [dbo].[orderDetail] (
[orderId] nchar(16) NOT NULL ,
[name] nvarchar(MAX) NOT NULL ,
[nowPrice] float(53) NOT NULL ,
[buyNum] int NOT NULL 
)


GO

-- ----------------------------
-- Records of orderDetail
-- ----------------------------
INSERT INTO [dbo].[orderDetail] ([orderId], [name], [nowPrice], [buyNum]) VALUES (N'1000001523564953', N'荷塘月色', N'36', N'1')
GO
GO
INSERT INTO [dbo].[orderDetail] ([orderId], [name], [nowPrice], [buyNum]) VALUES (N'1000001523564953', N'小葱河虾仁炖蛋', N'38', N'1')
GO
GO

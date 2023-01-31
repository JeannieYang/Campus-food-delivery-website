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

Date: 2023-01-31 22:47:58
*/


-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE [dbo].[order]
GO
CREATE TABLE [dbo].[order] (
[orderId] nchar(16) NOT NULL ,
[userId] nchar(10) NOT NULL ,
[orderTime] datetime NOT NULL ,
[totalPrice] float(53) NOT NULL 
)


GO

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO [dbo].[order] ([orderId], [userId], [orderTime], [totalPrice]) VALUES (N'1000001523564953', N'admin     ', N'2020-09-11 12:08:10.907', N'74')
GO
GO

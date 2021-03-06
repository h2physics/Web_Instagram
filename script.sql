USE [Instagram]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [varchar](20) NOT NULL,
	[fullname] [nvarchar](20) NULL,
	[username] [varchar](20) NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](32) NULL,
	[gender] [bit] NULL,
	[phone_number] [varchar](15) NULL,
	[website] [varchar](30) NULL,
	[biography] [nvarchar](1000) NULL,
	[avatar] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1521169500582', N'Gia Loc', N'locng', N'locng@gmail.com', N'Abc12345', 0, N'0985347232', N'loc.github.io', N'FPT University', NULL)
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1521169500583', N'admin', N'admin', N'admin@gmail.com', N'admin', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1521169518395', N'Dac Sang', N'sangnd', N'sangnd@gmail.com', N'Abc12345', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1521169555438', N'Van Hung', N'h2physics', N'hungnvdev42@gmail.com', N'Abc12345', 0, N'01693475700', N'h2physics.github.io', N'FPT University', NULL)
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1521535932972', N'Phong Pham', N'phongpham', N'phongpv@gmail.com', N'Abc12345', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1521963247222', N'Vu Thi Ngoc Vien', N'vienvtn', N'vienvtn@gmail.com', N'Abc12345', 1, N'0983757121', N'vienvtn.github.io', N'                                                                                I''m an April girl                                        
                                    
                                    
                                    ', N'https://docs.google.com/uc?id=1Y95QkW9FiZ6Gd-5SRbICFKGiM-fiAwon')
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1522119163531', N'Lan Anh', N'lananh', N'lananh@gmail.com', N'Abc12345', 1, N'', N'', N'                                        
                                    ', N'https://docs.google.com/uc?id=1H_RUObU4VlEUHAoUYcKH6ntkpsco0yRt')
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1522135482727', N'Hoàng Thùy', N'pippitatdai', N'hoangthuy.ftu@gmail.com', N'Abc12345', 1, N'', N'hoangthuy.github.io', N'                                        
                                    ', N'https://docs.google.com/uc?id=1XDANbPVSVN9R9mNWggWeXlsytv0s9sj1')
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1522135699326', N'VSBG.ME', N'vsbg.official', N'vsbg.official@gmail.com', N'Abc12345', 0, N'', N'vsbg.me', N'Vietnamese Sexy Bae Group                                      
                                    ', N'https://docs.google.com/uc?id=1hrI-6Jb3IlaMiwwMgmxwfnQSNO9EezUy')
INSERT [dbo].[Users] ([id], [fullname], [username], [email], [password], [gender], [phone_number], [website], [biography], [avatar]) VALUES (N'1522136037548', N'Đỗ Thu Phương', N'thuphuong', N'thuphuong@gmail.com', N'Abc12345', 1, N'', N'', N'Phương6789❤️ chuyên sỉ lẻ lens Hàn Vassen💰 giá tốt, chất lượng👍                            
                                    ', N'https://docs.google.com/uc?id=1TIwVawv8WyDYPE-vFSYKwSb9n9hhg64y')
/****** Object:  Table [dbo].[Test]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[birthday] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[birthday] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Test] ([birthday]) VALUES (CAST(0x0000A8B000E9D6BA AS DateTime))
INSERT [dbo].[Test] ([birthday]) VALUES (CAST(0x0000A8B000E9EA6F AS DateTime))
/****** Object:  Table [dbo].[Role]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[uid] [varchar](20) NOT NULL,
	[role] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1521169500582', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1521169500583', N'admin')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1521169518395', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1521169555438', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1521535932972', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1521963247222', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1522119163531', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1522135482727', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1522135699326', N'user')
INSERT [dbo].[Role] ([uid], [role]) VALUES (N'1522136037548', N'user')
/****** Object:  Table [dbo].[Relationship]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relationship](
	[uid] [varchar](20) NOT NULL,
	[friend_id] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[friend_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169500582', N'1521169518395')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169500582', N'1521169555438')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169500582', N'1521535932972')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169555438', N'1521169500582')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169555438', N'1521169518395')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169555438', N'1521535932972')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521169555438', N'1521963247222')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521963247222', N'1522119163531')
INSERT [dbo].[Relationship] ([uid], [friend_id]) VALUES (N'1521963247222', N'1522135482727')
/****** Object:  Table [dbo].[Post]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[id] [varchar](20) NOT NULL,
	[uid] [varchar](20) NULL,
	[image] [varchar](500) NULL,
	[time] [datetime] NULL,
	[content] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522133313180', N'1521963247222', N'https://docs.google.com/uc?id=17mdMpQpF5AHd8if03FTBMpdU91AR4cZ1', CAST(0x0000A8B000000000 AS DateTime), N'Hạ buông mình trên góc sân vắng, nắng trải dài trên những ngả đường, những tán lá vàng còn dư âm lại của giao mùa. Ta ngồi đây lắng nghe tháng tư ùa về, nhẹ nhàng và bất chợt…🍂🍂🍂Mùa này nỗi nhớ phiêu linh, lòng người như có gió lùa trôi không hạn định. . . Nắng lang thang hoang hoải lạc đường tìm riêng hạnh phúc, để lại con khoảng trời bơ vơ, để lại phố vắng thẫn thờ... lòng người chênh vênh... Hạ hôm nay vẫn thơm mùi năm tháng cũ... chỉ tiếc rằng góc phố đã vắng ai :))')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522133395869', N'1521963247222', N'https://docs.google.com/uc?id=1Kn0gbHDfocC_JIq1XOWSbV1V0HPNHHdh', CAST(0x0000A8B000000000 AS DateTime), N'Một ngày giờ mới xong xuôi mọi việc ngoài kia để về tới nhà... Thấy buýt cũng chẳng buồn chạy đuổi theo xe  Ngồi xe buýt dù trai hay gái đều thấy họ mang 1 túi quà :))) Xuống buýt thấy ven đường người người tấp nập dễ sợ... người đi chơi, nhưng nhiều nhất là ng bán hoa 😅 Mọi quán bán đồ ăn đều nghỉ khiến chẳng mua nổi đồ ăn huống chi chẳng muốn ăn Quán bún đầu ngõ hôm nay cũng không bán  Chỗ mọi hôm thấy đông hôm nay sẽ vắng, mọi hôm vắng khách hôm nay sẽ đông... Sau ngày 8/3 dài thứ bạn cần nhất chỉ là 1 giấc ngủ mà ko có tiếng báo thức... thôi xàm quá ...🤣🤣🤣 À quên chúc chị, em, cô, dì, bạn bè gần xa 8/3 vui vẻ :))) ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522134908293', N'1521963247222', N'https://docs.google.com/uc?id=1bOZvvIefRllAH7JjJsumoc7p8qIw7wUQ', CAST(0x0000A8B000EADEE8 AS DateTime), N'Bầu trời chẳng vì bất cứ ai mà xanh :)))')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522135420302', N'1522119163531', N'https://docs.google.com/uc?id=1U_5j90Yus9UVN5qew9vBwUv7ZeW1ikLO', CAST(0x0000A8B000ED36EB AS DateTime), N'Về chăm trai ốm mà chị ốm theo luôn 😔😔😔')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522135500564', N'1522135482727', N'https://docs.google.com/uc?id=1cIHmP9IIrz04FSwWViYF2eOf94i313xM', CAST(0x0000A8B000ED94F9 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522135730638', N'1522135699326', N'https://docs.google.com/uc?id=1CPJaQyLy_jBUxXqjmZM7qx3y6ZiYP1oV', CAST(0x0000A8B000EEA297 AS DateTime), N'Thề vs các ông Nhìn cái link fb đã thấy yêu rồi <3 Fb mẫu: Thuỷ Thanh Nguyễn Link: https://www.facebook.com/thuybexiuxiu')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522135848983', N'1522135699326', N'https://docs.google.com/uc?id=12DU_XeBVvqOORkt1fVZSnOsrJb_8mrLE', CAST(0x0000A8B000EF2D47 AS DateTime), N'Sơ mi trắng <3 Fb mẫu: Nguyễn Việt Phương Thảo Link fb dưới cmt nhé')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522135925968', N'1522135482727', N'https://docs.google.com/uc?id=1bOVMi6eHdw-e_OqbVPVtzH7FWM2zs6lj', CAST(0x0000A8B000EF877E AS DateTime), N'')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522135948660', N'1521963247222', N'https://docs.google.com/uc?id=1JdGy3O_1cw_yBPV5RXFgarovhtNRj9dP', CAST(0x0000A8B000EFA216 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136007193', N'1522135699326', N'https://docs.google.com/uc?id=1Qy9nrg_UxQ6M3vs6pJLaGL9srZ4toRs4', CAST(0x0000A8B000EFE6AE AS DateTime), N'Có trái tim tựa như tiếng đàn làm tôi yêu siết bao Fb mẫu: Huỳnh Ngọc Phương Dung Link fb dưới cmt nhé')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136100352', N'1522136037548', N'https://docs.google.com/uc?id=1YHPGEt9aL0gcAyQg7a7fuUTd9WP_v2nd', CAST(0x0000A8B000F053DA AS DateTime), N'Thế này đã đủ đánh iu chưa❤️😆')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136126008', N'1521963247222', N'https://docs.google.com/uc?id=1GKs9v2BxRlrzdOlKPv2qYjDywH3uqS7g', CAST(0x0000A8B000F071EA AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136152061', N'1522135699326', N'https://docs.google.com/uc?id=1UPjDE1RwoB5MtV9br2YEQg-bnq7OF8do', CAST(0x0000A8B000F09072 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136162889', N'1522135699326', N'https://docs.google.com/uc?id=1qktBxT7KsNwHsErwgl8PN54AQavP0wGZ', CAST(0x0000A8B000F09D23 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136180599', N'1522135482727', N'https://docs.google.com/uc?id=1xnhZeOJ9yPv-GyTjpFaPglXHIrRA9CDS', CAST(0x0000A8B000F0B1E4 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136234481', N'1522136037548', N'https://docs.google.com/uc?id=1fv-010wnPPCJENztyk-yeDmkJha9W2-M', CAST(0x0000A8B000F0F108 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136275591', N'1522135699326', N'https://docs.google.com/uc?id=1D5g-drcU3CRXBYIvHmZfBQd1o6ShwIyQ', CAST(0x0000A8B000F12135 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136298758', N'1522135699326', N'https://docs.google.com/uc?id=1sRmmgHhQbXmOxOUWP8kulUqtmgdphzjg', CAST(0x0000A8B000F13C5B AS DateTime), N'Thần thái')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136339654', N'1522135482727', N'https://docs.google.com/uc?id=1OdPoozqcFp70jskf9ykaCxqjCrvB5ItX', CAST(0x0000A8B000F16C48 AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136385536', N'1522136037548', N'https://docs.google.com/uc?id=1ahKz_eN4F1ON6PakA8-x4xOQFlgd9wue', CAST(0x0000A8B000F1A20D AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136476318', N'1521963247222', N'https://docs.google.com/uc?id=14MZ-r3hnpuPYF24ahoayJSJ93n_p3dgx', CAST(0x0000A8B000F20C6F AS DateTime), N' ')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136512059', N'1522135699326', N'https://docs.google.com/uc?id=1UVtDi2nqGDIwrPOAjTA8-7ggLijNoUqW', CAST(0x0000A8B000F23652 AS DateTime), N'Đi tù hông???')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136581822', N'1522135699326', N'https://docs.google.com/uc?id=1FTwbXpN8TBt2BAIm-erxKdPeAxPo_NAR', CAST(0x0000A8B000F28813 AS DateTime), N'hấy bảo con gái ăn nhiều bánh đậu xanh sẽ rất xinh :3 Chắc đúng :3 Fb mẫu : Tăng Thị Phượng Link fb dưới cmt nhé')
INSERT [dbo].[Post] ([id], [uid], [image], [time], [content]) VALUES (N'1522136600575', N'1522136037548', N'https://docs.google.com/uc?id=1V7FL3Qc-TUvD4yBt2ppE69eTLr1_nLEk', CAST(0x0000A8B000F29E0D AS DateTime), N' ')
/****** Object:  Table [dbo].[Favorite]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Favorite](
	[uid] [varchar](20) NOT NULL,
	[post_id] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 03/27/2018 14:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [varchar](20) NOT NULL,
	[uid] [varchar](20) NULL,
	[post_id] [varchar](20) NULL,
	[content] [nvarchar](200) NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__Comment__post_id__173876EA]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
/****** Object:  ForeignKey [FK__Comment__uid__182C9B23]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Favorite__post_i__1920BF5C]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
/****** Object:  ForeignKey [FK__Favorite__uid__1A14E395]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Post__uid__1B0907CE]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Relations__frien__1BFD2C07]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD FOREIGN KEY([friend_id])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Relationshi__uid__1CF15040]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Role__uid__1DE57479]    Script Date: 03/27/2018 14:45:31 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO

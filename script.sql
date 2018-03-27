USE [Instagram]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/27/2018 09:28:05 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 03/27/2018 09:28:05 ******/
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
/****** Object:  Table [dbo].[Relationship]    Script Date: 03/27/2018 09:28:05 ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 03/27/2018 09:28:05 ******/
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
	[time] [date] NULL,
	[content] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 03/27/2018 09:28:05 ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 03/27/2018 09:28:05 ******/
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
	[time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__Comment__post_id__5070F446]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
/****** Object:  ForeignKey [FK__Comment__uid__4F7CD00D]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Favorite__post_i__5FB337D6]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
/****** Object:  ForeignKey [FK__Favorite__uid__5EBF139D]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Post__uid__4AB81AF0]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Relations__frien__5629CD9C]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD FOREIGN KEY([friend_id])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Relationshi__uid__5535A963]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
/****** Object:  ForeignKey [FK__Role__uid__6E01572D]    Script Date: 03/27/2018 09:28:05 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO

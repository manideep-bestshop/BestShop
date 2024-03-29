USE [bestshop1]
GO
/****** Object:  Table [dbo].[books]    Script Date: 11-02-2024 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[authors] [varchar](255) NOT NULL,
	[isbn] [varchar](20) NOT NULL,
	[num_pages] [int] NOT NULL,
	[price] [decimal](16, 2) NOT NULL,
	[category] [varchar](180) NOT NULL,
	[description] [text] NOT NULL,
	[image_filename] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 11-02-2024 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](100) NOT NULL,
	[lastname] [varchar](100) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[subject] [varchar](250) NOT NULL,
	[message] [text] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 11-02-2024 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](16, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11-02-2024 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[shipping_fee] [decimal](16, 2) NOT NULL,
	[delivery_address] [varchar](255) NOT NULL,
	[payment_method] [varchar](50) NOT NULL,
	[payment_status] [varchar](20) NOT NULL,
	[order_status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_resets]    Script Date: 11-02-2024 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_resets](
	[email] [varchar](150) NOT NULL,
	[token] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11-02-2024 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](100) NOT NULL,
	[lastname] [varchar](100) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[role] [varchar](10) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (2, N'asp.net for beginners', N'gates', N'007700940X', 569, CAST(899.00 AS Decimal(16, 2)), N'Technology', N'asp.net', N'20240130235420945.jpg', CAST(N'2024-01-26T01:28:06.157' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (4, N'economic growth', N'george', N'0045450p', 756, CAST(1600.00 AS Decimal(16, 2)), N'Other', N'finance', N'20240130233933599.jpg', CAST(N'2024-01-30T13:29:41.320' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (7, N'csharp', N'bill gates', N'22334e3', 246, CAST(657.00 AS Decimal(16, 2)), N'Technology', N'', N'20240202205210409.jpg', CAST(N'2024-02-02T20:52:10.487' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (8, N'azure', N'gates', N'776hdh222', 567, CAST(999.00 AS Decimal(16, 2)), N'Technology', N'', N'20240202205254735.jpg', CAST(N'2024-02-02T20:52:54.757' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (1002, N'ICSE Mathematics', N'Viva', N'123e4533', 234, CAST(199.00 AS Decimal(16, 2)), N'Mathematics', N'mathematics', N'20240210205433736.jpg', CAST(N'2024-02-10T20:54:33.820' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (1003, N'the health habit', N'Elizabeth Rider', N'87654323f', 187, CAST(129.00 AS Decimal(16, 2)), N'Medicine', N'health habits', N'20240210205621663.jpg', CAST(N'2024-02-10T20:56:21.680' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (1004, N'Indian History', N'Jankiraman', N'1234re55', 566, CAST(459.00 AS Decimal(16, 2)), N'History', N'whole indian history available in this book', N'20240210205914482.jpg', CAST(N'2024-02-10T20:59:14.643' AS DateTime))
INSERT [dbo].[books] ([id], [title], [authors], [isbn], [num_pages], [price], [category], [description], [image_filename], [created_at]) VALUES (1005, N'Sports', N'Phanindra', N'3445er4231', 120, CAST(68.00 AS Decimal(16, 2)), N'Other', N'Available sports information here', N'20240210210151320.jpg', CAST(N'2024-02-10T21:01:51.353' AS DateTime))
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[messages] ON 

INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (6, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Order Status', N'dddddd', CAST(N'2024-01-25T14:42:18.787' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (7, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Order Status', N'dddddd', CAST(N'2024-01-25T14:46:35.167' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (8, N'', N'Nampally', N'manideep.n15@gmail.com', N'8500091944', N'Order Status', N'jjjjjjj', CAST(N'2024-01-25T14:48:26.723' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (10, N'', N'o', N'oggojukeerthi@gmail.com', N'9182907519', N'Other', N'received damaged product', CAST(N'2024-01-31T13:46:58.623' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (1002, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Refund Request', N'need refund', CAST(N'2024-02-09T12:04:33.220' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (1003, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Refund Request', N'need refund', CAST(N'2024-02-09T12:06:56.050' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (1004, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Refund Request', N'refund ', CAST(N'2024-02-09T12:09:06.830' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (2002, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Job Application', N'please review my job application soon..', CAST(N'2024-02-10T21:02:24.060' AS DateTime))
INSERT [dbo].[messages] ([id], [firstname], [lastname], [email], [phone], [subject], [message], [created_at]) VALUES (2003, N'', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Job Application', N'please review my job application soon..', CAST(N'2024-02-10T21:06:27.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[messages] OFF
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 

INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (1, 1, 2, 1, CAST(899.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (2, 1, 4, 1, CAST(1600.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (3, 1, 7, 1, CAST(657.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (5, 2, 7, 1, CAST(657.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (6, 3, 8, 1, CAST(999.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (7, 4, 8, 2, CAST(999.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (8, 4, 4, 2, CAST(1600.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (9, 5, 8, 1, CAST(999.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (10, 5, 7, 1, CAST(657.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (11, 6, 8, 2, CAST(999.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (12, 6, 4, 1, CAST(1600.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (13, 7, 4, 1, CAST(1600.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (14, 8, 4, 1, CAST(1600.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (15, 8, 2, 1, CAST(899.00 AS Decimal(16, 2)))
INSERT [dbo].[order_items] ([id], [order_id], [book_id], [quantity], [unit_price]) VALUES (16, 9, 8, 1, CAST(999.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (1, 1, CAST(N'2024-02-06T13:20:26.370' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'cash', N'pending', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (2, 1, CAST(N'2024-02-06T16:41:16.833' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'cash', N'pending', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (3, 1, CAST(N'2024-02-06T16:41:54.083' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'credit_card', N'pending', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (4, 1, CAST(N'2024-02-06T16:42:51.617' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'cash', N'canceled', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (5, 1, CAST(N'2024-02-06T16:47:36.053' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'cash', N'accepted', N'delivered')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (6, 1002, CAST(N'2024-02-06T21:38:33.403' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Siddipet', N'cash', N'pending', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (7, 1003, CAST(N'2024-02-06T23:22:55.337' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'cash', N'pending', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (8, 1, CAST(N'2024-02-07T18:32:31.290' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar', N'cash', N'pending', N'created')
INSERT [dbo].[orders] ([id], [client_id], [order_date], [shipping_fee], [delivery_address], [payment_method], [payment_status], [order_status]) VALUES (9, 5, CAST(N'2024-02-09T16:40:21.177' AS DateTime), CAST(5.00 AS Decimal(16, 2)), N'Karimnagar,Telangana', N'cash', N'accepted', N'delivered')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [phone], [address], [password], [role], [created_at]) VALUES (1, N'manideep', N'nampally', N'manideep.n15@gmail.com', N'8500091944', N'Karimnagar', N'AQAAAAIAAYagAAAAEPGCetQYmCEKbGByoQgieZmmd9PGmClEuvmtiyAXtd0quUFJMsSkzqaSelB/l1YeUg==', N'admin', CAST(N'2024-01-31T13:27:11.837' AS DateTime))
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [phone], [address], [password], [role], [created_at]) VALUES (4, N'Keerthana', N'Oggoju', N'oggojukeerthi@gmail.com', N'9182907519', N'Siddipet', N'AQAAAAIAAYagAAAAEG8d9EmUPUKCsFSP0yxVhzEOO8RypAHsAdO44aRfyH1BDz67/IH7n8kHKIPDNdzoAw==', N'client', CAST(N'2024-01-31T14:08:42.497' AS DateTime))
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [phone], [address], [password], [role], [created_at]) VALUES (5, N'Manideep', N'Nampally', N'nmanideep1015@gmail.com', N'8500091944', N'Karimnagar,Telangana', N'AQAAAAIAAYagAAAAEPpfXcCYooIzEBf48DvRAzzIkPOV9yKJsh8hcGAJmQs/u+i99Ixkm6NSqSukgPvVhw==', N'client', CAST(N'2024-01-31T14:52:34.660' AS DateTime))
INSERT [dbo].[users] ([id], [firstname], [lastname], [email], [phone], [address], [password], [role], [created_at]) VALUES (1003, N'R Sandeep', N'Rondla', N'sandeepreddyrodla.sr@gmail.com', N'9542835468', N'Karimnagar', N'AQAAAAIAAYagAAAAEEmeOvhfeFQnyn80ECrm4Rc54DXMdWhlJDX+vpQgBNa57rc4h/clqc+csyZdBbakZg==', N'client', CAST(N'2024-02-06T23:21:14.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164274A1BDE]    Script Date: 11-02-2024 21:13:59 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[messages] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[password_resets] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([order_status]='returned' OR [order_status]='delivered' OR [order_status]='shipped' OR [order_status]='canceled' OR [order_status]='accepted' OR [order_status]='created'))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([payment_status]='canceled' OR [payment_status]='accepted' OR [payment_status]='pending'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='client' OR [role]='admin'))
GO

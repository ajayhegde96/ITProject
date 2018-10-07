SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User] ([Id], [Username], [Password], [Subject], [Role]) VALUES (1, N'admin', N'admin123', N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[User] OFF

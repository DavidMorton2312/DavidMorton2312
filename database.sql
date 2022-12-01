--New Database: DBSportStore
-- Bang AdminUser
CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT            NOT NULL,
    [NameUser]     NVARCHAR (MAX) NULL,
    [EmailUser]     NVARCHAR (MAX) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);
--Bang Category
CREATE TABLE [dbo].[Category] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [IDCate]   NCHAR (20)     NOT NULL,
    [NameCate] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([IDCate] ASC)
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
    [IDCus]    INT            IDENTITY (1, 1) NOT NULL,
    [NameCus]  NVARCHAR (MAX) NULL,
    [PhoneCus] NVARCHAR (15)  NULL,
    [EmailCus] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([IDCus] ASC)
);
--Bang Products
CREATE TABLE [dbo].[Products] (
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [NamePro]       NVARCHAR (MAX)  NULL,
	[NameCPU]		varchar(30) NULL,
	[Core]			varchar(6) NULL ,
	[Thread]			varchar(6) NULL ,
	[BusCPU]			varchar(12) NULL ,
	[VGA]			varchar(30) NULL ,
	[Storage]			varchar(15) NULL ,
	[RAM]			varchar(30) NULL ,
	[BusRam]			varchar(12) NULL ,
	[MaxRam]			varchar(15) NULL ,
	[Resolution]			varchar(15) NULL ,
	[Nen]			varchar(6) NULL ,
	[Monitor]			varchar(6) NULL ,
	[Port]			varchar(100) NULL ,
	[Webcam]			varchar(30) NULL ,
	[KeyboardLight]			varchar(20) NULL ,
	[Tinhnangkhac]			varchar(30) NULL ,
    [DecriptionPro] NVARCHAR (MAX)  NULL,
    [IDCate]      NCHAR (20)      NULL,
    [Price]         DECIMAL (18, 0) NULL,
    [ImagePro]      NVARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([IDCate]) REFERENCES [dbo].[Category] ([IDCate])
);
--Bang OrderPro
CREATE TABLE [dbo].[OrderPro] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [DateOrder]        DATE           NULL,
    [IDCus]            INT            NULL,
    [AddressDeliverry] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDCus]) REFERENCES [dbo].[Customer] ([IDCus])
);
--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [IDProduct] INT        NULL,
    [IDOrder]   INT        NULL,
    [Quantity]  INT        NULL,
    [UnitPrice] FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDProduct]) REFERENCES [dbo].[Products] ([ProductID]),
    FOREIGN KEY ([IDOrder]) REFERENCES [dbo].[OrderPro] ([ID])
);
USE [PublishingHouseDatabase]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[gender] [int] NOT NULL,
	[IdentityNumber] [nvarchar](11) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[City_Id] [int] NULL,
	[Country_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAuthors]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAuthors](
	[Product_Id] [int] NOT NULL,
	[Author_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ProductAuthors] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC,
	[Author_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ProductType] [int] NOT NULL,
	[Isnb] [nvarchar](13) NOT NULL,
	[PublishDate] [datetime] NOT NULL,
	[NumberOfpages] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Publisher_Id] [int] NOT NULL,
	[Annotation] [nvarchar](500) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 6/17/2020 10:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202006171100542_SecondMigration', N'PublishingHouseFinal.Migrations.Configuration', 0x1F8B0800000000000400ED1CDB6EEBB8F1BD40FF41D0535B9CB5E20405B681BD8B1C1F67D7D8240EE264D1B70346621CA1BAB82215C428FA657DD84FEA2F94BA51BC4AA4AC5CF634382F8EC819CE8DC3E10CE7FCF73FBFCD7E7C8E23E70966284C93B93B9D1CB90E4CFC340893EDDCCDF1C377DFBB3FFEF0C73FCC9641FCECFCDACC3B29E611C804CDDD478C77A79E87FC4718033489433F4B51FA80277E1A7B2048BDE3A3A3BF79D3A907090A97E0729CD94D9EE03086E51FE4CF459AF8708773105DA6018C50FD9D8C6C4AACCE158821DA011FCEDDEBFC3E0AD123A1EFE73447F03C4C4034A9C05CE72C0A01216903A307D7014992628009C1A777086E709626DBCD8E7C00D1ED7E07C9BC071021583372DA4E37E5E9E8B8E0C96B011B547E8E701A5B229C9ED442F244F041A276A91089189744DC785F705D8A72EE9EE5F831CD5C475CEA741165C5B44E394F2AE84F8E6ACE276A25C4988A7F9F9C451EE13C83F304E6382B669470FE2F707F9BFE0326F3248F22965C423019E33E904FD759BA8319DEDFC0879A8955E03A1E0FE78980148C81A9185C25F8E4D875AEC8E2E03E82D41A18616C709AC19F6002338061700D30865952E080A53CA5D585B5CEC30CE1E267B324B141222BD7B904CF1730D9E2C7B9FB57B291CEC36718341F6A2AEE9290EC420283B31C2AA8EC5EF902BCD1C25B980430A3CB927D581BCB4FF58025BE46D457797CCFE095D9994E5F829DCF61861FBF10E5372B17BF6FC3D81E138611DC3DA6C9082AE95E68198330EA5884FC1CB2CA15780AB7E5AE10D65B941BE10646E52071063B4EEF5FABF1F32C8D6FD2887A9EF2F3D74D9A677E2191541EBB05D916620B3A5272A664DDA43453646AAA112D41F5B02D4DE4CF20F7315212550F7EADD6402C55C2105DB7214B1C6FC866E99A79ADD3EF3C0A2A050D3B080AD88F63A06747F63862D30DD9E970CCB5DDEC81810AAFC03F74FE7BD279ED2E86EABC06FFD0798FCE6F431C7529FDF86542AE5A3DC5B25CDCC57DB70DBB5072DF156C9DBC082395798D126E55F1E2FA6107B610F5994037AAB320C82042AF1852D188E0B0A8410C66745185713453E9A708C33B086366C9A4D1412D71ED0C1579E62EAFA562A0D36B107CB8BD777DD4E5B194D568AE9A2B741E816D9BE63924D751E11CD716880408CE684F90B1BAE2857D090B4756F3777976B1749D5F4194933F8E24C57073CF97DCEC69F7EC9F9717ABC5FAFA767943218E651554C2EE500077E68C237F06E55B8BFFF37AFD8BA9F8CF6E6E570B73F9DF2C37EBBB9BC5D24EFA6708A57E580A93DB01D5A59B5F6E99044EC70D5CCCD7903D4C8418EE88D8C8BCB9FB17897E35427A556D1156174C1EDDD16432153964B83163B2BECAF49125DEEDC760554808B0DC3617AC1119160F7D1D75DA08408A0A6D78D666232C053980E1F618EF234E11598CC2B41C8FB078DB2883C73C75C5737D9D7C8111C4D039F3AB8AC002201F04725448367A6022B4EA405CA409066142FD88E02049FC0CEE81D2F9DE2158FB5F541FC1A2280AFC1B88C5A0B43D8905E54BB2E4111037104215FC42156448D0E5B6D22068B65C0F8E361D27A1A016D287A2D1B812496B0E021A4687A244EB04293343913F15ADA9DB9953A219AD7966281A236750347A13ED94E7C982DF465B7A96558EDDC4B50F645C70E62CEFADD51DCCBE747393F9EFF4F3469E9EA1BDB5F60E11E87C7BBF240F9000B34FF432D0B87E43E73F540EB2BB6731319BDF5818CDD5857AEAB6B8ED55D5EDA60AEE69CAE0B34BB0DB118FCE94C5EB2FCEA6AA892FBEDBD8D788E30A87E72345A998524B57229744B085C268B1430258D639DBA36611C4D234DDB9A4F1B6CDAAFCD123ABAF71C0CDFCE2B7F220545CE94474AD58CF09A731B9FC964C43692BC880E5430510814C710D5FA4511E27BAAB7C1734533E6691309FCD71B505611655FBD51C5353E165F134DFCCB188755D5E4AFC983956A65CCB22643E9BE3620AB62C2EE6B339AEBA26CBE2A93FC938669E6085A2D57B92D94B0124BF8B8CF6587DCA8FB5C554518BC1065383BDCCF692B7836E2BBC954A68F0319A56D4819589627490FFA7BAA141C558AA692E20F6AAD142BE8C6AEA2A178BA0FE648E834B13B298B8018BD3A42C57713C955F2C28626B4F1C45EC808501F3F527CE92F921739CB410C562A31FDFCFD668A3E4D13687EE2E60B23DF4B0DFBAEFE2EF24AA98BA4E3ED884CD358859685CDCB094C54D2EDB200BC6482D250A956ECA1C5A036C47517D7F1C48913531E486148465DE73858A0218AD9518F029DE39079B40938FB1B38206EA6043E0B32F436DA1C632A239F0B9A5F765115A6E0F360A294B6515BEB4609A28C5D83A3409AE816A68B08D601E9A8CD940C26A63B3A36B34253389383B35338086E1688724A59CDB5025533C23AA594A2DBE8A23E8D7B0945614A7D0E082A6178534E2AC4EE9F5B7DC4839BE6A8AEB10DA9FC2A0C8EF6DF608C378524C986CFE192DA2908433ED844B90840F10E1AAFCEE1E1F4D8F85669DF7D338E32114448A94A8DC3DC3ABEC151EF384854C7B9FEB58BE6F93BA54922790F98F20937A130E6C42190B2FDF6352CA6494AE12257D455FC9A14D2301F98D47691A3110A1758F4883F34F3178FEB32D261A9B32CA904ACD2BA2AFE7B9FBAF12E6D459FDFD6B0DF6C959674495A7CE91F36FEB959918C872710A69BEBE5D37C5B7E118547B573292317A113EC465F58CFFDB1017F75A5EE9D78E079C0D8AC7F0830E08E6FDBBFA583819E379FBE08341F9BC7D08A3C2E3F683CE023EFEB6F3C92CACCE2B1FB477340FC97EAFBBE7B59CCDF048B7F3CA2D4FD75E84FB45CDAE64697514D2C2E6149BA8A5DD6E7D0A3882C90F7B0BDCE67FAD1EEB3AF233AA410F6B89FE61566C0110918B2CC219B9CA4A59F0EB2C4CFC7007229666F91A6EB26F0BF15174E2C817B82B6E1609E6F93259A923154DB10A56DDC7FAF8EFA1B944AFED6BE5B7D5B8B66EFDA64AEFCC39BF82DE4D72A4F21B379397D1E3BD5F5651A0301F61E445AC485F621FDD8A3AB3DDF6C7E55B18932A173BC4057C93A664A1D857B7A4CE92C22B1A9241EF065F7E78BDA68AA16E712C47D4F19CE1A50CC8CC09F5545046B71E75138BFCA658D49DAA35A5A333A5AA5790FBF67D4AD45C85D6BA67ED8AB695BDB669458558D32FA16E6851A2A6A57515766D4782A6DBA5ABD945B5007DD966DC0AD3DD09A35C43FF905EC38556C5C27807473A85BF5C6F0E6B3AEDF3D6FE8E1445FBC5FB6ABF116C977B21FA56EC6982E1FE2E1B4D6157754228CADC064D250AAE8591D1996F9A57FA995797DC87E8EC8D591FAFA948F46BC2334203B64D2C659C9621B9864F4E63E63FD724E1000AB72D8AE27D51027DEE1CA67356C943DA04050245CD1421F375093108C8217D96E1F001F8980CFB10A1F2FF80A81BD997F13D0C56C93AC7BB1C1396617C1F715EA2082BBAD62FFBA2789A67EB5DF9BF8F8CC10221332CF2F0EBE4731E4601A5FB5C917AD3A028E2953AB75BE8121739DEED9E62BA92BA4574886AF1D130EB16C6BB882043EB64039EE010DAEE10BC805BE0EF9BA7187A24FD8AE0C53EFB12826D066254E368E1C99FC48683F8F987FF01913DDA7963560000, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202006171113558_Ragaca', N'PublishingHouseFinal.Migrations.Configuration', 0x1F8B0800000000000400ED1CDB6EEBB8F1BD40FF41D0535B9CB5E20405DAC0DE458E8FB36B6C120771B2E8DB0123318E505D5C910A6214FDB23EF493FA0BA56E14AF12292B17A4C1797144CE706E1C0E6738E7BFFFFECFECA7E738729E6086C23499BBD3C991EBC0C44F8330D9CEDD1C3FFCF017F7A71F7FFFBBD932889F9DDF9A7927C53C0299A0B9FB88F1EED4F390FF0863802671E867294A1FF0C44F630F04A9777C74F4576F3AF52041E1125C8E33BBC9131CC6B0FC83FCB948131FEE700EA2CB348011AABF93914D89D5B90231443BE0C3B97B9DDF47217A24F4FD92E6089E870988261598EB9C452120246D60F4E03A2049520C3021F8F40EC10DCED264BBD9910F20BADDEF2099F70022046B464EDBE9A63C1D1D173C792D6083CACF114E634B84D3935A489E083E48D42E152211E392881BEF0BAE4B51CEDDB31C3FA699EB884B9D2EA2AC98D629E74905FDC551CDF942AD841853F1EF8BB3C8239C67709EC01C67C58C12CEFF15EE6FD3BFC3649EE451C4924B082663DC07F2E93A4B7730C3FB1BF85033B10A5CC7E3E13C11908231301583AB049F1CBBCE15591CDC47905A03238C0D4E33F8334C6006300CAE01C6304B0A1CB094A7B4BAB0D67998215CFC6C9624364864E53A97E0F902265BFC3877FF4C36D279F80C83E6434DC55D12925D48607096430595DD2B5F80375A780B9300667459B20F6B63F9B91EB0C4D788FA2A8FEF19BC323BD3E94BB0F335CCF0E337A2FC66E5E2F76D18DB63C23082BBC734194125DD0B2D6310461D8B909F4356B9024FE1B6DC15C27A8B7223DCC0A81C24CE60C7E9FD7B357E9EA5F14D1A51CF537EFEBE49F3CC2F2492CA63B720DB426C41474ACE94AC9B94668A4C4D35A225A81EB6A589FC19E43E464AA2EAC1EFD51A88A54A18A2EB366489E30DD92C5D33AF75FA9D4741A5A061074101FB790CF4ECC81E473C64439A2BB731F981FAADC03F55FC8E555C3B83A12AAEC13F55DCA3E2DB10475D3A3E7E9980AA564FB12C175571DF6D832A94DC778552272FC248655EA304535534B87ED8812D447D26D08DEA2C083288D02B064CF4BC3F2C261043155DCC601CAB54FA2982EC0EC29859326974504B5C3B43459EB9CB6BA918E8F41A049F6EEF3D9D6C792CA5289A7BE30A9D4760DBE66C0E495C5438C7553D6198E08CF60419AB1A5EB697B0F05B357F9767174BD7F90D4439F9E348D20337F77CC9CD9E76CFFE6579B15AACAF6F973714E258564125EC0E057047CC38F26750BEB5F8BFAED7BF9A8AFFECE676B53097FFCD72B3BEBB592CEDA47F8650EA87A530B91D50DDA0F9E59649E0745CA7C5E40BD9B24488E18E888DCC9BBB7F92E85723A4F7CE1661755BE4D11D4D26539143861B3326EB8B4A1F59E2457D0C5685DB3DCB6D737D1A9161F18CD751A73DF0A520D086676D6AC1529003186E4FED3EE21481C4284CCBE1078BB70D2A78CC53573CC6D7C93718410C9D33BF4AEF2F00F24120078164A3072642AB0EC4459A601026D48F080E9284CBE01E289DEF1D82B5FF45F5892B8AA2C0BF81588C41DB935850BE244B1E0171032154C12F543185045D6E2B0D8266CBF5E068736B120A6A217D281A8D2B91B4E620A06174284AB4CE76323314C950D19ABA9D39259AD19A6786A231720645A337D14E799E2CF86DB4A56759E5D84D5CFB40C60567CEF2DE5ADDC1EC4B173599FF4E3F6FE4E919DA5B6BEF1081CEB7F74BF2000930FB442F038DEB3774FE43E520BB7B1613B3F98D85D15C5DA8A76E2BD55E55AA6E4ADA9EA6A63DBB04BB1DF1E84C8DBBFEE26CAA02F7E2878D7DC137AE70783E52D47D29B574257227045B288C163B248065D1B23D6A16412C4DD39D4B1A6FDBACCA1F3DB2FA1A07DCCC2F7E2B0F42C5954E44D78AF59C701A93BB6EC93494B6820C58BE3A0011C814B7EE451AE571A2BBB9774133B5601609F3D91C575BDD6551B55FCD3135E55A164FF3CD1C8B58A4E5A5C48F9963656AAF2C42E6B3392EA6FACAE2623E9BE3AA0BAC2C9EFA938C63E60956285ABD2799BD1440F2BBC8688FD5A7FC585B4C15B5186C3035D8CB6C2F793BE8B6C25BA984061FA369451D5899284607F97FAA1B1A548CA59AE60262AF1A2DE4CBA8A62E6AB108EA4FE638B834218B891BB0384DCAEA14C753F9C58222B6D4C451C40E5818305F6EE22C991F32C749EB4E2C36FAF1FD6C8D364A1E6D73E8EE0226DB430FFBD17D177F2751C5D475F2C1266CAE41CC42E3E286A5AC6572D9065930466A2951A87453E6D01A603B8AEAFBE3408AAC892137A4202CF39E2B5454E468ADC4804FF1CE39D8049A7C8C9D153450071B029F7D196A0B359611CD81CF2DBD2F8BD0727BB05148592AABF0A505D34429C6D6A149700D5443836D04F3D064CC0612561B9B1D5DA3299949C4D9A99901340C473B2429E5DC862A99E21951CD526AF1551C41BF86A5B4A23885061734BD28A41167754AAFBF7F46CAF155535C87D0FE1406457E6FB34718C69362C264F38F681185249C69275C82247C800857E577F7F8687A2C74DEBC9F2E180FA12052A444E556185E65AFF076272C64DAFB3AC7F2399BD472923C81CC7F0499D468706047C95878F986915226A3B48828E92B9A440EED0009C86F3C4A07888108AD1B3E1A9C7F88C1F31F6D31D1D8945186546A5E117D3DCFDD7F9630A7CEEA6FDF6BB02FCE3A23AA3C758E9C7F59AFCCC440968B5348F3F5ED5A233E866350ED5D0323B16E34F89496CD9BFD8F212DEE69BCD2AB1D0F3819142FDF071D0FCC6377F5A17032C65BF6C1C782F22DFB10468597EC079D047CF46DE79159589D4F563034E0F1F7C7D83DAFE46B8687B99DF76D79BAF616DC2F6976254BA3A3901626A7D8432DED76EB53C0112C7ED843E036F96BF552D791DF500D7A554BF40FB362078088DC6211CEC83D564A815F6761E2873B10B134CB7770936D5B888FA21347BEC15D71AD4830CF97C94A1D79688A55B0EA3ED6C77F0CCD65796D9F2ABFADC6B545EB37557A67C2F915F46E9220951FB8993C8B1EEFF1B28A0285F908232F6245FAFAFAE856D499EAB63F2EDFC2985489D8212EE0439A9285625FDD923AEB09AF6848068D1B7CEDE1F53A2A86BAC5B11C51C75B869732203327D4533E19DD7AD41D2CF283625177AABE948EB694AA5841AEDBF7295173155AEBDEB42B7A56F6DA8E1515624DB384BA9B45899AD6D555D8B5ED089A5697AE4E17D502F4599B711F4C771B8C720DFD2B7A0D175A150BE31D1CE914FE728D39ACE9B46F5BFBDB5114BD17EFABF746B05DEE79E85BB1A70986FB5B6C34555DD509A1A8711B749428B816464667BEE95CE9675E5D6F1FA2B337667DBC8E22D1AF096F080DD836B19471FA85E4023E398D99FF2693840328DCB6288AC74509F4B97398CE59250F6913140814355384CCD725C4202087F45986C307E06332EC4384CAFFEFA1EE625FC6F7305825EB1CEF724C5886F17DC4798922ACE85ABF6C8AE2699EAD77E5FF3432060B84CCB048C3AF93AF79180594EE7345EA4D83A28857EAD46EA14B5CA478B77B8AE94A6A15D121AAC547C3AC5B18EF22820CAD930D78824368BB43F0026E81BF6FDE61E891F42B8217FBEC5B08B61988518DA385277F121B0EE2E71FFF071A453C532D560000, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202006171602357_Ragaca2', N'PublishingHouseFinal.Migrations.Configuration', 0x1F8B0800000000000400ED1CDB6EEBB8F1BD40FF41D0535B9CB5E30405DAC0DE458E8FB36B6C120771B2E8DB0123D18E505D5C910A6214FDB23EF493FA0BA52E94789548594E8234382F8EC819CE8DC3E10CE7FCF7DFFF99FEF41285CE334C5190C43377323A711D187B891FC4DB999BE1CD0F7F717FFAF1F7BF9B2EFCE8C5F98DCE3BCBE711C818CDDC278C77E7E331F29E6004D0280ABC3441C9068FBC241A033F199F9E9CFC753C998C2141E1125C8E33BDCB621C44B0F883FC394F620FEE7006C2EBC48721AABE93917581D5B90111443BE0C1997B9B3D86017A22F4FD9264085E063108472598EB5C84012024AD61B8711D10C7090698107CFE80E01AA749BC5DEFC80710DEEF7790CCDB8010C18A91F366BA294F27A7394FE30690A2F2328493C812E1E4AC12D25804EF256AB7162211E382881BEF73AE0B51CEDC8B0C3F25A9EB884B9DCFC3349FD62AE75109FDC551CDF9525B0931A6FCDF17679E85384BE12C86194EF319059CF72BDCDF277F87F12CCEC2902597104CC6B80FE4D36D9AEC608AF777705331B1F45D67CCC38D45C01A8C8129195CC6F8ECD4756EC8E2E03184B53530C258E324853FC318A60043FF16600CD338C7010B794AAB0B6B5D0629C2F94FBA24B141222BD7B9062F5730DEE2A799FB67B2912E8317E8D30F15150F7140762181C169061554B6AF7C05DE68E12D8C7D98D6CB927D5819CBCFD580253E2AEA9B2C7A64F0CAEC4C26C760E76B90E2A76F44F974E5FCF77D10D963C23084BBA7241E4025ED0B2D2210842D8B909F7D56B901CFC1B6D815C27AF36223DCC1B01824CE60C7E9FD7B397E9926D15D12D69EA7F8FC7D9D64A9974B2491C7EE41BA85D8828E849C29693B29748A4C4D39A225A81AB6A589FCE9671E464AA2AAC1EFE51A88A54A18AAD7A56489E3946C96AEE9B871FAAD4741A9A07E07410EFB790C74ECC80E47DC67439A2B979A7C4FFD96E09F2A7EC72AAE9C415F1557E09F2AEE50F17D80C3361D9F1E27A0BA606E012D81C351D6AE4C235F968BE8B8EFB6011D8A1FDBC2B8B3A330529AF620815C1989AE363BB085A8CBFC3A74EBFB2944E81583B53AD6382C1E11C3245DBC621C2795FAC903FC16C298593269F5A096B866868A3C7377DB50D1D3E152049F2EF73D9DAA5924A547E89D75892E43B06DF24587244D4A9CC3AA9E304C70867B828C550D2FDB6B98FBAD8ABFEB8BAB85EBFC06C28CFC7122E9819B7BB9E0664FDA67FFB2B85ACE57B7F78BBB1AE254564129EC16057047CC30F26750BEB5F8BFAE56BF9A8AFFE2EE7E393797FFDD62BD7AB89B2FECA47F8150E2058530B91D50DEDEF9E516B1EFB45CE5C5C40FD9B24488C18E888DCC9BB97F92E85723ACEFBC0DC2F2A6CAA33B198D2622870C37664C5697A42EB2C424C110AC0A9905965B7A751B9061F18CD751A73DF0A520D086676D5AC352903D186E4EED2EE21481C4204CCBE1078BB7092A78CC13573CC657F13718420C9D0BAF2C2DCC01F2802F078164A3FB26422B0FC479126310C4B51F111C240997C123503ADF07042BFF8BAA135714458E7F0DB118833627B1A07C49963C02E20602A8829FAB620A09BAD8561A0474CB75E068F27A128ADA42BA50508D2B9134E620A06174284AB4CAB43233148958D19ADA9D794D34A3B5B1190A6AE40C0AAA37D14E799E2CF8A5DAD2B3AC72EC26AEBD27E3823367796FACEE60F6A58B9ACC7FAB9F37F2F40CED8DB5B78840E7DBBB25798004987DA29781C6F51B3AFFBE7290DD3D8B89D9FCC6C2A05797DA533755F2715926A7E5F4B1A69E3EBD06BB1DF1E84C7DBDFAE2ACCBE2FAFC87B57DB1392A718C3DA4A839D7D4D62B913B21D8426134DF213E2C0AA6CD5133F723699AEE5CD2785BBA2A7FF4C8EAA30E98CECF7F2B0F42C5954E44D788F592701A91BB6EC13494B6820C58BC7800214815B7EE79126651ACBBB9B7413375681609F3D91C5753596651355FCD31D152318B877E33C72216887929F163E65899BA2F8B90F96C8E8BA9FCB2B898CFE6B8AAE22E8BA7FA24E3988E052B14AD7E2C99BD1440F2BBC8688F55A7FC505B4C15B5186C3035D871B697BC1D745BE1AD5452071F8369451D5899284607F97FAA9B3AA8184A35F40262AF1A2DE471545315D45804D527731C6C758C45C47E37C7C6251D5974DC80C5D954D4BA3809155F2C28620B571C45EC80C576E08B57DCBEE0872C7440AB589C02E8C7F7B3D19A987BB0ADA6BB59986C363DEC47F784FC0D4715A157A90C9B20BC02310BB4F3FB9AB232CAE52E64C118A9A540A1D24D9191A3C0761455B7D19E14591343EE5B7E5064519728AFEFD59517033EC51B6C6F13A0D91D3B2BA050071B029FCBE96B0B159601CD81CF54BD2F8BD0727BB05148392FAB60A801D3C43CC6D6A14997F55403C536807968F26F3D09AB8CCD8EAEC194CCA4F5ECD4CC001A06B72D929432787D955CE31950CD52A2F2551C41B786A524A538A50E2EEA64A590949C5609C2EE4E202963584E711D42FB73E0E7D9C2F51E61188DF209A3F53FC279189070A699700DE26003112E8BF9EEE9C9E454E8217A3FFD3C6384FC509160959B7A7895BDC24BA0209769E75B1FCBC77152F34CFC0C52EF09A452CBC481BD3143E1E55B5F0A990CD2ECA2A42F6F7739B497C527BFF120BD2C0622B46E5DA138FF1081973FDA62AA6353461952E17A49F4F53273FF59C09C3BCBBF7DAFC0BE38AB94A8F2DC3971FE65BD321303592E5E439AAF6FD7E4F1311C836AEF1A188975CBC4A7B46CBA0F3E86B4B847FE4AAF76DAE36490DFF06B1CA63D6AC513FD5E270FF32A5F7DDE9C0DF1E8BEF789A37C74DF8751E1C9FD41870C1FD8DB397B1656E7EE150CF578A5FE3136E62BB9B1FE1174EB555E9EAEBD60774B9A5DC9D2E86A480B9353ECA18676BBF56BC0012CBEDF8BE526AF6CF5A4D8911F7BF57AFE4BF40FD37C0780905C90114EC91559CAAEDFA641EC053B10B234CBD77B936D9B8BAF46278E7C83BBFCC612639E2F93955A52DC3556C1AABB581FFED5369740B67D53FDB61AD756D7DF54E9ADB9EC57D0BB49EE557E8967F27E7BB857D62A0A14E6238C1CC58AF40F0106B7A2D62CBAFD71F916C6A4CAF1F671011FD2942C14FBEA96D45AAA78454332E830E1CB1AAFD7FAD1D72D0EE5885A9E491CCB80CC9C5047656670EB51B7DAC82F9F45DDA91A685AFA67CA3A08B96E3F2644CD6568AD7B7CAF68AED96B5B6B5488355D1DEAB61B25EABA64AFC2AEED9BD0F4E4B4B5E4A816A8DFDF1937ECB4F7EB28D7D03FF7D770A155B130DEC2914EE1C7EB20624DA77984DBDD37A36812795F4D4282ED72EF58DF8A3D4D30DCDD0BA42918AB4E0845F9DCA0F545C1B5303238F3B4C5A69B797529BF8FCEDE98F5E15A9F44BF263C4F3460DBC45286696C92DF0690D398F9BF44493880826D83227FB714438F3B87EB39CB7893D0A040A0884E11325FD710039F1CD217290E36C0C364D8830815FF3145D56EBF881EA1BF8C5719DE6598B00CA3C790F3127958D1B67ED1BDC5D33C5DED8AFF126508160899419E865FC55FB320F46BBA2F15A9370D8A3C5EA952BBB92E719EE2DDEE6B4C37524F8B0E5125BE3ACCBA87D12E24C8D02A5E8367D887B60704AFE016787BFAC4438FA45B11BCD8A7DF02B04D41842A1C0D3CF993D8B01FBDFCF83FE341D43352570000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [gender], [IdentityNumber], [BirthDate], [telephone], [Email], [City_Id], [Country_Id]) VALUES (1, N'Nika', N'Jamburia', 0, N'11111111111', CAST(N'1998-12-24 00:00:00.000' AS DateTime), N'12315151', N'nika@gmail.com', 1, 1)
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName], [gender], [IdentityNumber], [BirthDate], [telephone], [Email], [City_Id], [Country_Id]) VALUES (2, N'Alexandre', N'Diuma', 0, N'11111111111', CAST(N'1998-12-24 00:00:00.000' AS DateTime), N'12315151', N'Alex@gmail.com', 3, 3)
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1, N'Tbilisi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2, N'New-York')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N'Paris')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name]) VALUES (1, N'Georgia')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'Usa')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (3, N'France')
SET IDENTITY_INSERT [dbo].[Countries] OFF
INSERT [dbo].[ProductAuthors] ([Product_Id], [Author_Id]) VALUES (1, 1)
INSERT [dbo].[ProductAuthors] ([Product_Id], [Author_Id]) VALUES (4, 2)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [ProductType], [Isnb], [PublishDate], [NumberOfpages], [Address], [Publisher_Id], [Annotation]) VALUES (1, N'Gau: salobie tu sachebureke?', 1, N'1111111111111', CAST(N'2019-12-12 00:00:00.000' AS DateTime), 100, N'http://ragaca.com', 1, N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
INSERT [dbo].[Products] ([Id], [Title], [ProductType], [Isnb], [PublishDate], [NumberOfpages], [Address], [Publisher_Id], [Annotation]) VALUES (4, N'sami mushketeri 2', 0, N'1111111112111', CAST(N'2019-12-12 00:00:00.000' AS DateTime), 100, N'rigi 1 taro 1', 1, N'aaaaaaaaaaaaaaaaaaaaaa')
INSERT [dbo].[Products] ([Id], [Title], [ProductType], [Isnb], [PublishDate], [NumberOfpages], [Address], [Publisher_Id], [Annotation]) VALUES (6, N'resursi', 2, N'1111112221111', CAST(N'2019-12-12 00:00:00.000' AS DateTime), 200, N'http://aaa.com', 1, N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([Id], [Name]) VALUES (1, N'Palitra')
INSERT [dbo].[Publishers] ([Id], [Name]) VALUES (2, N'Gamomcemloba')
SET IDENTITY_INSERT [dbo].[Publishers] OFF
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Authors_dbo.Cities_City_Id] FOREIGN KEY([City_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Authors] CHECK CONSTRAINT [FK_dbo.Authors_dbo.Cities_City_Id]
GO
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Authors_dbo.Countries_Country_Id] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Authors] CHECK CONSTRAINT [FK_dbo.Authors_dbo.Countries_Country_Id]
GO
ALTER TABLE [dbo].[ProductAuthors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductAuthors_dbo.Authors_Author_Id] FOREIGN KEY([Author_Id])
REFERENCES [dbo].[Authors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAuthors] CHECK CONSTRAINT [FK_dbo.ProductAuthors_dbo.Authors_Author_Id]
GO
ALTER TABLE [dbo].[ProductAuthors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductAuthors_dbo.Products_Product_Id] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAuthors] CHECK CONSTRAINT [FK_dbo.ProductAuthors_dbo.Products_Product_Id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Publishers_Publisher_Id] FOREIGN KEY([Publisher_Id])
REFERENCES [dbo].[Publishers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Publishers_Publisher_Id]
GO

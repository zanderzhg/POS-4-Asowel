﻿create database DBpos
go

use DBpos
go



CREATE TABLE [dbo].[AdminRes] (
    [ad_id] [varchar](10) NOT NULL,
    [username] [varchar](50) NOT NULL,
    [pass] [varchar](max) NOT NULL,
    [name] [varchar](50) NOT NULL,
    [ad_role] [int] NOT NULL,
    CONSTRAINT [PK_dbo.AdminRes] PRIMARY KEY ([ad_id])
)
CREATE TABLE [dbo].[Employee] (
    [emp_id] [varchar](10) NOT NULL,
    [emp_code] [varchar](max),
    [manager] [varchar](10) NOT NULL,
    [username] [varchar](50) NOT NULL,
    [pass] [varchar](max) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [birth] [date] NOT NULL,
    [startday] [date] NOT NULL,
    [hour_wage] [int] NOT NULL,
    [addr] [nvarchar](200),
    [email] [varchar](100),
    [phone] [varchar](20),
    [emp_role] [int] NOT NULL,
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Employee] PRIMARY KEY ([emp_id])
)
CREATE INDEX [IX_manager] ON [dbo].[Employee]([manager])
CREATE TABLE [dbo].[OrderNote] (
    [ordernote_id] [varchar](10) NOT NULL,
    [pay_method] [int] NOT NULL,
    [sale_value] [money] NOT NULL,
    [totalPrice_nonDisc] [money] NOT NULL,
    [Svc] [money] NOT NULL,
    [Vat] [money] NOT NULL,
    [subEmp_id] [varchar](200),
    [discount] [int] NOT NULL,
    [Pax] [int] NOT NULL,
    [cus_id] [varchar](10),
    [emp_id] [varchar](10),
    [ordertable] [int] NOT NULL,
    [ordertime] [datetime] NOT NULL,
    [total_price] [money] NOT NULL,
    [customer_pay] [money] NOT NULL,
    [pay_back] [money] NOT NULL,
    CONSTRAINT [PK_dbo.OrderNote] PRIMARY KEY ([ordernote_id])
)
CREATE INDEX [IX_cus_id] ON [dbo].[OrderNote]([cus_id])
CREATE INDEX [IX_emp_id] ON [dbo].[OrderNote]([emp_id])
CREATE TABLE [dbo].[Customer] (
    [cus_id] [varchar](10) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [phone] [varchar](20),
    [email] [varchar](100),
    [discount] [int] NOT NULL,
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Customer] PRIMARY KEY ([cus_id])
)
CREATE TABLE [dbo].[OrderNoteDetails] (
    [ordernote_id] [varchar](10) NOT NULL,
    [product_id] [varchar](10) NOT NULL,
    [discount] [int] NOT NULL,
    [quan] [int] NOT NULL,
    CONSTRAINT [PK_dbo.OrderNoteDetails] PRIMARY KEY ([ordernote_id], [product_id])
)
CREATE INDEX [IX_ordernote_id] ON [dbo].[OrderNoteDetails]([ordernote_id])
CREATE INDEX [IX_product_id] ON [dbo].[OrderNoteDetails]([product_id])
CREATE TABLE [dbo].[Product] (
    [product_id] [varchar](10) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [info] [nvarchar](100),
    [price] [money] NOT NULL,
    [type] [int] NOT NULL,
    [deleted] [int] NOT NULL,
    [ImageLink] [nvarchar](max),
    [Discount] [int] NOT NULL,
    [std_stats] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_dbo.Product] PRIMARY KEY ([product_id])
)
CREATE TABLE [dbo].[ProductDetails] (
    [pdetail_id] [varchar](10) NOT NULL,
    [product_id] [varchar](10) NOT NULL,
    [igd_id] [varchar](10) NOT NULL,
    [quan] [float] NOT NULL,
    [unit_use] [nvarchar](100) NOT NULL,
    CONSTRAINT [PK_dbo.ProductDetails] PRIMARY KEY ([pdetail_id])
)
CREATE INDEX [IX_product_id] ON [dbo].[ProductDetails]([product_id])
CREATE INDEX [IX_igd_id] ON [dbo].[ProductDetails]([igd_id])
CREATE TABLE [dbo].[Ingredient] (
    [igd_id] [varchar](10) NOT NULL,
    [warehouse_id] [varchar](10) NOT NULL,
    [name] [nvarchar](100) NOT NULL,
    [info] [nvarchar](300),
    [usefor] [tinyint] NOT NULL,
    [igd_type] [nvarchar](100) NOT NULL,
    [unit_buy] [nvarchar](100) NOT NULL,
    [standard_price] [money] NOT NULL,
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Ingredient] PRIMARY KEY ([igd_id])
)
CREATE INDEX [IX_warehouse_id] ON [dbo].[Ingredient]([warehouse_id])
CREATE TABLE [dbo].[ReceiptNoteDetails] (
    [rn_id] [varchar](10) NOT NULL,
    [igd_id] [varchar](10) NOT NULL,
    [quan] [float] NOT NULL,
    [item_price] [money] NOT NULL,
    [note] [nvarchar](1000),
    CONSTRAINT [PK_dbo.ReceiptNoteDetails] PRIMARY KEY ([rn_id], [igd_id])
)
CREATE INDEX [IX_rn_id] ON [dbo].[ReceiptNoteDetails]([rn_id])
CREATE INDEX [IX_igd_id] ON [dbo].[ReceiptNoteDetails]([igd_id])
CREATE TABLE [dbo].[ReceiptNote] (
    [rn_id] [varchar](10) NOT NULL,
    [emp_id] [varchar](10),
    [inday] [date] NOT NULL,
    [total_amount] [money] NOT NULL,
    CONSTRAINT [PK_dbo.ReceiptNote] PRIMARY KEY ([rn_id])
)
CREATE INDEX [IX_emp_id] ON [dbo].[ReceiptNote]([emp_id])
CREATE TABLE [dbo].[WareHouse] (
    [warehouse_id] [varchar](10) NOT NULL,
    [contain] [float],
    [std_contain] [float] NOT NULL,
    CONSTRAINT [PK_dbo.WareHouse] PRIMARY KEY ([warehouse_id])
)
CREATE TABLE [dbo].[SalaryNote] (
    [sn_id] [varchar](10) NOT NULL,
    [emp_id] [varchar](10) NOT NULL,
    [date_pay] [datetime],
    [salary_value] [money] NOT NULL,
    [work_hour] [float] NOT NULL,
    [for_month] [int] NOT NULL,
    [for_year] [int] NOT NULL,
    [is_paid] [tinyint] NOT NULL,
    CONSTRAINT [PK_dbo.SalaryNote] PRIMARY KEY ([sn_id])
)
CREATE INDEX [IX_emp_id] ON [dbo].[SalaryNote]([emp_id])
CREATE TABLE [dbo].[WorkingHistory] (
    [wh_id] [varchar](10) NOT NULL,
    [result_salary] [varchar](10),
    [emp_id] [varchar](10),
    [startTime] [datetime] NOT NULL,
    [endTime] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.WorkingHistory] PRIMARY KEY ([wh_id])
)
CREATE INDEX [IX_result_salary] ON [dbo].[WorkingHistory]([result_salary])
CREATE INDEX [IX_emp_id] ON [dbo].[WorkingHistory]([emp_id])
CREATE TABLE [dbo].[StockIn] (
    [si_id] [varchar](10) NOT NULL,
    [ad_id] [varchar](10),
    [intime] [datetime] NOT NULL,
    [total_amount] [money] NOT NULL,
    CONSTRAINT [PK_dbo.StockIn] PRIMARY KEY ([si_id])
)
CREATE INDEX [IX_ad_id] ON [dbo].[StockIn]([ad_id])
CREATE TABLE [dbo].[StockInDetails] (
    [si_id] [varchar](10) NOT NULL,
    [sto_id] [varchar](10) NOT NULL,
    [quan] [float] NOT NULL,
    [item_price] [money] NOT NULL,
    [note] [nvarchar](1000),
    CONSTRAINT [PK_dbo.StockInDetails] PRIMARY KEY ([si_id], [sto_id])
)
CREATE INDEX [IX_si_id] ON [dbo].[StockInDetails]([si_id])
CREATE INDEX [IX_sto_id] ON [dbo].[StockInDetails]([sto_id])
CREATE TABLE [dbo].[Stock] (
    [sto_id] [varchar](10) NOT NULL,
    [apwarehouse_id] [varchar](10) NOT NULL,
    [name] [nvarchar](100) NOT NULL,
    [group] [int] NOT NULL,
    [barter_code] [varchar](max) NOT NULL,
    [barter_name] [varchar](max) NOT NULL,
    [unit_in] [nvarchar](100) NOT NULL,
    [unit_out] [nvarchar](100) NOT NULL,
    [standard_price] [money] NOT NULL,
    [info] [nvarchar](500),
    [supplier] [nvarchar](500),
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Stock] PRIMARY KEY ([sto_id])
)
CREATE INDEX [IX_apwarehouse_id] ON [dbo].[Stock]([apwarehouse_id])
CREATE TABLE [dbo].[APWareHouse] (
    [apwarehouse_id] [varchar](10) NOT NULL,
    [name] [nvarchar](500) NOT NULL,
    [contain] [float],
    [std_contain] [float] NOT NULL,
    CONSTRAINT [PK_dbo.APWareHouse] PRIMARY KEY ([apwarehouse_id])
)
CREATE TABLE [dbo].[StockOutDetails] (
    [stockout_id] [varchar](10) NOT NULL,
    [stock_id] [varchar](10) NOT NULL,
    [discount] [int] NOT NULL,
    [quan] [int] NOT NULL,
    CONSTRAINT [PK_dbo.StockOutDetails] PRIMARY KEY ([stockout_id], [stock_id])
)
CREATE INDEX [IX_stockout_id] ON [dbo].[StockOutDetails]([stockout_id])
CREATE INDEX [IX_stock_id] ON [dbo].[StockOutDetails]([stock_id])
CREATE TABLE [dbo].[StockOut] (
    [stockout_id] [varchar](10) NOT NULL,
    [ad_id] [varchar](10),
    [outTime] [date] NOT NULL,
    [Vat] [money] NOT NULL,
    [discount] [int] NOT NULL,
    [total_amount] [money] NOT NULL,
    CONSTRAINT [PK_dbo.StockOut] PRIMARY KEY ([stockout_id])
)
CREATE INDEX [IX_ad_id] ON [dbo].[StockOut]([ad_id])
CREATE TABLE [dbo].[ApplicationLog] (
    [id] [int] NOT NULL IDENTITY,
    [date_added] [datetime] NOT NULL,
    [comment] [ntext] NOT NULL,
    [application_name] [nvarchar](100),
    [last_updated_on] rowversion NOT NULL,
    [extra_data] [xml],
    CONSTRAINT [PK_dbo.ApplicationLog] PRIMARY KEY ([id])
)
ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [FK_dbo.Employee_dbo.AdminRes_manager] FOREIGN KEY ([manager]) REFERENCES [dbo].[AdminRes] ([ad_id])
ALTER TABLE [dbo].[OrderNote] ADD CONSTRAINT [FK_dbo.OrderNote_dbo.Customer_cus_id] FOREIGN KEY ([cus_id]) REFERENCES [dbo].[Customer] ([cus_id])
ALTER TABLE [dbo].[OrderNote] ADD CONSTRAINT [FK_dbo.OrderNote_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[OrderNoteDetails] ADD CONSTRAINT [FK_dbo.OrderNoteDetails_dbo.OrderNote_ordernote_id] FOREIGN KEY ([ordernote_id]) REFERENCES [dbo].[OrderNote] ([ordernote_id])
ALTER TABLE [dbo].[OrderNoteDetails] ADD CONSTRAINT [FK_dbo.OrderNoteDetails_dbo.Product_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[Product] ([product_id])
ALTER TABLE [dbo].[ProductDetails] ADD CONSTRAINT [FK_dbo.ProductDetails_dbo.Ingredient_igd_id] FOREIGN KEY ([igd_id]) REFERENCES [dbo].[Ingredient] ([igd_id])
ALTER TABLE [dbo].[ProductDetails] ADD CONSTRAINT [FK_dbo.ProductDetails_dbo.Product_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[Product] ([product_id])
ALTER TABLE [dbo].[Ingredient] ADD CONSTRAINT [FK_dbo.Ingredient_dbo.WareHouse_warehouse_id] FOREIGN KEY ([warehouse_id]) REFERENCES [dbo].[WareHouse] ([warehouse_id])
ALTER TABLE [dbo].[ReceiptNoteDetails] ADD CONSTRAINT [FK_dbo.ReceiptNoteDetails_dbo.Ingredient_igd_id] FOREIGN KEY ([igd_id]) REFERENCES [dbo].[Ingredient] ([igd_id])
ALTER TABLE [dbo].[ReceiptNoteDetails] ADD CONSTRAINT [FK_dbo.ReceiptNoteDetails_dbo.ReceiptNote_rn_id] FOREIGN KEY ([rn_id]) REFERENCES [dbo].[ReceiptNote] ([rn_id])
ALTER TABLE [dbo].[ReceiptNote] ADD CONSTRAINT [FK_dbo.ReceiptNote_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[SalaryNote] ADD CONSTRAINT [FK_dbo.SalaryNote_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[WorkingHistory] ADD CONSTRAINT [FK_dbo.WorkingHistory_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[WorkingHistory] ADD CONSTRAINT [FK_dbo.WorkingHistory_dbo.SalaryNote_result_salary] FOREIGN KEY ([result_salary]) REFERENCES [dbo].[SalaryNote] ([sn_id])
ALTER TABLE [dbo].[StockIn] ADD CONSTRAINT [FK_dbo.StockIn_dbo.AdminRes_ad_id] FOREIGN KEY ([ad_id]) REFERENCES [dbo].[AdminRes] ([ad_id])
ALTER TABLE [dbo].[StockInDetails] ADD CONSTRAINT [FK_dbo.StockInDetails_dbo.Stock_sto_id] FOREIGN KEY ([sto_id]) REFERENCES [dbo].[Stock] ([sto_id])
ALTER TABLE [dbo].[StockInDetails] ADD CONSTRAINT [FK_dbo.StockInDetails_dbo.StockIn_si_id] FOREIGN KEY ([si_id]) REFERENCES [dbo].[StockIn] ([si_id])
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [FK_dbo.Stock_dbo.APWareHouse_apwarehouse_id] FOREIGN KEY ([apwarehouse_id]) REFERENCES [dbo].[APWareHouse] ([apwarehouse_id])
ALTER TABLE [dbo].[StockOutDetails] ADD CONSTRAINT [FK_dbo.StockOutDetails_dbo.Stock_stock_id] FOREIGN KEY ([stock_id]) REFERENCES [dbo].[Stock] ([sto_id])
ALTER TABLE [dbo].[StockOutDetails] ADD CONSTRAINT [FK_dbo.StockOutDetails_dbo.StockOut_stockout_id] FOREIGN KEY ([stockout_id]) REFERENCES [dbo].[StockOut] ([stockout_id])
ALTER TABLE [dbo].[StockOut] ADD CONSTRAINT [FK_dbo.StockOut_dbo.AdminRes_ad_id] FOREIGN KEY ([ad_id]) REFERENCES [dbo].[AdminRes] ([ad_id])
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201712140624320_initdatabase', N'POS.Context.MigrationConfiguration',  0x1F8B0800000000000400ED5D59731C39727E7784FF43473FD91BB36C1D9E881D05B91B1429CD305614DBA234E37DEA2876816485EAE8AD434BDAE15FE607FF24FF05A36E1C891B55DDE428F420360A4824121F12092013F8BFFFF9DFE3BF3C24F1E21BCA8B284B4F962F8F5E2C1728DD666194DE9D2CABF2F68F7F5AFEE5CFFFFC4FC7EFC2E461F16B9FEF759D0F974C8B93E57D59EEDEAC56C5F61E2541719444DB3C2BB2DBF2689B25AB20CC56AF5EBCF869F5F2E50A61124B4C6BB138FE54A56594A0E607FE7996A55BB42BAB20BECC4214175D3AFE72DD505D7C0C1254EC822D3A59AEAFAE8F70FE123D94CBC5691C0598856B14DF2E17419A6665506206DF7C29D0759967E9DDF50E2704F1E7C71DC2F96E83B8401DE36FC6ECBA6D78F1AA6EC36A2CD893DA5645992586045FBEEE84B2628B5B897639080D8BED1D166FF958B7BA11DDC9F2344CA2F4136E3B5BD79BB338AFF3B5826DCA45A838EAF2FFB020537F1800807152FFFB617156C56595A3931455651EC4387F751347DBBFA2C7CFD957949EA4551C939C61DEF0372A0127ADF36C87F2F2F113BA1DF8BD08978B155D72C5161D0A52A5DAE6E0FEC7185E2E2E83870F28BD2BEF31BA3168DF470F28EC133A3C7C49238C7834FCFE88990E6EE2318110D77599E5E86794A23C2851B80ECA12E5B8BF3F6629E2F865B8C3A0CC53FC9784C31F6D3994D7BC0E8A42522BFE73926A3FEEA5B1A7E1A72C1EEABD48CBD7AFD4343E06DFA2BBA687196AEF925D9C3D2284E5F709C54D8EE23EDAB53AE7A8FFBA19C6D7FB3C4BEAFAC792FDB7CDE720BF4358697DCE0419AEB32ADF1AF086B1B8FD7A91C2AC751F21CE984F1C63EC772BBEAEAA52C218FE2AE48CF806B3466680783B5E8DFA4FAA15FB1ED0568B7D81BDE945CC808D62EC8A1DAA66C4EC9DE16A9C54549957CA7A2E8334B843F91482F8AEFABDAAFEB6370D2B7D1BE5E57D5FEB3946E1E72831A7725D067919068FCE847EC1AAE9378C37C3A9889BCE421960B105E86160BC4B8228960E0B4D742AC078DF280349637CD482B5898505C010394731C26ACC971931CC75AE46443FDF098D887EC6D4E5EC2A0F51FE312B0516CEF079334E96237BFC576EC606B298DA139FD01645BB52CC2491016413FACE310A6632367D8238C81FC59C8EDF414681CFBC0904E43165F3B72CFF8A07DF2F11B67AF248C02B95E911E4579085E35994CFC97A1B90A56DBE0D25F666BF351C602E918D1547153E545B6E173C26282D2F51799F99AA4F7E30A15F83B81A54F939DA46498027AA758EFFEAB6AC7E5A2EAEB7414DF4DF8C6BF88C1B1CAFF3688B70D3CEA3623B594DD7DFA6A3FD6B504EC77775A35A3CA84D10BD19178B3FABD2D20D33EBDAA075217056155E8697D24699A19646619475E3DD64D2D2894693DEDA261E07DC64883D6BE60294AF0913DE771D98F6DB60FBD51F7DE14CDDB746619C8DD920E3ACFFCA598F401653FB71340B7C588F620639DBC2D8C03D47255EE528CCDC36D386B02D007ED94C62A397CBE964F18CBDAC69F0F405F666EF74DAD4D4D2F1A58427B271F6B2BB31D7E279969D003F93BDE745BAF6525853DB8A97C29C42765B00B55AC67C19D4963BC4C510981FA784D5B67CB64B27A27D87CAA29F71FBEF55907A1FB453CCEB4273446801E8B2DDF5B516D3435E31CB5D1625C37D3E885D6DBD33F0A3A96FBAFC7BD3330E7AE3090CC9BD182317E96DE66425E89C4A4CBB4EACC9EEC3FC6025990477E843947E9588D3CFE9A71FDD7D5D066918E421FEBF949D2C7AC29DDF659D8126552DE9588D6BA8F8655C5359209EC10C1CC7702E278B932269AAFFF76C6DAEC3A67EAB59602C7AA8B3C0A413954283DD4DE476A76F449E6755B3C969EA969146E59742367BEA4E64D66AEC22BDCB5118A1143605E9314C66166983310F670C0A33FA345E2D95979C572F662B293D4DCD3516D99BDAEA4697A9CA9A6C50FA5157BF0539BACFAA62A2F5B893C5EC6BCC9B99CCAFBD98CC589BDD6683BFD0DBC7D24A9D93A6F17C02AAB5F1DBEA71FE8A7B9376DAF586E7CD4A633BD270F2905B93C02C63E1CD23639ECB2668802C9FCCC7C7BD21B50EFBA5D66120FF046122E3C837F49D9B05C14C4E93202701EDB9902BB9B729F153AAB9616C3977B6F40F75EA3CF099DD83597E51A2645A5DDCEE00CBE619BB532E5B33DF8BB26395879666B4D0DA9A2DA04AC89A403A5EAADB40E6F6A5096D74E04169BFA7AED3E67187BA487DB8F5372E4CA709B9933AA1FF8FD4BDC6CAEF5932C4EC9D6CAC8D3A2B2DA136EB209D62A52508DB4D53470C25F6A621A8C5B5A9A2987865EE475FD401E041C4D9197ACB3C41610F5B7830E8AD56022CC4A5CB052B648F7104DAD01E8BEC0DDBD756B3DFF5EF62F633DD90C08CAEA10951E9958F4130AD5F7E1D2F5287CF392E24DE67F9251EECF7867B2E3C95BFA12077237251AC832834DB98B3330A2C428C589340168634658811A99284414604738A302322A79B0D4091D53704A862FBB306EEADCC80FB43D6989F5081A5D5F6EF3389D568C28E3FFB88B17897867674ECF48D439820AB7754E184E6519853681D05D7807EB2B3CFDA5B38F48DB336FFFE2CB36813D998666DB143D5349EAE14526D4C7819F8F3EE4CC842DA0D2E9FE16C0FC1E534DA63BF2D2FDB85A0B36C8681C631C9E4105D94C366735B9631FC9B8DFEAED86129013867993D477DD137EB50F9FB7E3C23541ADABA42A529443A8DCE64A9D8FC6A341D4E09C567AFD1CC14D9FEF4579959ED2FB5C50E75D09FAE7F87FE563FE759B573DBB4798B97642877BE9ACC4E6A6DE50AD94D5579ED8B7591CEDF6975BD5755397FC5F3F880297C007FF4E203785DED767124BDE6CE4F45BEEFC85ACB3DAADA6993CAC5CC6FE447786AA372CCB4B4509A0B3ACB0AEB4B3895DC8E7904ECB219849772AA19D6B619A85ED6BDB378BDFFA35766A635B523269FA8670A399C44451FD4A16F8371C9A8D2D753E068023599BDF54DEA01133B7C2CB74F8B7CFB35AB80E85D71764B137EA8E750C7DDD0B84365F0F0AE0750ACECCD273FD0AC104E91A6B3B53EA74D6605B3F545D95AFCD619DDD7F80D4B86EA65BF7AE50AD22B9ABAE2EAB075C569E8651B525E099681976BE1A6BCC1D08F4E3AB0B315DDFBF345A3DFED78C56659A1ABAFB41617A462B35B5FD44BE46DC3F887EC4E7F894115DB5F4CA84D40A8729DAED63B17216A04A9E359761A86E3D680B56238CB9204A5B2FD20DDBB314CAF5D1F7BDAD3F6A5BCBE0F41517ED985B5B8AF06E3E76D94360E2EF5FB48559EA374FB78D9506CAAA3B8F813C383A0D1EA3EC612DF55CDAE8EC2CBE401431AF76BE0F9DE12D1103E2D8A6C1B35AC335E298322A4F97D97860BD525EA2DE3E425EC987F3C68A3BAF3311327CB3F707290D01D74D7487750D234D9971C593CBA515E0FAF20C6DD5D60E14669C9AB8228DD46BB205670C09483B72A80D8B85AFC431DEC9773B44369AD011462D5A97C788983AF7FA88651702A011DAF0888C89103DCE427EA63D925AA632F13D78AE9C3477663E0487ABC6B90A6FCE2E8C81388C47CE8F42478C3A7118EC42276AA7F561C0DEA43DDD9BCF79B371CF1F7EFAB15DC143862F9D0E947F065234B1CB12276AA7F4E1C71B7142AFB5C7C652180AA3EE2DB025BE22B8F35D0EB1B60226674FA597EE9A805DA443DE0819919A0278D3C16A1422F0C79040670E9803E04F52E78182B2323A72781A10E433A9D0FDE4E6084419D7E70E2645E00AA675179402B08384BA8ED792E957132CF6C2A13F5A1CFA7F230637D4503DE4C30995A03239CB5303D99620358D2E97BC1052D2E8A0DE80A174E66002118F62B4283FC36209DC94D86357984F1489D38B19E0460323E747A53E25B61042F99B43DF03103B884577B8920A0BCBE8B80C19ABEE5551F67EACBC46634D354CCCC63A2A9E47EE8E6D91ABCCE530F006BF66E4FEF105BB3571F7335CC022E860D9D3E5D8BEEA4774017236F6736F6B0F3A10298F2DD8349763DF606330523F3014D21F7A70035E85E041100A497248C9D4F460EEBA34BFAC8AB7A91E9095A122EE659604A647CE8EB4B51C8BBA8C795F1EF8409CEDC35A10F2BE55BBC73EE5F28989907610AB13F319411CA461302D09D0513200DBA904547474E86369E219DAE866E9672811B2F7DAD0D0BEA6693FD4C944CF0BE701E1345F2139DDF07A21ACC8E82F87FB54F853F3C0978D0E93F67AF0A81545DEA9E0B3354CC83B47FE1402D0637C6A881C32A08DCACA7DEE012B2A1D57DB2D821730C4132F6C2C65C70E27CF3A59D2F76D46760453AAF1A024C1C09A780AE4F788998D09AE3A0F07673688964ADC90214A03333B0F42637D0939A87930D8EF63FBF014CCC37C10192D5AB1CBC5D666F2AA9EE7C238D4145E44CA79828477A3560A7544F042BDAEA010CCB71575384F0B55911451ECE68881B4C82C28B683893DC1669C2D8F5196740010F334E8002396B72005F91B52F44E1E599498F9397064D852AF2AA35E5627242648D7C68F5ACE0EE33376C8DF276E2C13BB8DA288D2EAC1EE5BD37769C554DAC3D7A806241BF14A80BAC2ABAD80F161635D16B54D2717018506350086B2471C8A249F4BB7E108D711F54416438FE80A8106EAF0A32BD7F3B4465F4F3D7E565186C628EFAA32F05C9EE680622359C6FE99110F3C49CF82AC85177EA73B448DF010521E8610A8E1EE0C8A54F564150496A58A44384880D0B059971BB11A243EEC2AAF8E12EEEE6B962B68E55ACB57A0CE4ABD7E97A24C45DC866D0A127A4A32C4E6CAD80BA696DD06FACE90FB344E6D0A428A3A56E2115E90A369209A1650812D306AF8CC7D865221BA394E1253A653B0803FB86D650FA9F9B153542F9084AE364C4C6DED26DD59003108006484215A646B54012A846B4819CC824E29084A611C488E9CCA344C649592611F8CC55D008EEC0D54522DCC1AA0ED85C24C20505C904238F20829B248C2182C424D0429A940199893BC04268F287F478B9E987BF500DD40A8021DA08592112F96985BC10E4296BC9A70CA583511DB9216A947440D2A6959E94661B948A07CC7400260C455040000A46F0093128FC40B35B2C04093F8AC5CB4FED454F354BEA47AF3762D4F400E990E6A0B36C84CEDD807CF41CC1A936295DC18976B1CB3A89A894CEDF93292CD84759292CD0D754D224D6D7D4879858CF529EE614A68444445A0EB9D2C95E22262723621E5181AF67F162523A93D27B9C127752A219D4125E22199903E944F39EF0911F5E345ACE91547B54EE91A49EE536272472527944CE232B72EB45292D91939FAC5D809B9F2789019E7D7A70B519788CD71934E8648E69D0A1826C5F60DC94928D348133DA34BB02BC13954808624F2B9E7DD0D78A1584861840EF2A52106BAF4610EC02241288DC57487D602E148C78DF4D8328346840693BC847396084DE2E60039443A6DD58D410C59C8306BC6C50132A9C0F879E7BC5148021DD3674E46EAF66F54695D4F740DFFB80D7BADA1212B91B4C36A2804774F484C31EA39B1CA4FB13107172AE31D74984D45FC3371CF00EDF8E57D7DB7B94045DC2F1AABE9D10EDCA2A88EBCB09E3A2FF7019EC76D89828C6925DCAE27A176CEBE3D03F5E2F170F499C1627CBFBB2DCBD59AD8A8674719444DB3C2BB2DBF2689B25AB20CC56AF5EBCF869F5F2E52A6969ACB605296FF6387AA809DB31C11D62BED6B71C86E87D9417657D83E14D504FB56761C267238FB30507267D55CC8935DF6FFDF9495FA0FEBB5BC05E5D1F75B51C0954F528BDF7B841F59D984DDB10AF54F992B86C7D276D9073B7CCD6BE3067595C25699B1284A0FB8098C49702E569733F2649A61A52F529AD83A2A0A9EC9A147D0A1F393E4C79380DEB91C58924CFF877065AE8335DC2795D709DCE0C3F16445A101BD72AB61813ADC93440262E2A126A174245CA14253B439C6122ED334C2C996D93AA4F68B878922494886EA314D3795EC07F1BE5F52BE924899B36499F46F38071183CD2648A21559F52FDF2FB6FB843684AF73875F38F26D9644487393B9E43A38E7E9734FE2034EE0017116917DF3717B6537D7C0FDCE12EE763C72BA77A0488B49388D0F06A134928EC130F46CB11C782B66A4E7808AAA1E724654582A52EF323859BF51F0C95DE2E78AC79BB44E57D16B22AE2719374E906433488D1AF415C31282A70F2E65B9BAE4FACB911BF792EED6396D697ECD344CBE1F326EDBF1B70FA8D21D724E8976F1E1420CB370906F55737C0BC5534A986BD38BE3F400DB821D564A678A0893409FAE5BBAB72490ADBAA309F89DDA7F366A894C10DABCF3222DD945AC44E82D9986C836A00CE9B5DFBC148E48D8BCC9A9D17B7BD5FCDCE6C6EC484DE06F5929DD5063701EFB7D690D98FFA1E7D836CB5B7C8E74943798B8B4E3A34DCED303F8682BBC1E24F673D356BA3DF7871B6393A476207CB43446136FB83B8B18742647710BBAF69B07D1E8CA4F2F726E560C0341C47DB824870E8AE011E61C959FAD85D01B60FE49214A226C504B4DCDC6D3C6BD7BDC24CFF4DCA746A4F288F042F783F442933E113C9AE23F0DC6204F68F6AE2FF4B66EFA228C34DD1261FDA787455ED74048BF5D83455EBEBB029C08DD036799F2ABDBB97921AAD77A63BC8FADA5CB8159746E59782DD89C3891B20FEA285D15E60483ABDD96250ECE0A7014059E149FB98BA508424F58FFEC3139C6830E46E336673B1EAD28CC6103FDBD412369D71EA51F0B67A0446C14D65B4C2EC953B309116DD27F375F0135906004ED4B623958F29341FB01A3444026F2F3E27A59DA74F53BD5F942801B018E164731CB66E7894E20062225B04ED1B815EB0E786BA59F1E66567F122E58EA0A2D4F0FC897AEB95DF040C1291BDBC27CC107E77B688117A136AE04552763683A0F3D96076F0FA44F3C90FA457AF6D2434F7D4FBA41BAE6DF78BDD8E35FA5F565828674E5D147B5117F5C3B4DCDE7CFD0AABE9BE7C2B04F8700D7F303F5EAB5DB1EB8370667CE0D4CD7D93AC4FEA7D965FE28E660EF8B1A1BA49DA6423527F4341CE537A6C520DF474B10E22D6BA28B0D4E1FEDB9766659DE7ADF52B7D63828592551010C2E89E53B1F7866384BE92969AE29B2F9B42705BAD98A497B1DB389C7CE68EFD8A31D980A134E429A13EF160F03838725A2B7AD8555547CB8B4A0ABBA7BD8A88EA1AF87622310D0F1E8A1729DFB1516A752CFC844C42C68DD8112E0232FAA8111298123CFD4D6BB472806F5F1353F9BE80B5409E23E26C816680AFF61E403768303725536A6AB7BFADCD9FF3ACDAD124EEDA240387503C87A29C77B9BD69D28DBD6E5B727CD33A72A62DACF73A2F9851D96C759A2DF66A324DA4104727E36F4892A369822D53F71DEAEBAABEA28975762E86D467B77D4B8520DA6A204968A5861E92967E628AE4F7BCA9C284F2394D67623ABA139B8C82648A1BAE2F66E6B926DDDC9A6AEF6DE7687D770452A1C81D3F0EC03144CC9537C4B497B53B2DDE3033805F6F65BCBC777507F787D9A7B69064EF81B49E55E9DB222D26560501A119C56E321AEF0F9F862167FAD43BC4419B6E329F2675D3D8F9B44B341858A328F8493E183F1ADBD51F82A2FCB2AB1B175E319A35C69F3655FB6D93194DFFEF1ECA3CA8E36C99DDB53A791336E933C39D0B6E66B30CB57729C3EF21B8B90B2CA6229E1B01D4F1CB4DC38B2EC8998D346EB32C17584ADFA2B08E32BE7E2C4A941CD5198EAEFF1E9FC5ED655F7D86CB208D6E51517ECEBEA2F464F9EAC5CB5747A7FF59E5F5950F7114146D507A1749FD86BD735B2BB4FAE5EB3AB41A85C98A2D6E1EA05D53298A90F25520D4C4303974B7567077845FA4217A3859FED7E2BF9988EBBFA24716043DD2C60BD0C129E678C5963D6630DA156BAFB7FD16E4DBFBFA38E33278F880D2BBF2FE64F9F2C572F1B18AE33A36E564791BC4C0D5BE0CCD3118544CF64773B26D742845F25F92E0E15F8D094DC0DB102CDD528D6A184B4990C3588A97F1C629CF8081CF1DD488E9CB7985CC18D12CEFDFE6EA7C05AD21A899E1502CBFBADC9BC5C57F6CBAA23F2C9A9082378B1758B4BFA3C1907A62AE0BA16E89D633A73185317ADA81081138AD3B2CA1911DE652F960F56F8AD02E2C4936828C6976E152629AAF2CD8DC196A359EC6B057E65D3112D7427BD68CB2B021B57EA44B7BD59264F0B37D979051CF2D950443E7D1980E14E8EC42AF89747621D0AC6D5D081061CEB271643C90C6F5B27DAF3521CFF6C5FBA04EF339B12DA93925EAAA153B56DA921E5921C3AEED654BC45B8FB355FBDB6648F527262E48A6A3AC5D288D21D6FA54B475F8F8088467150EC730AB95B76098B8A9ED294CAC49A67BFF56890FCD378309D13F7E34A32101161087A339DA1D1ACA952CEF730144B6C99CABB1B44F9E7CC0B23D72F18EC9757F45B9672CBA404BD28587A7195B6701094D9BC595FB8CDC86B5CDA805791244F0342D1EAB6D96730F6388089A760181E9E09A48DD8B239335861851D6EF9AF100D56F1F4D67CE4F5BD2272FA41ABF8DB3C01CC463C4B5BED271013111CDEC1BC17098A31ABD820E75EB19DAFFC71C2B64799F88514E5AEABEB698B55E9BCF5A7D50764BB58CD2471B1D3DC6647B6EF218A3ED9930EB7AE8326D4FB7F800DE5EF53C9A0581A81EC77D5783F9D86C0A7E9F5284AD215CE45DD0DBBAC8CB879742ADD8E0791E24DBC2D3FDA4F240762FBBF86E871332DAF76A820D3EE24517CF90907907AB9121B52DDC0032F8F40A14804ECF52BEC1FA8A44BB5BC8A7993CF70B18CEACEE90E2E90E553D3B6208AD161F116821838AAA76991B88886A97A98A88A6B6DF071803A9ED690C41D426E6AEBE22635E7EF7ADCDA0D8640D3576EF7FD430B1CD16B61D49E0799E1B12A1D68E277E43A8B5111D7D45DFBFE5E35BCB4331A91A5A3EF28F57D8835103158181DDAF678E793C039ED026635F5A9A031A704E30F0D416451A3DDE14F439ABF72DB060A529F97DD5E9BAEAECDE71F38D615B64C2787054703BD79D509AC2C1EF857641DBF6A62015ACEDC147968AD6F6406F08D99E6247B509E13EE01D55E54EF78FE63BDD6368B75FBAD3EDFE528FDDFA0E0591864E6BC484C815CEE447FECF74CF857D24D5FF9C250E5615E5B79DE5C69AAC4C9FBEB8675BAC6B8F254BBF1F1FA321427A460CBAC1EA992C1187086E873D7B672F771FC09C7C91CA443D7B7774B07172A0ED80264EFB6794A2BC0E0D5E07253611D33AEC1A356DB1DB21EE42AB1DB71086D0EA6E9A6D5EF1355F76B0F1D47E7DEAB8C0EA7EDF3641D8DC4C7642099F65C9AE6AAC32D3BD3622F0BAADEC2189EDD6A1C4F3D11DF13E4E137E729E78BD7A08006E5968DED51ED22EABB88C6AB9E33AB154B9168D64C6B85082CE984813FA0347080F0594D7480DE2B32C2DB060223ED47C9D47E936DA0531C33A930F3642E12B2F8E570351F6CB39DAA1B41E3D6C0B75AA13BE647BBC1AE832E35D2502EA917079E70F8EE41BF80536A2DFC69007A2DFC644BADF5E1C1DC9304084C011C488D4495020799F8EEF17D16372063890BD666A52E1AC3880C16B3B7E0F120746E35374CBED6438105738270EDAC5DE46C0BA7D176AA1A1772B8308F6DF264186594F29A2642C00227C77C4BCF219C0C239026E44EF15119D4C3A0113FD4B26EB230670452468025F27418DF489275D9F4523C0E83C556352F1BC6099778EA1DCFB60743C937946FE88CC81CD34BCF210B2EFD69987AF3F4CFB4DE41E3DB5FE10D63B035C461DBB115CD74A742B714241742791AA8F10E3E9CA13266437DA9AF9941A01C3702A53D53B0330A8C8B8D90D10262E8FA0C77C792686C75AF1A2EA81191D3438D6D053CB7C6742DDF87430013652D0373BC923B29382425EF11ED6B9334163FF2BDC3DC0C36675BB77808C81069E572B327890D10D042932F9592C54A48FD71DD83A85F69F9F77E9CAFAEE93C62CF3E959E042F9E6DA616343046B97117EE008311CC9822723A78588E2CDBB79A693D675DDE719AB021943000509B33EED191CB28ADFC533A86DAE9EDF081F9921FB7E0DEF5B50E906C644EB60CE76FF549D2F7D83C7D4D5D31C099E2A9D0B10A33BE50660DFBC17954020FD375962E4B7696609ED1E123DE9660A07E9033EFA2EA5334362EEE9E1AA2A41343C9F09027E88E70067085621708CDBF6DD13D00CBA9D2477149F414388EB9ECF849C77DA20A22D793BF2B94D1AB267734D6ADD13185863D86E3170F090D0B4F945D1BCD3624254A97748BCA39F43EAEAE79E2EE210D1BDB0D43BABF7B6C3E82CCC5A15EDE34727CBF0A60E7E6BDD8DBB8F0500159AFEB8EFC555307E826A18BF2A6A201CCDB82A886F501DC4674525A3972B57C7F809AA62FCAADB8C7EF35FDC983E87B449C33854D43B9C6170F50D5FA07A868F7AE4858D62BE4BAAD26D10798CCB55477E84EA22BF2BEA017C43B8EA803C50AD5C36752B29771759BDCA1A9555117B0F5C45C437A81AE2B3A21272FF93AB85FC0855437E573586D913E55BC464009BC5E451B5AD9F67F986F55FC056F51FF5C80FC811D532649054A60BBFCE9684AB92D4A0244C6D75F173D25A01382A834E1BC8F50DDC1A3287B05D6426CD6A25F5C92B52CB900940E3C5C8640025C9E461EA248C127EB21F763116443666D687773AE0BD8EA181441A67614107704441A13DB1A29BA2D14C20640668A82AB0866299B52F1A9645B6035592337F9AA262CBC6A5B9A30C65CD159D19DAF6D0BE9ACB0540C85A2D8F967069025C963639680AFD37675148DDFB0169E88703508DE22DB6A63D625B8C2A2DB4C31A22C0579F62910E09B5C3BBA7410118836CE3274103455F070E123F67B7E6EC1911A06F322011B50F33D510CE146A1A20B470DC069545B3859EB740D3F5BC743DEA0570E5D91060BE7816C3B03256C940E08807F91CF2CC1F48D3455E941A53E574CD9F779284FC0481E62BDD093DCD05FC42BA292B59229B3759E41107345BCB79CE53D3E1B57DAB33E52B76671190E2550A41EC32E5D28F7B1305EBD904815FE6FCE465CDC7ECB1B4B2126CA058369172E1113552ECE7433793DFE6689B2ADEBF804EF7D8C6FA6A2AE79C226AAEDC8BC58665F9F1345B5AB2EF62DF742592858E1AFEA04C6C1051AD9DAA871BD29A9D0C9CD6DBB2BFEFDE664FD3C5BA6B7298733BB8A40E9BB6D9B58ED46B387FF46AA783276F7E7FFBD1703E3A7C3B5EB5DB9D5D02FE89E7C1E00E5D66218A8B26F578F5A94AEBDB9CDA5FE7A888EE4612C798668AB6D479EC90E722BDCDFA536186A33E0B73B5D3256E5B7DB1D3695E46B7C1B6C49FB7A828F014BD5CFC5ABF95505B3F3728BC4831FC7755899B8C929B989AB9EBE36559FDC72B8EE7E3AB5DFDABF0D104CC66545F867595BEADA2381CF87E0FDCA22620519F5B77F765D57D59D6F766DD3D0E943E364F06EB10EAC4371CB77F46D874C4C48AABF43AF8866C78FB52A00FE82ED83EE2F46F51586FC88A88A83B8216FBF17914DCE541527434C6F2F827C670983CFCF9FF014E73F599F37F0100 , N'6.2.0-61023')







--delete [ApplicationLog]
--delete [WorkingHistory]
--delete [SalaryNote]
--delete [ReceiptNoteDetails]
--delete [ProductDetails]
--delete [OrderNoteDetails]
--delete [ReceiptNote]
--delete [Ingredient]
--delete [WareHouse]
--delete [Product]
--delete [OrderNote]
--delete [Customer]
--delete [Employee]
--delete [AdminRes]
--delete [__MigrationHistory]

--drop table [ApplicationLog]
--drop table [WorkingHistory]
--drop table [SalaryNote]
--drop table [ReceiptNoteDetails]
--drop table [ProductDetails]
--drop table [OrderNoteDetails]
--drop table [ReceiptNote]
--drop table [Ingredient]
--drop table [WareHouse]
--drop table [Product]
--drop table [OrderNote]
--drop table [Customer]
--drop table [Employee]
--drop table [AdminRes]
--drop table [__MigrationHistory]
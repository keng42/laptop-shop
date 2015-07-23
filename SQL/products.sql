Delete from Products;
DBCC CHECKIDENT (Products, RESEED, 0);
insert into Products Values (0,'2','Samsung Chromebook','ss2.jpg',1950,1950,'11.6" or 13.3" display<br>0.66 inches thin and 2.43 lbs<br>100 GB of Google Drive free for 2 years1<br>Up to 8.5 hours of use2<br>Boots up in seconds','2014-03-04',10010,1250,0,0,0);
insert into Products Values (1,1,'Samsung Chromebook','ss-cb.jpg',1522,1522,'11.6" display<br>0.7 inches thin and 2.4 lbs<br>Up to 7 hours of battery2<br>Boots up in less than 10 seconds<br>100 GB of Google Drive free for 2 years','2011-06-15',5000,12,0,0,0);
insert into Products Values (1,1,'Toshiba Chromebook','toshiba.jpg',1705,1705,'13.3" (1366x768) display, 16:9 aspect ratio<br>0.8 inches thin and 3.3 lbs / 1.5 kg<br>100 GB of Google Drive free for 2 years1<br>Up to 9 hours of active use2<br>Boots in seconds','2014-02-16',3800,16,0,0,0);
insert into Products Values (2,11,'HP Chromebook','hp-cb.jpg',1827,1705,'11.6" 300 nit display<br>0.69 inches thin and 2.3 lbs<br>Boots up in less than 10 seconds<br>Available in black or white with four accent colors<br>100 GB of Google Drive free for 2 years1<br>Up to 6.5 hours of battery2<br>Available in Wifi-only or with Wifi and Verizon LTE Connectivity','2013-10-09',12530,719,0,0,0);
insert into Products Values (2,14,'HP Chromebook','hp-cb-14.jpg',2133,1827,'Large 14" display<br>0.81 inches thin and 4.08 lbs<br>100 GB of Google Drive free for 2 years1<br>Up to 9.5 hours of use2<br>Boots up in less than 7 seconds<br>Available in Wifi-only or with Wifi and T-Mobile LTE Connectivity','2014-03-21',10086,459,0,0,0);
insert into Products Values (3,'C720','Acer Chromebook','ac-c720.jpg',1216,1216,'11.6" display<br>0.75 inches thin and 2.76 lbs<br>100 GB of Google Drive free for 2 years<br>Up to 8.5 hours of battery<br>Boots up in less than 7 seconds','2013-10-10',24586,2474,0,0,0);
insert into Products Values (3,'C720P','Acer Chromebook','ac-c720p.jpg',1827,1827,'11.6" (1366x768) touchscreen display, 16:9 aspect ratio<br>0.78 inches thin - 2.97 lbs/1.35kg<br>100 GB of Google Drive free for 2 years<br>Up to 7.5 hours of active use<br>Boots in seconds','2013-10-10',10586,429,0,0,0);
insert into Products Values (4,'Pixel','Google Chromebook','pixel.jpg',8857,7634,'12.85" high res display (2560x1700)<br>Multi-touch glass screen<br>0.64” thin and 3.3 lbs<br>Machined, full metal enclosure<br>1TB Google Drive, free for 3 years1<br>LTE built-in (optional)<br>Available in Wifi-only or with Wifi and Verizon LTE Connectivity','2013-02-22',100106,36,0,0,0);

insert into Products Values (5,'MGX72CH/A','MacBook Pro','MGX72CHA.jpg',9288,9720,'屏幕： 13.3英寸<br>分辨率： 2560x1600<br>CPU主频： 2.6GHz<br>核心数： 双核心/四线程<br>显卡类型： 核芯显卡<br>显存容量： 共享内存容量<br>电池类型： 聚合物电池<br>续航时间： 9小时','2012-10-10',4352,3,0,0,0);
insert into Products Values (5,'MD101CH/A','MacBook Pro','MD101CHA.jpg',7999,7600,'屏幕： 13.3英寸<br><br>分辨率： 1280x800<br><br>CPU主频： 2.5GHz<br><br>核心数： 双核心/四线程<br><br>显卡类型： 核芯显卡<br><br>显存容量： 共享内存容量<br><br>电池类型： 聚合物电池<br><br>续航时间： 7小时左右','2012-6-23',7210,34,0,0,0);
insert into Products Values (5,'MD760CH/A','MacBook Air','MD760CHA.jpg',7550,6988,'屏幕： 13.3英寸<br><br>分辨率： 1440x900<br><br>CPU主频： 1.3GHz<br><br>核心数： 双核心/四线程<br><br>显卡类型： 核芯显卡<br><br>显存容量： 共享内存容量<br><br>电池类型： 聚合物电池，5000毫安<br><br>续航时间： 12小时左右','2014-10-23',3210,2,0,0,0);




insert into Products Values (6,'ALW18D-5788','Alienware 18','slw18d-5788.jpg',39499,37999,'屏幕： 18.4英寸<br>分辨率： 1920x1080<br>CPU主频： 2.9GHz<br>核心数： 四核心/八线程<br>显卡类型： 双显卡（发烧级独立显卡＋集成显卡）<br>显存容量： 16GB<br>电池类型： 8芯锂电池<br>续航时间： 具体时间视使用环境而定','2013-07-01',9010,34,0,0,0);
insert into Products Values (6,'ALW14D-5528','Alienware 14','ALW14D-5528.jpg',12472,11563,'屏幕： 14英寸<br><br>分辨率： 1920x1080<br><br>CPU主频： 2.6GHz<br><br>核心数： 双核心/四线程<br><br>显卡类型： 发烧级独立显卡<br><br>显存容量： 2GB<br><br>电池类型： 6芯锂电池，6900毫安<br><br>续航时间： 具体时间视使用环境而定','2013-08-12',11210,151,0,0,0);
insert into Products Values (6,'ALW17D-5748','Alienware 17','ALW17D-5748.jpg',20788,18756,'屏幕： 17.3英寸<br>分辨率： 1920x1080<br>CPU主频： 2.5GHz<br>核心数： 四核心/八线程<br>显卡类型： 双显卡（发烧级独立显卡＋集成显卡）<br>显存容量： 8GB<br>电池类型： 8芯锂电池，8600毫安<br>续航时间： 具体时间视使用环境而定','2013-6-14',12210,141,0,0,0);
insert into Products Values (6,'*','Alienware 13','Alienware13.jpg',999999,999999,'概念产品 官方未发布<br>13英寸<br><br>分辨率： 2560x1440<br><br>CPU主频： 暂无数据<br><br>核心数： 暂无数据<br><br>显卡类型： 暂无数据<br><br>显存容量： 暂无数据<br><br>电池类型： 锂电池<br><br>续航时间： 具体时间视使用环境而定','2000-1-1',1510,0,0,0,0);
insert into Products Values (6,'ALW18D-4788','Alienware 18','ALW18D-4788.jpg',39499,36553,'屏幕： 18.4英寸<br>分辨率： 1920x1080<br>CPU主频： 2.8GHz<br>核心数： 四核心/八线程<br>显卡类型： 双显卡（发烧级独立显卡＋核芯显卡）<br>显存容量： 16GB<br>电池类型： 8芯锂电池<br>续航时间： 具体时间视使用环境而定','2014-10-23',7210,34,0,0,0);


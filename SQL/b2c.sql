use B2CSystem;
create table Categories(
    ID int not null identity(1,1) primary key,
    Name varchar(50),
    Memo varchar(255)
);

create table Products(
    ProductID int Not NUll Primary Key IDENTITY(1,1),
    CategoryID int Foreign key References Categories(ID),
    ModelNumber varchar(50),
    ModelName varchar(50),
    ProductImage varchar(50),
    UnitCost money Not NUll,
    Discount money Not NUll,
    Description varchar(2000),
    DateTimed smalldatetime Not NUll,
    Clicks int Not NUll,
    Sales int Not NUll,
    Commend bit Not NUll,
    Isdel bit Not NUll,
    VendorID int Not NUll
);

create table News(
    ID int not null primary key IDENTITY(1,1),
    Name varchar(50),
    IsDel bit not null,
    Memo varchar(max),
    DateTimed smalldatetime not null,
    UserID smallint
);

create table Admin(
    adminId int primary key not null,
    adminName varchar(50),
    adminPass varchar(50)
);
insert into Admin Values(1,'admin','adminpwd');

create table Customers(
    ID int primary key not null IDENTITY(1,1),
    Name varchar(50),
    Email varchar(50),
    Password varchar(50),
    Phone varchar(50),
    MobilePhone varchar(50),
    Postcode varchar(6),
    Address varchar(255),
    AddDate smalldatetime,
    IsEmp bit,-- 0
    IsVendor bit,
    IsDel bit
);
insert into Customers Values('test','i@a.com','test','20000000','13500000000','510000','广州','2014-11-13',0,0,0);

update Customers set Name='hi2',Phone='phone',MobilePhone='mobile',Postcode='code',Address='addr',Password='pwd' where email='i@a.com';


create table ShoppingCart(
    ID int primary key not null IDENTITY(1,1),
    CartID varchar(50) not null,
    ProductID int not null,
    Quantity int not null,
    DateTimed smalldatetime not null
);


create table Orders(
    ID int primary key not null IDENTITY(1,1),
    Memo varchar(2000),
    IsDel bit,
    DateTimed smalldatetime,
    CustomerID int,
    ShipDate smalldatetime,
    HasView bit,
    HasCheck bit,
    HasSend bit,
    HasReceive bit
);

insert into Orders values('this is memo',0,'2014-12-6',1,null,0,0,0,0);

create table OrderDetails(
    OrderID int not null,
    ProductID int not null,
    Quantity float not null,
    UnitCost money not null
);

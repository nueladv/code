drop database if exists dbShipping;
create database dbShipping;
use dbShipping;


create table tblCustomers(
    customerid int primary key,
    companyname varchar(100),
    firstname varchar(30),
    lastname varchar(30),
    billingaddress varchar(255),
    city varchar(30),
    stateofprovince varchar(100),
    zipcode varchar(20),
    companywebsite varchar(255),
    phonenumber varchar(30),
    faxnumber varchar(30),
    shipaddress varchar(255),
    shipcity varchar(50),
    shipstateofprovince varchar(50),
    shipzipcode varchar(20),
    shipphonenumber varchar(30),
    notes text
);

load data local infile 'C:/xampp/htdocs/rdbms/customer.csv'
into table tblCustomers
fields terminated by  ';'
ignore 1 lines;
select * from tblCustomers;

create table tblProducts(
    productid int primary key,
    productname varchar(100),
    unitprice double,
    instock int
);

load data local infile 'C:/xampp/htdocs/rdbms/products.csv'
into table tblProducts
fields terminated by ';'
ignore 1 lines;
select * from tblProducts;

create table tblEmployees(
    employeeid int primary key,
    firstname varchar(30),
    lastname varchar(30),
    title varchar(30),
    workphone varchar(20) 
);

load data local infile 'C:/xampp/htdocs/rdbms/employees.csv'
into table tblEmployees
fields terminated by  ';'
ignore 1 lines;
select * from tblEmployees;

create table tblShippingMethods(
    shippingmethodid int primary key,
    shippingmethod varchar(100)
);

load data local infile 'C:/xampp/htdocs/rdbms/shipping_methods.csv'
into table tblShippingMethods
fields terminated by ';'
ignore 1 lines;
select * from tblShippingMethods;

create table tblOrders(
    orderid int primary key,
    customerid int,
    employeeid int,
    orderdate timestamp,
    purchaseordernumber varchar(30),
    shipdate datetime,
    shippingmethodid int,
    freightcharge double,
    taxes double,
    paymentreceived char(1),
    comment text,
    foreign key(customerid) references tblCustomers(customerid),
    foreign key(employeeid) references tblEmployees(employeeid),
    foreign key(shippingmethodid) references tblShippingMethods(shippingmethodid) 
);

load data local infile 'C:/xampp/htdocs/rdbms/orders.csv'
into table tblOrders
fields terminated by  ';'
ignore 1 lines;
select * from tblOrders;

create table tblOrderDetails(
    orderdetailid int primary key,
    orderid int,
    productid int,
    quantity int,
    unitprice double,
    discount double,
    foreign key(orderid) references tblOrders(orderid),
    foreign key(productid) references tblProducts(productid)
);

load data local infile 'C:/xampp/htdocs/rdbms/order_details.csv'
into table tblOrderDetails
fields terminated by  ';'
ignore 1 lines;
select * from tblOrderDetails;

CREATE DATABASE quanlybanhang;
use quanlybanhang;
create table customer
(
    cID   int auto_increment
        primary key,
    cName varchar(30) not null,
    cAGE  int         not null
);
create table `order`
(
    oID         int auto_increment
        primary key,
    cID         int   ,
    oDate       date  null,
    oTotalPrice float null
);
create table orderdetail
(
    oID   int null,
    pID   int null,
    odQTY int null,
    constraint orderdetail_ibfk_1
        foreign key (oID) references `order` (oID),
    constraint orderdetail_ibfk_2
        foreign key (pID) references product (pID)
);

create index oID
    on orderdetail (oID);

create index pID
    on orderdetail (pID);
create table product
(
    pID    int auto_increment
        primary key,
    pName  int not null,
    pPrice int null
);
ALTER TABLE `order`
    ADD FOREIGN KEY (cID) REFERENCES customer(cID);
ALTER TABLE `orderdetail`
    ADD FOREIGN KEY (oID) REFERENCES `order`(oID);
ALTER TABLE `orderdetail`
    ADD FOREIGN KEY (pID) REFERENCES `product`(pID);
use quanlybanhang;
INSERT INTO customer (cName,cAGE) VALUES ('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);
INSERT INTO `order` (cID, oDate) VALUES (1,'2006-03-21'),(2,'2006-03-23'),(1,'2006-03-16');
INSERT INTO product ( pName, pPrice)  VALUES ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);
INSERT INTO orderdetail(oID, pID, odQTY) VALUES (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
SELECT oID,oDate,oTotalPrice from `order`;
SELECT c.cName,p.pName from customer as c inner join `order` o inner join orderdetail o2 inner join product p on o2.pID = p.pID AND o2.oID=o.oID AND c.cID=o.cID ;
SELECT c.cName from customer as c left join `order` o on c.cID = o.cID where oID is null;
SELECT o2.oID, o.oDate,o2.odQTY*p.pPrice as Price from orderdetail o2 join `order` o on o.oID = o2.oID join product p on o2.pID = p.pID;
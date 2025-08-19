drop database triggers;
create database triggers;
use triggers;
show tables;

-- before insert trigger -- 
create table customers(
cust_id int ,
age int ,
name varchar(30)
);

 delimiter // 
 create trigger age_verify 
 before insert on customers 
 for each row 
 if new.age < 0 then set new.age = 0;
 end if; // 
 
 
 insert into customers 
 values (101,27,"James"),(102,-40,"Ammy"),(103,32,"Ben"),(104,-39,"Angela");
 
 SELECT * FROM CUSTOMERS;
 
 
 -- After Insert Trigger -- 
 
 create table customers1(
 id int auto_increment primary key,
 name varchar(40) not null ,
 email varchar(30),
 birthdate date 
 );
 
 select * from customers1;
 
 CREATE TABLE message (
    id INT AUTO_INCREMENT,
    messageID INT,
    message VARCHAR(300) NOT NULL,
    PRIMARY KEY (id, messageID)
);
 
 select * from message;
 
 
 -- After insert Trigger -- 
 
 DELIMITER //
CREATE TRIGGER check_null_dob
AFTER INSERT ON customers1
FOR EACH ROW
BEGIN
    IF NEW.birthdate IS NULL THEN
        INSERT INTO message (messageID, message)
        VALUES (NEW.id, CONCAT('Hi ', NEW.name, ', please update your date of birth'));
    END IF;
END;
//

DELIMITER ;


insert into customers1 (name,email,birthdate) values
("Nancy","nancy@abc.com",NULL),
("Ronald","ronald@xyz.com","1998-11-16"),
("Cris","chris@xyz.com","1997-08-20"),
("Alice","alice@anc.com",NULL);

select * FROM CUSTOMERS1;
select * FROM message;


--  Before update trigger -- 

create table employees 
(
emp_id int primary key ,
emp_name varchar(25),
age int ,
salary float
);

insert into employees values 
(101,"Jimmy",35,70000),
(102,"Shane",30,5500),
(103,"Marry",28,62000),
(104,"Dwayne",37,5700),
(105,"Sara",32,72000),
(106,"Ammy",35,80000),
(107,"Jack",40,10000);

select * from employees;

DELIMITER //
CREATE TRIGGER upd_trigger
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary = 10000 THEN
        SET NEW.salary = 85000;
    ELSEIF NEW.salary < 10000 THEN
        SET NEW.salary = 72000;
    END IF;
END;
//
DELIMITER ;

update employees 
set salary = 8000;

-- Before Delete Trigger -- 

create table salary
(
eid int primary key ,
validfrom date not null ,
amount float not null 
);

select * from salary;

insert into salary(eid,validfrom,amount) values 
(101,'2005-05-01',55000),
(102,'2007-08-01',68000),
(103,'2006-09-01',75000);


create table salarydel 
(
id int primary key auto_increment,
eid int ,
validfrom date not null,
amount float not null ,
deletedat timestamp default now());


DELIMITER //

CREATE TRIGGER salary_delete 
BEFORE DELETE 
ON salary 
FOR EACH ROW
BEGIN
    INSERT INTO salarydel (eid, validfrom, amount)
    VALUES (OLD.eid, OLD.validfrom, OLD.amount);
END;
//

DELIMITER ;

delete from salary 
where eid =103;

select * from salarydel;





 
 
 
 
 
 
 
 
 
 
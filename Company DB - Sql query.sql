create database TechImpact;
use TechImpact; 

CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

describe employee;

CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY(mgr_id) references employee(emp_id) on delete set null
);

describe branch;

ALTER TABLE employee
ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;


create table client(
client_id INT primary key,
client_name VARCHAR(40),
branch_id INT,
foreign key(branch_id) references branch(branch_id) on delete set null
);

describe client;

create table works_on(
emp_id INT,
client_id INT,
total_sales INT,
primary key(emp_id, client_id),
foreign key(emp_id) references employee(emp_id) on delete cascade,
foreign key(client_id) references client(client_id) on delete cascade
);

describe works_on;


create table branch_supplier(
branch_id INT,
supplier_name VARCHAR(40),
supply_type VARCHAR(40),
primary key(branch_id, supplier_name),
foreign key(branch_id) references branch(branch_id) on delete cascade
);

insert into employee values(100, 'David','Wallace', '1967-11-17','M', 250000,NULL,null);
select * from employee;

insert into branch values(1, 'corporate',100,'2006-02-09');

update employee set branch_id=1 where emp_id=100;

insert into employee values(101, 'Jan','Levinson', '1961-05-11','F', 110000,NULL,null);
insert into employee values(102,'Michel','Scott','1964-03-15','M',75000,100,null);

insert into branch values(2,'Scranton', 102, '1992-04-06');

insert into employee values(103,'Angela','Martin','1971-06-25','F',63000,102,null);
insert into employee values(104,'Kelly','Kapoor','1980-02-05','F',55000,102,null);
insert into employee values(105,'Stanley','Hudson','1958-02-19','M',69000,102,null);
insert into employee values(106,'Josh','Porter','1969-09-05','M',78000,100,null);
insert into employee values(107,'Andy','Bernard','1973-07-22','M',65000,106,null);
insert into employee values(108,'Jim','Halpert','1978-10-01','M',71000,106,null);

update employee set branch_id=1 where emp_id=101;
update employee set branch_id=2 where emp_id=102;
update employee set branch_id=2 where emp_id=103;
update employee set branch_id=2 where emp_id=104;
update employee set branch_id=2 where emp_id=105;
update employee set branch_id=3 where emp_id=106;
update employee set branch_id=3 where emp_id=107;
update employee set branch_id=3 where emp_id=108;

update employee set super_id=100 where emp_id=101;

select*from employee;

insert into branch values(3, 'Stamford',106,'1998-02-13');

select * from branch;

select * from employee where sex='M';

insert into client values(400,'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

select * from client;

insert into branch_supplier values(2,'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

select * from branch_supplier;


INSERT INTO works_on VALUES(105, 400, 55000);
INSERT INTO works_on VALUES(102, 401, 267000);
INSERT INTO works_on VALUES(108, 402, 22500);
INSERT INTO works_on VALUES(107, 403, 5000);
INSERT INTO works_on VALUES(108, 403, 12000);
INSERT INTO works_on VALUES(105, 404, 33000);
INSERT INTO works_on VALUES(107, 405, 26000);
INSERT INTO works_on VALUES(102, 406, 15000);
INSERT INTO works_on VALUES(105, 406, 130000);

select * from works_on;


SELECT *
from employee
ORDER BY sex, first_name;

select * from employee order by salary asc limit 1;

select * from employee order by salary desc limit 1;

select * from employee limit 5;


select first_name, employee.last_name from employee;

select distinct branch_id from employee;

select distinct sex from employee;

select emp_id,first_name,last_name from employee where birth_day >= '1970-01-01';

select * from employee where birth_day between '1970-01-01' AND '1975-01-01';

SELECT * FROM employee WHERE (birth_day >= '1970-01-01' AND sex = 'F') OR salary > 80000;

SELECT *
FROM employee
WHERE first_name IN ('Jim', 'Michael', 'Johnny', 'David');


/* FUNCTIONS*/
/* aggregate function - In database management an aggregate function is a function where the values of multiple rows are grouped together as input on certain criteria to form a single value of more significant meaning.*/
-- Find the number of employees
SELECT COUNT(super_id) FROM employee;

select avg(salary) from employee;

select sum(salary) from employee;

select max(salary) from employee;

select * from employee order by salary desc limit 1;

select count(emp_id) from employee where sex in ("M","F");

select count(emp_id), sex from employee group by sex; 

select emp_id, sum(total_sales) from works_on group by emp_id;


update client set client_name = "LLC_FedEx" where client_id=406; 

-- wild card usage 
 select * from client where client_name like "LLC%";
 
 ## find any employee born on 10th day of the month
 
 select * from employee where birth_day like "_____10%";
 
 
 ## Usage of UNION
 
select first_name from employee UNION select branch_name from branch;
 
select branch_name from branch UNION select emp_id from employee;

select avg(salary), sex from employee group  by sex having avg(salary)>90000;

## Joins

select emp_id, mgr_id, branch_name, first_name, salary, mgr_start_date from employee inner join branch on employee.emp_id = branch.branch_id;

select client_name, branch_name from branch inner join client on branch.branch_id = client.branch_id;

select branch.branch_id, branch_name, supplier_name from branch inner join branch_supplier on branch.branch_id = branch_supplier.branch_id;


select supplier_name, branch_name from branch_supplier left join branch on branch_supplier.branch_id = branch.branch_id;

select supplier_name, branch_name from branch_supplier right join branch on branch_supplier.branch_id = branch.branch_id;

select * from employee where emp_id in (select distinct works_on.emp_id from works_on where works_on.total_sales > 50000);












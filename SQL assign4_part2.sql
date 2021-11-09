/*-------------------------------------------------------------------------------------------------------*/
/*                      Creating tables                                         */

CREATE TABLE Employee(
        EmpID           VARCHAR(8) not null,  -- this is goin to be the primary key
        FName           Varchar(15),          -- first name of the employee
        LName           Varchar(15),          -- last name of the employee
        Pronoun         Varchar(15),          -- he/him, she/her
        Gender          Varchar(8),           -- male, female, others
        PhoneNo         Varchar(12) not null,   
        Email           Varchar(30) not null,       
        Street_Address  Varchar(30),  
        City            Varchar(10),
        Province        varchar(15),
        PostalCode      varchar(7),
        Marital_Status  varchar(10),
        PositionTitle   varchar(20),          -- this is foreign key drawn from the salary table to define the salary of the employee
        DeptID          varchar(8),           -- foreign key that tells us which department does the employe work in
        StartDate       date,                 -- date on which employee stated working
        Empusername     varchar(20) ,
        Emppassword     varchar(20),

        Primary Key (EmpID)
);

Create Table Department(
        DeptID          Varchar(8) not null,    -- unique id affiliated with a department
        Name            varchar(15),            -- name of the department
        DeptManager     varchar(8),             -- this will be an employee who manages a certain department
        
        Primary Key (DeptID)
);

Create Table Salary(
        PositionTitle   varchar(20),            -- salaries are based on the position title of the employee
                                                -- this is also the primary key for salary table
        Amount          float(10),              -- amount that is fixed for a specific title in the company
        Bonus           float(10),
        
        Primary Key (PositionTitle)
);

Create  Table Leave(
        LeaveID        varchar(8) not null,
        EmpID          varchar(8),              -- foreign key that will be used to track the holidays employee 
        DateLeave      date, 
        
        Primary Key (LeaveID)
);

Create Table Payroll(
        TransactionID       varchar(8) not null,
        EmpID               varchar(8) ,            -- foreign key 
        DatePayed           date,
        Amount              float(10),
        Gross               float(10),
        Bank                varchar(15),
        AccountNumber       number(12),
        P_Manager           varchar(8),             -- this will be an employee who manages payroll
        Report              varchar(200),
        
        Primary Key (TransactionID)

);

/*-------------------------------------------------------------------------------------------------------*/
/*              Altering tables, adding in foreign keys to the tables               */

alter table Employee
add foreign key (DeptID) References Department(DeptID);

alter table Employee
add foreign key (PositionTitle) References Salary(PositionTitle);

alter table Leave
add Foreign Key (EmpID) References Employee(EmpID);

alter table Payroll
add Foreign Key (EmpID) References Employee(EmpID);


-- There needs to be an increment in the Position Title column storage
alter table employee
modify PositionTitle varchar(30);



/*-------------------------------------------------------------------------------------------------------*/
/*                  Inserting to the table EMPLOYEE                             */

insert into employee (empid , fname , lname , pronoun, 
                gender, phoneno, email, street_address, city, province, postalcode, 
                marital_status, positiontitle, deptid, empusername, emppassword)
       values ('78945655', 'Hunk', 'Logan', 'he/him', 
                'M', '905-456-4561', 'aaronhunk@xyz.com', '25 Dinasour Street', 'Toronto', 'ON', 'A7P 6E2', 
                'Single', 'Assitant HR', '78945612', 'hunk.pp', 'Snake@12');
insert into employee (empid , fname , lname , pronoun, 
                gender, phoneno, email, street_address, city, province, postalcode, 
                marital_status, positiontitle, deptid, empusername, emppassword)
       values ('78945656', 'Peter', 'Jhonson', 'he/him', 
                'M', '905-456-4455', 'petjhon@xyz.com', '14 Lisa Street', 'Brampton', 'ON', 'P3R 7B7', 
                'Married', 'Business Manager', '78945613', 'pettj.1', 'Snake@12');
insert into employee (empid , fname , lname , pronoun, 
                gender, phoneno, email, street_address, city, province, postalcode, 
                marital_status, positiontitle, deptid, empusername, emppassword)
       values ('78945657', 'Jane', 'Ace', 'she/her', 
                'F', '416-454-7856', 'ace2jane@abc.com', '31 Pink Streey', 'Oakville', 'ON', 'L3B 7N5', 
                'Single', 'Training Lead', '78945614', 'jace3n', 'Snake@12');
insert into employee (empid , fname , lname , pronoun, 
                gender, phoneno, email, street_address, city, province, postalcode, 
                marital_status, positiontitle, deptid, empusername, emppassword)
       values ('78945658', 'Emma', 'Oaks', 'she/her', 
                'F', '416-789-1268', 'oaksemma@xyz.com', '47 Herrsion Road', 'Palace', 'ON', 'R3U 8H3', 
                'Divorced', 'Analyst', '78945611', 'eoa3ks', 'Snake@12');
insert into employee (empid , fname , lname , pronoun, 
                gender, phoneno, email, street_address, city, province, postalcode, 
                marital_status, positiontitle,deptid, empusername, emppassword)
       values ('78945659', 'harry', 'potter', 'he/him', 
                'M', '416-456-4821', 'potterharry@hogs.com', '34 James Street', 'London', 'ON', 'H7G 3H8', 
                'Single', 'Analyst','78945611', 'potterh3ry', 'Snake@12');

/*-------------------------------------------------------------------------------------------------------*/
/*              Inserting into the table DEPARTMENT                             */

insert into department (deptid, name, deptmanager)
        values ('78945611', 'IT',Null);
insert into department (deptid, name, deptmanager)
        values ('78945612', 'Hiring',null);
insert into department (deptid, name, deptmanager)
        values ('78945613', 'Managment','78945656');
insert into department (deptid, name, deptmanager)
        values ('78945614', 'Training',null);        

/*-------------------------------------------------------------------------------------------------------*/
/*                  Inserting into the table LEAVE                              */


insert into leave (leaveid, empid, dateleave)
        values ('78945689', '78945655',  '2021-10-15');
insert into leave (leaveid, empid, dateleave)
        values ('78945690', '78945657', '2021-10-14');
insert into leave (leaveid, empid, dateleave)
        values ('78945691', '78945659', '2021-10-13');
insert into leave (leaveid, empid, dateleave)
        values ('78945692', '78945657', '2021-10-12');
insert into leave (leaveid, empid, dateleave)
        values ('78945693', '78945655', '2021-10-11');
insert into leave (leaveid, empid, dateleave)
        values ('78945694', '78945656', '2021-10-13');
insert into leave (leaveid, empid, dateleave)
        values ('78945695', '78945655', '2021-10-14');        

/*-------------------------------------------------------------------------------------------------------*/
/*                  Inserting into the table SALARY                             */

insert into salary (positiontitle,amount)
        values ('Assitant HR', 223454);
insert into salary (positiontitle, amount)
        values ('Training Lead', 213454);
insert into salary (positiontitle, amount)
        values ('Analyst', 442457);
insert into salary (positiontitle, amount)
        values ('Business Manager',787641);        

/*-------------------------------------------------------------------------------------------------------*/
/*                  Inserting into the table PAYROLL                            */

insert into payroll (transactionid, empid, datepayed, bank, accountnumber, report)
        values ('45454511', '78945655', '2021-10-19', 'Scotiabank', '123456789111', 'This is test data 1.');
insert into payroll (transactionid, empid, datepayed, bank, accountnumber, report)
        values ('45454512', '78945657', '2021-10-19', 'RBC', '123456789112', 'This is test data 2.');
insert into payroll (transactionid, empid, datepayed, bank, accountnumber, report)
        values ('45454513', '78945657', '2021-10-15', 'RBC', '123456789123', 'This is test data 3.');
insert into payroll (transactionid, empid, datepayed, bank, accountnumber, report)
        values ('45454514', '78945659', '2021-10-15', 'Amex', '123456789114', 'This is test data 4.');
insert into payroll (transactionid, empid, datepayed, bank, accountnumber, report)
        values ('45454515', '78945658', '2021-10-17', 'Amex', '123456789115', 'This is test data 5.');        

/*-------------------------------------------------------------------------------------------------------*/
/*                  Writing some simple queries                                 */

ttitle left '---COMPLETE TABLE EMPLOYEE---'-   
skip left ''
select * from employee for update nowait;   -- display the whole employee table

ttitle left '---COMPLETE TABLE DEPARTMENT---'-   
skip left ''
select * from department for update nowait; -- display the whole department table

ttitle left '---COMPLETE TABLE LEAVE---'-   
skip left ''
select * from leave for update nowait;      -- display the whole leave table

ttitle left '---COMPLETE TABLE SALARY---'-   
skip left ''
select * from salary for update nowait;     -- displays the whole salary table

ttitle left '---COMPLETE TABLE PAYROLL---'-   
skip left ''
select * from payroll for update nowait;    -- display the whole payroll table

/*-------------------------------------------------------------------------------------------------------*/
/*                  Writing some more simple queries                                 */

ttitle left '---Salaries greater than 400,000---'-   
skip left ''
select positiontit, amount from salary                        -- displays  the records from table salary
            where amount >= 400000          -- with amount greater than or equal to 400,000
            order by amount desc            -- and sort it in desc order of amount
            for update nowait;

ttitle left '---OREDRING THE NAMESS OF EMP IN DESCENDING ORDER---'-   
skip left ''            
select fname as FirstName,lname as LastName  -- select fname and last name from employee table
            from employee                    -- name the columns FirstName and LastName
            order by fname desc;             -- order by desceding order of firstname

ttitle left '---LISTING SINGLE FEMALES IN THE DATABASE---'-   
skip left ''
select * from employee                       -- select the employee
            where Gender = 'F'               -- who is female 
            and marital_status = 'Single'    -- and single
            for update nowait;            

ttitle left '---NUMBER OF EMPLOYEES WITH A BANK---'-
skip left ''                                                               
select count(transactionid) as EmpFromThisBank, -- this query counts the number of
            payroll.bank                        -- employees affiliated with     
            from payroll                        -- each bank
            group by bank;


ttitle left '---PAYROLLS GENERATED BEFORE 18 Oct, 2021---'- 
skip left '---AND SORT THEM BY DATE---'-
skip left ''
select transactionid as TranID,      -- selecting the payrolls which were payed 
        accountnumber as AccNumber,         -- before 18 oct, 2021
            bank, datepayed from payroll    -- and ordered in ascending order of date 
            where datepayed < '2021-10-18'
            order by datepayed;

ttitle left '---LISTING DEPARTMENT NAMES---'-   
skip left ''            
select name as DeptName from department             -- selecting the deparment names
            order by department.name;               -- listed in ascending order

ttitle left '---NUMBER OF EMPLOYEES ON LEAVE ON CERTAIN DATE---'-  
skip left ''            
select count(leaveid) as peopleOnLeave,         -- displays the number of people 
            leave.dateleave                     -- who were on leave on a certain
            from leave                          -- date and list them in ascending order
            group by dateleave                  -- of date.
            order by dateleave;

ttitle left '---NUMBER OF EMPLOYEES ON A CERTAIN POSITION TITLE---'- 
skip left ''            
select count(empid) as employeeCount,           -- this query tells us 
            positiontitle                       -- how  many employees we have working
            from employee                       -- at different positions in the company
            group by positiontitle;            

--delete from payroll;

-- a table that shows the salary amount of an employee
create view emp_salary as
(select e.empid, e.fname, e.lname, s.positiontitle, s.amount 
        from employee e, salary s
        where e.positiontitle = s.positiontitle);
 
--  this gives the data of the employee with acccount number  123456789112
create view accnum_detail as
(select distinct s.positiontitle, d.name as department, e.fname, e.lname, e.empid, s.amount, p.accountnumber
        from employee e , salary s, department d, payroll p
        where p.accountnumber = '123456789112'
                and p.empid = e.empid
                and e.positiontitle = s.positiontitle
                and e.deptid = d.deptid);

-- names and empid's of employees who were on leave on 'oct 13 2021'
create view emp_on_leave_on_13oct as
(select e.fname,e.lname,e.empid,l.dateleave      
            from leave l, employee e
            where l.dateleave = '2021-10-13'
                and l.empid = e.empid);                         
                   
select * from emp_on_leave_on_13oct;
select * from emp_salary;
select * from accnum_detail; 

drop view accnum_detail;

alter session set ddl_lock_timeout = 600;

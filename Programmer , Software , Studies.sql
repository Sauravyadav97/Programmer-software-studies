create database Intel_Assgn_107
GO

CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
GO

SELECT * FROM studies

INSERT INTO studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
GO

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)
GO

SELECT * FROM software

INSERT INTO software
SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6
Go


CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
GO

SELECT * FROM programmer

INSERT INTO programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500
Go


SELECT * FROM programmer
SELECT * FROM software
SELECT * FROM studies



 


1)Display the details of the Software Developed in C By female programmers of
   Pragathi?


     select software.pname , developin , title , scost , dcost , sold
     from software inner join programmer on software.pname = programmer.pname
     inner join studies on studies.pname = software.pname
     where developin = 'dbase' and gender = 'f' and institute = 'pragathi'


2)Display the number of packages, No. of Copies Sold and sales value of
      each programmer institute wise.

      select  institute, sum(sold) as copies_sold , sum(scost * sold) as sales_values   from 
      software inner join studies on software.pname = studies.pname
      group by institute

3)Display the details of the software developed in DBASE by Male Programmers, who
  belong to the institute in which most number of Programmers studied.

   select top 1 institute , count(institute) as max_institute, 
      title ,developin, scost , dcost , sold from software inner join programmer
      on software.pname = programmer.pname inner join studies on studies.pname = 
     programmer.pname where developin = 'dbase' and gender = 'm'
     group by institute  , developin , title , scost , dcost , sold
     order by count(institute)  desc

4) Display the details of the software Developed by the male programmers Born
   before 1965 and female programmers born after 1975.


     select software.pname , developin , title , scost , dcost , sold , gender , dob
     from software inner join programmer on software.pname = programmer.pname
     where year(dob) < 1966 and  gender = 'm'
     or year(dob) > 1968 and gender = 'f'
     select * from programmer

5) Display the details of the software that has developed in the language which is
   neither the first nor the second proficiency of the programmers.


    select software.pname , developin , title , scost , dcost , sold 
    from software inner join programmer on software.pname = programmer.pname
    where developin not in (select prof1  from programmer) and developin not in 
    (select prof2 from programmer)


6)  Display the details of the software developed by the male students of Sabhari.

     select software.pname , developin , title , scost , dcost , sold from
     software inner join programmer on software.pname = programmer.pname
     inner join studies on studies.pname = software.pname
     where gender = 'm' and institute = 'sabhari'



7)  Display the total sales value of the software, institute wise.

    select institute , sum(scost * sold) from software inner join studies
     on software.pname = studies.pname
     group by institute 

8) In which institute does the person who developed the costliest package studied.

      select top 1  institute , max(dcost) from software inner join studies 
      on studies.pname = software.pname
      group by institute
      order by max(dcost) desc


9)  How much does the person who developed the highest selling package earn and
    what course did HE/SHE undergo.


     select * from( select rank() over(order by sold desc) as sold_rank , 
     software.pname ,  sold , salary ,  course 
     from software inner join programmer on 
     software.pname = programmer.pname
     inner join
      studies on studies.pname = software.pname
      ) as p where p.sold_rank = 1
  
or

select top 1 software.pname ,  sold , salary ,  course 
from software inner join programmer on 
software.pname = programmer.pname
inner join
studies on studies.pname = software.pname
order by sold desc





10) How many packages were developed by students, who studied in institute that
    charge the lowest course fee? 

      select count(software.pname)  , institute , course_fee from
      software inner join studies on software.pname = studies.pname
      where course_fee = (select min(course_fee) from studies)
      group by institute , course_fee





11)    How many packages are developed by the most experienced programmer form
       BDPS.

     select count(software.pname)  
     from studies inner join software
      on software.pname = studies.pname inner join programmer
      on programmer.pname = software.pname
      where institute = 'bdps' and doj = 
      (select min(doj) from programmer)








  
12)  List the programmer names (from the programmer table) and No. Of Packages
     each has developed


      select programmer.pname , count(software.pname) 
      as packages_developed from software 
      inner join programmer on programmer.pname = software.pname
      group by programmer.pname

	

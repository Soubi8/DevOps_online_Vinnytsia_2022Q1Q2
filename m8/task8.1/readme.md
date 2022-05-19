# Module 7 - Database Administration    
## Task 7.1
## Part 1
### 1. Download MySQL server for your OS on VM.
To install the MySQL server I executed the `sudo apt-get install mysql-server` command.

### 2. Install MySQL server on VM.
Since I've installed the MySQL in the previous step, I checked the status of the service by running `systemctl status mysql.service`.

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/1.jpg)

### 3. Select a subject area and describe the database schema, (minimum 3 tables)
I decided to create a database for the __Car Service__ of completed work orders. It will contain 3 tables with information about the clients and their cars, jobs done with date stamps and parts used for the maintenance.

### Table 1. Information about clients and their vehicles
| Customer ID | Client's Name | Car | Year | VIN Number | Phone Number |
| - | - | - | - | - | - |
| 1001 | Andrii | Mazda 3 | 2008 | 2GNFLGEK5D6416554 | 380688233443 |
| 1002 | Maksym | Audi A4 | 2011 | KNDJC733745285895 | 380972310098 |
| 1003 | Olena | Fiat 500 | 2013 | 2B3KA43G07H836713 | 380987371223 |
| 1004 | Vasyl | Opel Astra | 2012 | WBAEA5C55ACV92970 | 380931288323 |
| 1005 | Volodymyr | BMW X1 | 2014 | 3N1AB7AP7EY247485 | 380985644771 |
| 1006 | Svitlana | Hyundai i10 | 2013 | JS2GB41W0Y5183116 | 380977544317 |
| 1007 | Alina | Audi Q3 | 2018 | 3A8FY58898T170603 | 380938709162 |

### Table 2. Completed work orders
| Order # | Customer ID | Job Description | Price for job | Employee | Total Price |
| - | - | - | - | - | - | 
| 22001 | 1002 | Coolant replacement | 1000 | Andrii | 2000 |
| 22002 | 1004 | Wheel allignment | 500 | Oleksandr | 500 |
| 22003 | 1005 | Oil change | 600 | Andrii | 1650 | 
| 22004 | 1001 | Replacement of front brake pads | 800 | Oleksandr | 1700 |
| 22005 | 1003 | Rear shocks replacement | 1500 | Oleksandr | 4000 |
| 22006 | 1006 | Oil change | 600 | Andrii | 1550 |
| 22007 | 1002 | Oil change | 600 | Andrii | 1600 |
| 22008 | 1007 | Front shocks replacement | 1500 | Oleksandr | 3900 |
| 22009 | 1004 | A/C refill | 1000 | Oleksandr | 1600 |
| 22010 | 1001 | Door handle replacement | 400 | Oleksandr | 1050 |

### Table 3. Parts used for maintenance
| Item Description | Manufacturer | Part Number | Price | Order # | 
| - | - | - | - | - |
| Oil 5w20 5L | Total | 8749 | 700 | 22006 |
| Oil 5w30 5L | Total | 8750 | 700 | 22007 |
| Oil 5w40 5L | Total | 8751 | 750 | 22003 |
| Oil Filter | Mahle | 1232 | 300 | 22003 |
| Oil Filter | Filtron | 65782 | 250 | 22006 |
| Oil Filter | MANN | 5433 | 300 | 22007 |
| Coolant 5L Concentrate G12+ | Coolstream | 72230 | 1000 | 22001 |
| Brake Pads | Brembo | 12345 | 900 | 22004 |
| Rear Shock (Pair) | KYB | 87123 | 2500 | 22005 |
| AC Gas R410A | Du-Pont | 65432 | 600 | 22009 |
| Door Handle Mazda 3 OEM | Mazda | 12012 | 650 | 22010 |
| Front Shock (Pair) | Monroe | 62531 | 2400 | 22008 |

### 4. Create a database on the server through the console.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/2.jpg)

`use car_service;` to use the previously created database.

### 5. Fill in tables.

Created 3 tables and filled in the information based on the tables above.

    CREATE TABLE clients_info (
        customer_id INT NOT NULL,
        customer_name VARCHAR(30) NOT NULL,
        car VARCHAR(30) NOT NULL,
        release_year INT NOT NULL,
        vin VARCHAR(17) NOT NULL,
        phone VARCHAR(10) NOT NULL,
        PRIMARY KEY(customer_id)
    );

    INSERT INTO clients_info VALUE (1001, "Andrii", "Mazda 3", 2008, "2GNFLGEK5D6416554", 0688233443);
    INSERT INTO clients_info VALUE (1002, "Maksym", "Audi A4", 2011, "KNDJC733745285895", 0972310098);
    INSERT INTO clients_info VALUE (1003, "Olena", "Fiat 500", 2013, "2B3KA43G07H836713", 0987371223);
    INSERT INTO clients_info VALUE (1004, "Vasyl", "Opel Astra", 2012, "WBAEA5C55ACV92970", 0931288323);
    INSERT INTO clients_info VALUE (1005, "Volodymyr", "BMW X1", 2014, "3N1AB7AP7EY247485", 0985644771);
    INSERT INTO clients_info VALUE (1006, "Svitlana", "Hyundai i10", 2013, "JS2GB41W0Y5183116", 0977544317);
    INSERT INTO clients_info VALUE (1007, "Alina", "Audi Q3", 2018, "3A8FY58898T170603", 0938709162);

    CREATE TABLE work_orders (
        order_num INT NOT NULL,
        customer_id INT NOT NULL,
        job_description VARCHAR(60) NOT NULL,
        price INT NOT NULL,
        employee VARCHAR(15) NOT NULL,
        total_price INT NOT NULL,
        PRIMARY KEY(order_num)
    );

    INSERT INTO work_orders VALUE (22001, 1002, "Coolant replacement", 1000, "Andrii", 2000);
    INSERT INTO work_orders VALUE (22002, 1004, "Wheel allignment", 500, "Oleksandr ", 500);
    INSERT INTO work_orders VALUE (22003, 1005, "Oil change", 600, "Andrii", 1650);
    INSERT INTO work_orders VALUE (22004, 1001, "Replacement of front brake pads", 800, "Oleksandr ", 1700);
    INSERT INTO work_orders VALUE (22005, 1003, "Rear shocks replacement", 1500, "Oleksandr ", 4000);
    INSERT INTO work_orders VALUE (22006, 1006, "Oil change", 600, "Andrii", 1550);
    INSERT INTO work_orders VALUE (22007, 1002, "Oil change", 600, "Andrii", 1600);
    INSERT INTO work_orders VALUE (22008, 1007, "Front shocks replacement", 1500, "Oleksandr ", 3900);
    INSERT INTO work_orders VALUE (22009, 1004, "A/C refill", 1000, "Oleksandr ", 1600);
    INSERT INTO work_orders VALUE (22010, 1001, "Door handle replacement", 400, "Oleksandr ", 1050);

    CREATE TABLE items (
        item_description VARCHAR(60) NOT NULL,
        manufacturer VARCHAR(30) NOT NULL,
        part_number INT NOT NULL,
        price INT NOT NULL,
        order_num INT NOT NULL,
        PRIMARY KEY(part_number)
    );

    INSERT INTO items VALUE ("Oil 5w20 5L", "Total", 8749, 700, 22006);
    INSERT INTO items VALUE ("Oil 5w30 5L", "Total", 8750, 700, 22007);
    INSERT INTO items VALUE ("Oil 5w40 5L", "Total", 8751, 750, 22003);
    INSERT INTO items VALUE ("Oil Filter", "Mahle", 1232, 300, 22003);
    INSERT INTO items VALUE ("Oil Filter", "Filtron", 65782, 250, 22006);
    INSERT INTO items VALUE ("Oil Filter", "MANN", 5433, 300, 22007);
    INSERT INTO items VALUE ("Coolant 5L Concentrate G12+", "Coolstream", 72230, 1000, 22001);
    INSERT INTO items VALUE ("Brake Pads", "Brembo", 12345, 900, 22004);
    INSERT INTO items VALUE ("Rear Shock (Pair)", "KYB", 87123, 2500, 22005);
    INSERT INTO items VALUE ("AC Gas R410A", "Du-Pont", 65432, 600, 22009);
    INSERT INTO items VALUE ("Door Handle Mazda 3 OEM", "Mazda", 12012, 650, 22010);
    INSERT INTO items VALUE ("Front Shock (Pair)", "Monroe", 62531, 2400, 22008);

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/3.jpg)

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/4.jpg)

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/5.jpg)

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/6.jpg)

### 6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY.
`SELECT * FROM work_orders WHERE employee = 'Andrii' GROUP BY order_num ORDER BY customer_id;`

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/7.jpg)

### 7. Execute other different SQL queries DDL, DML, DCL.
### DDL query

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/8.jpg)

### DML query

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/9.jpg)

### DCL query

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/10.jpg)

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/11.jpg)

### 8. Create a database of new users with different privileges. Connect to the database as a new user and verify the privileges allow or deny certain actions.

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/12.jpg)

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/13.jpg)

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/14.jpg)

### 9. Make a selection from the main table DB MySQL.

![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/15.jpg)

## Part 2
### 10. Make backup of your database.

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/16.jpg)

### 11. Delete the table and/or part of the data in the table.

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/17.jpg)

### 12. Restore your database.

![Screenshot18](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/18.jpg)

### 13. Transfer your local database to RDS AWS.
I created a MySQL database on AWS RDS first. 

![Screenshot19](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/19.jpg)

Then restored the database from the backup created in the step #10. For this matter, I created an EC2 instance and installed MySQL client on it. I used this instance to connect to the AWS RDS database, where I restored the database from the backup.

![Screenshot20](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/20.jpg)

![Screenshot21](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/21.jpg)

### 14. Connect to your database.

![Screenshot22](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/22.jpg)

### 15. Execute SELECT operator similar step 6.

![Screenshot23](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/23.jpg)

### 16. Create a dump of your database.

![Screenshot24](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/24.jpg)

![Screenshot25](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/25.jpg)

## Part 3 - MongoDB
### 17. Create a database. Use the use command to connect to a new database (If it doesn't exist, Mongo will create it when you write to it).

For this matter, I created __Cluster0__ and connected to it using MongoDB Shell.

![Screenshot26](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/26.jpg)

![Screenshot27](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/27.jpg)

### 18. Create a collection. Use db.createCollection to create a collection. I'll leave the subject up to you. Run show dbs and show collections to view your database and collections.

![Screenshot28](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/28.jpg)

### 19. Create some documents. Insert a couple of documents into your collection. I'll leave the subject matter up to you, perhaps cars or hats.

![Screenshot29](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/29.jpg)

### 20. Use find() to list documents out.

![Screenshot30](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/Screenshots/30.jpg)

## Summary
In this task I installed the MySQL database server on my virtual machine. I created a database and few tables which were populated with data for further manipulation. I executed some common queries within the database, created its backup and restored it to the AWS RDS database in turn. As a final part, I familiarized myself with the MongoDB, its collections and documents and some common commands within the mongosh.

[car_service.sql](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m7/task7.1/car_service.sql)

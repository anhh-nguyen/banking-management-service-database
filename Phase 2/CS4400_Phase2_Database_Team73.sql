DROP DATABASE IF EXISTS banking;
CREATE DATABASE IF NOT EXISTS banking;
USE banking;

DROP TABLE IF EXISTS person;
CREATE TABLE person (
    Person_ID varchar(50) not null,
    Password varchar(50) not null,
    Tax_ID varchar(11),
    First_Name varchar(50),
    Last_Name varchar(50),
    Birthdate date,
    Street varchar(50),
    City varchar(50),
    State char(2),
    Zip decimal(5,0),
    Date_Joined date,
    Salary decimal(6,0),
    Num_Payments decimal(3,0),
    Tot_Earned decimal(9,0),
    User_Type varchar(100) not null,
    PRIMARY KEY(person_id)
) ENGINE=innodb;

insert into person values ('mmoss7', 'password1', null, null, null, null, null, null, null, null, null, null, null, null, 'admin');
insert into person values ('tmcgee1', 'password2', null, null, null, null, null, null, null, null, null, null, null, null, 'admin');
insert into person values ('dscully5', 'password3', null, null, null, null, null, null, null, null, null, null, null, null, 'admin');
insert into person values ('fmulder8', 'password4', null, null, null, null, null, null, null, null, null, null, null, null, 'admin');
insert into person values ('arwhite6' , 'password5', '053-87-1120', 'Amelia-Rose', 'Whitehead', '1960-06-06', '60 Nightshade Court', 'Baltimore', 'MD', '21217', '2021-12-03', '4700', '6', '28200', 'employee/customer');
insert into person values ('ealfaro4' , 'password6', '278-78-7676', 'Evie', 'Alfaro', '1960-06-06', '314 Five Fingers Way', 'Atlanta', 'GA', '30301', '2021-12-27', '5600', '3', '17100', 'employee');
insert into person values ('mmcgill4' , 'password7', '623-09-0887', 'Maheen', 'McGill', '1955-06-23', '741 Pan American Trace', 'East Cobb', 'GA', '30304', '2020-09-08', '9400', '3', '29100', 'employee');
insert into person values ('sville19' , 'password8', '354-10-6263', 'Sahar', 'Villegas', '1965-03-16', '10 Downing Road', 'East Cobb', 'GA', '30304', '2020-06-16', '8000', '4', '35000', 'employee');
insert into person values ('rnairn5', 'password9', '404-51-1036', 'Roxanne', 'Nairn', '1959-07-13', '2048 Transparency Road', 'Atlanta', 'GA', '30301', '2021-08-16', '5100', '5', '27400', 'employee');
insert into person values ('smcgill17' , 'password10', '238-40-5070', 'Saqlain', 'McGill', '1954-06-02', '741 Pan American Trace', 'East Cobb', 'GA', '30304', '2020-09-11', '8800', '3', '33700', 'employee');
insert into person values ('tjtalbot4', 'password11', '203-46-3005', 'TJ', 'Talbot', '1978-05-10', '101 Snoopy Woodstock Circle', 'Salt Lake City', 'UT', '84108', '2020-03-25', null, null, null, 'customer');
insert into person values ('owalter6', 'password12', '346-51-9139', 'Om', 'Walter', '1971-10-23', '143 Snoopy Woodstock Circle', 'Salt Lake City', 'UT', '84108', '2020-04-29', null, null, null, 'customer');
insert into person values ('rsanchez', 'password13', '012-34-5678', 'Rick', 'Sanchez', '1936-08-22', '137 Puget Run', 'Seattle', 'WA', '98420', null, '49500', '10', '654321', 'employee/customer');
insert into person values ('msmith', 'password14', '246-80-1234', 'Morty', 'Smith', '1999-04-04', '137 Puget Run', 'Seattle', 'WA', '98420', '2017-08-21', null, null, null, 'customer');
insert into person values ('lgibbs4', 'password15', '304-39-1098', 'Leroy', 'Gibbs', '1954-11-21', '50 Mountain Spur', 'Stillwater', 'PA', '17878', '2021-06-16', null, null, null, 'employee');
insert into person values ('ghopper9', 'password16', '101-00-1111', 'Grace', 'Hopper', '1906-12-09', '1 Broadway', 'New York', 'NY', '10004', '2019-12-25', '49500', '5', '447999', 'employee');
insert into person values ('asantiago99', 'password17', '765-43-2109', 'Amy', 'Santiago', '1983-07-04', '1477 Park Avenue Apt. 82', 'New York', 'NY', '11217', '2018-03-09', null, null, null, 'customer');
insert into person values ('rholt99', 'password18', '111-22-3333', 'Raymond', 'Holt', '1955-01-01', '123 Main Street', 'Perth Amboy', 'NJ', '08861', '2022-01-01', null, null, null, 'employee/customer');
insert into person values ('jperalta99', 'password19', '775-33-6054', 'Jake', 'Peralta', '1981-09-04', '1477 Park Avenue Apt. 82', 'New York', 'NY', '11217', '2018-03-10', 5400, 3, 5900, 'employee');
insert into person values ('glinetti99', 'password20', '233-76-0019', 'Gina', 'Linetti', '1986-03-20', '75 Allure Drive', 'New York', 'NY', '11220', '2019-04-04', null, null, null, 'employee/customer');
insert into person values ('cboyle99', 'password21', '433-12-1200', 'Charles', 'Boyle', '1982-09-04', '1477 Park Avenue Apt. 65', 'New York', 'NY', '11217', '2018-03-10', null, null, '1200', 'employee/customer');
insert into person values ('rdiaz99', 'password22', '687-54-1033', 'Rosa', 'Diaz', '1984-11-30', '3 East Park Loop', 'Yonkers', 'NY', '10112', '2020-12-24', null, null, null, 'customer');
insert into person values ('atrebek1', 'password23', '000-00-0000', 'Alex', 'Trebek', '1940-07-22', '10202 West Washington Boulevard', 'Culver City', 'CA', '90232', '2014-03-22', null, null, null, 'customer');
insert into person values ('kjennings66', 'password24', '004-52-2700', 'Ken', 'Jennings', '1974-05-23', '74 Champions Height', 'Edmonds', 'WA', '98020', '2005-09-07', '2000', '9', '43000', 'employee/customer');
insert into person values ('gburdell', 'password25', '404-00-0000', null, null, null, null, null, null, null, null, null, null, null, 'employee');
insert into person values ('pbeesly17', 'password26', '664-98-7654', 'Pam', 'Beesly', null, null, null, null, null, '2021-06-06', '8400', '2', '14000', 'employee/customer');
insert into person values ('beyonce', 'password27', '444-55-666', 'Beyonce', null, '1981-09-04', '222 Star Grove', 'Houston', 'TX', '77077', '2014-02-02', '9800', '6', '320985', 'employee'); 

DROP TABLE IF EXISTS contact;
CREATE TABLE contact (
    Customer_ID varchar(50) not null,
    Contact_Type varchar(50) not null,
    Contact_Address varchar(100) not null,
    PRIMARY KEY(Customer_ID, Contact_Type, Contact_Address),
    CONSTRAINT contact_ibfk_9 FOREIGN KEY (Customer_ID) REFERENCES person(Person_ID)
) ENGINE=innodb;

INSERT INTO contact VALUES ('arwhite6', 'mobile', '333-182-9303');
INSERT INTO contact VALUES('arwhite6', 'email', 'amelia_whitehead@me.com');
INSERT INTO contact VALUES('tjtalbot4', 'mobile', '845-101-2760');
INSERT INTO contact VALUES('tjtalbot4' ,'home' ,'236-464-1023');
INSERT INTO contact VALUES('tjtalbot4', 'email', 'tj_forever@aol.com');
INSERT INTO contact VALUES('owalter6', 'home', '370-186-5341');
INSERT INTO contact VALUES('rsanchez', 'phone', '000-098-7654');
INSERT INTO contact VALUES('msmith', 'email', 'morty@rm.com');
INSERT INTO contact VALUES('asantiago99', 'email', 'asantiago99@nypd.org');
INSERT INTO contact VALUES('asantiago99', 'fax' '334-444-1234', 'x276');
INSERT INTO contact VALUES('pbeesly17', 'email', 'pb@dunder.com');
INSERT INTO contact VALUES('pbeesly17', 'email', 'jh@dunder.com');
INSERT INTO contact VALUES('msmith', 'phone', '000-098-7654');

DROP TABLE IF EXISTS corporation;
CREATE TABLE corporation (
    Corporation_ID varchar(10) not null,
    Short_Name varchar(50) not null,
    Long_Name varchar(100) not null,
    Reserved_Assets decimal(9,0),
    PRIMARY KEY(Corporation_ID)
) ENGINE=innodb;

insert into corporation values ('WF', 'Wells Fargo', 'Wells Fargo Bank National Association', '33000000');
insert into corporation values ('BA', 'Bank of America', 'Bank of America Corporation', '51000000');
insert into corporation values ('ST', 'Sun Trust', 'Sun Trust Banks/Truist Financial Corporation', '39000000');
insert into corporation values ('NASA', 'NASA FCU', 'NASA Federal Credit Union', '11000000');
insert into corporation values ('TD', 'TD Ameritrade', 'TD Ameritrade Holding Corporation', '0');
insert into corporation values ('GS', 'Goldman Sachs', 'Goldman Sachs Group, Inc.', null); 

DROP TABLE IF EXISTS bank;
CREATE TABLE bank (
    Bank_ID varchar(50) not null,
    bank_name varchar(50),
    stress varchar(100),
    City varchar(50),
    State char(2),
    Zip decimal(5,0),
    Reserved_Assets decimal(9,0),
    Corporation_ID varchar(10) not null,
    Manager varchar(50) not null,
    PRIMARY KEY(Bank_ID),
    CONSTRAINT bank_ibfk_3 FOREIGN KEY (Corporation_ID) REFERENCES corporation(Corporation_ID),
    CONSTRAINT bank_ibfk_4 FOREIGN KEY (Manager) REFERENCES person(Person_ID)
) ENGINE=innodb;

insert into bank values ('WF_1', 'Wells Fargo #1 Bank', '1010 Binary Way', 'Seattle', 'WA', '98101', '127000', 'WF', 'sville19');
insert into bank values ('WF_2', 'Wells Fargo #2 Bank', '337 Firefly Lane', 'Seattle', 'WA', '98101', '553000', 'WF', 'mmcgill4');
insert into bank values ('BA_West', 'Bank of America West Region Bank', '865 Black Gold Circle', 'Dallas', 'TX', '75116', '267000', 'BA', 'smcgill17');
insert into bank values ('NASA_Goddard', 'NASA FCU at Goddard SFC', '8800 Greenbelt Road', 'Greenbelt', 'MD', '20771', '140000', 'NASA', 'rsanchez');
insert into bank values ('TD_Online', null, null, null, null, null, '0', 'TD', 'kjennings66');
insert into bank values ('TD_GT', 'TD Ameritrade Midtown Branch', '47 Tech Parkway', 'Atlanta', 'GA', '30333',null, 'TD', 'gburdell');
insert into bank values ('NASA_KSC', 'NASA FCU at Kennedy Space Center', '1 Space Commerce Way', 'Cape Canaveral', 'FL', '45678', '0', 'NASA', 'rholt99');
insert into bank values ('BA_South', 'Bank of America Plaza-Midtown', '600 Peachtree Street NE', 'Atlanta', 'GA', '30333', '42000', 'BA', 'ghopper9');
insert into bank values ('NASA_HAL', 'NASA FCU at US Space & Rocket Center', '1 Tranquility Base Suite 203', 'Huntsville', 'AL', '35805', null, 'NASA', 'pbeesly17'); 

DROP TABLE IF EXISTS account;
CREATE TABLE account (
    Bank_ID varchar(50) not null,
    Account_ID varchar(50) not null,
    Balance decimal(9,0),
    Interest_Rate decimal(2,0),
    last_deposit date,
    Minimum_Balance decimal(9,0),
    Num_Withdrawls decimal(3,0),
    Max_Withdrawls decimal(3,0),
    Overdraft_Bank varchar(50) default null,
    Overdraft_Account varchar(50) default null,
    Overdraft_Date date default null,
    Overdraft_Amount varchar(90) default null,
    Account_Type varchar(50),
    PRIMARY KEY(Bank_ID, Account_ID),
    CONSTRAINT account_ibfk_1 FOREIGN KEY (Bank_ID) REFERENCES bank(Bank_ID),
    CONSTRAINT account_ibfk_2 FOREIGN KEY (Overdraft_Bank, Overdraft_Account) REFERENCES account(Bank_ID, Account_ID)
) ENGINE=innodb;

insert into account values ('WF_2', 'checking_A', '2700', null, null, null, null, null, null, null, null, null, 'Checking');
insert into account values ('BA_West', 'checking_A', '100', null, null, null, null, null, null, null, null, null, 'Checking');
insert into account values ('NASA_Goddard', 'company_checking', null, null, null, null, null, null, null, null, null, null, 'Checking');
insert into account values ('NASA_KSC', 'company_checking', '150000', null, null, null, null, null, null, null, null, null, 'Checking');
insert into account values ('TD_Online', 'company_checking', '0', null, null, null, null, null, null, null, null, null, 'Checking');
insert into account values ('WF_2', 'market_X', '27000', '20', '2021-12-23', null, '1', '2', null, null, null, null, 'Market');
insert into account values ('TD_Online', 'Roth_IRA', '167000', '12', '2022-01-03', null, '0', '0', null, null, null, null, 'Market');
insert into account values ('TD_GT', 'Roth_IRA', '15000', '8', '2021-01-01', null, null, null, null, null, null, null, 'Market');
insert into account values ('BA_South', 'GT_investments', '16000', '4', '2020-03-11', null, '5', '10', null, null, null, null, 'Market');
insert into account values ('WF_2', 'savings_A', '19400', '10', '2021-11-05', '15000', null, null, null, null, null, null, 'Savings');
insert into account values ('BA_West', 'savings_B', '8000', '6', '2021-09-01', '10000', null, null, 'BA_West', 'checking_A', '2021-12-08', '600', 'Savings');
insert into account values ('NASA_Goddard', 'company_savings', '1000000', null , null , null , null, null, 'NASA_KSC', 'company_checking', null, null, 'Savings');
insert into account values ('TD_GT', 'savings_A', '8500', null, null, '0', null, null, null, null, null, null, 'Savings');
insert into account values ('BA_South', 'GT_savings', '9999', '2', null, '2000', null, null, 'TD_Online', 'company_checking', '2020-08-07', '1', 'Savings');

DROP TABLE IF EXISTS works_for;
CREATE TABLE works_for(
    Bank_ID varchar(50) not null,
    Employee_ID varchar(50) not null,
    PRIMARY KEY(Bank_ID, Employee_ID),
    CONSTRAINT works_for_ibfk_5 FOREIGN KEY (Bank_ID) REFERENCES bank(Bank_ID),
    CONSTRAINT works_for_ibfk_6 FOREIGN KEY (Employee_ID) REFERENCES person(Person_ID)
) ENGINE=innodb;

insert into works_for values ('WF_2', 'arwhite6');
insert into works_for values ('WF_1', 'ealfaro4');
insert into works_for values ('WF_2', 'ealfaro4');
insert into works_for values ('BA_West', 'rnairn5');
insert into works_for values ('BA_South', 'beyonce');
insert into works_for values ('NASA_Goddard', 'beyonce');
insert into works_for values ('TD_Online', 'beyonce');
insert into works_for values ('TD_GT', 'jperalta99');
insert into works_for values ('TD_GT', 'cboyle99');
insert into works_for values ('NASA_KSC', 'jperalta99');
insert into works_for values ('NASA_KSC', 'cboyle99');
insert into works_for values ('NASA_HAL', 'jperalta99');
insert into works_for values ('BA_West', 'glinetti99');
insert into works_for values ('TD_Online', 'glinetti99');

DROP TABLE IF EXISTS account_owner;
CREATE TABLE account_owner(
    Customer_ID varchar(50) not null,
    Bank_ID varchar(50) not null,
    Account_ID varchar(50) not null,
    Joined_Date date not null,
    Last_Transaction date,
    PRIMARY KEY(Customer_ID, Bank_ID, Account_ID),
    CONSTRAINT account_owner_ibfk_7 FOREIGN KEY (Customer_ID) REFERENCES person(Person_ID),
    CONSTRAINT account_owner_ibfk_8 FOREIGN KEY (Bank_ID, Account_ID) REFERENCES account(Bank_ID, Account_ID)
) ENGINE=innodb;

INSERT INTO account_owner VALUES ('arwhite6','WF_2', 'checking_A', '2021-08-10', '2022-01-26');
INSERT INTO account_owner VALUES ('arwhite6', 'WF_2', 'savings_A', '2021-08-10', '2021-11-11');
INSERT INTO account_owner VALUES ('tjtalbot4', 'WF_2', 'savings_A', '2021-08-17', '2022-02-03');
INSERT INTO account_owner VALUES ('owalter6', 'BA_West', 'checking_A', '2020-09-02',null);
INSERT INTO account_owner VALUES ('owalter6', 'BA_West', 'savings_B', '2020-09-02',null);
INSERT INTO account_owner VALUES ('msmith', 'NASA_Goddard', 'company_checking', '2018-10-11', null);
INSERT INTO account_owner VALUES ('rsanchez', 'NASA_Goddard', 'company_checking', '2018-10-10', '2022-02-04');
INSERT INTO account_owner VALUES ('rsanchez', 'NASA_KSC', 'company_checking', '2018-10-10', '2022-01-13');
INSERT INTO account_owner VALUES ('tjtalbot4', 'TD_Online', 'company_checking', '2020-12-07', '2020-12-07');
INSERT INTO account_owner VALUES ('rholt99', 'WF_2', 'market_X', '2022-02-02', '2020-02-04');
INSERT INTO account_owner VALUES ('asantiago99', 'WF_2', 'market_X', '2020-02-02', '2020-02-04');
INSERT INTO account_owner VALUES ('cboyle99', 'TD_Online', 'Roth_IRA', '2021-09-26', null);
INSERT INTO account_owner VALUES ('glinetti99', 'TD_Online', 'Roth_IRA', '2019-12-24', null);
INSERT INTO account_owner VALUES ('msmith', 'TD_GT', 'Roth_IRA', '2021-01-01', '2022-01-01');
INSERT INTO account_owner VALUES ('kjennings66', 'BA_South', 'GT_investments', '2009-08-09',null);
INSERT INTO account_owner VALUES ('rsanchez', 'NASA_Goddard', 'company_savings', '2014-08-16',null);
INSERT INTO account_owner VALUES ('pbeesly17', 'TD_GT', 'savings_A', '2021-09-09',null);
INSERT INTO account_owner VALUES ('atrebek1', 'BA_South', 'GT_savings', '2015-12-31', '2017-03-22');
INSERT INTO account_owner VALUES ('kjennings66', 'BA_South', 'GT_savings', '2010-08-09', '2022-02-21');

DROP TABLE IF EXISTS fees;
CREATE TABLE fees(
    Bank_ID varchar(50) not null,
    Account_ID varchar(50) not null,
    Fee varchar(50) not null,
    PRIMARY KEY(Bank_ID, Account_ID, Fee),
    CONSTRAINT fees_ibfk_10 FOREIGN KEY (Bank_ID, Account_ID) REFERENCES account(Bank_ID, Account_ID)
) ENGINE=innodb;

INSERT INTO fees VALUES
('WF_2', 'savings_A', 'low balance'),
('BA_West', 'savings_B', 'low balance'),
('BA_West', 'savings_B', 'overdraft'),
('WF_2', 'market_X', 'administrative'),
('WF_2', 'market_X', 'frequency'),
('WF_2', 'market_X', 'fee'),
('TD_Online', 'Roth_IRA', 'low balance'),
('TD_Online', 'Roth_IRA', 'withdrawal'),
('NASA_Goddard', 'company_savings', 'credit union'),
('BA_South', 'GT_investments', 'withdrawal');

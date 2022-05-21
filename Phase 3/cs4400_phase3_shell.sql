-- CS4400: Introduction to Database Systems
-- Bank Management Project - Phase 3 (v2)
-- Generating Stored Procedures & Functions for the Use Cases
-- April 4th, 2022
-- implement these functions and stored procedures on the project database
use bank_management;
-- [1] create_corporation()
-- This stored procedure creates a new corporation
drop procedure if exists create_corporation;
delimiter //
create procedure create_corporation (in ip_corpID varchar(100),
    in ip_shortName varchar(100), in ip_longName varchar(100),
    in ip_resAssets integer)
begin
insert into corporation values (ip_corpiD, ip_shortName, ip_longName, ip_resAssets);
end //
delimiter ;
-- [2] create_bank()
-- This stored procedure creates a new bank that is owned by an existing corporation
-- The corporation must also be managed by a valid employee [being a manager doesn't leave enough time for other jobs]
drop procedure if exists create_bank;
delimiter //
create procedure create_bank (in ip_bankID varchar(100), in ip_bankName varchar(100),
	in ip_street varchar(100), in ip_city varchar(100), in ip_state char(2),
    in ip_zip char(5), in ip_resAssets integer, in ip_corpID varchar(100),
    in ip_manager varchar(100), in ip_bank_employee varchar(100))
sp_main: begin
	if (select count(*) from corporation where corpID = ip_corpID) = 0 or
    (select count(*) from bank where manager = ip_manager) = 1 or
    (select count(*) from person where perID = ip_manager) = 0 or
    (select count(*) from person where perID = ip_bank_employee) = 0 or
    (select count(*) from workfor where perID = ip_manager) > 0
    then leave sp_main; end if;
    
    insert into bank values (ip_bankID, ip_bankName, ip_street, ip_city, ip_state, ip_zip, ip_resAssets, ip_corpID, ip_manager);
    insert into workfor values (ip_bankID, ip_bank_employee);
end //
delimiter ;
-- [3] start_employee_role()
-- If the person exists as an admin or employee then don't change the database state [not allowed to be admin along with any other person-based role]
-- If the person doesn't exist then this stored procedure creates a new employee
-- If the person exists as a customer then the employee data is added to create thejoint customer-employee role
drop procedure if exists start_employee_role;
delimiter //
create procedure start_employee_role (in ip_perID varchar(100), in ip_taxID char(11),
	in ip_firstName varchar(100), in ip_lastName varchar(100), in ip_birthdate date,
    in ip_street varchar(100), in ip_city varchar(100), in ip_state char(2),
    in ip_zip char(5), in ip_dtJoined date, in ip_salary integer,
    in ip_payments integer, in ip_earned integer, in emp_password  varchar(100))
sp_main: begin
	if (select count(*) from employee where perID = ip_perID) > 0 or
    ((select count(*) from bank_user where perID = ip_perID) = 0 and (select count(*) from person where perID = ip_perID) = 1)
    then leave sp_main; end if;
    
    if (select count(*) from person where perID = ip_perID) = 0
    then insert into person values(ip_perID,emp_password);
    insert into bank_user values(ip_perID, ip_taxID, ip_birthdate, ip_firstName, ip_lastName, ip_dtJoined, ip_street, ip_city, ip_state, ip_zip);
    insert into employee values(ip_perID, ip_salary, ip_payments, ip_earned);
    end if;
    
    if (select count(*) from customer where perID = ip_perID) = 1
    then insert into employee values(ip_perID, ip_salary, ip_payments, ip_earned);
    end if;
    
end //
delimiter ;
-- [4] start_customer_role()
-- If the person exists as an admin or customer then don't change the database state [not allowed to be admin along with any other person-based role]
-- If the person doesn't exist then this stored procedure creates a new customer
-- If the person exists as an employee then the customer data is added to create the joint customer-employee role
drop procedure if exists start_customer_role;
delimiter //
create procedure start_customer_role (in ip_perID varchar(100), in ip_taxID char(11),
	in ip_firstName varchar(100), in ip_lastName varchar(100), in ip_birthdate date,
    in ip_street varchar(100), in ip_city varchar(100), in ip_state char(2),
    in ip_zip char(5), in ip_dtJoined date, in cust_password varchar(100))
sp_main: begin
	if (select count(*) from customer where perID = ip_perID) = 1 or
    ((select count(*) from bank_user where perID = ip_perID) = 0 and (select count(*) from person where perID = ip_perID) = 1)
    
    then leave sp_main; end if;
    
    if (select count(*) from person where perID = ip_perID) = 0
    then insert into person values(ip_perID,cust_password);
    insert into bank_user values(ip_perID, ip_taxID, ip_birthdate, ip_firstName, ip_lastName, ip_dtJoined, ip_street, ip_city, ip_state, ip_zip);
    insert into customer values(ip_perID);
    end if;
    
    if (select count(*) from employee where perID = ip_perID) = 1
    then insert into customer values(ip_perID);
    end if;
end //
delimiter ;
-- [5] stop_employee_role()
-- If the person doesn't exist as an employee then don't change the database state
-- If the employee manages a bank or is the last employee at a bank then don't change the database state [each bank must have a manager and at least one employee]
-- If the person exists in the joint customer-employee role then the employee data must be removed, but the customer information must be maintained
-- If the person exists only as an employee then all related person data must be removed
drop procedure if exists stop_employee_role;
delimiter //
create procedure stop_employee_role (in ip_perID varchar(100))
begin
-- Implement your code here
end //
delimiter ;
-- [6] stop_customer_role()
-- If the person doesn't exist as an customer then don't change the database state
-- If the customer is the only holder of an account then don't change the database state [each account must have at least one holder]
-- If the person exists in the joint customer-employee role then the customer data must be removed, but the employee information must be maintained
-- If the person exists only as a customer then all related person data must be removed
drop procedure if exists stop_customer_role;
delimiter //
create procedure stop_employee_role (in ip_perID varchar(100))
sp_main: begin
	if (select count(*) from employee where perID = ip_perID) = 0 or 
    (select count(*) from bank where manager = ip_perID) > 0 or 
    (select count(bankID) from workfor where bankID in (select bankID from workfor where perID = ip_perID) group by bankID) = 1
    then leave sp_main; end if;
    
    if (select count(*) from employee where perID = ip_perID) = 1 and
    (select count(*) from customer where perID = ip_perID) = 1 
    then delete from workfor where perID = ip_perID;
    delete from employee where perID = ip_perID;
    end if;
    
    if (select count(*) from employee where perID = ip_perID) = 1 and
    (select count(*) from customer where perID = ip_perID) = 0
    then delete from workfor where perID = ip_perID;
    delete from employee where perID = ip_perID;
    delete from bank_user where perID = ip_perID;
    delete from person where perID = ip_perID;
    end if;
    
end //
delimiter ;
-- [7] hire_worker()
-- If the person is not an employee then don't change the database state
-- If the worker is a manager then then don't change the database state [being a manager doesn't leave enough time for other jobs]
-- Otherwise, the person will now work at the assigned bank in addition to any other previous work assignments
-- Also, adjust the employee's salary appropriately
drop procedure if exists hire_worker;
delimiter //
create procedure hire_worker (in ip_perID varchar(100), in ip_bankID varchar(100),
in ip_salary integer)
begin
-- Implement your code here
end //
delimiter ;
-- [8] replace_manager()
-- If the new person is not an employee then don't change the database state
-- If the new person is a manager or worker at any bank then don't change the database state [being a manager doesn't leave enough time for other jobs]
-- Otherwise, replace the previous manager at that bank with the new person
-- The previous manager's association as manager of that bank must be removed
-- Adjust the employee's salary appropriately
drop procedure if exists replace_manager;
delimiter //
create procedure replace_manager (in ip_perID varchar(100), in ip_bankID 
varchar(100),
in ip_salary integer)
begin
-- Implement your code here
end //
delimiter ;
-- [9] add_account_access()
-- If the account does not exist, create a new account. If the account exists, add the customer to the account
-- When creating a new account:
    -- If the person opening the account is not an admin then don't change the database state
    -- If the intended customer (i.e. ip_customer) is not a customer then don't change the database state
    -- Otherwise, create a new account owned by the designated customer
    -- The account type will be determined by the enumerated ip_account_type variable
    -- ip_account_type in {checking, savings, market}
-- When adding a customer to an account:
    -- If the person granting access is not an admin or someone with access to the account then don't change the database state
    -- If the intended customer (i.e. ip_customer) is not a customer then don't change the database state
    -- Otherwise, add the new customer to the existing account
drop procedure if exists add_account_access;
delimiter //
create procedure add_account_access (in ip_requester varchar(100), in ip_customer 
varchar(100),
in ip_account_type varchar(10), in ip_bankID varchar(100),
    in ip_accountID varchar(100), in ip_balance integer, in ip_interest_rate 
integer,
    in ip_dtDeposit date, in ip_minBalance integer, in ip_numWithdrawals integer,
    in ip_maxWithdrawals integer, in ip_dtShareStart date)
begin
-- Implement your code here
end //
delimiter ;
-- [10] remove_account_access()
-- Remove a customer's account access. If they are the last customer with access tothe account, close the account
-- When just revoking access:
-- If the person revoking access is not an admin or someone with access to the account then don't change the database state
-- Otherwise, remove the designated sharer from the existing account
-- When closing the account:
-- If the customer to be removed from the account is NOT the last remaining owner/sharer then don't close the account
-- If the person closing the account is not an admin or someone with access to the account then don't change the database state
-- Otherwise, the account must be closed
drop procedure if exists remove_account_access;
delimiter //
create procedure remove_account_access (in ip_requester varchar(100), in ip_sharer 
varchar(100),
in ip_bankID varchar(100), in ip_accountID varchar(100))
begin
-- Implement your code here
end //
delimiter ;
-- [11] create_fee()
drop procedure if exists create_fee;
delimiter //
create procedure create_fee (in ip_bankID varchar(100), in ip_accountID 
varchar(100),
in ip_fee_type varchar(100))
begin
-- Implement your code here
end //
delimiter ;
-- [12] start_overdraft()
drop procedure if exists start_overdraft;
delimiter //
create procedure start_overdraft (in ip_requester varchar(100),
in ip_checking_bankID varchar(100), in ip_checking_accountID varchar(100),
    in ip_savings_bankID varchar(100), in ip_savings_accountID varchar(100))
begin
-- Implement your code here
end //
delimiter ;
-- [13] stop_overdraft()
drop procedure if exists stop_overdraft;
delimiter //
create procedure stop_overdraft (in ip_requester varchar(100),
in ip_checking_bankID varchar(100), in ip_checking_accountID varchar(100))
begin
-- Implement your code here
end //
delimiter ;
-- [14] account_deposit()
-- If the person making the deposit does not have access to the account then don't 
-- Otherwise, the account balance and related info must be modified appropriately
drop procedure if exists account_deposit;drop procedure if exists stop_overdraft;
delimiter //
create procedure account_deposit (in ip_requester varchar(100), in 
ip_deposit_amount integer,
in ip_bankID varchar(100), in ip_accountID varchar(100), in ip_dtAction date)
sp_main: begin
if ip_requester not in (select perID from access where bankID = ip_bankID and accountID = ip_accountID)
then leave sp_main; end if;

if ip_requester in (select perID from access where bankID = ip_bankID and accountID = ip_accountID)
then update bank_account set balance = balance + ip_deposit_amount where bankID = ip_bankID and accountID = ip_accountID;
update access set dtAction = ip_dtAction where bankID = ip_bankID and accountID = ip_accountID;
end if;

end //
delimiter ;
-- [15] account_withdrawal()
-- If the person making the withdrawal does not have access to the account then don't change the database state
-- If the withdrawal amount is more than the account balance for a savings or market account then don't change the database state [the account balance must be positive]
-- If the withdrawal amount is more than the account balance + the overdraft balance (i.e., from the designated savings account) for a checking account then don't change the database state [the account balance must be positive]
-- Otherwise, the account balance and related info must be modified appropriately (amount deducted from the primary account first, and second from the overdraft account as needed)
drop procedure if exists account_withdrawal;
delimiter //
create procedure account_withdrawal (in ip_requester varchar(100), in ip_withdrawal_amount integer,
	in ip_bankID varchar(100), in ip_accountID varchar(100), in ip_dtAction date)
sp_main: begin
	-- Implement your code here
    if not exists (select * from access where perID = ip_requester and accountID = ip_accountID and bankID = ip_bankID) then leave sp_main; end if;
    if (select balance from bank_account where accountID = ip_accountID and bankID = ip_bankID) <= 0 then leave sp_main; end if;
    
	if exists (select * from savings where accountID = ip_accountID and bankID = ip_bankID) or exists (select * from market where accountID = ip_accountID and bankID = ip_bankID) then
		if ip_withdrawal_amount <= (select balance from bank_account where accountID = ip_accountID and bankID = ip_bankID) then
			update bank_account set balance = balance - ip_withdrawal_amount where accountID = ip_accountID and bankID = ip_bankID;
		end if;
	end if;
	if exists (select * from checking where accountID = ip_accountID and bankID = ip_bankID) then
		if ip_withdrawal_amount <= (select balance + amount 
			from (select balance, amount from bank_account, checking where bank_account.accountID = checking.accountID and bank_account.bankID = checking.bankID and bank_account.accountID = ip_accountID and bank_account.bankID = ip_bankID) as A)
            then update bank_account set balance = balance - ip_withdrawal_amount where accountID = ip_accountID and bankID = ip_bankID;
		end if;
	end if;
end //
delimiter ;
-- [16] account_transfer()
-- If the person making the transfer does not have access to both accounts then don't change the database state
-- If the withdrawal amount is more than the account balance for a savings or market account then don't change the database state [the account balance must be positive]
-- If the withdrawal amount is more than the account balance + the overdraft balance (i.e., from the designated savings account) for a checking account then don't change the database state [the account balance must be positive]
-- Otherwise, the account balance and related info must be modified appropriately (amount deducted from the withdrawal account first, and second from the overdraft account as needed, and then added to the deposit account)
drop procedure if exists account_transfer;
delimiter //
create procedure account_transfer (in ip_requester varchar(100), in 
ip_transfer_amount integer,
in ip_from_bankID varchar(100), in ip_from_accountID varchar(100),
    in ip_to_bankID varchar(100), in ip_to_accountID varchar(100), in ip_dtAction 
date)
sp_main: begin
declare checkingBalance Integer;
-- does not have access to both account
if ip_requester not in (select perID from access where bankID = ip_from_bankID and accountID = ip_from_accountID) and ip_requester not in (select perID from access where bankID = ip_to_bankID and accountID = ip_to_accountID)
then leave sp_main; end if;
-- access checking account and both checkings and savings does not have enough fund
if ip_requester in (select perID from access where bankID = ip_from_bankID and accountID = ip_from_accountID) and ip_from_accountID like '%checking%'
and ip_transfer_amount > (select balance from bank_account where accountID = ip_from_accountID) + (select sum(balance) from bank_account where accountID in (select accountID from access where perID = ip_requester and accountID not like '%checking%'))
then leave sp_main; end if;
-- access checking and checking has enough fund
if ip_requester in (select perID from access where bankID = ip_from_bankID and accountID = ip_from_accountID) and ip_from_accountID like '%checking%'
and ip_transfer_amount <= (select balance from bank_account where accountID = ip_from_accountID and bankID = ip_from_bankID)
then update bank_account set balance = balance - ip_transfer_amount where bankID = ip_from_bankID and accountID = ip_from_accountID;
update bank_account set balance = balance + ip_transfer_amount where bankID = ip_to_bankID and accountID = ip_to_accountID;
update access set dtAction = ip_dtAction where bankID = ip_from_bankID and accountID = ip_from_accountID;
update access set dtAction = ip_dtAction where bankID = ip_to_bankID and accountID = ip_to_accountID;
end if;
-- access checking and checking does not have enough funds so savings need to back it up
if ip_requester in (select perID from access where bankID = ip_from_bankID and accountID = ip_from_accountID) and ip_accountID like '%checking%'
and ip_transfer_amount > (select balance from bank_account where accountID = ip_from_accountID and bankID = ip_from_bankID)
then 
select balance from bank_account where bankID = ip_from_bankID and accountID = ip_from_accountID into checkingBalance;
update bank_account set balance = 0 where bankID = ip_from_bankID and accountID = ip_from_accountID;
update bank_account set balance = balance - (ip_transfer_amount - @checkingBalance) where bankID = ip_from_bankID and accountID = (select accountID from access where perID = ip_requester and accountID not like '%checking%');
update bank_account set balance = balance + ip_transfer_amount where bankID = ip_to_bankID and accountID = ip_to_accountID;
update access set dtAction = ip_dtAction where bankID = ip_to_bankID and accountID = ip_to_accountID;
end if;
-- access savings or markets and do not have enough funds
if ip_requester in (select perID from access where bankID = ip_from_bankID and accountID = ip_from_accountID) and ip_from_accountID not like '%checking%'
and ip_transfer_amount > (select balance from bank_account where bankID = ip_from_bankID and accountID = ip_from_accountID)
then leave sp_main; end if;
-- access savings or markets and have enough funds
if ip_requester in (select perID from access where bankID = ip_from_bankID and accountID = ip_from_accountID) and ip_accountID not like '%checking%'
and ip_transfer_amount <= (select balance from bank_account where bankID = ip_from_bankID and accountID = ip_from_accountID)
then update bank_account set balance = balance - ip_transfer_amount where bankID = ip_from_bankID and accountID = ip_from_accountID;
update bank_account set balance = balance + ip_transfer_amount where bankID = ip_to_bankID and accountID = ip_to_accountID;
update access set dtAction = ip_dtAction where bankID = ip_to_bankID and accountID = ip_to_accountID;
end if;
end //
delimiter ;
-- [17] pay_employees()
-- Increase each employee's pay earned so far by the monthly salary
-- Deduct the employee's pay from the banks reserved assets
-- If an employee works at more than one bank, then deduct the (evenly divided) monthly pay from each of the affected bank's reserved assets
-- Truncate any fractional results to an integer before further calculations
drop procedure if exists pay_employees;
delimiter //
create procedure pay_employees ()
sp_main: begin
    -- increase earning, increase payment. 2 different conditions, one for employee who only works at one place, one for multiple places
end //
delimiter ;
-- [18] penalize_accounts()
-- For each savings account that is below the minimum balance, deduct the smaller of $100 or 10% of the current balance from the account
-- For each market account that has exceeded the maximum number of withdrawals, deduct the smaller of $500 per excess withdrawal or 20% of the current balance fromthe account
-- Add all deducted amounts to the reserved assets of the bank that owns the account
-- Truncate any fractional results to an integer before further calculations
drop procedure if exists penalize_accounts;
delimiter //
create procedure penalize_accounts ()
begin
-- Implement your code here
end //
delimiter ;
-- [19] accrue_interest()
-- For each interest-bearing account that is "in good standing", increase the balance based on the designated interest rate
-- A savings account is "in good standing" if the current balance is equal to or above the designated minimum balance
-- A market account is "in good standing" if the current number of withdrawals is less than or equal to the maximum number of allowed withdrawals
-- Subtract all paid amounts from the reserved assets of the bank that owns the account                                                                       
-- Truncate any fractional results to an integer before further calculations
drop procedure if exists accrue_interest;
delimiter //
create procedure accrue_interest ()
begin
-- Implement your code here
end //
delimiter ;
-- [20] display_account_stats()
-- Display the simple and derived attributes for each account, along with the owning bank
-- create or replace view display_account_stats as
-- Uncomment above line and implement your code here
-- [21] display_bank_stats()
-- Display the simple and derived attributes for each bank, along with the owning corporation
-- create or replace view display_bank_stats as
-- Uncomment above line and implement your code here

-- [22] display_corporation_stats()
-- Display the simple and derived attributes for each corporation
create or replace view viewHelper1 as 
select sum(balance) as balance, bank_account.bankID, bank.corpID 
from bank_account join bank on bank_account.bankID = bank.bankID group by bankID;

create or replace view viewHelper2 as 
select sum(balance) as balance, count(*) as numberBanksOwned, corpID 
from viewHelper1 group by corpID;

create or replace view display_corporation_stats as
select corporation.corpID, shortName, longName, resAssets, viewHelper2.balance, viewHelper2.numberBanksOwned 
from corporation join viewHelper2 where corporation.corpID = viewHelper2.corpID;
-- [23] display_customer_stats()
-- Display the simple and derived attributes for each customer
create or replace view viewHelper3 as
select count(*) as count, perID from access group by perID;

create or replace view viewHelper4 as
select access.bankID, access.accountID, access.perID, bank_account.balance
from access join bank_account on bank_account.bankID = access.bankID and bank_account.accountID = access.accountID;

create or replace view viewHelper5 as
select sum(balance) as balance, perID from viewHelper4 group by perID;

create or replace view viewHelper6 as
select viewHelper3.count as count, viewHelper3.perID, viewHelper5.balance from viewHelper3 join viewHelper5 on viewHelper3.perID = viewHelper5.perID;

create or replace view display_customer_stats as
select customer_contacts.perID, contact_type, info, viewHelper6.count as numbers_of_account, viewHelper6.balance
from customer_contacts join viewHelper6 on viewHelper6.perID = customer_contacts.perID;
-- [24] display_employee_stats()
-- Display the simple and derived attributes for each employee
create or replace view display_employee_stats as
select bank_user.perID as "person_identifier", bank_user.taxID as "tax_identifier", concat(firstName," ",lastName) as "employee_name",
birthdate as "date_of_birthdate", dtJoined as "joined_system", bank_user.street, bank_user.city, bank_user.state, bank_user.zip ,
count(*) as "number_of_banks", resAssets as "bank_assets"
from employee left outer join bank_user on employee.perID = bank_user.perID 
left outer join workfor on bank_user.perID = workfor.perID 
left outer join bank on workfor.bankID = bank.bankID 
group by bank_user.perID;
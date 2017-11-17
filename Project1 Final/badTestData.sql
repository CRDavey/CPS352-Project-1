--Cody Davey
--CPS352
--
--Testing that constraints, delete, and update work properly
--TESTING PRIMARY KEY CONSTRAINTS

--TESTING FOR BAD DATA
--Testing primary key constraints

--Violates the r_id primary key since r_id 1 already exists
db2 => insert into RaidParty(r_id, raid_limit)
db2 (cont.) => values(1, 4);
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0803N  One or more values in the INSERT statement, UPDATE statement, or 
foreign key update caused by a DELETE statement are not valid because the 
primary key, unique constraint or unique index identified by "1" constrains 
table "CODY.RAIDPARTY" from having duplicate values for the index key. 

--Violates the cr_id primary key because it already exists
db2 => insert into chat(cr_id, r_id, chat_name, Room_pswd, room_limit)
db2 (cont.) => values(20, 1, 'Your Chat', 'Back Off', 7);
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0803N  One or more values in the INSERT statement, UPDATE statement, or 
foreign key update caused by a DELETE statement are not valid because the 
primary key, unique constraint or unique index identified by "1" constrains 
table "CODY.CHAT" from having duplicate values for the index key.  
SQLSTATE=23505
db2 => 

--Violates the role_name primary key because the input value already exists
db2 => Insert into Roles(role_name, primary_job)
db2 (cont.) => values('DPS', 'Damage');
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0803N  One or more values in the INSERT statement, UPDATE statement, or 
foreign key update caused by a DELETE statement are not valid because the 
primary key, unique constraint or unique index identified by "1" constrains 
table "CODY.ROLES" from having duplicate values for the index key.  
SQLSTATE=23505

--TESTING FOREIGN KEY CONSTRAINTS

--Violates the foreign key constraint for role_name referencing 'Roles'
--Because the input value does not exist in the parent table 'Roles'
db2 => insert into RaidRoles(role_name, r_id, role_number)
db2 (cont.) => values('Off-DPS', 1, 3);
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0530N  The insert or update value of the FOREIGN KEY 
"CODY.RAIDROLES.SQL150325121940800" is not equal to any value of the parent 
key of the parent table.  SQLSTATE=23503

--Violates the foreign key constraint for class_name referencing 'Class'
--Because the input value does not exist in the parent table Roles
db2 => Insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
db2 (cont.) => values('Guy', NULL, 'Monk', 0, 21, NULL, 'Good');
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0530N  The insert or update value of the FOREIGN KEY 
"CODY.CHARACTER.SQL150325124712950" is not equal to any value of the parent 
key of the parent table.  SQLSTATE=23503

--TEST THE NOT NULL CONSTRAINTS

--Violates the Not NULL constraint for ability_name in Abilities
db2 => Insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
db2 (cont.) => values(NULL, 'Medic', NULL, NULL, NULL, NULL);
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0407N  Assignment of a NULL value to a NOT NULL column "TBSPACEID=2, 
TABLEID=1545, COLNO=0" is not allowed.  SQLSTATE=23502


--Vioaltes the Not NULL constraint for room_pswd in Chat
db2 => Insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
db2 (cont.) => values(55, 2, 'Better Chat', NULL, 7);
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0407N  Assignment of a NULL value to a NOT NULL column "TBSPACEID=2, 
TABLEID=1538, COLNO=3" is not allowed.  SQLSTATE=23502


--TEST THE CHECK CONSTRAINTS

--Violates the check constraint for party_ldr
--party_ldr is a boolean attribute with 1 being true and 0 being false
--Inserting a value of 2 violates the constraint
db2 => Insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
db2 (cont.) => values('Guy', NULL, 'Warrior', 4, 15, NULL, 'good');
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0545N  The requested operation is not allowed because a row does not 
satisfy the check constraint "CODY.CHARACTER.SQL150325124712920".  
SQLSTATE=23513

--Violates the check constraint for acc_type
--acc_type only accepts 4 values on insert
--as the attempted insert does not use one of those values it is rejected
db2 => Insert into Accessory(acc_id, inv_id, acc_name, acc_type, acc_level)
db2 (cont.) => values('a10', 'I1', 'Arbitrary Name', 'Cape', 55);
DB21034E  The command was processed as an SQL statement because it was not a 
valid Command Line Processor command.  During SQL processing it returned:
SQL0545N  The requested operation is not allowed because a row does not 
satisfy the check constraint "CODY.ACCESSORY.SQL150325124713970".  
SQLSTATE=23513

--BAD DELETES

--Trying to delete a nonexistent entity
db2 => Delete from character
db2 (cont.) => where username = 'Bilbo';
SQL0100W  No row was found for FETCH, UPDATE or DELETE; or the result of a 
query is an empty table.  SQLSTATE=02000






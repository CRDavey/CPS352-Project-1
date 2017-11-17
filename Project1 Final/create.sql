  CREATE TABLE RaidParty
   (
   r_id varchar(8) NOT NULL,
   raid_limit numeric(1,0) with Default 5, check (raid_limit <= 5),
   primary key (r_id)
   );

  CREATE TABLE Party 
   ( 
   p_id varchar(8) NOT NULL,     
   r_id varchar(8) NULL, 
   party_limit numeric(1,0) with Default 4, check (party_limit <= 4), 
   primary key (p_id), 
   foreign key (r_id) references RaidParty 
   ); 

  CREATE TABLE chat
   (
   cr_id varchar(8) NOT NULL,
   r_id varchar(8),
   chat_name varchar(25),
   room_pswd varchar(15) NOT NULL,
   room_limit numeric(2, 0), check(room_limit >= 1 AND room_limit <= 20),
   primary key (cr_id),
   foreign key (r_id) references RaidParty
			on delete cascade
   );

  CREATE TABLE Roles 
   ( 
   role_name varchar(15) NOT NULL, 
   primary_job varchar(25), 
   primary key (role_name) 
   ); 

CREATE TABLE RaidRoles
   (
   role_name varchar(15) NOT NULL,
   r_id varchar(8) NOT NULL,
   role_number numeric(2,0), check (role_number <= 20),
   primary key(role_name, r_id),
   foreign key(role_name) references roles
			on delete cascade,
   foreign key(r_id) references RaidParty
			on delete cascade
   );


  CREATE TABLE class
   (
   class_name varchar(15) NOT NULL,
   trait varchar(25),
   description varchar(200),
   primary key (class_name)
   );


  CREATE TABLE character
   (
   username varchar(10) NOT NULL,
   p_id varchar(8) NULL,
   class_name varchar(15),
   party_ldr smallInt, check (party_ldr In (0,1)),
   char_level numeric(2,0), check (char_level <= 60),
   title varchar(15),
   faction varchar(15),
   primary key(username),
   foreign key (p_id) references party
			on delete restrict,
   foreign key (class_name) references class
			on delete cascade
   );

  CREATE TABLE characterRole
   (
   role_name varchar(15) NOT NULL,
   username varchar(10) NOT NULL
   );

  CREATE TABLE Abilities
   (
   ability_name varchar(15) NOT NULL,
   class_name varchar(15),
   effect varchar(25),
   duration numeric(2,0),
   cooldown numeric(3,0),
   abi_level numeric(2,0), check(abi_level <= 60),
   primary key(ability_name),
   foreign key(class_name) references class
			on delete cascade
   );




  CREATE TABLE Inventory 
   ( 
   inv_id varchar(8) NOT NULL, 
   username varchar(10), 
   inv_limit numeric(2,0) with default 60, check(inv_limit <= 80), 
   money numeric(7,0), check(money <= 9999999), 
   primary key(inv_id),                 
   foreign key(username) references character
			on delete cascade 
   ); 


  CREATE TABLE Accessory 
   ( 
   acc_id varchar(8) NOT NULL, 
   inv_id varchar(8), 
   acc_name varchar(30), 
   acc_type varchar(10), check (acc_type in 
					('Ring', 'Necklace', 'Belt', 'Bracelet')), 
   acc_level numeric(2,0), check(acc_level <= 60), 
   primary key(acc_id), 
   foreign key(inv_id) references inventory
			on delete cascade
   ); 

  CREATE TABLE Armor 
   ( 
   a_id varchar(8) NOT NULL, 
   inv_id varchar(8), 
   armr_name varchar(30), 
   armr_rating numeric(3,0), 
   armr_type varchar(15), check (armr_type in 
   			        ('Light', 'Medium', 'Heavy')), 
   armr_level numeric(2,0), check(armr_level <= 60), 
   primary key(a_id), 
   foreign key(inv_id) references inventory
			on delete cascade
   ); 

  CREATE TABLE Weapon 
   ( 
   w_id varchar(8) NOT NULL, 
   inv_id varchar(8), 
   wep_name varchar(30), 
   wep_dam numeric(3,0), 
   wep_type varchar(15), check (wep_type in 
   			('Sword', 'Polearm', 'Bow', 'Dagger', 'Staff')), 
   wep_level numeric(2,0), check(wep_level <= 60), 
   primary key(w_id), 
   foreign key(inv_id) references inventory
			on delete cascade
   ); 

  CREATE TABLE Attributes 
   ( 
   acc_id varchar(8) NULL, 
   a_id varchar(8) NULL, 
   w_id varchar(8), 
   attribute varchar(25) NULL, 
   foreign key(acc_id) references accessory
			on delete cascade
			on update NO ACTION,
   foreign key(a_id) references Armor
			on delete cascade,
   foreign key(w_id) references Weapon 
			on delete cascade
  ); 

  CREATE TABLE equippedAcc 
   ( 
   username varchar(10) NOT NULL, 
   acc_id varchar(8) NOT NULL, 
   primary key(username, acc_id), 
   foreign key(username) references character
			on delete cascade,
   foreign key(acc_id) references Accessory 
			on delete cascade
   ); 


  CREATE TABLE equippedArmor 
   ( 
   username varchar(10) NOT NULL, 
   a_id varchar(8) NOT NULL, 
   primary key(username, a_id), 
   foreign key(username) references character
			on delete cascade,
   foreign key(a_id) references armor
			on delete cascade
   ); 

  CREATE TABLE equippedWep 
   ( 
   username varchar(10) NOT NULL, 
   w_id varchar(8) NOT NULL, 
   primary key(username, w_id), 
   foreign key(username) references character
			on delete cascade, 
   foreign key(w_id) references Weapon 
			on delete cascade
   ); 

--Create a trigger for deleting RaidParty
--Create TRIGGER Delete_raidParty
--	Before DELETE ON raidParty
--	BEGIN ATOMIC
--		DECLARE oldId varchar(15);
--		SET oldId = 
	

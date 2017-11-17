--TESTING THE DATABASE WITH GOOD DATA

--Good Inserts

--Insert a new party
--Simulates a new Party being created
Insert into Party(p_id, r_id)
	 values(14, NULL);


--Insert a new raidparty
--Simulates a new raidParty being created
insert into raidParty(r_id)
	values(3);


--Insert a new character
--Simulates a new character being created
Insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Guy', NULL, 'Warrior', 0, 1, 'noob', 'neutral');

--Insert a new chatroom
--simulates a new chat being created
 insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
 	values(25, 2, 'Raid Boss Chat', 'Boss Room', 20);



--GOOD UPDATES

--Updates the character 'Sasha' to be in a new party and have a new title
--Simulates a character changing their title and joining a party
UPDATE CHARACTER
SET p_id=13, title='Weapon Expert'
where username ='Sasha';

--Simulates a trade with an armor item being traded
--from inv_id 'I4' to inv_id 'I3'
UPDATE Accessory
SET inv_id='I3'
where acc_id='acc5';

--Updates the character 'lampplate' to a new level
--Simulates a character leveling up once
UPDATE CHARACTER
 SET char_level =46
 where username ='Lampplate';

--GOOD DELETES

--Simulates a character unequipping armor
DELETE FROM EquippedArmor
	where a_id='a4';

--Deletes a chatroom
--Simulates a chatroom being deleted
DELETE FROM CHAT
 where cr_id = 24;




--SQL QUERY STATEMENTS

--Find all the characters in the party with p_id 11
select party.p_id, username
	from party join character on (party.p_id = character.p_id)
	where party.p_id = 11
	order by username;

--Display the username, class name, and level of all characters with the warrior class
select username, class_name as class, char_level as level
	from character
	where class_name = 'Warrior';

--Find all the equipment that modifies the Dexterity stat
select acc_id, a_id, w_id, attribute
 from Attributes
 where attribute LIKE '%Dex%';

--Find all the characters with the ability to use 'Shield Wall'
select username, ability_name
 from character join Abilities
 	on 1 = 1
 where ability_name = 'Shield Wall' and character.class_name = Abilities.class_name
 Order by username;

--List the names of character in a Raid Party and order them
select username
 from character join party
 	on character.p_id = party.p_id
 join raidparty
 	on party.r_id = raidparty.r_id
 where raidparty.r_id = 1
 order by username;

--List the Roles of characters in a raid party
select username, characterRole.role_name
 from characterRole join RaidRoles
 	on CharacterRole.role_name = RaidRoles.role_name
 where r_id =1;

--List all members in the raid chatroom(s)
 select cr_id, username
 from character join party
 	on character.p_id = party.p_id
 join raidparty
 	on party.r_id = raidparty.r_id
 join chat
 	on raidparty.r_id = chat.r_id
 where raidParty.r_id =1;


--List all the currently equipped weapons with attributes

Select inventory.username, wep_Name, attribute
from equippedWep join Weapon
	on equippedWep.w_id = weapon.w_id
join attributes
	on weapon.w_id = attributes.w_id
join inventory
	on weapon.inv_id = inventory.inv_id;

--List all the currently equipped Armor
Select inventory.username, armr_Name, attribute
from equippedArmor join Armor
	on equippedArmor.a_id = armor.a_id
join attributes
	on armor.a_id = attributes.a_id
join inventory
	on armor.inv_id = inventory.inv_id;

--List all the currently equipped Accessories
Select inventory.username, acc_Name, attribute
from equippedacc join Accessory
	on equippedAcc.acc_id = accessory.acc_id
join attributes
	on accessory.acc_id = attributes.acc_id
join inventory
	on accessory.inv_id = inventory.inv_id;

--List the Inventory of a character
select username, wep_name, armr_name, acc_name, money
from inventory join weapon
	on weapon.inv_id = inventory.inv_id
join armor
	on armor.inv_id = inventory.inv_id
join Accessory
	on accessory.inv_id = inventory.inv_id
where username ='Shifty';






insert into RaidParty(r_id, raid_limit)
	values(1, 5);

insert into RaidParty(r_id, raid_limit)
	values(2, 5);


insert into Party(p_id, r_id, party_limit)
	values(11, 1, 4);

insert into Party(p_id, r_id, party_limit)
	values(12, 1, 4);

insert into Party(p_id, r_id, party_limit)
	values(13, 2, 4);

insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
	values(20, 1, 'The Best Chat', 'lol', 15);

insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
	values(21, 2, 'Party Chat', 'Its a secret', 10);

insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
	values(22, 1, 'Time for a Chat', 'password', 15);

insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
	values(23, 2, 'Private Chat', 'Open Sesame', 5);

insert into chat(cr_id, r_id, chat_name, room_pswd, room_limit)
	values(24, 1, 'Hello World', 'No Need', 15);

insert into roles(role_name, primary_job)
	values('DPS', 'Kill Everything');

insert into roles(role_name, primary_job)
	values('Tank', 'Draw Aggro');

insert into roles(role_name, primary_job)
	values('Off-Tank', 'Provide Tank Support');

insert into roles(role_name, primary_job)
	values('Healer', 'Heal the Team');

insert into roles(role_name, primary_job)
	values('CC', 'Control the battle');

insert into RaidRoles(role_name, r_id, role_number)
	values('DPS', 1, 5);

insert into RaidRoles(role_name, r_id, role_number)
	values('Tank', 1, 1);

insert into RaidRoles(role_name, r_id, role_number)
	values('Healer', 1, 2);

insert into RaidRoles(role_name, r_id, role_number)
	values('Off-Tank', 2, 2);

insert into RaidRoles(role_name, r_id, role_number)
	values('CC', 2, 4);

insert into class(class_name, trait, description)
	values('Warrior', 'Weapon Expert', 'An expert at dealing damage');

insert into class(class_name, trait, description)
	values('Guardian', 'Damage Absorbtion', 'An expert at taking damage');

insert into class(class_name, trait, description)
	values('Medic', 'Medical Expert', 'An expert at Patching up the wounded');

insert into class(class_name, trait, description)
	values('Mage', 'Flow Control', 'An expert at controlling the flow of battle');

insert into class(class_name, trait, description)
	values('Archer', 'Ranged Expert', 'An expert at dealing damage from distance');

insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Lampplate', 11, 'Warrior', 1, 45, 'Warlord', 'good');

insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Shakabro', 11, 'Medic', 0, 50, 'Drifter', 'good');

insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Shifty', 12, 'Guardian', 1, 30, 'Sergeant', 'neutral');

insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Mumbles', 12, 'Mage', 0, 60, 'Major', 'Mumbles');

insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Tourist', NULL, 'Archer', 1, 45, 'Traveller', 'evil');

insert into character(username, p_id, class_name, party_ldr, char_level, title, faction)
	values('Sasha', NULL, 'Guardian', 0, 47, NULL, 'evil');

insert into characterRole(role_name, username)
	values('DPS', 'Lampplate');

insert into characterRole(role_name, username)
	values('Healer', 'Shakabro');

insert into characterRole(role_name, username)
	values('Tank', 'Shifty');

insert into characterRole(role_name, username)
	values('CC', 'Mumbles');

insert into characterRole(role_name, username)
	values('DPS', 'Tourist');

insert into characterRole(role_name, username)
	values('Off-Tank', 'Sasha');

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Spark', 'Mage', 'Shock an Enemy', 5, 15, 10);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Scatter Shot', 'Archer', 'Shoots Multiple Arrows', NULL, 20, 20);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Longshot', 'Archer', 'Powerful Shot', NULL, 10, 5);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Shield Wall', 'Guardian', 'Increases Defense', 30, 60, 45);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Rampage', 'Warrior', 'Increases Attack', 10, 15, 50);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Slash', 'Warrior', 'Simple Slash Attack', NULL, 5, 1);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Heal', 'Medic', 'Heals an Ally', NULL, 20, 10);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Remedy', 'Medic', 'Removes Status', 5, 35, 30);

insert into Abilities(ability_name, class_name, effect, duration, cooldown, abi_level)
	values('Whirlwind', 'Warrior', 'Spinning Strike', 3, 25, 35);

insert into Inventory(inv_id, username, money)
	values('I1', 'Lampplate', 1);

insert into Inventory(inv_id, username, money)
	values('I2', 'Shakabro', 20000);

insert into Inventory(inv_id, username, money)
	values('I3', 'Shifty', 50000);

insert into Inventory(inv_id, username, money)
	values('I4', 'Mumbles', 25000);

insert into Inventory(inv_id, username, money)
	values('I6', 'Sasha', 1000000);

insert into Inventory(inv_id, username, money)
	values('I5', 'Tourist', 200000);

insert into Accessory(acc_id, inv_id, acc_name, acc_type, acc_level)
	values('acc1', 'I1', 'Ring of Fire', 'Ring', 40);

insert into Accessory(acc_id, inv_id, acc_name, acc_type, acc_level)
	values('acc2', 'I1', 'Gold Necklace', 'Necklace', 15);

insert into Accessory(acc_id, inv_id, acc_name, acc_type, acc_level)
	values('acc3', 'I2', 'Silver Bracelet', 'Bracelet', 5);

insert into Accessory(acc_id, inv_id, acc_name, acc_type, acc_level)
	values('acc4', 'I3', 'Belt of Speed', 'Belt', 25);

insert into Accessory(acc_id, inv_id, acc_name, acc_type, acc_level)
	values('acc5', 'I4', 'Ring of the Lords', 'Ring', 60);

insert into Armor(a_id, inv_id, armr_name, armr_rating, armr_type, armr_level)
	values('a1', 'I5', 'Rogues Glory', 55, 'Medium', 40);

insert into Armor(a_id, inv_id, armr_name, armr_rating, armr_type, armr_level)
	values('a2', 'I6', 'Juggernauts Armor', 90, 'Heavy', 45);

insert into Armor(a_id, inv_id, armr_name, armr_rating, armr_type, armr_level)
	values('a3', 'I4', 'Sneaky Cloak', 25, 'Light', 55);

insert into Armor(a_id, inv_id, armr_name, armr_rating, armr_type, armr_level)
	values('a4', 'I3', 'Fumbles Revenge', 70, 'Heavy', 25);

insert into Armor(a_id, inv_id, armr_name, armr_rating, armr_type, armr_level)
	values('a5', 'I5', 'Medics Requiem', 50, 'Medium', 45);

insert into weapon(w_id, inv_id, wep_name, wep_dam, wep_type, wep_level)
	values('w1', 'I1', 'Dark Sword', 90, 'Sword', 40);

insert into weapon(w_id, inv_id, wep_name, wep_dam, wep_type, wep_level)
	values('w2', 'I1', 'Master Sword', 105, 'Sword', 60);

insert into weapon(w_id, inv_id, wep_name, wep_dam, wep_type, wep_level)
	values('w3', 'I4', 'Staff of Wisdom', 70, 'Staff', 50);

insert into weapon(w_id, inv_id, wep_name, wep_dam, wep_type, wep_level)
	values('w4', 'I3', 'Gae Bolg', 95, 'Polearm', 25);

insert into weapon(w_id, inv_id, wep_name, wep_dam, wep_type, wep_level)
	values('w5', 'I5', 'Recurve Bow', 100, 'Bow', 45);

insert into weapon(w_id, inv_id, wep_name, wep_dam, wep_type, wep_level)
	values('w6', 'I2', 'Meddics Dagger', 55, 'Dagger', 15);

insert into Attributes(acc_id, a_id, w_id, attribute)
	values('acc1', NULL, NULL, 'Attack +5');

insert into Attributes(acc_id, a_id, w_id, attribute)
	values(NULL, NULL, 'w5', 'Dexterity +3');

insert into Attributes(acc_id, a_id, w_id, attribute)
	values(NULL, 'a5', NULL, 'Crit Defense +4');

insert into Attributes(acc_id, a_id, w_id, attribute)
	values(NULL, NULL, 'w1', 'Health +35');

insert into Attributes(acc_id, a_id, w_id, attribute)
	values('acc4', NULL, NULL, 'Dexterity +5');

insert into Attributes(acc_id, a_id, w_id, attribute)
	values(NULL, 'a3', NULL, 'Threat -5');

insert into equippedAcc(username, acc_id)
	values('Lampplate', 'acc1');

insert into equippedAcc(username, acc_id)
	values('Shifty', 'acc4');

insert into equippedAcc(username, acc_id)
	values('Mumbles', 'acc5');

insert into equippedArmor(username, a_id)
	values('Tourist', 'a1');

insert into equippedArmor(username, a_id)
	values('Shifty', 'a4');

insert into equippedArmor(username, a_id)
	values('Mumbles', 'a3');

insert into equippedWep(username, w_id)
	values('Lampplate', 'w1');

insert into equippedWep(username, w_id)
	values('Shifty', 'w4');

insert into equippedWep(username, w_id)
	values('Tourist', 'w5');

insert into equippedWep(username, w_id)
	values('Shakabro', 'w6');

-- Remove some Duplicate Spawns
DELETE FROM `creature` WHERE `guid`=161671 AND `id`=3367; -- Felika <Trade Supplies>
DELETE FROM `creature` WHERE `guid`=162048 AND `id`=14377; -- Scout Tharr
DELETE FROM `creature` WHERE `guid`=161180 AND `id`=14375; -- Scout Stronghand
DELETE FROM `creature` WHERE `guid`=161157 AND `id`=14376; -- Scout Manslayer
DELETE FROM `creature` WHERE `guid`=161099 AND `id`=3296; -- Orgrimmar Grunt

-- Remove two duplicate 'Warchief's Command Board'
DELETE FROM `gameobject` WHERE `guid` IN (73629, 73556);
-- Fix faction for 'Warchief's Command Board'
UPDATE `gameobject_template` SET `faction`=79 WHERE `entry` IN (206116, 206109);

-- Remove some Creatures because they should only appear on transport
DELETE FROM `creature` WHERE `guid` IN (140528, 162060, 162056, 162059, 162055, 162064, 162061, 162065, 162063, 162062, 162058, 162057, 162054);

-- Zugra Flamefist <Tol Barad Battle-Mage> should cast 'Arcane Channeling' (Doesn't work with Aura in creature_addon)
DELETE FROM `creature_template_addon` WHERE `entry`=47321;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES (47321, 0, 0x0, 0x1, '');
DELETE FROM `smart_scripts` WHERE `entryorguid`=47321 AND `source_type`=0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=47321 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(47321,0,0,0,25,0,100,0,0,0,0,0,11,32783,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Zugra Flamefist - On Reset - Cast Arcane Channeling");

-- Only a few Orgrimmar Barve should sit down
UPDATE `creature_template_addon` SET `bytes1`=0x0 WHERE `entry`=45230;
DELETE FROM `creature_addon` WHERE `guid` IN (140457, 140462, 140465, 140466);
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES 
(140457, 0, 0x1, 0x101, ''),
(140462, 0, 0x1, 0x101, ''),
(140465, 0, 0x1, 0x101, ''),
(140466, 0, 0x1, 0x101, '');

-- Some Creatures should use their hammer
UPDATE `creature_template_addon` SET `emote`=233 WHERE `entry` IN (44781, 7230, 7231, 4043, 5712, 3355);

-- Some Orgrimmar Grunts have to sit down
DELETE FROM `creature_addon` WHERE `guid` IN (140458, 140461, 140467);
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES 
(140458, 0, 0x1, 0x101, ''),
(140461, 0, 0x1, 0x101, ''),
(140467, 0, 0x1, 0x101, '');
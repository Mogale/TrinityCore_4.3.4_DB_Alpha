SET @CGUID := XXX; -- 1 needed

-- Add missing Barrus Spawn in Ironforge
DELETE FROM `creature` WHERE `id`=15119;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15119, 0, 1, 1, -4964.69, -936.287, 501.743, 5.44543, 120, 0, 0); -- Barrus <Fishing Promoter>

-- Grinkle and Barrus should only appear while "Stranglethorn Fishing Extravaganza Announce" Event is up
DELETE FROM `game_event_creature` WHERE `eventEntry`=14 AND `guid`=161064;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(14, 161064), -- Grinkle <Fishing Promoter>
(14, @CGUID+0); -- Barrus <Fishing Promoter>
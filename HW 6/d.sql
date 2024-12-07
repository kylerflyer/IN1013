CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ukpoints` AS
    SELECT 
        `waypoint`.`pointId` AS `pointId`,
        `waypoint`.`region` AS `region`,
        `point`.`ident` AS `ident`,
        `waypoint`.`type` AS `type`
    FROM
        (`point`
        JOIN `waypoint` ON ((`point`.`pointId` = `waypoint`.`pointId`)))
    WHERE
        (`waypoint`.`region` = 'EG')
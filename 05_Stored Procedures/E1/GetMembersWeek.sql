CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMembersWeek`()
BEGIN

SELECT `members`.`id_member`, `members`.`joining_date`,`members`.`membership_types_id_membership_types` as 'MemberShipType'  FROM `gym_manager`.`members` where dayofweek(members.joining_date) > 1 and dayofweek(members.joining_date) <= 7;

END
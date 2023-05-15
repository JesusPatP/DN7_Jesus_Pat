CREATE DEFINER=`root`@`localhost` PROCEDURE `GetConsultInventory`(in _idProduct int)
BEGIN
SELECT `inventory`.`id_inventory`,
    `inventory`.`amount`
FROM `gym_manager`.`inventory` where `inventory`.`product_types_id_product_types` = _idProduct;
END
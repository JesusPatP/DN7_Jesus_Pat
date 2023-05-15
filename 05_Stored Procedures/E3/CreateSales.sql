CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateSales`(in _idProduct int, in _userId int, out _idSale int, out _amount int)
BEGIN

declare _amountProduct int;
declare _saleId int;

select `inventory`.`amount` from `gym_manager`.`inventory` where `inventory`.`product_types_id_product_types` = _idProduct into _amountProduct;

if(_amountProduct > 0) then
select `inventory`.`amount` from `gym_manager`.`inventory` where `inventory`.`product_types_id_product_types` = _idProduct into _amountProduct;
select max(`sales`.`id_sale`) + 1 into _saleId from `gym_manager`.`sales` ;

insert into sales (id_sale, sale_date, product_types_id_product_type, id_user_sale)
values(_saleId, now() , _idProduct, _userId);

set _amountProduct = _amountProduct -1;

UPDATE `gym_manager`.`inventory` SET `amount` =_amountProduct WHERE `product_types_id_product_types` = _idProduct;

set _idSale = _saleId;
set _amount = _amountProduct;
end if;
END
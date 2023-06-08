-- 1. 
SELECT SUM(amount) FROM hardware;
-- 2. 
select * from hardware
where amount = 0;
-- 3. 
select avg (hardware.price) FROM hardware
WHERE hardware.title LIKE 'Монитор%';
-- 4.
select * from hardware
where hardware.title like 'Клавиатура%'
order by hardware.price asc;
-- 5. 
select hardware.tag, count(*) as count from hardware
group by hardware.tag
order by count desc;
-- 6. 
select count(*) from hardware
where hardware.tag = 'discount';
-- 7. 
select hardware.title, hardware.price from hardware 
where hardware.tag = 'new'
order by hardware.price desc
limit 1;
-- 8. 
insert into hardware
(title, price, tag, amount) 
values 
("Ноутбук Lenovo 2BXKQ7E9XD", 54500, "new", 1);
-- 9. 
DELETE FROM hardware
WHERE hardware.title = "Очки PS VR 2" and hardware.id > 0 ;

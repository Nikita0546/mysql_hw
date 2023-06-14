-- 1.
select authors.name from authors
join authors_books on authors_books.authors_id = authors.id
group by authors.name
order by count(authors_books.authors_id) desc
limit 1;
-- 2.
select * from books
where books.year is not null
order by books.year asc
limit 5;
-- 3. 
select count(books.id) as count from books
join shelves on shelves.id = books.shelves_id
where shelves.title = 'Полка в кабинете'
group by books.shelves_id;
-- 4. 
select books.title, authors.name, books.year from books
join shelves on shelves.id = books.shelves_id
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id
where shelves.title = 'Полка в спальне';
-- 5. 
select books.title, books.year from books
join shelves on shelves.id = books.shelves_id
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id
where authors.name = 'Лев Толстой';
-- 6. 
select books.title from books
join shelves on shelves.id = books.shelves_id
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id
where authors.name like 'А%';
-- 7. 
select books.title, authors.name from books
join shelves on shelves.id = books.shelves_id
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id
where shelves.title like '%нижняя%' or shelves.title like '%верхняя%';
-- 8.
update books
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id
set books.friends_id = (select friends.id from friends where friends.name = 'Иванов Иван')
where authors.name = 'Данте Алигьери' and books.title = 'Божественная комедия'
and books.id > 0;
-- 9.
insert into authors 
(name)
values
(
"Стивен Хокинг"
 );

insert into books 
(title, year, shelves_id)
values (
	"Краткие ответы на большие вопросы", 
     2020, 
     (select shelves.id from shelves where shelves.title = "Полка в кабинете" limit 1)
 );

 insert into authors_books
 (books_id, authors_id)
 values 
 (
 	(select books.id from books where books.title = "Краткие ответы на большие вопросы" and books.year = 2020 limit 1),
 	(select authors.id from authors where authors.name = "Стивен Хокинг" limit 1)
 );
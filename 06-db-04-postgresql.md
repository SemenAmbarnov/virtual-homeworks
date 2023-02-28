# Домашнее задание к занятию "4. PostgreSQL"

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

Подключитесь к БД PostgreSQL используя `psql`.

Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.

**Найдите и приведите** управляющие команды для:
- вывода списка БД
- подключения к БД
- вывода списка таблиц
- вывода описания содержимого таблиц
- выхода из psql

Решение:

\l - список БД \
\c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo} connect to new database (currently "postgres") - подключение к БД \
\dt[S+] [PATTERN] - список таблиц \
\d[S+]  NAME - описание содержимого таблиц \
\q - выход из psql


## Задача 2

Используя `psql`, создайте БД `test_database`.

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/virt-11/06-db-04-postgresql/test_data).

Восстановите бэкап БД в `test_database`.

Перейдите в управляющую консоль `psql` внутри контейнера.

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.

Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` 
с наибольшим средним значением размера элементов в байтах.

**Приведите в ответе** команду, которую вы использовали для вычисления, и полученный результат.

Решение:

Раскатываю бэкап в созданную базу:

![image](https://user-images.githubusercontent.com/92155007/221566350-1060488a-66ed-43b6-84f7-b62dd2cd63a0.png)

Захожу в postgree и переключаюсь в test_database и далее провожу операцию ANALYZE и вывожу столбец orders:

![image](https://user-images.githubusercontent.com/92155007/221566884-2ae76864-ac77-4779-9d1d-1620fece9cde.png)

## Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и
поиск по ней занимает долгое время. Вам как успешному выпускнику курсов DevOps в Нетологии предложили
провести разбиение таблицы на 2: шардировать на orders_1 - price>499 и orders_2 - price<=499.

Предложите SQL-транзакцию для проведения этой операции.

Можно ли было изначально исключить ручное разбиение при проектировании таблицы orders?

Решение:

BEGIN;

 Переименование таблицы:

 ALTER TABLE orders RENAME to orders_old;

 Создание новой таблицы на основе старой и шардирование на 2 таблицы:

 CREATE TABLE orders (
   like orders_old 
   including all
 );

 CREATE TABLE orders_1 (
     CHECK (price>499)
 ) INHERITS (orders);

 CREATE TABLE orders_2 (
     CHECK (price<=499)
 ) INHERITS (orders);

 Задание владельца:

 ALTER TABLE orders_1 OWNER TO postgres;
 ALTER TABLE orders_2 OWNER TO postgres;

 Создание правил для шардов:

 CREATE RULE orders_insert_over_499 AS ON INSERT TO orders
 WHERE (price>499)
 DO INSTEAD INSERT INTO orders_1 VALUES(NEW.*);

 CREATE RULE orders_insert_499_or_less AS ON INSERT TO orders
 WHERE (price<=499)
 DO INSTEAD INSERT INTO orders_2 VALUES(NEW.*);

 Копирование данных из старой таблицы в новую:

 INSERT INTO orders (id,title,price) select id,title,price FROM orders_old

COMMIT;

Можно ли было изначально исключить ручное разбиение при проектировании таблицы orders?

Да такой вариант возможен если данное условие указать при создании таблицы на этапе создания партиций.


## Задача 4

Используя утилиту `pg_dump`, создайте бекап БД `test_database`.

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

Решение:

Снимаю бэкап БД:

![image](https://user-images.githubusercontent.com/92155007/221570581-ddcbc875-b4bb-4c9d-94aa-ae472ff499f7.png)


Я бы добавил признак UNIQUE

![image](https://user-images.githubusercontent.com/92155007/221568898-9a11fbbd-d2e7-4234-ba9e-59f45c7ff405.png)

title  | character varying(80) |           | not null UNIQUE

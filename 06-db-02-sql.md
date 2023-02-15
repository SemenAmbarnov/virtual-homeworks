# Домашнее задание к занятию "2. SQL"

### Задача №1 

Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose манифест.

Решение: 

![image](https://user-images.githubusercontent.com/92155007/218685869-6cc6826e-755a-4d7c-b7d4-286c5bf84588.png)


### Задача №2

В БД из задачи 1: 
- создайте пользователя test-admin-user и БД test_db
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже)
- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db
- создайте пользователя test-simple-user  
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db

Таблица orders:
- id (serial primary key)
- наименование (string)
- цена (integer)

Таблица clients:
- id (serial primary key)
- фамилия (string)
- страна проживания (string, index)
- заказ (foreign key orders)

Приведите:
- итоговый список БД после выполнения пунктов выше,
- описание таблиц (describe)
- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
- список пользователей с правами над таблицами test_db

Решение: 

![image](https://user-images.githubusercontent.com/92155007/218735743-dc3bc551-6800-4580-9413-0d9c0f9dc716.png)

![image](https://user-images.githubusercontent.com/92155007/218735826-3ec03bb0-b616-4f0f-b636-62a8e3a66e31.png)

![image](https://user-images.githubusercontent.com/92155007/218735886-db52dca3-4dc3-4088-a62d-11158f12c7e8.png)

SQL-запрос:

SELECT grantee, table_name, privilege_type \
FROM information_schema.table_privileges \
WHERE table_name='clients' or table_name='orders';

![image](https://user-images.githubusercontent.com/92155007/218751585-8028e2ae-4ece-4ead-a91a-9fdeffd98d6d.png)

### Задача №3

Используя SQL синтаксис - наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|

Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|

Используя SQL синтаксис:
- вычислите количество записей для каждой таблицы 
- приведите в ответе:
    - запросы 
    - результаты их выполнения.

Решение:

![image](https://user-images.githubusercontent.com/92155007/218952109-f2a1e634-24f5-49fd-ae58-a344bcf37db3.png)

![Screenshot from 2023-02-15 10-42-32](https://user-images.githubusercontent.com/92155007/218952311-7e8c07a7-2bcc-4247-8fb5-03c7ef588c2f.png)






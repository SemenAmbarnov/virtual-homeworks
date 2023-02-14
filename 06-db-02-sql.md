# Домашнее задание к занятию "2. SQL"

### Задача №1 

Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose манифест.

Решение: 

![image](https://user-images.githubusercontent.com/92155007/218685869-6cc6826e-755a-4d7c-b7d4-286c5bf84588.png)


### Задача №2

В БД из задачи 1:

создайте пользователя test-admin-user и БД test_db \
в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже) \
предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db \
создайте пользователя test-simple-user \
предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db \

Таблица orders: 

id (serial primary key) \
наименование (string) \
цена (integer) \
Таблица clients: \

id (serial primary key) \
фамилия (string) \
страна проживания (string, index) \
заказ (foreign key orders) \

Приведите:

итоговый список БД после выполнения пунктов выше, \
описание таблиц (describe) \
SQL-запрос для выдачи списка пользователей с правами над таблицами test_db \
список пользователей с правами над таблицами test_db \

Решение: 

![image](https://user-images.githubusercontent.com/92155007/218735743-dc3bc551-6800-4580-9413-0d9c0f9dc716.png)

![image](https://user-images.githubusercontent.com/92155007/218735826-3ec03bb0-b616-4f0f-b636-62a8e3a66e31.png)

![image](https://user-images.githubusercontent.com/92155007/218735886-db52dca3-4dc3-4088-a62d-11158f12c7e8.png)


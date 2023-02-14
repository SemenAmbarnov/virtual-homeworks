# Домашнее задание к занятию "2. SQL"

### Задача №1 

Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose манифест.

Решение: 

version: "2"

volumes:
  postgres_data:
  backup_data:

networks:
  postgres:
    driver: bridge


services:

  postgreesql:
    image: postgres:12
    container_name: postgreesql
    environment:
      - PGDATA=/var/lib/postgresql/data/pgdata
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=netology
      - POSTGRES_USER=postgres
    volumes:
      - postgres_data:/var/lib/postgresql/data/pgdata
      - backup_data:/backup
    restart: always
    networks:
      - postgres

### Задача №2

В БД из задачи 1:

создайте пользователя test-admin-user и БД test_db
в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже)
предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db
создайте пользователя test-simple-user
предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db
Таблица orders:

id (serial primary key)
наименование (string)
цена (integer)
Таблица clients:

id (serial primary key)
фамилия (string)
страна проживания (string, index)
заказ (foreign key orders)
Приведите:

итоговый список БД после выполнения пунктов выше,
описание таблиц (describe)
SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
список пользователей с правами над таблицами test_db

Решение: 



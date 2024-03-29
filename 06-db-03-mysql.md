# Домашнее задание к занятию "3. MySQL"

## Задача 1

Используя docker поднимите инстанс MySQL (версию 8). Данные БД сохраните в volume.

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/virt-11/06-db-03-mysql/test_data) и 
восстановитесь из него.

Перейдите в управляющую консоль `mysql` внутри контейнера.

Используя команду `\h` получите список управляющих команд.

Найдите команду для выдачи статуса БД и **приведите в ответе** из ее вывода версию сервера БД.

Подключитесь к восстановленной БД и получите список таблиц из этой БД.

**Приведите в ответе** количество записей с `price` > 300.

В следующих заданиях мы будем продолжать работу с данным контейнером.


Решение:

Docker-compose файл:

![image](https://user-images.githubusercontent.com/92155007/220086653-ca88fefb-5ad6-47b1-8b19-3aced88352ee.png)

Список созданныйх баз:

![image](https://user-images.githubusercontent.com/92155007/220087054-8bd828f4-7201-4b20-92cf-2580e64aef52.png)

Восстанавливаю базу из бэкапа:

bash-4.4# mysql -b mysql -p < /backup/test_dump.sql 

Переключаюсь на базу и вывлжу статус:

![image](https://user-images.githubusercontent.com/92155007/220087708-b1978127-1101-4456-8e3f-4573c5feb1e4.png)

Вывожу список таблиц:

![image](https://user-images.githubusercontent.com/92155007/220087804-4f04f064-4c0e-41b4-a883-f26423984926.png)

Вывожу колличество записей:

![image](https://user-images.githubusercontent.com/92155007/220087966-842ea730-abb6-4fed-9537-6129e2689d4e.png)

## Задача 2

Создайте пользователя test в БД c паролем test-pass, используя:
- плагин авторизации mysql_native_password
- срок истечения пароля - 180 дней 
- количество попыток авторизации - 3 
- максимальное количество запросов в час - 100
- аттрибуты пользователя:
    - Фамилия "Pretty"
    - Имя "James"

Предоставьте привелегии пользователю `test` на операции SELECT базы `test_db`.
    
Используя таблицу INFORMATION_SCHEMA.USER_ATTRIBUTES получите данные по пользователю `test` и 
**приведите в ответе к задаче**.

Решение:

![image](https://user-images.githubusercontent.com/92155007/220095648-8437543c-61bd-4725-914d-2ddce67c7cf9.png)

## Задача 3

Установите профилирование `SET profiling = 1`.
Изучите вывод профилирования команд `SHOW PROFILES;`.

Исследуйте, какой `engine` используется в таблице БД `test_db` и **приведите в ответе**.

Измените `engine` и **приведите время выполнения и запрос на изменения из профайлера в ответе**:
- на `MyISAM`
- на `InnoDB`

Решение:

Ответ по изменению движка

![image](https://user-images.githubusercontent.com/92155007/220097215-c3fb53f6-c5a3-4a6e-8333-5d3050297a8d.png)

Ответ: используется InnoDB

![image](https://user-images.githubusercontent.com/92155007/220097403-577db150-a087-480c-9af0-82049454ad86.png)


## Задача 4 

Изучите файл `my.cnf` в директории /etc/mysql.

Измените его согласно ТЗ (движок InnoDB):
- Скорость IO важнее сохранности данных
- Нужна компрессия таблиц для экономии места на диске
- Размер буффера с незакомиченными транзакциями 1 Мб
- Буффер кеширования 30% от ОЗУ
- Размер файла логов операций 100 Мб

Приведите в ответе измененный файл `my.cnf`.


Решение:

[mysqld] 

datadir=/var/lib/mysql \
socket=/var/run/mysqld/mysqld.sock \
secure-file-priv=NULL \
user=mysql

pid-file=/var/run/mysqld/mysqld.pid

[client]

socket=/var/run/mysqld/mysqld.sock 

!includedir /etc/mysql/conf.d/ 


innodb_flush_log_at_trx_commit = 0 \
innodb_file_per_table = 1 \
innodb_log_buffer_size	= 1M \
key_buffer_size = 2448М \
max_binlog_size	= 100M 

# Домашнее задание к занятию "6.5. Elasticsearch"

## Задача 1

Используя докер образ [elasticsearch:7](https://hub.docker.com/_/elasticsearch) как базовый:

- составьте Dockerfile-манифест для elasticsearch
- соберите docker-образ и сделайте `push` в ваш docker.io репозиторий
- запустите контейнер из получившегося образа и выполните запрос пути `/` c хост-машины

В ответе приведите:
- текст Dockerfile манифеста
- ссылку на образ в репозитории dockerhub
- ответ `elasticsearch` на запрос пути `/` в json виде

Решение:

1. ![image](https://user-images.githubusercontent.com/92155007/226618795-e79dde0a-411e-4930-93e6-2f6f5d6c8379.png)
2. https://hub.docker.com/repository/docker/samborsch/elastic/general
3. ![image](https://user-images.githubusercontent.com/92155007/226619198-123d25ea-25ca-4c32-ba2f-7c8b1c0ec1e7.png)

## Задача 2

В этом задании вы научитесь:
- создавать и удалять индексы
- изучать состояние кластера
- обосновывать причину деградации доступности данных

Ознакомтесь с [документацией](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html) 
и добавьте в `elasticsearch` 3 индекса, в соответствии со таблицей:

| Имя | Количество реплик | Количество шард |
|-----|-------------------|-----------------|
| ind-1| 0 | 1 |
| ind-2 | 1 | 2 |
| ind-3 | 2 | 4 |

Получите список индексов и их статусов, используя API и **приведите в ответе** на задание.

Получите состояние кластера `elasticsearch`, используя API.

Как вы думаете, почему часть индексов и кластер находится в состоянии yellow?

Удалите все индексы.

Решение:

1. Создаю индексы: \
curl -X PUT http://localhost:9200/ind-1\?pretty -H 'Content-Type: application/json' -d'{ "settings": { "index": { "number_of_shards": 1, "number_of_replicas": 0 }}}' \
curl -X PUT http://localhost:9200/ind-2\?pretty -H 'Content-Type: application/json' -d'{ "settings": { "index": { "number_of_shards": 2, "number_of_replicas": 1 }}}' \
curl -X PUT http://localhost:9200/ind-3\?pretty -H 'Content-Type: application/json' -d'{ "settings": { "index": { "number_of_shards": 4, "number_of_replicas": 2 }}}'
![image](https://user-images.githubusercontent.com/92155007/226620610-fba653d5-34d2-42bd-928a-d102d038d0e9.png)


2. Получаю состояние кластера: 
   ![image](https://user-images.githubusercontent.com/92155007/226620684-b06db26c-f740-4a36-a453-5ad777225057.png)


3. Жёлтым помечены те реплики для которой не хватило ноды. Причина в нехватке места для размещения реплик.
4. Удаляю индексы:
   ![image](https://user-images.githubusercontent.com/92155007/226629274-cfd9cdb2-d11d-4b3f-a048-b484a995f38a.png)
   
## Задача 3

В данном задании вы научитесь:
- создавать бэкапы данных
- восстанавливать индексы из бэкапов

Создайте директорию `{путь до корневой директории с elasticsearch в образе}/snapshots`.

Используя API [зарегистрируйте](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html#snapshots-register-repository) 
данную директорию как `snapshot repository` c именем `netology_backup`.

**Приведите в ответе** запрос API и результат вызова API для создания репозитория.

Создайте индекс `test` с 0 реплик и 1 шардом и **приведите в ответе** список индексов.

[Создайте `snapshot`](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-take-snapshot.html) 
состояния кластера `elasticsearch`.

**Приведите в ответе** список файлов в директории со `snapshot`ами.

Удалите индекс `test` и создайте индекс `test-2`. **Приведите в ответе** список индексов.

[Восстановите](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-restore-snapshot.html) состояние
кластера `elasticsearch` из `snapshot`, созданного ранее. 

**Приведите в ответе** запрос к API восстановления и итоговый список индексов.

Подсказки:
- возможно вам понадобится доработать `elasticsearch.yml` в части директивы `path.repo` и перезапустить `elasticsearch`


Решение:

1. ![image](https://user-images.githubusercontent.com/92155007/226853040-8a98d50d-3d15-424c-82aa-8af80fd42e0d.png)

2. ![image](https://user-images.githubusercontent.com/92155007/226886520-f39999f3-d54a-4be1-a8db-c2edf0ef9698.png)

3. ![image](https://user-images.githubusercontent.com/92155007/226887089-0324034d-da16-460b-9908-7c9ce837f86d.png)
   ![image](https://user-images.githubusercontent.com/92155007/226887239-529d21a1-f6af-41ca-b600-5fc2fd4bf1ac.png)

4. ![Screenshot from 2023-03-22 13-23-22](https://user-images.githubusercontent.com/92155007/226858135-63f572a2-af3a-4d56-aaaa-d6de28f3b2ce.png)






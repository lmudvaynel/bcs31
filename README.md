# Template Baltic IT

## Деплой
см. [DEPLOY.md](DEPLOY.md)

## База
### Пример config/database.yml:
```yaml
development:
  adapter: mysql2
  encoding: utf8
  database: bcs31_dev
  username: root
  password: ''

test: &test
  adapter: mysql2
  encoding: utf8
  database: bcs31_test
  username: root
  password: ''

production:
  adapter: mysql2
  encoding: utf8
  database: bcs31_prod
  username: root
  password: ''

cucumber:
  <<: *test
```

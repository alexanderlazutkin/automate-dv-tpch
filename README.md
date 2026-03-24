# dbt_tpch

Проект dbt для построения Raw Data Vault поверх TPC-H (DuckDB) с локальным пакетом `automate-dv`.

## Профиль

Добавьте профиль в `~/.dbt/profiles.yml`:

```yaml
dbt_tpch:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: ../automatedv/tpch.duckdb
      schema: main
      threads: 4
```

## Зависимости

Пакет подключён локально через `packages.yml`:

```yaml
packages:
  - local: ../automate-dv
```

## Команды

```bash
cd /home/lan/project/automatedv/dbt_tpch
dbt deps
dbt debug
dbt run --select staging.tpch
dbt run --select raw_vault
dbt test
```

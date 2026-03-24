# Актуализированный план/статус проекта `dbt_tpch`

## 1) Статус проекта

Проект `dbt_tpch` уже создан и находится в рабочем состоянии как локальный dbt-проект для DuckDB с подключенным локальным пакетом `automate-dv`.

Ключевые подтверждения:

- Конфиг проекта: [`dbt_project.yml`](dbt_tpch/dbt_project.yml)
- Локальное подключение пакета: [`packages.yml`](dbt_tpch/packages.yml)
- Локальный профиль (в репозитории): [`profiles.yml`](dbt_tpch/profiles.yml)
- Зависимости Python/dbt: [`pyproject.toml`](dbt_tpch/pyproject.toml)

---

## 2) Актуальная конфигурация

### 2.1 dbt-переменные и материализации

В [`dbt_project.yml`](dbt_tpch/dbt_project.yml):

- `hash: 'md5'`
- `enable_native_hashes: false`
- `concat_string: '||'`
- `null_placeholder_string: '^^'`
- `max_datetime: '9999-12-31 23:59:59.999999'`

Материализации:

- `staging` → schema `staging`
- `raw_vault` → schema `raw_vault`
- `raw_vault/hubs|links|satellites` → `table`
- базовая материализация моделей проекта: `view` (с переопределениями для слоёв)

### 2.2 Профиль и путь к БД

В текущем [`profiles.yml`](dbt_tpch/profiles.yml):

- target: `dev`
- type: `duckdb`
- path: `../tpch.duckdb`
- schema: `main`
- threads: `2`

### 2.3 Подключение `automate-dv`

В [`packages.yml`](dbt_tpch/packages.yml) используется локальный путь:

- `/home/lan/project/automatedv/automate-dv`

---

## 3) Фактическая структура моделей

### 3.1 Staging

Источник таблиц TPC-H описан в [`_stg_tpch__sources.yml`](dbt_tpch/models/staging/tpch/_stg_tpch__sources.yml):

- `customer`, `orders`, `lineitem`, `part`, `partsupp`, `supplier`, `nation`, `region`.

Staging-модели:

- `stg_customer.sql`
- `stg_orders.sql`
- `stg_lineitem.sql`
- `stg_part.sql`
- `stg_partsupp.sql`
- `stg_supplier.sql`
- `stg_nation.sql`
- `stg_region.sql`
- `stg_customer_nation.sql`
- `stg_supplier_nation.sql`

### 3.2 Raw Vault

**Hubs (6):**

- `hub_customer.sql`, `hub_supplier.sql`, `hub_part.sql`, `hub_order.sql`, `hub_nation.sql`, `hub_region.sql`

**Links (6):**

- `link_order_customer.sql`
- `link_part_supplier.sql`
- `link_supplier_nation.sql`
- `link_customer_nation.sql`
- `link_nation_region.sql`
- `link_lineitem.sql`

**Satellites (7):**

- `sat_customer.sql`
- `sat_supplier.sql`
- `sat_part.sql`
- `sat_order.sql`
- `sat_nation.sql`
- `sat_region.sql`
- `sat_partsupp.sql`

### 3.3 Marts

Каталог `models/marts` в текущем состоянии пуст.

При этом в [`schema.yml`](dbt_tpch/models/schema.yml) присутствует описание `fact_sales`, что требует синхронизации с фактическими файлами моделей.

---

## 4) Особенности текущей реализации Data Vault

1. В части связей используется `eff_link`, например в [`link_order_customer.sql`](dbt_tpch/models/raw_vault/links/link_order_customer.sql).
2. Для `lineitem` используется `t_link` в [`link_lineitem.sql`](dbt_tpch/models/raw_vault/links/link_lineitem.sql).
3. Для спутников с историчностью используется `eff_sat` и `meta.is_auto_end_dating=true`, например в [`sat_customer.sql`](dbt_tpch/models/raw_vault/satellites/sat_customer.sql) и [`sat_partsupp.sql`](dbt_tpch/models/raw_vault/satellites/sat_partsupp.sql).
4. Staging-слой формирует `effective_from/effective_to`, `load_datetime`, `record_source='!TPCH'` (см. [`stg_lineitem.sql`](dbt_tpch/models/staging/tpch/stg_lineitem.sql)).

---

## 5) Что изменилось относительно прежнего плана

Ранее документ был ориентирован на создание проекта «с нуля». По факту:

- проект уже собран;
- структура links/satellites отличается от первоначального варианта (например, единый [`link_lineitem.sql`](dbt_tpch/models/raw_vault/links/link_lineitem.sql) вместо пары отдельных link-моделей);
- используется effectivity-подход (`eff_link`, `eff_sat`) в ряде сущностей;
- часть описаний в старом плане стала неактуальной и требовала приведения к реальному коду.

---

## 6) Актуальный backlog

### P0

1. Синхронизировать документацию моделей с фактическим составом файлов:
   - выровнять [`schema.yml`](dbt_tpch/models/schema.yml) и `models/marts`.
2. Зафиксировать единый источник правды по профилям:
   - либо поддерживать [`profiles.yml`](dbt_tpch/profiles.yml) как эталон,
   - либо явно оставить его только как пример и описать это в README.

### P1

1. Добавить/уточнить тесты для key Data Vault объектов в [`schema.yml`](dbt_tpch/models/schema.yml):
   - `not_null`, `unique` на ключах,
   - связи и ожидаемые row-count для основных сущностей.
2. Формализовать сценарий инкрементальных прогонов для `eff_*`/`t_link`.

### P2

1. При необходимости добавить витрины в `models/marts` и реализовать `fact_sales` как реальную модель (сейчас описана, но файл не обнаружен).

---

## 7) Критерий актуальности этого документа

Документ считается актуальным, пока:

- фактическая структура моделей соответствует разделу 3;
- конфигурация в [`dbt_project.yml`](dbt_tpch/dbt_project.yml) и [`profiles.yml`](dbt_tpch/profiles.yml) не изменилась существенно;
- связь с локальным `automate-dv` через [`packages.yml`](dbt_tpch/packages.yml) сохраняется.

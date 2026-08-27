#!/bin/sh
set -e
dbt seed --full-refresh --profiles-dir .
dbt snapshot --profiles-dir .
dbt run --full-refresh --profiles-dir .
dbt test --profiles-dir .

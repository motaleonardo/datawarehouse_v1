{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT 
        email, 
        DATE(data) AS data,
        ROUND(CAST(valor AS DECIMAL(10,2)), 2) as valor, 
        quantidade, 
        produto
    FROM 
        {{ ref('bronze_vendas') }}
)

SELECT * FROM cleaned_data
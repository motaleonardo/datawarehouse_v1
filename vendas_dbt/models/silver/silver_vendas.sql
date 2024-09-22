{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT 
        email, 
        DATE(data) AS data,
        valor, 
        quantidade, 
        produto
    FROM 
        {{ ref('bronze_vendas') }}
)

SELECT * FROM cleaned_data
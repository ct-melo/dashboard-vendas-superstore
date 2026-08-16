-- ============================================================
-- PROJETO 1: Dashboard de Vendas — Sample Superstore
-- Portfólio Data Analyst
-- Dataset: Kaggle Sample Superstore (CC0, ~9.994 registros)
-- ============================================================

-- ============================================================
-- 1. RECEITA E LUCRO POR CATEGORIA
-- Pergunta: Qual categoria gera mais receita e lucro?
-- ============================================================
SELECT category,
       ROUND(SUM(sales), 2)                    AS receita_total,
       ROUND(SUM(profit), 2)                   AS lucro_total,
       ROUND(SUM(profit)/SUM(sales)*100, 1)    AS margem_pct,
       SUM(quantity)                            AS qtd_vendida
FROM superstore
GROUP BY category
ORDER BY receita_total DESC;

-- ============================================================
-- 2. DESEMPENHO POR REGIÃO
-- Pergunta: Quais regiões têm melhor/pior desempenho?
-- ============================================================
SELECT region,
       ROUND(SUM(sales), 2)                    AS receita,
       ROUND(SUM(profit), 2)                   AS lucro,
       ROUND(SUM(profit)/SUM(sales)*100, 1)    AS margem_pct,
       COUNT(DISTINCT order_id)                 AS total_pedidos
FROM superstore
GROUP BY region
ORDER BY receita DESC;

-- ============================================================
-- 3. TOP 10 SUB-CATEGORIAS MAIS LUCRATIVAS
-- Pergunta: Quais produtos específicos mais contribuem para o lucro?
-- ============================================================
SELECT sub_category,
       category,
       ROUND(SUM(sales), 2)                    AS receita,
       ROUND(SUM(profit), 2)                   AS lucro,
       ROUND(SUM(profit)/SUM(sales)*100, 1)    AS margem_pct
FROM superstore
GROUP BY sub_category
ORDER BY lucro DESC
LIMIT 10;

-- ============================================================
-- 4. SUB-CATEGORIAS COM PREJUÍZO
-- Pergunta: Quais produtos estão dando prejuízo?
-- ============================================================
SELECT sub_category,
       category,
       ROUND(SUM(sales), 2)                    AS receita,
       ROUND(SUM(profit), 2)                   AS lucro,
       ROUND(SUM(profit)/SUM(sales)*100, 1)    AS margem_pct
FROM superstore
GROUP BY sub_category
HAVING lucro < 0
ORDER BY lucro ASC;

-- ============================================================
-- 5. IMPACTO DO DESCONTO NO LUCRO
-- Pergunta: Existe correlação entre desconto e lucro?
-- ============================================================
SELECT CASE
         WHEN discount = 0    THEN '0% (Sem desconto)'
         WHEN discount <= 0.1 THEN '1-10%'
         WHEN discount <= 0.2 THEN '11-20%'
         WHEN discount <= 0.3 THEN '21-30%'
         ELSE '31%+'
       END                                     AS faixa_desconto,
       COUNT(*)                                AS transacoes,
       ROUND(SUM(sales), 2)                    AS receita,
       ROUND(SUM(profit), 2)                   AS lucro,
       ROUND(SUM(profit)/SUM(sales)*100, 1)    AS margem_pct
FROM superstore
GROUP BY faixa_desconto
ORDER BY faixa_desconto;

-- ============================================================
-- 6. TENDÊNCIA MENSAL DE VENDAS
-- Pergunta: Qual a tendência de vendas ao longo do tempo?
-- ============================================================
SELECT SUBSTR(order_date, -4)                                       AS ano,
       SUBSTR(order_date, 1, INSTR(order_date, '/') - 1)           AS mes,
       ROUND(SUM(sales), 2)                                        AS receita,
       ROUND(SUM(profit), 2)                                       AS lucro
FROM superstore
GROUP BY ano, mes
ORDER BY ano, mes;

-- ============================================================
-- 7. TOP 10 ESTADOS POR RECEITA
-- Pergunta: Quais estados vendem mais? E quais dão lucro ou prejuízo?
-- ============================================================
SELECT state,
       region,
       ROUND(SUM(sales), 2)                    AS receita,
       ROUND(SUM(profit), 2)                   AS lucro,
       ROUND(SUM(profit)/SUM(sales)*100, 1)    AS margem_pct
FROM superstore
GROUP BY state
ORDER BY receita DESC
LIMIT 10;

-- ============================================================
-- 8. ANÁLISE POR SEGMENTO DE CLIENTE
-- Pergunta: Qual segmento é mais valioso?
-- ============================================================
SELECT segment,
       COUNT(DISTINCT customer_id)              AS clientes,
       COUNT(DISTINCT order_id)                 AS pedidos,
       ROUND(SUM(sales), 2)                    AS receita,
       ROUND(SUM(profit), 2)                   AS lucro,
       ROUND(SUM(sales)/COUNT(DISTINCT order_id), 2) AS ticket_medio
FROM superstore
GROUP BY segment
ORDER BY receita DESC;

-- ============================================================
-- INSIGHTS PRINCIPAIS
-- ============================================================
-- 1. Technology tem a melhor margem (17.4%), Furniture a pior (2.5%)
-- 2. Descontos acima de 20% DESTROEM o lucro (margem vira negativa)
-- 3. Tables, Bookcases e Supplies dão prejuízo — revisar preços
-- 4. Copiers são o produto mais lucrativo ($55.6K, 37% margem)
-- 5. Texas, Florida, Ohio e Illinois dão prejuízo apesar de alto faturamento
-- 6. Vendas crescem ano a ano com pico sazonal em Nov-Dez
-- 7. Home Office tem o maior ticket médio ($473) mas menor base de clientes

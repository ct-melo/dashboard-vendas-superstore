# 📊 Dashboard de Vendas — Sample Superstore

## Sobre o Projeto

Análise exploratória de dados de vendas de uma rede varejista fictícia (Superstore), com o objetivo de identificar padrões de receita, lucro, desempenho regional e impacto de descontos nas margens.

Este projeto faz parte do meu portfólio como **Data Analyst** em transição de carreira.

## 🎯 Perguntas de Negócio

1. Qual categoria gera mais receita e lucro?
2. Quais regiões têm melhor/pior desempenho?
3. Quais sub-categorias dão prejuízo?
4. Existe correlação entre desconto e lucro?
5. Qual a tendência de vendas ao longo do tempo?
6. Quais estados vendem mais — e quais dão prejuízo?
7. Qual segmento de cliente é mais valioso?

## 🔍 Principais Insights

- **Technology** tem a melhor margem (17.4%); **Furniture** tem a pior (2.5%)
- Descontos acima de 20% **destroem o lucro** — margem fica negativa (-10% a -48%)
- **Tables**, **Bookcases** e **Supplies** dão prejuízo — necessitam revisão de preço
- **Copiers** são o produto mais lucrativo ($55.6K, 37% de margem)
- **Texas** é o 4º maior estado em vendas mas perde $-25.7K — investigar descontos
- Vendas crescem ano a ano com pico sazonal em novembro-dezembro
- **Home Office** tem o maior ticket médio ($473) mas menor base de clientes

## 🛠️ Ferramentas Utilizadas

- **SQL** — consultas analíticas (GROUP BY, HAVING, CASE WHEN, subconsultas)
- **HTML/CSS + Chart.js** — dashboard interativo com 7 gráficos
- **Dataset** — [Sample Superstore (Kaggle, CC0)](https://www.kaggle.com/datasets/jacopoferretti/superstore-dataset) — 9.994 registros, 21 colunas

## 📁 Estrutura do Projeto

\`\`\`
├── README.md                          # Este arquivo
├── consultas_superstore.sql           # 8 consultas SQL documentadas
├── dashboard_vendas_superstore.html   # Dashboard interativo (abrir no navegador)
└── superstore.csv                     # Dataset original (9.994 registros)
\`\`\`

## 📈 Dashboard

O dashboard inclui:
- KPIs: Receita Total, Lucro Total, Clientes Únicos, Ticket Médio
- Gráfico de tendência mensal (2015–2018)
- Receita e lucro por categoria, região, sub-categoria e segmento
- Impacto do desconto no lucro
- Top 10 estados com destaque para os que dão prejuízo
- Insights embarcados em cada gráfico

Para visualizar, baixe o arquivo \`dashboard_vendas_superstore.html\` e abra no navegador.

## 👤 Autor

**ct-melo** — Estudante de Ciências de Dados, em transição de carreira para Data Analytics

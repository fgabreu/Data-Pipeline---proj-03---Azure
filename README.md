# Lab-03---Azure
Projeto Interno 03 Big Data - Azure (Blueshift Brasil)

Projeto Pocco Pamonhas

1.0 - REQUISITOS DO CLIENTE

Projeto de migração de várias cargas de trabalho que, atualmente, estão no Apache Nifi para o Azure Databricks. Além de migrar os fluxos de trabalho a POCCO quer aproveitar a oportunidade para estruturar seu Data Warehouse, conforme especificado abaixo. Você deverá desenvolver um algoritmo em Python ou PySpark no Azure Databricks consumindo um arquivo disponibilizado no Azure Blob Storage, ingerir esses dados no SQL Server e construir um dashboard seguindo as especificações detalhadas abaixo.

I - Especificação para construção dos dashboard em Power BI

VENDAS = quantidade de itens multiplicados pelo valor do item.
- O acumulado de vendas do último ano por Região e País. Ele gostaria de ter essa visão através de um Mapa Mundial diretamente no Relatório.
- Quantidade de vendas dos últimos 10 dias através de um gráfico de colunas.
- Quantidade de vendas e a Quantidade acumulada de vendas dos últimos 30 dias.
- Uma visão acumulada das vendas do último ano por Canal e País. De forma que seja possível ver a distribuição das vendas um determinado país por canal.

II - Especificação para reestruturação do Data Warehouse

Os relatórios desenvolvidos no Power BI deverão apontar para as seguintes tabelas: 
- Dimensão com as regiões.
- Dimensão com país.
- Dimensão com Canais de venda.
- Fato com as vendas


2.0 - SOLUÇÃO PROPOSTA

Arquitetura Proposta:

![ARQUITETURA3](https://user-images.githubusercontent.com/57818977/220207255-9b8d4946-97ad-4327-b022-aae433e78526.png)

Estruturação do Projeto:

![dicionario de dados](https://user-images.githubusercontent.com/57818977/220207458-341ef80e-5e5a-4d69-bad4-0e04b1f5ad36.png)

To do

Schemas:
- Criar um schema no SQL Server chamado STAGE_<SEU NOME>;
- Criar um schema no SQL Server chamado DW_<SEU NOME>;
- Desenvolver o ETL ou EL para fazer a primeira ingestão: do Blob para o SQL Server.
- Desenvolver uma PROCEDURE para popular as tabelas finais: do SQL Server(schema STAGE) para o SQL Server(schema DW).
- Desenvolver no Power BI as visões que atendam as necessidades apresentadas pela empresa.


III - RESULTADOS DO PROJETO

RESULTADO FINAL PIPELINE AZURE DATAFACTORY:





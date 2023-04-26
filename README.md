# Proj-03---Azure
Projeto 03 Big Data - Azure

1.0 - REQUISITOS DO CLIENTE

Projeto de migração de várias cargas de trabalho que, atualmente, estão no Apache Nifi para o Azure Databricks. Além de migrar os fluxos de trabalho a empresa quer aproveitar a oportunidade para estruturar seu Data Warehouse, conforme especificado abaixo. Deverá ser desenvolvido um algoritmo em Python ou PySpark no Azure Databricks consumindo um arquivo disponibilizado no Azure Blob Storage, ingerir esses dados no SQL Server e construir um dashboard seguindo as especificações detalhadas abaixo.


I - Especificação para reestruturação do Data Warehouse

Os relatórios desenvolvidos no Power BI deverão apontar para as seguintes tabelas: 
- Dimensão com as regiões.
- Dimensão com país.
- Dimensão com Canais de venda.
- Fato com as vendas

II - Especificação para construção dos dashboard em Power BI

VENDAS = quantidade de itens multiplicados pelo valor do item.
- O acumulado de vendas dos últimos 365 dias por Região e País. Ele gostaria de ter essa visão através de um Mapa Mundial diretamente no Relatório.
- Quantidade de vendas dos últimos 10 dias através de um gráfico de colunas.
- Quantidade de vendas e a Quantidade acumulada de vendas dos últimos 30 dias.
- Uma visão acumulada das vendas do último ano por Canal e País. De forma que seja possível ver a distribuição das vendas um determinado país por canal.

--------------------------------------------------------------------------------------------------------------------------------------------------------------

2.0 - SOLUÇÃO PROPOSTA

Arquitetura Proposta:

![ARQUITETURA3](https://user-images.githubusercontent.com/57818977/220207255-9b8d4946-97ad-4327-b022-aae433e78526.png)

Estruturação do Projeto:

![dicionario de dados](https://user-images.githubusercontent.com/57818977/220207458-341ef80e-5e5a-4d69-bad4-0e04b1f5ad36.png)

To do

Schemas:
- Criar um schema no SQL Server chamado STAGE_<SEU NOME>;
- Criar um schema no SQL Server chamado DW_<SEU NOME>;
- Desenvolver o ETL ou ELT para fazer a primeira ingestão: do Blob para o SQL Server.
- Desenvolver uma PROCEDURE para popular as tabelas finais: do SQL Server(schema STAGE) para o SQL Server(schema DW).
- Desenvolver no Power BI as visões que atendam as necessidades apresentadas pela empresa.


 -------------------------------------------------------------------------------------------------------------------------------------------------------------
  
3.0 - RESULTADOS DO PROJETO

  3.1 - Resultado Final Pipeline no Azure Datafactory:

![Pipeline-lab03](https://user-images.githubusercontent.com/57818977/220207934-9b0321f7-601e-4b10-bbd7-96a930e571d7.png)
  

  3.2 - Resultado da reestruturação do Data Warehouse (conforme Especificação I):
  
![DW](https://user-images.githubusercontent.com/57818977/220210060-b494f2a2-bbe4-426e-9b42-91deeabe9f11.png)
  
  3.3 - Dashboard em Power BI (conforme necessidades Especificação II):
  
  - Acumulado de vendas dos últimos 365 dias por Região e País, contendo um Mapa Mundial:
  
![acumulado ultimos 365dias](https://user-images.githubusercontent.com/57818977/220210780-c54a1558-fe19-4248-b298-31c9c42f3c7d.png)
  
  - Quantidade de vendas dos últimos 10 dias através de um gráfico de colunas:
 
![vendas 10 dias](https://user-images.githubusercontent.com/57818977/220211245-987b01f2-8de3-4f19-9e28-0c897852fec4.png)
  
  - Quantidade de vendas e a Quantidade acumulada de vendas dos últimos 30 dias.
  
![vendas 30 dias](https://user-images.githubusercontent.com/57818977/220210884-23e7c42b-a480-4a49-8e3b-f97caa581437.png)
  
 
 
  
  




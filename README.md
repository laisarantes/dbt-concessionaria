# Projeto de Engenharia de Dados - Concessionária

🚧 Status: Em desenvolvimento

Este projeto tem como objetivo simular um pipeline completo de Engenharia de Dados, do zero à camada analítica, utilizando tecnologias amplamente empregadas no mercado.

## Tecnologias
- Python
- Pandas
- Jupyter Notebook
- PostgreSQL
- dbt
- Apache Airflow (em implementação)
- Docker

## Sobre os dados

O banco de dados (schema, tabelas e relacionamentos) foi inteiramente projetado e criado por mim, simulando o cenário de uma concessionária de veículos (clientes, funcionários, lojas, fornecedores, veículos, vendas e pagamentos). Os dados armazenados são fictícios, gerados exclusivamente para fins de estudo e demonstração técnica.

## Estrutura do projeto

- **notebooks/** — análise exploratória dos dados (EDA), usada para entender a qualidade e a estrutura dos dados brutos antes de iniciar as transformações no dbt.
- **dbt/** — modelagem e transformação dos dados, organizada em camadas:
  - `staging/` — limpeza, padronização e tipagem dos dados brutos (1 modelo por tabela de origem).
  - `intermediate/` — junção de entidades relacionadas (ex: loja + endereço, veículo + modelo + marca) para enriquecer os dados antes da camada final.
  - `marts/` — modelo dimensional final, com dimensões (`dim_`) e fatos (`fct_`) prontos para consumo analítico.
- **tests** — testes de qualidade de dados (unicidade, valores nulos, integridade referencial e valores aceitos) aplicados em todas as camadas do dbt.

## Etapas do projeto
- ✔️ Análise exploratória dos dados (notebooks)
- ✔️ Modelagem do banco
- ✔️ Transformações com dbt (staging e intermediate)
- ✔️ Construção da camada de marts (dimensões e fatos)
- ✔️ Testes de qualidade de dados
- 🚧 Orquestração com Apache Airflow
- 🚧 Containerização com Docker

## Próximos passos

A próxima etapa do projeto é implementar a orquestração do pipeline com **Apache Airflow**, automatizando a execução das transformações dbt e a atualização periódica dos dados, além de empacotar todo o ambiente com **Docker** para facilitar a reprodutibilidade.

---

Projeto desenvolvido para fins de estudo e prática em Engenharia de Dados.
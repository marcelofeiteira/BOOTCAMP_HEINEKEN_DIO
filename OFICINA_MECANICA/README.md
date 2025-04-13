<img src="https://github.com/user-attachments/assets/7ef0925f-f96c-459a-9199-62b9b1b258b5" alt="HEIA AS-0eb5aa36" width="50">
Bootcamp Heineken DIO

## 📖 Sobre o Repositório
# 🛒 Projeto: Banco de Dados para Oficina Mecanica 

## 📍 Descrição

Este repositório contém a modelagem lógica e física de um banco de dados relacional voltado para o gerenciamento de uma oficina mecânica. O objetivo é garantir o controle completo das informações relacionadas aos clientes, veículos, mecânicos, ordens de serviço, peças, estoque, e serviços realizados.

A modelagem foi feita com foco em eficiência, normalização e integridade dos dados, utilizando MySQL como SGBD.

## 🧩 Estrutura e Entidades Principais
### 🔹 Clientes (`tb_cliente`)
Armazena informações de clientes (Pessoa Física ou Jurídica).
Garantia de integridade com a constraint `unique_doc_client` para evitar duplicidade de CPF e CNPJ.

### 🔹 Equipes (`tb_equipe`)
Registra as equipes responsáveis pelos atendimentos na oficina.

### 🔹 Mecânicos (`tb_mecanico`)
Contém os dados dos mecânicos, como nome, especialidade e equipe a qual pertencem.

### 🔹 Veículos (`tb_veiculo`)
Armazena os dados dos veículos que são atendidos pela oficina, como placa, modelo e ano.

### 🔹 Ordens de Serviço (`tb_ordem_servico`)
Registra as ordens de serviço abertas para cada veículo, incluindo status, valor total e data de emissão.

### 🔹 Serviços (`tb_servico`)
Armazena os serviços realizados, como descrição e valor da mão de obra.

### 🔹 Peças (`tb_peca`)
Controla as peças utilizadas nas manutenções, incluindo valores de custo e repasse.

### 🔹 Estoque de Peças (`tb_estoque`)
Controle do estoque das peças, com o local de armazenagem e quantidade disponível.

### 🔹 Associação de Serviços às Ordens (`tb_servico_os`)
Relaciona serviços a ordens de serviço específicas, com controle de quantidade e subtotal.

### 🔹 Associação de Peças às Ordens (`tb_peca_os`)
Relaciona peças a ordens de serviço específicas, com controle de quantidade e subtotal.

## 📌 Diagrama EER

![Diagrama EER](https://raw.githubusercontent.com/marcelofeiteira/BOOTCAMP_HEINEKEN_DIO/main/OFICINA_MECANICA/EER/DiagramaOficinaDio.png)


## 📂 Dados Fictícios para Inserção
Foram utilizados arquivos .csv para realizar a importação dos dados nas tabelas utilizando o comando `LOAD DATA` no MySQL.

📁 **[OFICINA_MECANICA/arquivos csv/tb_cliente.csv]**

## 🔧 Como Executar o Projeto

### 1️⃣ Criação das Tabelas
O script SQL para criação das tabelas e instruções para importação de dados está disponível abaixo:

- **Script para Criação das Tabelas**: 

- [create_tables.sql](querys/CREATE%20OFICINA.sql)

### 2️⃣ Carregamento dos Dados
Utilize o comando `LOAD DATA INFILE` com os arquivos .csv localizados na pasta `/arquivos csv` para popular as tabelas.

💾 **Exemplo de inserção com LOAD DATA**:

```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_cliente.csv'
INTO TABLE tb_cliente
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nome, tipo_cliente, cpf, cnpj, endereco, email, telefone);
```

## 🧠 Resumo da Estrutura

| Entidade           | Atributos Principais                              | Relacionamentos                                               |
|--------------------|---------------------------------------------------|---------------------------------------------------------------|
| Cliente            | id_cliente, cpf, cnpj, tipo_cliente               | 1 cliente → N veículos / N ordens de serviço                  |
| Equipe             | id_equipe, nome_equipe                            | 1 equipe → N mecânicos / N veículos                           |
| Mecânico           | id_mecanico, nome, especialidade                  | 1 mecânico → N ordens de serviço                              |
| Veículo            | id_veiculo, placa, modelo, cor, ano              | 1 veículo → N ordens de serviço                               |
| Ordem de Serviço   | id_os, id_veiculo, data_emissao, valor_total      | 1 ordem de serviço → N serviços / N peças                     |
| Serviço            | id_servico, descricao, valor_mao_obra             | N serviços → N ordens de serviço                              |
| Peça               | id_peca, descricao, preco_real, preco_repasse     | N peças → N ordens de serviço                                 |
| Estoque            | id_estoque, quantidade, preco_real, preco_repasse | N peças → N estoques                                          |


### 🧩 Foco no Desafio

**Objetivo:**

Pergunta respondida: Quais clientes têm veículos registrados e quais são esses veículos?

*Recuperação simples com SELECT*

```sql 
SELECT id_cliente, nome, tipo_cliente, placa, modelo, cor
FROM tb_cliente
JOIN tb_veiculo ON tb_cliente.id_cliente = tb_veiculo.id_cliente;
```

*Filtro de dados com WHERE*

Pergunta respondida: Quais são os veículos de cor preta e com ano superior a 2010?

```sql 
SELECT id_veiculo, placa, modelo, cor, ano
FROM tb_veiculo
WHERE cor = 'preto' AND ano > 2010;
```

*Junção de tabelas com múltiplas condições*

Pergunta respondida: Quais clientes têm ordens de serviço registradas e qual é o status dessas ordens?

```sql
SELECT c.id_cliente, c.nome, v.placa, os.id_os, os.status
FROM tb_cliente c
JOIN tb_veiculo v ON c.id_cliente = v.id_cliente
JOIN tb_ordem_servico os ON v.id_veiculo = os.id_veiculo
ORDER BY c.id_cliente, os.id_os;

```

*Uso de GROUP BY e HAVING* 

Pergunta respondida: Quais equipes realizaram mais de 5 ordens de serviço?

```sql
SELECT e.id_equipe, e.nome_equipe, COUNT(os.id_os) AS quantidade_ordens
FROM tb_equipe e
JOIN tb_veiculo v ON e.id_equipe = v.id_equipe
JOIN tb_ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY e.id_equipe
HAVING COUNT(os.id_os) > 5;
```

✅ Conclusões e Benefícios
🔐 Integridade referencial com uso extensivo de chaves estrangeiras.

🔄 Controle completo de ordens de serviço, peças e estoque.

🧾 Acompanhamento de status de ordens de serviço e entregas.

🚗 Relatório completo de veículos e clientes atendidos.

👨‍💻 Autor
Marcelo Feiteira
📅 Abril/2025
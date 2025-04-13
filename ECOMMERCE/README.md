<img src="https://github.com/user-attachments/assets/7ef0925f-f96c-459a-9199-62b9b1b258b5" alt="HEIA AS-0eb5aa36" width="50">
Bootcamp Heineken DIO

## 📖 Sobre o Repositório
# 🛒 Projeto: Banco de Dados para E-commerce

## 📍 Descrição

Este repositório contém a modelagem lógica e física de um banco de dados relacional voltado para um sistema de **e-commerce**. O objetivo é garantir o gerenciamento completo do fluxo comercial, incluindo **clientes**, **produtos**, **pedidos**, **estoque**, **fornecedores**, **entregas** e **pagamentos**.

A modelagem foi feita com foco em **eficiência, normalização e integridade dos dados**, utilizando **MySQL** como SGBD.

---

## 🧩 Estrutura e Entidades Principais

### 🔹 Clientes (`tb_clients`)
- Suporte para Pessoa Física (CPF) ou Jurídica (CNPJ)
- Dados como nome, endereço e tipo de cliente
- Constraint para evitar duplicidade de documentos (CPF/CNPJ)

### 🔹 Produtos (`tb_products`)
- Produtos classificados por categoria e se são para crianças
- Avaliações, tamanhos e vinculação com vendedores e fornecedores

### 🔹 Pedidos (`tb_orders`)
- Ligação direta com clientes
- Status, descrição e valor de envio
- Produtos vinculados via tabela associativa (`tb_product_order`)

### 🔹 Pagamentos (`tb_payments`)
- Múltiplos métodos por cliente
- Status e limite disponível
- Ligação com pedidos

### 🔹 Entregas (`tb_delivery`)
- Acompanhamento do pedido
- Código de rastreio e previsão de entrega

### 🔹 Fornecedores (`tb_supplier`) e Vendedores (`tb_seller`)
- Relacionados a produtos
- Com dados de CNPJ ou CPF e contato

### 🔹 Estoque (`tb_products_storage`)
- Controle da quantidade e local de armazenagem
- Associado a produtos e localização física

---

## 📌 Diagrama EER

![Diagrama EER](https://raw.githubusercontent.com/marcelofeiteira/BOOTCAMP_HEINEKEN_DIO/main/ECOMMERCE/EER/DiagramaEcommerceDio.png)

## 📂 Dados Ficticios para Inserção

Foram utilizados arquivos `.csv` para realizar a importação dos dados nas tabelas utilizando o comando `LOAD DATA`.

📁 **[EER_ECOMMERCE/arquivos csv/tb_clients.csv]**

🔧 Como Executar o Projeto
1️⃣ Criação das Tabelas
Script SQL

O script com a criação das tabelas e instruções para importação de dados está disponível abaixo:

- [create_tables.sql](querys/CREATE%20ECOMMERCE.sql)

2️⃣ Carregamento dos Dados
Utilize o comando LOAD DATA INFILE com os arquivos .csv localizados na pasta /dados para popular as tabelas.


### 💾 Exemplo de inserção com `LOAD DATA`:

```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_clients.csv'
INTO TABLE tb_clients
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fname, minit, lname, tipo_cliente, cpf, cnpj, address);
```

3️⃣ Exemplo Relacionamentos
Um cliente → pode ter vários pedidos.

Um pedido → pode conter vários produtos.

Um produto → pode estar vinculado a vários fornecedores e vendedores.

Um pagamento → está associado a um pedido.

Uma entrega → está vinculada a um pedido.

Resumo da Estrutura
## 🧠 Resumo da Estrutura

| Entidade    | Atributos Principais                         | Relacionamentos                                                  |
|-------------|----------------------------------------------|------------------------------------------------------------------|
| Cliente     | id_client, cpf, cnpj, tipo_cliente           | 1 cliente → N pedidos / N métodos de pagamento                   |
| Produto     | id_product, category, assessment             | N produtos → N pedidos / N fornecedores / N vendedores           |
| Pedido      | id_order, status, sendvalue                  | 1 pedido → N produtos / 1 entrega / 1 pagamento                  |
| Fornecedor  | id_supplier, cnpj, contato                   | 1 fornecedor → N produtos                                        |
| Vendedor    | id_seller, cpf/cnpj, location                | 1 vendedor → N produtos                                          |
| Estoque     | id_prod_storage, quantity, location          | N produtos ↔ N locais de armazenamento                           |
| Pagamento   | id_payment, type, status, limitavailable     | 1 pagamento → 1 pedido                                           |
| Entrega     | id_delivery, tracking_code, status           | 1 entrega → 1 pedido                                             |

✅ Conclusões e Benefícios
🔐 Integridade referencial com uso extensivo de chaves estrangeiras

🔄 Suporte a vendas por múltiplos vendedores

🧾 Registro de pagamentos múltiplos e flexíveis

🚚 Controle completo de entregas e rastreamento

🔍 Estrutura robusta para análises futuras com queries SQL e BI

---

### 🧩 Foco no Desafio

**Objetivo:**
> Refine o modelo apresentado acrescentando os seguintes pontos:

#### 📌 **Cliente PJ e PF** – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
    - O modelo possui campo com tipo de cliente e atributos distintos para CPF e CNPJ.
  
#### 📌 **Pagamento** – Pode ter cadastrado mais de uma forma de pagamento;
    - O modelo possui tabela de pagamentos com atributo de tipo de pagamento.
  
#### 📌 **Entrega** – Possui status e código de rastreio;
    - A estrutura de tabela de entrega possui os atributos `status_delivery` e `tracking_code`.

#### 📌 Quantos pedidos foram feitos por cada cliente?
> **R:** Em média 1.6 pedidos por cliente.

```sql
SELECT AVG(QTD_PEDIDOS) 
FROM (
    SELECT 
        CONCAT(B.fname, ' ', lname) AS NOME_CLIENTE, 
        COUNT(0) AS QTD_PEDIDOS
    FROM tb_orders AS A
    INNER JOIN tb_clients AS B ON A.id_order_client = B.id_client
    GROUP BY 1
    ORDER BY QTD_PEDIDOS DESC
) AS TEMP;
```

---

#### 📌 Algum vendedor também é fornecedor?
> **R:** Sim, 4 deles também são fornecedores — representando 20% dos vendedores.

```sql
SELECT DISTINCT id_seller 
FROM tb_seller AS A
INNER JOIN tb_supplier AS B ON A.cnpj = B.cnpj;
```

---

#### 📌 Relação de produtos, fornecedores e estoques
> **R:** Query que traz todos os produtos, seus fornecedores, a quantidade fornecida, o estoque e o local de armazenamento.

```sql
SELECT 
    P.id_product,
    P.pname AS product_name,
    S.id_supplier,
    S.socialname AS supplier_name,
    PS.quantity AS quantity_supplied,
    ST.id_prod_storage,
    ST.storage_location,
    ST.quantity AS quantity_in_storage
FROM tb_products AS P
INNER JOIN tb_products_supplier AS PS ON P.id_product = PS.id_pproduct
INNER JOIN tb_supplier AS S ON PS.id_psupplier = S.id_supplier
LEFT JOIN tb_storage_location AS SL ON P.id_product = SL.id_lproduct
LEFT JOIN tb_products_storage AS ST ON SL.id_lstorage = ST.id_prod_storage;
```

---

#### 📌 Relação de nomes dos fornecedores e nomes dos produtos
> **R:** Lista fornecedores e os produtos fornecidos.

```sql
SELECT 
    S.socialname AS fornecedor,
    P.pname AS produto
FROM tb_products_supplier PS
JOIN tb_supplier S ON PS.id_psupplier = S.id_supplier
JOIN tb_products P ON PS.id_pproduct = P.id_product;
```


👨‍💻 Autor
Marcelo Feiteira
📅 Abril/2025
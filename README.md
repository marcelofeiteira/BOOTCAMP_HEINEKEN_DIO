<img src="https://github.com/user-attachments/assets/7ef0925f-f96c-459a-9199-62b9b1b258b5" alt="HEIA AS-0eb5aa36" width="50">
Bootcamp Heineken DIO

## 📖 Sobre o Repositório

Este repositório contem desafios relacionados ao BootCamp DIO - Heinken - Inteligência Artificial Aplicada a Dados com Copilot.

# 🛒 E-COMMERCE (Modelo EER)

🏗️ Como o Modelo Está Estruturado  

O modelo foi projetado para atender às principais necessidades de um e-commerce, incluindo:  

- **Cadastro de Clientes**: Suporte para **Pessoa Física (CPF)** e **Pessoa Jurídica (CNPJ)**.  
- **Gerenciamento de Pedidos**: Cada cliente pode realizar múltiplos pedidos, acompanhando status e detalhes da entrega.  
- **Catálogo de Produtos**: Produtos podem ser vendidos por terceiros (**vendedores**) e são fornecidos por empresas específicas (**fornecedores**).  
- **Pagamentos**: O sistema aceita diversas formas de pagamento, como **cartão, boleto e Pix**.  
- **Entrega**: Cada pedido tem um **código de rastreamento** e um **status atualizado** para acompanhamento.  

## 📂 Estrutura do Banco de Dados  

O banco de dados é composto por diversas entidades, organizadas da seguinte forma:  

- **Cliente**
- **Endereco**
- **Pedido**
- **Pagamento**
- **Entrega**
- **Produto**
- **Estoque**
- **Fornecedor**
- **Vendedor**

## 📊 Diagrama EER  

A estrutura do banco de dados é representada pelo diagrama abaixo, que detalha **entidades, atributos e seus relacionamentos**:  

![EER E-COMMERCE BOOTCAMP DIO_pages-to-jpg-0001](https://github.com/user-attachments/assets/5814973c-9196-4af1-b7d4-80d77b49b1f1)

Arquivo em PDF [📄 EER E-COMMERCE BOOTCAMP DIO.pdf](https://github.com/marcelofeiteira/BOOTCAMP_HEINEKEN_DIO/blob/main/EER_ECOMMERCE/EER%20E-COMMERCE%20BOOTCAMP%20DIO.pdf)

# 🛠️ OFICINA (Modelo EER)

🏗️ Como o Modelo Está Estruturado  

O modelo foi projetado para atender às necessidades de uma oficina mecânica, incluindo:

- **Cadastro de Clientes:** Clientes podem registrar veículos no sistema.
- **Gerenciamento de Ordens de Serviço:** Cada OS contém serviços e peças associadas, bem como status e valores.
- **Equipe de Mecânicos:** Mecânicos são organizados em equipes responsáveis pelos reparos.
- **Serviços e Peças:** Cada OS pode incluir múltiplos serviços e peças, controladas por um sistema de estoque.
- **Controle de Estoque:** Garante a disponibilidade de peças para os reparos.

## 📂 Estrutura do Banco de Dados  

O banco de dados é composto por diversas entidades, organizadas da seguinte forma:  

- **Cliente**
- **Veículo**
- **Equipe**
- **Mecânico*
- **Ordem de Serviço (OS)**
- **Serviço**
- **Peça**
- **Estoque**
- **OS_Serviço**
- **OS_Peça**

## 📊 Diagrama EER  

A estrutura do banco de dados é representada pelo diagrama abaixo, que detalha **entidades, atributos e seus relacionamentos**:  

![EER OFICINA BOOTCAMP DIO_pages-to-jpg-0001](https://github.com/user-attachments/assets/02ef90bf-b752-4bdd-873f-699d9d6acf3f)

Arquivo em PDF [📄 EER OFICINA BOOTCAMP DIO.pdf](https://github.com/marcelofeiteira/BOOTCAMP_HEINEKEN_DIO/blob/main/EER_OFICINA/EER%20OFICINA%20BOOTCAMP%20DIO.pdf)

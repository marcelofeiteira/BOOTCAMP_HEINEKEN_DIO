# 📦 Bootcamp Heineken - E-commerce (Modelo EER)

## 📖 Sobre o Projeto  

Este repositório apresenta o **Modelo Entidade-Relacionamento Estendido (EER)** para um sistema de e-commerce. O objetivo é estruturar um banco de dados eficiente para gerenciar a venda de produtos em uma plataforma online, contemplando diferentes **vendedores, clientes e fornecedores**.  

## 🏗️ Como o Modelo Está Estruturado  

O modelo foi projetado para atender às principais necessidades de um e-commerce, incluindo:  

- **Cadastro de Clientes**: Suporte para **Pessoa Física (CPF)** e **Pessoa Jurídica (CNPJ)**.  
- **Gerenciamento de Pedidos**: Cada cliente pode realizar múltiplos pedidos, acompanhando status e detalhes da entrega.  
- **Catálogo de Produtos**: Produtos podem ser vendidos por terceiros (**vendedores**) e são fornecidos por empresas específicas (**fornecedores**).  
- **Pagamentos**: O sistema aceita diversas formas de pagamento, como **cartão, boleto e Pix**.  
- **Entrega**: Cada pedido tem um **código de rastreamento** e um **status atualizado** para acompanhamento.  

## 📊 Diagrama EER  

A estrutura do banco de dados é representada pelo diagrama abaixo, que detalha **entidades, atributos e seus relacionamentos**:  

![EER E-COMMERCE BOOTCAMP DIO_pages-to-jpg-0001](https://github.com/user-attachments/assets/5814973c-9196-4af1-b7d4-80d77b49b1f1)

## 📂 Estrutura do Banco de Dados  


O banco de dados é composto por diversas entidades, organizadas da seguinte forma:  

- **Cliente**  
- **Endereço**  
- **Pedido**  
- **Produto**  
- **Fornecedor**  
- **Vendedor**  
- **Pagamento**  
- **Entrega**  
- **ItemPedido** *(tabela intermediária para a relação N:M entre Pedido e Produto)*  

Para mais detalhes, consulte o arquivo [`diagrama_eer.md`](diagrama_eer.md).  

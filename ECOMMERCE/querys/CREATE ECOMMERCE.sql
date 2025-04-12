
CREATE TABLE tb_clients (
    id_client BIGINT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(10),
    minit CHAR(3),
    lname VARCHAR(20),
    tipo_cliente ENUM('PF','PJ'),
    cpf CHAR(11),
    cnpj CHAR(15),
    address VARCHAR(50),
    CONSTRAINT unique_doc_client UNIQUE(cpf, cnpj)
);

CREATE TABLE tb_products (
    id_product BIGINT AUTO_INCREMENT PRIMARY KEY,
    pname VARCHAR(10),
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos'),
    assessment FLOAT,
    size VARCHAR(50)
);

CREATE TABLE tb_payments (
    id_client BIGINT,
    id_payment BIGINT,
    id_order BIGINT,
    type_payment ENUM('Boleto', 'Cartao', 'Dois Cartoes'),
    status_payment ENUM('Pago','Aguardando'),
    limitavailable FLOAT,
    PRIMARY KEY (id_client, id_payment),
    CONSTRAINT fk_payments_order FOREIGN KEY (id_order) REFERENCES tb_orders(id_order) 
);

CREATE TABLE tb_orders (
    id_order BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_order_client BIGINT,
    order_status ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderdescription VARCHAR(255),
    sendvalue FLOAT DEFAULT 10,
    paymentcash BOOL DEFAULT FALSE,
    CONSTRAINT fk_order_client FOREIGN KEY (id_order_client) REFERENCES tb_clients(id_client)
);

CREATE TABLE tb_products_storage (
    id_prod_storage BIGINT AUTO_INCREMENT PRIMARY KEY,
    storage_location VARCHAR(255),
    quantity INT DEFAULT 0
);

CREATE TABLE tb_supplier (
    id_supplier BIGINT AUTO_INCREMENT PRIMARY KEY,
    socialname VARCHAR(255) NOT NULL,
    cnpj CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(cnpj)
);

CREATE TABLE tb_seller (
    id_seller BIGINT AUTO_INCREMENT PRIMARY KEY,
    socialname VARCHAR(255) NOT NULL,
    abstname VARCHAR(255) NOT NULL,
    cnpj CHAR(15),
    cpf CHAR(15),
    location VARCHAR(255),
    CONTACT CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE(cnpj),
    CONSTRAINT unique_cpf_seller UNIQUE(cpf)
);

CREATE TABLE tb_product_seller (
    id_pseller BIGINT,
    id_pproduct BIGINT,
    prodquantity INT DEFAULT 1,
    PRIMARY KEY (id_pseller, id_pproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (id_pseller) REFERENCES tb_seller(id_seller),
    CONSTRAINT fk_product_product FOREIGN KEY (id_pproduct) REFERENCES tb_products(id_product)
);

CREATE TABLE tb_product_order (
    id_poproduct BIGINT,
    id_poorder BIGINT,
    poquantity INT DEFAULT 1,
    postatus ENUM('Disponivel', 'Sem Estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (id_poproduct, id_poorder),
    CONSTRAINT fk_product_order FOREIGN KEY (id_poproduct) REFERENCES tb_products(id_product),
    CONSTRAINT fk_order_product FOREIGN KEY (id_poorder) REFERENCES tb_orders(id_order)
);

CREATE TABLE tb_storage_location (
    id_lproduct BIGINT,
    id_lstorage BIGINT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_lproduct, id_lstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (id_lproduct) REFERENCES tb_products(id_product),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (id_lstorage) REFERENCES tb_products_storage(id_prod_storage)
);

CREATE TABLE tb_products_supplier (
    id_psupplier BIGINT,
    id_pproduct BIGINT,
    quantity INT NOT NULL,
    PRIMARY KEY (id_psupplier, id_pproduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (id_psupplier) REFERENCES tb_supplier(id_supplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (id_pproduct) REFERENCES tb_products(id_product)
);

CREATE TABLE tb_delivery (
    id_delivery BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_order BIGINT,
    tracking_code VARCHAR(20) UNIQUE,
    status_delivery ENUM('Em transporte', 'Entregue', 'Aguardando envio', 'Cancelado') DEFAULT 'Aguardando envio',
    estimated_delivery DATE,
    actual_delivery DATE,
    CONSTRAINT fk_delivery_order FOREIGN KEY (id_order) REFERENCES tb_orders(id_order)
);

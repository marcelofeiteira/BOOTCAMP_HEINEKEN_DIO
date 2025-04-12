LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_clients.csv'
INTO TABLE tb_clients
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fname, minit, lname, tipo_cliente, cpf, cnpj, address);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_products.csv'
INTO TABLE tb_products
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(pname, classification_kids, category, assessment, size);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_products_storage.csv'
INTO TABLE tb_products_storage
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(storage_location, quantity);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_supplier.csv'
INTO TABLE tb_supplier
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(socialname, cnpj, contact);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_seller.csv'
INTO TABLE tb_seller
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(socialname, abstname, cnpj, cpf, location, contact);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_payments.csv'
INTO TABLE tb_payments
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_client, id_payment, id_order, type_payment, status_payment, limitavailable);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_orders.csv'
INTO TABLE tb_orders
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_order, id_order_client, order_status, orderdescription, sendvalue, paymentcash);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_product_seller.csv'
INTO TABLE tb_product_seller
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_pseller, id_pproduct, prodquantity);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_product_order.csv'
INTO TABLE tb_product_order
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_poproduct, id_poorder, poquantity, postatus);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_storage_location.csv'
INTO TABLE tb_storage_location
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_lproduct, id_lstorage, location);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_products_supplier.csv'
INTO TABLE tb_products_supplier
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_psupplier, id_pproduct, quantity);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_delivery.csv'
INTO TABLE tb_delivery
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_order, tracking_code, status_delivery, estimated_delivery, @actual_delivery)
SET actual_delivery = NULLIF(@actual_delivery, 'NULL');

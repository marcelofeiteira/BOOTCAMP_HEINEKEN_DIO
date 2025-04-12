-- QUANTOS PEDIDOS FORAM FEITOS POR CADA CLIENTE? R: Em média 1.6 pedidos por cliente.

SELECT AVG(QTD_PEDIDOS) 
FROM (
SELECT 
	CONCAT(B.fname,' ',lname) AS NOME_CLIENTE, 
	COUNT(0) AS QTD_PEDIDOS
FROM tb_orders AS A
INNER JOIN tb_clients AS B ON A.id_order_client = B.id_client
GROUP BY  1
ORDER BY QTD_PEDIDOS DESC
) AS TEMP;

-- ALGUM VENDEDOR TAMBÉM É FORNECEDOR? R: Sim, 4 deles também são fornecedor. Representando 20% dos vendedores. 

SELECT 
	DISTINCT id_seller 
FROM tb_seller AS A
INNER JOIN tb_supplier AS B ON A.cnpj = B.cnpj
;


-- RELAÇÃO DE PRODUTOS FORNECEDORES E ESTOQUE R: Query com todos os produtos, seus fornecedores, a quantidade fornecida, o estoque e o local de armazenamento.

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
INNER JOIN tb_supplier AS S ON ps.id_psupplier = S.id_supplier
LEFT JOIN tb_storage_location AS SL ON P.id_product = SL.id_lproduct
LEFT JOIN tb_products_storage AS ST ON SL.id_lstorage = ST.id_prod_storage;

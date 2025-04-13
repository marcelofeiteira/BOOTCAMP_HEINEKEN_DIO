
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_cliente.csv'
INTO TABLE tb_cliente
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nome, tipo_cliente, cpf, cnpj, endereco, email, telefone);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_equipe.csv'
INTO TABLE tb_equipe
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nome_equipe);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_mecanico.csv'
INTO TABLE tb_mecanico
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_equipe, nome, especialidade, telefone);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_veiculo.csv'
INTO TABLE tb_veiculo
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_cliente, id_equipe, placa, modelo, ano, cor);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_ordem_servico.csv'
INTO TABLE tb_ordem_servico
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_veiculo, data_emissao, data_conclusao, status, valor_total);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_servico.csv'
INTO TABLE tb_servico
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(descricao, valor_mao_obra);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_servico_os.csv'
INTO TABLE tb_servico_os
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_servico, id_os, quantidade, subtotal);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_peca.csv'
INTO TABLE tb_peca
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(descricao, preco_real, preco_repasse);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_estoque.csv'
INTO TABLE tb_estoque
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_peca, quantidade, preco_real, preco_repasse);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/tb_peca_os.csv'
INTO TABLE tb_peca_os
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_os, id_peca, quantidade, subtotal);

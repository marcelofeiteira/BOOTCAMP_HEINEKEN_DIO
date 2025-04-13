CREATE DATABASE db_oficina;
USE db_oficina;

CREATE TABLE tb_equipe (
    id_equipe BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_equipe VARCHAR(255)
);

CREATE TABLE tb_cliente (
    id_cliente BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    tipo_cliente ENUM('PF','PJ'),
    cpf CHAR(11),
    cnpj CHAR(15),
    endereco VARCHAR(50),
    email VARCHAR(255),
    telefone CHAR(11) NOT NULL,
    CONSTRAINT unique_doc_client UNIQUE(cpf, cnpj)
);

CREATE TABLE tb_veiculo (
    id_veiculo BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_cliente BIGINT,
    id_equipe BIGINT,
    placa CHAR(17) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(45) NOT NULL,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente),
    CONSTRAINT fk_veiculo_equipe FOREIGN KEY (id_equipe) REFERENCES tb_equipe(id_equipe)
);

CREATE TABLE tb_mecanico (
    id_mecanico BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_equipe BIGINT,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(45),
    telefone CHAR(11) NOT NULL,
    CONSTRAINT fk_mecanico_equipe FOREIGN KEY (id_equipe) REFERENCES tb_equipe(id_equipe)
);

CREATE TABLE tb_ordem_servico (
    id_os BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo BIGINT NOT NULL,
    data_emissao DATE DEFAULT (CURRENT_DATE),
    data_conclusao DATE DEFAULT NULL,
    status ENUM('aberta', 'em andamento', 'concluida', 'cancelada'),
    valor_total FLOAT DEFAULT 0,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (id_veiculo) REFERENCES tb_veiculo(id_veiculo)
);

CREATE TABLE tb_servico (
    id_servico BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor_mao_obra FLOAT
);

CREATE TABLE tb_servico_os (
    id_servico BIGINT,
    id_os BIGINT,
    quantidade INT DEFAULT 0,
    subtotal FLOAT DEFAULT 0,
    PRIMARY KEY (id_servico, id_os),
    CONSTRAINT fk_servico_os_servico FOREIGN KEY (id_servico) REFERENCES tb_servico(id_servico),
    CONSTRAINT fk_servico_os_os FOREIGN KEY (id_os) REFERENCES tb_ordem_servico(id_os)
);

CREATE TABLE tb_peca (
    id_peca BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL,
    preco_real FLOAT,
    preco_repasse FLOAT
);

CREATE TABLE tb_estoque (
    id_estoque BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_peca BIGINT NOT NULL,
    quantidade BIGINT,
    preco_real FLOAT,
    preco_repasse FLOAT,
    CONSTRAINT fk_estoque_peca FOREIGN KEY (id_peca) REFERENCES tb_peca(id_peca)
);

CREATE TABLE tb_peca_os (
    id_os BIGINT,
    id_peca BIGINT,
    quantidade INT DEFAULT 1,
    subtotal FLOAT,
    PRIMARY KEY (id_os, id_peca),
    CONSTRAINT fk_peca_os_os FOREIGN KEY (id_os) REFERENCES tb_ordem_servico(id_os),
    CONSTRAINT fk_peca_os_peca FOREIGN KEY (id_peca) REFERENCES tb_peca(id_peca)
);

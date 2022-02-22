/*
	14 DE FEVEREIRO DE 2022
    ESCOLA MENTORAMA - CURSO SQL
    ALUNO: GUSTAVO DUARTE E SILVA
    PROFESSOR: FELIPPE FELISOLA CASO
*/

/*
	PROJETO FINAL - CURSO SQL - MODULO 17/17
*/

-- CRIANDO O BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS enila_frigus;

-- SELECIONANDO O BANCO DE DADOS
USE enila_frigus;

-- CRIANDO AS TABELAS 

-- REGIOES DO BRASIL
CREATE TABLE IF NOT EXISTS regioes(
	id_regiao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    regiao VARCHAR(255) NOT NULL,
    sigla VARCHAR(2) NOT NULL UNIQUE
) COMMENT "Tabela armazena todos os estados do brasil";

-- CRIANDO A TABELA VENDEDORES
CREATE TABLE IF NOT EXISTS vendedores(
	id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_regiao INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
) COMMENT "Tabela armazena todos os vendedores da empresa";

CREATE TABLE IF NOT EXISTS clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_regiao INT NOT NULL,
    cliente VARCHAR(255) NOT NULL,
    segmento VARCHAR(255) NOT NULL,
    ativo BOOL NOT NULL,
    FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
) COMMENT "Tabela que armazena todos os clientes da empresa";

CREATE TABLE IF NOT EXISTS fornecedores(
	id_fornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_regiao INT NOT NULL,
    fornecedor VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
	FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
) COMMENT "Tabela que armazena os fornecedores para empresa";

CREATE TABLE IF NOT EXISTS produtos(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    produto VARCHAR(255) NOT NULL,
    unidade VARCHAR(2) NOT NULL,
    preco_venda NUMERIC(10,2) NOT NULL,
    ultima_data_compra DATE NOT NULL,
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
) COMMENT "Tabela que armazena os produtos para a venda ";

CREATE TABLE IF NOT EXISTS pagamentos(
	id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento VARCHAR(255) NOT NULL,
    banco VARCHAR(255) NOT NULL,
    data_pagamento DATE NOT NULL
) COMMENT "Tabela que armazena a forma de pagamento realizada pelo cliente";

CREATE TABLE IF NOT EXISTS vendas(
	id_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pagamento INT NOT NULL,
    id_produto INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_cliente INT NOT NULL,
    quantidade INT NOT NULL,
    valor_total NUMERIC (10,2) NOT NULL,
    FOREIGN KEY (id_pagamento) REFERENCES pagamentos(id_pagamento),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
) COMMENT "Tabela que armazena a transação de venda realizada pelo cliente";


/*
	INSERINDO DADOS NAS TABELAS
*/

-- REGIAO(ESTADOS)
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Acre','AC');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Alagoas','AL');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Amapá','AP');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Amazonas','AM');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Bahia','BA');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Ceará','CE');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Espírito Santo','ES');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Goiás','GO');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Maranhão','MA');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Mato Grosso','MT');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Mato Grosso do Sul','MS');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Minas Gerais','MG');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Pará','PA');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Paraíba','PB');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Paraná','PR');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Pernambuco','PE');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Piauí','PI');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Rio de Janeiro','RJ');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Rio Grande do Norte','RN');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Rio Grande do Sul','RS');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Rondônia','RO');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Roraima','RR');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Santa Catarina','SC');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'São Paulo','SP');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Sergipe','SE');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Tocantins','TO');
INSERT INTO enila_frigus.regioes (id_regiao, regiao, sigla) VALUES (DEFAULT, 'Distrito Federal','DF');

-- VENDEDORES
INSERT INTO enila_frigus.vendedores(id_vendedor, id_regiao, nome, sobrenome, email) VALUES (DEFAULT, 10, 'Gustavo', 'Duarte', 'gustavo.duarte@enilafrigus.com.br');
INSERT INTO enila_frigus.vendedores(id_vendedor, id_regiao, nome, sobrenome, email) VALUES (DEFAULT, 10, 'Aline', 'Santos', 'aline.santos@enilafrigus.com.br');
INSERT INTO enila_frigus.vendedores(id_vendedor, id_regiao, nome, sobrenome, email) VALUES (DEFAULT, 10, 'Adelson', 'Silva', 'adelson.silva@enilafrigus.com.br');
INSERT INTO enila_frigus.vendedores(id_vendedor, id_regiao, nome, sobrenome, email) VALUES (DEFAULT, 10, 'Helder', 'Oliveira', 'helder.oliveira@enilafrigus.com.br');
INSERT INTO enila_frigus.vendedores(id_vendedor, id_regiao, nome, sobrenome, email) VALUES (DEFAULT, 10, 'Flavia', 'Melo', 'flavia.melo@enilafrigus.com.br');
INSERT INTO enila_frigus.vendedores(id_vendedor, id_regiao, nome, sobrenome, email) VALUES (DEFAULT, 10, 'Isabella', 'Medeiros', 'isabella.medeiros@enilafrigus.com.br');

-- CLIENTES
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 10, 'Sorveteria Solar', 'Sorvetes', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 12, 'Açai da dona rosa', 'Acai', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 10, 'SM Comper', 'Supermercado', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 10, 'SM Solar da Chapada', 'Supermercado', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 10, 'Tatavo Acai', 'Acai', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 2, 'Sorvetao do bao', 'Sorvetes', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 1, 'Frigo Norte', 'Frigorifico', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 1, 'Compre Mais', 'Supermercado', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 5, 'Dona Nila Acai', 'Acai', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 7, 'Gostinho Gostoso', 'Sorvetes', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 8, 'Casa do Pao', 'Padaria', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 9, 'Pao & Cia', 'Padaria', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 9, 'Padaria Italia', 'Padaria', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 10, 'SM Modelo', 'Supermercado', TRUE);
INSERT INTO enila_frigus.clientes(id_cliente, id_regiao, cliente, segmento, ativo) VALUES (DEFAULT, 8, 'Padaria Du Bom', 'Padaria', TRUE);

-- FORNECEDORES
INSERT INTO enila_frigus.fornecedores(id_fornecedor, id_regiao, fornecedor, email) VALUES (DEFAULT, 11, 'Refricom', 'compras@refricom.com.br');
INSERT INTO enila_frigus.fornecedores(id_fornecedor, id_regiao, fornecedor, email) VALUES (DEFAULT, 11, 'Sikaflex', 'lojas@sikaflex.com');
INSERT INTO enila_frigus.fornecedores(id_fornecedor, id_regiao, fornecedor, email) VALUES (DEFAULT, 10, 'Plastico & Cia', 'comercial.plasticocia@outlook.com');
INSERT INTO enila_frigus.fornecedores(id_fornecedor, id_regiao, fornecedor, email) VALUES (DEFAULT, 10, 'Quimica & Cia', 'compre_quimica@gmail.com');
INSERT INTO enila_frigus.fornecedores(id_fornecedor, id_regiao, fornecedor, email) VALUES (DEFAULT, 10, 'Frigo Paineis', 'paines_frigo@facebook.com.br');
INSERT INTO enila_frigus.fornecedores(id_fornecedor, id_regiao, fornecedor, email) VALUES (DEFAULT, 9, 'Danica', 'danica@gmail.com');

-- PRODUTOS
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 5, 'Painel PIR 50mm', 'M2', 92.50, '2020-02-04');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 5, 'Painel PIR 70mm', 'M2', 131.00, '2020-03-04');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 5, 'Painel PIR 120mm', 'M2', 180.00, '2020-03-10');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 5, 'Painel PIR 150mm', 'M2', 151.00, '2020-02-10');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira U 40x50mm EXT.', 'BR', 23.40, '2020-02-04');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira U 40x70mm EXT.', 'BR', 23.50, '2020-02-04');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira U 40x120mm EXT.', 'BR', 25.50, '2020-03-05');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira U 40x150mm EXT.', 'BR', 30.00, '2020-02-22');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira L 40x40mm EXT.', 'BR', 24.00, '2020-02-23');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira L 40x160mm EXT.', 'BR', 25.00, '2020-02-24');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 6, 'Cantoneira L 40x190mm EXT.', 'BR', 30.00, '2020-02-04');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 1, 'Rebite POP', 'PC', 0.50, '2020-02-04');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 3, 'Chapa EPS', 'PC', 36.00, '2020-02-10');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 4, 'Frio Asfalto 18 Kg', 'PC', 115.00, '2020-02-15');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 1, 'Lona Poliet', 'M', 7.00, '2020-02-15');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 1, 'Parafuso Bicromat', 'PC', 0.25, '2020-02-16');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 1, 'Bucha /p parafuso', 'PC', 0.25, '2020-03-15');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 2, 'Sikaflex 600ml', 'PC', 35.00, '2020-03-16');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 1, 'Valvula Equalizadora de Pressao', 'PC', 750.00, '2020-03-17');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 4, 'Polyurethane A 3KG', 'PC', 150.00, '2020-03-18');
INSERT INTO enila_frigus.produtos(id_produto, id_fornecedor, produto, unidade, preco_venda, ultima_data_compra) VALUES (DEFAULT, 4, 'Polyurethane B 3KG', 'PC', 150.00, '2020-03-19');

-- PAGAMENTOS
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito a vista', 'Nu Bank', '2020-05-01');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito 2x', 'Nu Bank', '2020-05-01');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito 3x', 'Nu Bank', '2020-05-01');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Débito', 'Pic Pay', '2020-05-01');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito 2x', 'Itau', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Débito', 'Itau', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito 3x', 'Banco do Brasil', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito 3x', 'Banco do Brasil', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Débito', 'Bradesco', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito 2x', 'Sicredi', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Credito a vista', 'Bradesco', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Dinheiro', 'Itau', '2020-05-02');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Dinheiro', 'Itau', '2020-05-03');
INSERT INTO enila_frigus.pagamentos(id_pagamento, forma_pagamento, banco, data_pagamento) VALUES (DEFAULT, 'Debito', 'Nu Bank', '2020-05-04');

-- VENDAS
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 1, 1, 1 ,14, 30, 2775);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 1, 2, 1 ,14, 30, 3930);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 2, 1, 1 ,10, 20, 1850);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 2, 2, 1 ,10, 20, 2620);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 3, 14, 2 ,9, 10, 1150);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 3, 15, 2 ,9, 20, 140);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 4, 13, 2 ,1, 50, 1800);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 5, 19, 2 ,2, 1, 750);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 6, 13, 2 ,6, 25, 900);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 7, 5, 3 ,8, 10, 234);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 7, 6, 3 ,8, 10, 235);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 8, 3, 3 ,4, 50, 9000);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 8, 4, 3 ,4, 50, 7550);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 9, 3, 4 ,11, 40, 7200);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 10, 3, 2 ,12, 100, 18000);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 11, 12, 6 ,13, 250, 125);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 11, 9, 6 ,13, 15, 360);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 11, 11, 6 ,13, 15, 450);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 12, 14, 2 ,9, 5, 575);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 13, 20, 2 ,8, 2, 300);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 13, 21, 2 ,8, 2, 300);
INSERT INTO enila_frigus.vendas(id_venda, id_pagamento, id_produto, id_vendedor, id_cliente, quantidade, valor_total) VALUES (DEFAULT, 14, 3, 2 ,15, 150, 27000);



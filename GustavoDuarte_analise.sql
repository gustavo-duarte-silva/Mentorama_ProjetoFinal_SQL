/*
	14 DE FEVEREIRO DE 2022
    ESCOLA MENTORAMA - CURSO SQL
    ALUNO: GUSTAVO DUARTE E SILVA
    PROFESSOR: FELIPPE FELISOLA CASO
*/

/*
	PROJETO FINAL - CURSO SQL - MODULO 17/17
*/

-- CRIANDO VIEWS PARA FACILITAR NA ORGANIZAÇÃO DO CODIGO
CREATE VIEW view_clientes_regiao AS(
	SELECT id_cliente, id_regiao, segmento, regiao, sigla
	FROM enila_frigus.clientes
	INNER JOIN enila_frigus.regioes
		USING (id_regiao));

CREATE VIEW view_produtos_movimentados AS(
	SELECT id_produto, produto, unidade, quantidade
    FROM enila_frigus.produtos
    INNER JOIN enila_frigus.vendas
		USING(id_produto)
);

CREATE VIEW view_vendedores_vendas AS(
	SELECT * 
    FROM enila_frigus.vendedores
    INNER JOIN vendas
		USING(id_vendedor)
);
 
 CREATE VIEW view_clientes_vendas AS(
	SELECT *
	FROM clientes
	INNER JOIN vendas
		USING(id_cliente)
 );
 
/*
	PERGUNTA 1)
    A ENILA DESEJA EXPANDIR PARA OUTRAS REGIOES DO BRASIL,
    O PRESIDENTE DA ENILA QUER EXPANDIR PARA A REGIAO EM MAIOR POTENCIAL
    ASSIM PRECISAMOS VERIFICAR QUAL ESTADO POSSUI MAIOR QUANTIDADE DE VENDAS E VALOR
    
    R: DE ACORDO COM A CONSULTA, O ESTADO EM MAIOR POTENCIAL É O MARANHAO
    POIS É O SEGUNDO ESTADO QUE MAIS VENDEU E TEM O MAIOR VALOR DE VENDAS
*/

WITH quantidade_vendas_clientes AS (
	SELECT id_regiao, regiao, COUNT(id_regiao) AS quantidade_vendas, SUM(valor_total) AS total_arrecadado
    FROM view_clientes_regiao
    INNER JOIN enila_frigus.vendas
		USING (id_cliente)
	GROUP BY id_regiao
    ORDER BY quantidade_vendas DESC)
SELECT *
FROM quantidade_vendas_clientes;
    
/*
	PERGUNTA 2)
    A PRESIDENCIA DESEJA FAZER UM GRAFICO QUE ACOMPANHA O CRESCIMENTO DA EMPRESA.
    É NECESSARIO QUE OBTENHA A INFORMAÇÃO POR SEGMENTO DE MERCADO, COMO AÇAI, SORVETES, ETC..
    SABENDO DISSO, PRECISA-SE QUE FAÇA UMA SOMATORIA ACUMULATIVO DAS VENDAS
    OBS: SÃO POUCAS INFORMAÇÕES ENTÃO AS VENDAS VAI ATE O DIA 04 DE MAIO
*/

WITH clientes AS(
	SELECT *
	FROM view_clientes_regiao
    INNER JOIN vendas
		USING(id_cliente)
	INNER JOIN pagamentos
		USING(id_pagamento)
)
SELECT data_pagamento, segmento, valor_total AS venda_no_dia, 
        SUM(valor_total) OVER(PARTITION BY segmento ORDER BY segmento ROWS UNBOUNDED PRECEDING) AS total_acumulado
FROM clientes;

/*
	PERGUNTA 3)
    A ENILA AINDA NAO POSSUI UM SISTEMA QUE MANTEM A ORDER E QUANTIDADE DE PRODUTO EM SEU ESTOQUE
    DESSA FORMA AINDA UTILIZAM DE FORMA MANUAL, ESCREVENDO EM UM CADERNO
    O ESTOQUE PRECISA SABEM QUANTOS PRODUTOS FORAM VENDIDOS PARA VERIFICAR SE BATE COM A CONTA DELES 
    VERIFICAR A QUANTIDADE DE PRODUTOS VENDIDOS 
    OBS: A Unidade M é Metros, M2 é Metro Quadrado (M²), BR é Barra de 3 Metros, PC é Uma Peça
    
    EX: NO RESULTADO DA CONSULTA DEU 50 M² vendidos de painel PIR de 50mm
        
*/

SELECT id_produto, produto, unidade, SUM(quantidade) AS total_por_unidade
FROM view_produtos_movimentados
GROUP BY id_produto;

/*
	PERGUNTA 4)
    O PRESIDENTE DESEJA PRESENTEAR O MAIOR VENDEDOR DA EMPRESA
    ELE PRECISA SABER QUAL É A PESSOA E O SEU EMAIL
    PARA ENVIAR O PREMIO
    QUAL FOI O EMPREGADO QUE MAIOR FATUROU PARA EMPRESA E QUANTIDADE DE VENDAS
*/
	SELECT id_vendedor, nome, sobrenome, email, COUNT(id_vendedor) AS qtde_vendas, SUM(valor_total) AS faturamento
    FROM view_vendedores_vendas
    GROUP BY id_vendedor
    ORDER BY faturamento DESC;

/*
	PERGUNTA 5)
	DESEJA-SE CRIAR PROMOÇÕES DIARIAS PARA EMPRESAS QUE PAGARAM MUITO
    ASSIM É NECESSARIO SABER QUAL FOI A EMPRESA QUE MAIS COMPROU NA ENILA FRIGUS
    CLIENTE QUE MAIS COMPROU NA ENILA E SEU FATURAMENTO.

*/

SELECT id_cliente, cliente, COUNT(id_cliente) AS quantidade_vendas, SUM(valor_total) AS valor_compras
FROM view_clientes_vendas
GROUP BY id_cliente
ORDER BY valor_compras DESC;

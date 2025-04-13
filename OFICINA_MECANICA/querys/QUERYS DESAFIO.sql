-- 1. Recuperação simples com SELECT
A-- consulta a seguir recupera informações básicas sobre os clientes e os veículos registrados na oficina.

SELECT id_cliente, nome, tipo_cliente, placa, modelo, cor
FROM tb_cliente
JOIN tb_veiculo ON tb_cliente.id_cliente = tb_veiculo.id_cliente;
-- Pergunta respondida: Quais clientes têm veículos registrados e quais são esses veículos?

-- 2. Filtros com WHERE
-- A consulta a seguir filtra os veículos por cor e ano, retornando apenas os veículos com cor preta e ano superior a 2010.

SELECT id_veiculo, placa, modelo, cor, ano
FROM tb_veiculo
WHERE cor = 'preto' AND ano > 2010;
-- Pergunta respondida: Quais são os veículos de cor preta e com ano superior a 2010?

-- 3. Expressões para gerar atributos derivados
-- A consulta a seguir calcula o valor total da manutenção, que é a soma de valor_mao_obra e valor_total das ordens de serviço. Além disso, retorna o nome do serviço e o valor calculado.

SELECT os.id_os, s.descricao AS nome_servico, 
       (os.valor_total + s.valor_mao_obra) AS valor_total_manutencao
FROM tb_ordem_servico os
JOIN tb_servico_os so ON os.id_os = so.id_os
JOIN tb_servico s ON so.id_servico = s.id_servico;
-- Pergunta respondida: Qual é o valor total de manutenção considerando o valor total das ordens de serviço e o valor da mão de obra?

-- 4. Ordenação dos dados com ORDER BY
-- A consulta a seguir retorna as ordens de serviço com valores totais de forma ordenada do maior para o menor.
-- 1. Recuperação simples com SELECT
-- A consulta a seguir recupera informações básicas sobre os clientes e os veículos registrados na oficina.

SELECT id_cliente, nome, tipo_cliente, placa, modelo, cor
FROM tb_cliente
JOIN tb_veiculo ON tb_cliente.id_cliente = tb_veiculo.id_cliente;
Pergunta respondida: Quais clientes têm veículos registrados e quais são esses veículos?

-- 2. Filtros com WHERE
-- A consulta a seguir filtra os veículos por cor e ano, retornando apenas os veículos com cor preta e ano superior a 2010.

SELECT id_veiculo, placa, modelo, cor, ano
FROM tb_veiculo
WHERE cor = 'preto' AND ano > 2010;
-- Pergunta respondida: Quais são os veículos de cor preta e com ano superior a 2010?

-- 3. Expressões para gerar atributos derivados
-- A consulta a seguir calcula o valor total da manutenção, que é a soma de valor_mao_obra e valor_total das ordens de serviço. Além disso, retorna o nome do serviço e o valor calculado.

SELECT os.id_os, s.descricao AS nome_servico, 
       (os.valor_total + s.valor_mao_obra) AS valor_total_manutencao
FROM tb_ordem_servico os
JOIN tb_servico_os so ON os.id_os = so.id_os
JOIN tb_servico s ON so.id_servico = s.id_servico;
-- Pergunta respondida: Qual é o valor total de manutenção considerando o valor total das ordens de serviço e o valor da mão de obra?

-- 4. Ordenação dos dados com ORDER BY
-- A consulta a seguir retorna as ordens de serviço com valores totais de forma ordenada do maior para o menor.

SELECT id_os, valor_total
FROM tb_ordem_servico
ORDER BY valor_total DESC;
-- Pergunta respondida: Quais são as ordens de serviço com os maiores valores totais?

-- 5. Condições de filtros aos grupos com HAVING
-- Aqui, a consulta retorna as equipes que realizaram mais de 5 ordens de serviço, utilizando HAVING para filtrar os resultados de acordo com a quantidade de ordens por equipe.

SELECT e.id_equipe, e.nome_equipe, COUNT(os.id_os) AS quantidade_ordens
FROM tb_equipe e
JOIN tb_veiculo v ON e.id_equipe = v.id_equipe
JOIN tb_ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY e.id_equipe
HAVING COUNT(os.id_os) > 5;
-- Pergunta respondida: Quais equipes realizaram mais de 5 ordens de serviço?

-- 6. Junções entre tabelas para fornecer uma perspectiva mais complexa
-- A consulta a seguir traz um relatório mais complexo envolvendo várias tabelas. Ela retorna os clientes, seus veículos, as ordens de serviço realizadas e o status da ordem de serviço.

SELECT c.id_cliente, c.nome, v.placa, os.id_os, os.status
FROM tb_cliente c
JOIN tb_veiculo v ON c.id_cliente = v.id_cliente
JOIN tb_ordem_servico os ON v.id_veiculo = os.id_veiculo
ORDER BY c.id_cliente, os.id_os;
-- Pergunta respondida: Quais clientes têm ordens de serviço registradas e qual é o status dessas ordens?

-- 7. Consultas com múltiplas condições de filtro, GROUP BY e HAVING
-- Aqui, uma consulta que retorna a soma dos valores de manutenção para cada cliente, mas apenas para aqueles clientes que tenham mais de uma ordem de serviço.

SELECT c.id_cliente, c.nome, SUM(os.valor_total) AS total_gasto
FROM tb_cliente c
JOIN tb_veiculo v ON c.id_cliente = v.id_cliente
JOIN tb_ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY c.id_cliente
HAVING COUNT(os.id_os) > 1;
-- Pergunta respondida: Quais clientes gastaram mais de uma vez na oficina e qual é o total gasto?

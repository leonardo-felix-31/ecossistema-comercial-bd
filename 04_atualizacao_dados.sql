SET SQL_SAFE_UPDATES = 0;

-- ==============================================================================
-- COMANDOS DE UPDATE 
-- ==============================================================================

-- 1. Reajuste de Preço: Inflação de 10% nos produtos de Suporte
UPDATE Produto 
SET Preco_Base = Preco_Base * 1.10 
WHERE Nome LIKE '%Suporte%';

-- 2. Correção de Cadastro : Vendedor mudou de área
UPDATE Vendedor 
SET Area_Atuacao = 'Corporativo' 
WHERE Nome = 'Roberto Almeida';

-- 3. Atualização de Cliente : Promover cliente para VIP se o email for corporativo (ex: termina em .com)
-- e atualmente for classificado como 'PJ'
UPDATE Cliente
SET Categoria = 'VIP'
WHERE Email LIKE '%.com' AND Categoria = 'PJ';


-- ==============================================================================
-- COMANDOS DE DELETE 
-- ==============================================================================

-- 1. Limpeza de Dados Antigos : Remover vendas de valor irrisório e antigas (limpeza de histórico inútil)
DELETE FROM Venda 
WHERE Preco_Total < 50.00 AND Data_Venda < '2024-01-01';

-- 2. Cancelamento de Venda Específica : Uma venda foi lançada errada (duplicidade) e precisa ser removida pelo ID
DELETE FROM Venda 
WHERE ID_Venda = 5002; 

-- 3. Remoção de Produto Descontinuado : Remover um produto que nunca foi vendido ou foi criado para teste.
INSERT INTO Produto (Nome, Descricao, Preco_Base) VALUES ('Produto Teste Errado', 'A ser deletado', 1.00);

DELETE FROM Produto 
WHERE Nome = 'Produto Teste Errado';

-- Ranking de Melhores Vendedores
SELECT 
    ven.Nome, 
    COUNT(v.ID_Venda) as Total_Vendas,
    SUM(v.Preco_Total) as Faturamento_Total
FROM Vendedor ven
JOIN Venda v ON ven.ID_Vendedor = v.ID_Vendedor
GROUP BY ven.Nome
ORDER BY Faturamento_Total DESC;

-- Análise de Vendas por Categoria de Cliente
SELECT 
    c.Categoria,
    COUNT(v.ID_Venda) as Qtd_Vendas,
    AVG(v.Preco_Total) as Ticket_Medio
FROM Cliente c
JOIN Venda v ON c.ID_Cliente = v.ID_Cliente
GROUP BY c.Categoria;

-- Vendas do Ano Atual
SELECT * FROM Venda 
WHERE Data_Venda >= '2024-01-01'
ORDER BY Data_Venda DESC;
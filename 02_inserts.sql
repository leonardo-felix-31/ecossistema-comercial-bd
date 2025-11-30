USE comercial;


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Venda;
TRUNCATE TABLE Cliente;
TRUNCATE TABLE Produto;
TRUNCATE TABLE Vendedor;
SET FOREIGN_KEY_CHECKS = 1;

-- ==============================================================================
-- 1. INSERINDO VENDEDORES (10 Registros)
-- ==============================================================================
INSERT INTO Vendedor (Nome, Email, Telefone, Area_Atuacao) VALUES 
('Roberto Almeida', 'roberto.a@empresa.com', '11999991111', 'Varejo'),     -- ID 1
('Fernanda Costa', 'fernanda.c@empresa.com', '11988882222', 'Atacado'),    -- ID 2
('Lucas Pereira', 'lucas.p@empresa.com', '21977773333', 'Corporativo'),    -- ID 3
('Juliana Martins', 'ju.martins@empresa.com', '31966664444', 'Varejo'),    -- ID 4
('Ricardo Oliveira', 'ricardo.o@empresa.com', '41955556666', 'Parceiros'), -- ID 5
('Amanda Souza', 'amanda.s@empresa.com', '11944447777', 'Atacado'),        -- ID 6
('Bruno Lima', 'bruno.l@empresa.com', '21933338888', 'Corporativo'),       -- ID 7
('Camila Rocha', 'camila.r@empresa.com', '11922229999', 'Inside Sales'),   -- ID 8
('Diego Alves', 'diego.a@empresa.com', '31911110000', 'Inside Sales'),     -- ID 9
('Elaine Santos', 'elaine.s@empresa.com', '41900001111', 'Parceiros');     -- ID 10

-- ==============================================================================
-- 2. INSERINDO PRODUTOS E SERVIÇOS (15 Registros)
-- ==============================================================================
INSERT INTO Produto (Nome, Descricao, Preco_Base) VALUES 
('Consultoria de Dados', 'Análise completa de BI e Data Warehouse', 1500.00),     -- ID 1
('Licença CRM Starter', 'Licença anual básica para 1 usuário', 300.00),           -- ID 2
('Licença CRM Pro', 'Licença anual completa com automação', 800.00),              -- ID 3
('Treinamento de Vendas', 'Workshop presencial de 8 horas', 2000.00),             -- ID 4
('Suporte Mensal N1', 'Manutenção básica remota', 150.00),                        -- ID 5
('Suporte Mensal N2', 'Suporte 24/7 com SLA de 4h', 500.00),                      -- ID 6
('Implementação de ERP', 'Setup inicial e migração de dados', 5000.00),           -- ID 7
('Auditoria de Processos', 'Revisão de fluxo comercial', 1200.00),                -- ID 8
('Notebook Corporativo', 'Dell Latitude i5 16GB RAM (Locação)', 250.00),          -- ID 9
('Monitor 24pol', 'Monitor Full HD para estações de trabalho', 800.00),           -- ID 10
('Mouse Sem Fio', 'Periférico Logitech', 120.00),                                 -- ID 11
('Teclado Mecânico', 'Teclado de alta durabilidade', 350.00),                     -- ID 12
('Hospedagem Cloud', 'Servidor VPS Básico (Mensal)', 100.00),                     -- ID 13
('Backup Gerenciado', 'Rotina de backup diário 1TB', 200.00),                     -- ID 14
('Design de Dashboard', 'Criação de visualização customizada no PowerBI', 900.00);-- ID 15

-- ==============================================================================
-- 3. INSERINDO CLIENTES (15 Registros com JSON Variado)
-- ==============================================================================
INSERT INTO Cliente (Nome, CPF_CNPJ, Telefone, Email, Categoria, Dados_Adicionais) VALUES 
('Tech Solutions Ltda', '12.345.678/0001-90', '1130304040', 'contato@techsol.com', 'PJ', '{"setor": "Tecnologia", "tamanho": "Medio"}'),
('João da Silva', '123.456.789-00', '11912345678', 'joao.silva@email.com', 'PF', '{"origem": "Linkedin", "preferencia": "Email"}'),
('Mercado Rápido', '98.765.432/0001-10', '2133445566', 'compras@mercardorapido.com', 'VIP', '{"setor": "Varejo", "limite_credito": 50000}'),
('Construtora Fortes', '11.222.333/0001-44', '3133334444', 'obras@fortes.com.br', 'PJ', '{"setor": "Construcao", "filiais": 5}'),
('Hospital Santa Vida', '55.666.777/0001-88', '1133335555', 'adm@santavida.com.br', 'VIP', '{"setor": "Saude", "complexidade": "Alta"}'),
('Maria Oliveira', '222.333.444-55', '41988887777', 'maria.o@gmail.com', 'PF', '{"origem": "Indicação", "interesse": "Cursos"}'),
('Advocacia Mendes', '99.888.777/0001-22', '1130301111', 'contato@mendesadv.com', 'PJ', '{"setor": "Juridico", "tamanho": "Pequeno"}'),
('Startup Inova', '77.666.555/0001-11', '2130302222', 'hello@inova.io', 'Startups', '{"fase": "Seed", "investidor": "Anjo"}'),
('Pedro Santos', '333.444.555-66', '11977776666', 'pedro.s@hotmail.com', 'PF', '{"origem": "Site", "newsletter": true}'),
('Logística Veloz', '44.555.666/0001-99', '3130309999', 'operacao@veloz.com', 'PJ', '{"setor": "Logistica", "frota": 20}'),
('Ana Costa', '555.666.777-88', '11966665555', 'ana.costa@uol.com.br', 'PF', '{"origem": "Instagram"}'),
('Educação Futuro', '22.111.000/0001-33', '4130308888', 'diretoria@educafuturo.com', 'VIP', '{"setor": "Educacao", "alunos": 2000}'),
('Consultório Dr. Lucas', '88.999.000/0001-77', '2130307777', 'agendamento@drlucas.com', 'PJ', '{"setor": "Saude", "especialidade": "Odonto"}'),
('Carla Dias', '666.777.888-99', '31955554444', 'carla.d@gmail.com', 'PF', '{"origem": "Google Ads"}'),
('Agro Top Safra', '10.203.040/0001-50', '6230305555', 'comercial@topsafra.com', 'VIP', '{"setor": "Agronegocio", "regiao": "Centro-Oeste"}');

-- ==============================================================================
-- 4. INSERINDO VENDAS (30 Registros - Cruzando IDs acima)
-- ==============================================================================
-- Obs: Preco_Total calculado manualmente aqui (Qtd * Preco_Unidade)
INSERT INTO Venda (Data_Venda, Quantidade, Preco_Unidade, Preco_Total, Observacoes, ID_Cliente, ID_Vendedor, ID_Produto) VALUES 
-- Vendas de 2023
('2023-01-15', 1, 1500.00, 1500.00, 'Kickoff do projeto', 1, 3, 1),
('2023-02-10', 5, 300.00, 1500.00, 'Licenças iniciais', 1, 3, 2),
('2023-03-05', 2, 2000.00, 4000.00, 'Treinamento equipe vendas', 3, 1, 4),
('2023-04-12', 1, 5000.00, 5000.00, 'Implantação ERP filial 1', 4, 7, 7),
('2023-05-20', 10, 150.00, 1500.00, 'Contrato suporte anual', 5, 5, 5),
('2023-06-01', 1, 250.00, 250.00, 'Notebook temporário', 8, 9, 9),
('2023-06-15', 3, 800.00, 2400.00, 'Monitores novos', 7, 8, 10),
('2023-07-10', 1, 900.00, 900.00, 'Dashboards diretoria', 15, 2, 15),
('2023-08-22', 1, 1200.00, 1200.00, 'Auditoria prévia', 12, 6, 8),
('2023-09-30', 20, 300.00, 6000.00, 'Expansão de licenças', 3, 1, 2),

-- Vendas de 2024 (Q1 e Q2)
('2024-01-10', 2, 1500.00, 3000.00, 'Renovação consultoria', 1, 3, 1),
('2024-01-15', 1, 350.00, 350.00, 'Teclado gamer para dev', 2, 4, 12),
('2024-02-01', 50, 120.00, 6000.00, 'Mouses para call center', 10, 2, 11),
('2024-02-20', 1, 200.00, 200.00, 'Backup nuvem', 13, 9, 14),
('2024-03-05', 4, 250.00, 1000.00, 'Notebooks estagiários', 8, 9, 9),
('2024-03-10', 1, 800.00, 800.00, 'Licença Pro gestor', 6, 8, 3),
('2024-04-01', 1, 5000.00, 5000.00, 'ERP Módulo Financeiro', 12, 7, 7),
('2024-04-15', 10, 500.00, 5000.00, 'Suporte Premium', 5, 5, 6),
('2024-05-05', 2, 2000.00, 4000.00, 'Treinamento Reciclagem', 10, 1, 4),
('2024-05-20', 1, 1500.00, 1500.00, 'Consultoria pontual', 14, 8, 1),

-- Vendas Recentes (Q3 2024)
('2024-06-01', 5, 300.00, 1500.00, NULL, 9, 9, 2),
('2024-06-10', 1, 100.00, 100.00, 'Teste VPS', 2, 4, 13),
('2024-07-01', 3, 1200.00, 3600.00, 'Auditoria Filiais', 4, 6, 8),
('2024-07-15', 2, 900.00, 1800.00, 'BI Marketing', 8, 8, 15),
('2024-08-01', 100, 150.00, 15000.00, 'Renovação massiva suporte', 3, 5, 5), -- Grande venda
('2024-08-05', 1, 800.00, 800.00, NULL, 11, 4, 10),
('2024-08-10', 2, 350.00, 700.00, NULL, 11, 4, 12),
('2024-09-01', 5, 250.00, 1250.00, 'Troca parque máquinas', 13, 9, 9),
('2024-09-15', 1, 5000.00, 5000.00, 'ERP Start', 15, 7, 7),
('2024-10-01', 1, 1500.00, 1500.00, 'Consultoria final', 1, 3, 1);
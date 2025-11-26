INSERT INTO Grupo_carro (nome, descricao) VALUES
('Econômico', 'Carros 1.0 sem ar'),
('Intermediário', 'Carros 1.6 com ar'),
('Luxo', 'Sedans grandes ou SUVs');

INSERT INTO Agencias (nome, telefone, endereco) VALUES
('Agência Aeroporto GRU', '11987654321', 'Avenida Principal, 100 - Guarulhos/SP'),
('Agência Centro SP', '11912345678', 'Rua da Consolação, 500 - São Paulo/SP');

INSERT INTO Funcionario (nome, funcao, id_agencia) VALUES
('João da Silva', 'Gerente', 1),
('Maria Souza', 'Motorista', 2),
('Carlos Lima', 'Atendente', 1);

INSERT INTO Usuario (nome, cpf, email, tem_cnh) VALUES
('Alice Neves', '12345678901', 'alice@exemplo.com', TRUE),
('Bruno Rocha', '98765432101', 'bruno@exemplo.com', TRUE);

INSERT INTO Veiculo (id_agencia, id_grupo_carro, placa, marca, modelo, diaria, km, status) VALUES
(1, 1, 'ABC1A23', 'Fiat', 'Mobi', 80.00, 15000, 'Livre'),
(1, 3, 'DEF4B56', 'BMW', 'X1', 350.00, 5000, 'Livre'),
(2, 2, 'GHI7C89', 'VW', 'Virtus', 150.00, 20000, 'Livre');

INSERT INTO Agendamento (id_usuario, id_grupo_carro, id_agencia_retirada, id_agencia_devolucao, retirada, devolucao, status, id_veiculo) VALUES
(1, 3, 1, 2, '2025-12-01 10:00:00', '2025-12-08 10:00:00', 'Confirmada', 2);

INSERT INTO Contrato (id_agendamento, id_veiculo, id_func_motorista, termos, status, periodo, data_inicio, data_fim) VALUES
(1, 2, 2, 'Locação Padrão', 'Ativo', 7, '2025-12-01', '2025-12-08');

INSERT INTO Pagamento (id_contrato, forma, data, status, valor) VALUES
(1, 'Cartão de Crédito', NOW(), 'Aprovado', 2450.00);

UPDATE Veiculo 
SET status = 'Alugado' 
WHERE id = 2;

UPDATE Funcionario
SET funcao = 'Diretor', valor = 8500.00
WHERE id = 1;

UPDATE Veiculo
SET diaria = 75.00
WHERE id = 1;

DELETE FROM Grupo_carro
WHERE id = 4;

DELETE FROM Veiculo
WHERE id = 4 AND placa = 'XYZ9D01';

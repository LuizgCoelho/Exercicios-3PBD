
INSERT INTO Grupo_carro (nome, descricao) VALUES
('Econômico', 'Carros 1.0 sem ar'),
('Intermediário', 'Carros 1.6 com ar'),
('Luxo', 'Sedans grandes ou SUVs');

INSERT INTO Agencias (nome, telefone, endereco) VALUES
('Agência Aeroporto GRU', '11987654321', 'Avenida Principal, 100 - Guarulhos/SP'),
('Agência Centro SP', '11912345678', 'Rua da Consolação, 500 - São Paulo/SP');

INSERT INTO Horarios (id_agencia, hora_inicio, hora_fim, dia_semana) VALUES
(1, '08:00:00', '18:00:00', 'Segunda'),
(1, '08:00:00', '18:00:00', 'Terça'),
(2, '09:00:00', '19:00:00', 'Segunda'),
(2, '09:00:00', '19:00:00', 'Quarta');

INSERT INTO Usuario (nome, telefone, endereco, email, genero, nacionalidade, tem_cnh, cpf) VALUES
('Alice Neves', '11922223333', 'Rua Azul 15', 'alice@exemplo.com', 'Feminino', 'Brasileira', TRUE, '53242134100'),
('Bruno Rocha', '11933334444', 'Rua Verde 80', 'bruno@exemplo.com', 'Masculino', 'Brasileiro', TRUE, '98765432101'),
('Carlos Mendes', '11944445555', 'Rua Vermelha 20', 'carlos@exemplo.com', 'Masculino', 'Brasileiro', FALSE, '11122233344');

INSERT INTO Pessoa_juridica (id_cliente, nome_empresa, cnpj, telefone_comercial, registro_estadual) VALUES
(3, 'Tech Solutions LTDA', '12345678000155', '1133334444', '55.667.123-4');

INSERT INTO Funcionario (nome, valor, telefone, endereco, funcao, id_agencia) VALUES
('João da Silva', 4500.00, '11988887777', 'Rua Alfa 10', 'Gerente', 1),
('Maria Souza', 3200.00, '11999996666', 'Rua Beta 200', 'Motorista', 2),
('Carlos Lima', 2800.00, '11977774444', 'Av Gama 50', 'Atendente', 1);

INSERT INTO Veiculo (id_agencia, id_grupo_carro, placa, marca, modelo, diaria, especificacoes, km, tipo, status) VALUES
(1, 1, 'ABC1A23', 'Fiat', 'Mobi', 80.00, '1.0, manual, básico', 15000, 'Hatch', 'Livre'),
(1, 3, 'DEF4B56', 'BMW', 'X1', 350.00, 'SUV automático top', 5000, 'SUV', 'Livre'),
(2, 2, 'GHI7C89', 'VW', 'Virtus', 150.00, '1.6 automático', 20000, 'Sedan', 'Livre');

INSERT INTO Checklist (id_veiculo, id_funcionario, tem_seguro, data_checklist, observacoes) VALUES
(1, 1, TRUE, '2025-11-01 10:00:00', 'Carro limpo e revisado.'),
(2, 1, TRUE, '2025-11-03 09:30:00', 'Revisão completa.'),
(3, 3, FALSE, '2025-11-05 15:20:00', 'Pneus com desgaste moderado.');

INSERT INTO Agendamento (id_usuario, id_grupo_carro, id_agencia_retirada, id_agencia_devolucao, retirada, devolucao, status) VALUES
(1, 3, 1, 2, '2025-12-01 10:00:00', '2025-01-14 10:00:00', 'Confirmada'),
(1, 3, 2, 2, '2026-01-15 10:00:00', '2026-01-12 10:00:00', 'Confirmada'),
(2, 2, 2, 2, '2026-01-14 10:00:00', '2026-01-11 10:00:00', 'Confirmada');

INSERT INTO Contrato (id_agendamento, id_veiculo, id_func_motorista, termos, status, periodo, data_inicio, data_fim) VALUES
(1, 2, 2, 'Locação Padrão', 'Ativo', 7, '2025-12-01', '2025-12-08'),
(3, 3, 2, 'Contrato Intermediário', 'Ativo', 3, '2026-01-11', '2026-01-14');

INSERT INTO Pagamento (id_contrato, forma, data, status, valor, nota_fiscal) VALUES
(1, 'Cartão de Crédito', NOW(), 'Aprovado', 2450.00, 'NF-2025-001'),
(2, 'Pix', NOW(), 'Aprovado', 750.00, 'NF-2026-010');

INSERT INTO Relatorio (observacoes, data_criacao) VALUES
('Relatório mensal de movimentação', NOW()),
('Relatório de manutenção preventiva', NOW());

-- =======================================================================
-- 1. CENÁRIO: ALUGUEL COMPLETO DE UM VEÍCULO (Usuário Novo - Fernanda)
-- =======================================================================

-- Cadastro de Novo Usuário
INSERT INTO Usuario (nome, telefone, endereco, email, genero, nacionalidade, tem_cnh, cpf) VALUES
('Fernanda Oliveira', '11955556666', 'Av. das Flores, 100', 'fernanda@exemplo.com', 'Feminino', 'Brasileira', TRUE, '76543210987');

-- Consulta de Veículos Disponíveis
SELECT 
    v.id, v.placa, v.modelo, gc.nome AS Grupo_Carro
FROM 
    Veiculo v
JOIN 
    Grupo_carro gc ON v.id_grupo_carro = gc.id
WHERE 
    gc.nome = 'Econômico' 
    AND v.status = 'Livre' 
    AND v.id NOT IN (
        SELECT id_veiculo FROM Contrato c JOIN Agendamento a ON c.id_agendamento = a.id
        WHERE c.status IN ('Ativo', 'Pendente') AND (a.devolucao > '2026-02-10 14:00:00' AND a.retirada < '2026-02-13 14:00:00')
    );

-- Agendamento do Veículo
INSERT INTO Agendamento (id_usuario, id_grupo_carro, id_agencia_retirada, id_agencia_devolucao, retirada, devolucao, status) VALUES
(4, 1, 1, 1, '2026-02-10 14:00:00', '2026-02-13 14:00:00', 'Pendente');

-- Criação do Contrato e Atualização do Status do Veículo
INSERT INTO Contrato (id_agendamento, id_veiculo, termos, status, periodo, data_inicio, data_fim) VALUES
(4, 1, 'Termos Econômicos', 'Pendente', 3, '2026-02-10', '2026-02-13');

-- Efetuar Pagamento
INSERT INTO Pagamento (id_contrato, forma, data, status, valor, nota_fiscal) VALUES
(3, 'Débito', NOW(), 'Aprovado', 240.00, 'NF-2026-011');

-- Atualizar o status do Agendamento 
UPDATE Agendamento
SET status = 'Contratada'
WHERE id = 4;

-- Atualizar o status do Contrato
UPDATE Contrato
SET status = 'Ativo'
WHERE id = 3;

-- Atualizar o status do Veículo 
UPDATE Veiculo
SET status = 'Alugado'
WHERE id = 1; 

-- =======================================================================
-- 2. CENÁRIO: MANUTENÇÃO E ATUALIZAÇÃO DE DADOS DA EMPRESA
-- =======================================================================

-- Inclusão de Novo Funcionário
INSERT INTO Funcionario (nome, valor, telefone, endereco, funcao, id_agencia) VALUES
('Patrícia Santos', 3000.00, '11966665555', 'Rua Nova, 30', 'Motorista', 1);

-- Atualização do Endereço de uma Agência
UPDATE Agencias
SET endereco = 'Rua da Consolação, 1500 - Novo Bairro/SP', telefone = '11990008888'
WHERE id = 2;

-- Registro de Checklist para Novo Veículo
INSERT INTO Veiculo (id_agencia, id_grupo_carro, placa, marca, modelo, diaria, especificacoes, km, tipo, status) VALUES
(1, 1, 'JHK1D11', 'Hyundai', 'HB20', 90.00, '1.0, completo', 0, 'Hatch', 'Livre');

-- Inserir um novo Checklist para o veículo (Veículo ID 4, Funcionario ID 4)
INSERT INTO Checklist (id_veiculo, id_funcionario, tem_seguro, data_checklist, observacoes) VALUES
(4, 4, TRUE, NOW(), 'Veículo novo, tudo OK.');

-- =======================================================================
-- 3. CENÁRIO: DEVOLUÇÃO E CANCELAMENTO
-- =======================================================================

-- Devolução de Veículo e Encerramento de Contrato
UPDATE Contrato
SET status = 'Finalizado'
WHERE id = 1;

-- Atualizar o status do Veículo 
UPDATE Veiculo
SET status = 'Livre', km = km + 1000 
WHERE id = 2;

-- Atualizar o status do Agendamento associado
UPDATE Agendamento
SET status = 'Finalizado'
WHERE id = 1;

-- Cancelamento de Agendamento
DELETE FROM Agendamento
WHERE id = 3;

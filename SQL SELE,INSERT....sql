INSERT INTO especialidade (nome_especialidade) 
VALUES ('Dermatologia');

SELECT * FROM especialidade;
SELECT * FROM especialidade WHERE id_especialidade = 1;

UPDATE especialidade 
SET nome_especialidade = 'Dermatologia Estética' 
WHERE id_especialidade = 1;

DELETE FROM especialidade WHERE id_especialidade = 1;


INSERT INTO servico (id_especialidade, nome_servico, descricao, duracao, preco, tipo, status) 
VALUES (1, 'Limpeza de Pele Profunda', 'Limpeza completa com extração', '01:00:00', 150.00, 'Facial', 'Ativo');

SELECT * FROM servico;
SELECT * FROM servico WHERE id_servico = 1;

UPDATE servico 
SET preco = 160.00, status = 'Inativo' 
WHERE id_servico = 1;

DELETE FROM servico WHERE id_servico = 1;


INSERT INTO profissional (nome, status, email, telefone) 
VALUES ('Dr. Ana Silva', 'Ativo', 'ana.silva@clinica.com', '(21) 99999-1234');

SELECT * FROM profissional;
SELECT * FROM profissional WHERE id_profissional = 1;

UPDATE profissional 
SET telefone = '(21) 98888-1234', status = 'Férias' 
WHERE id_profissional = 1;

DELETE FROM profissional WHERE id_profissional = 1;


INSERT INTO cliente (nome, data_nascimento, cpf, email, telefone, senha, credito) 
VALUES ('Carlos Pereira', '1990-05-15', '123.456.789-00', 'carlos.pereira@email.com', '(21) 97777-5555', 'senhaForte123', 0.00);

SELECT * FROM cliente;
SELECT * FROM cliente WHERE id_cliente = 1;

UPDATE cliente 
SET telefone = '(21) 97777-6666', credito = 100.00 
WHERE id_cliente = 1;

DELETE FROM cliente WHERE id_cliente = 1;


INSERT INTO pacote (nome_pacote, descricao, valor, tipo) 
VALUES ('Pacote Verão Facial', '5 sessões de limpeza de pele', 650.00, 'Facial');

SELECT * FROM pacote;
SELECT * FROM pacote WHERE id_pacote = 1;

UPDATE pacote 
SET valor = 700.00 
WHERE id_pacote = 1;

DELETE FROM pacote WHERE id_pacote = 1;


INSERT INTO contrato (id_cliente, valor_total, data_inicio, status, credito_utilizado) 
VALUES (1, 650.00, '2025-10-29', 'Ativo', 0.00);

SELECT * FROM contrato;
SELECT * FROM contrato WHERE id_contrato = 1;

UPDATE contrato 
SET status = 'Finalizado', credito_utilizado = 650.00 
WHERE id_contrato = 1;

DELETE FROM contrato WHERE id_contrato = 1;


INSERT INTO pagamento (id_contrato, status, valor, data_pagamento, nota_fiscal, metodo) 
VALUES (1, 'Efetuado', 650.00, '2025-10-29', 'NF-00123', 'Cartão de Crédito');

SELECT * FROM pagamento;
SELECT * FROM pagamento WHERE id_pagamento = 1;

UPDATE pagamento 
SET status = 'Estornado', metodo = 'Pix' 
WHERE id_pagamento = 1;

DELETE FROM pagamento WHERE id_pagamento = 1;


INSERT INTO agendamento (id_profissional, id_cliente, data, hora_inicio, hora_fim, id_servico, status, valor_servico, id_contrato) 
VALUES (1, 1, '2025-11-05', '14:00:00', '15:00:00', 1, 'Confirmado', 150.00, NULL);

INSERT INTO agendamento (id_profissional, id_cliente, data, hora_inicio, hora_fim, id_servico, status, valor_servico, id_contrato) 
VALUES (1, 1, '2025-11-12', '14:00:00', '15:00:00', 1, 'Confirmado', 0.00, 1);

SELECT * FROM agendamento;
SELECT * FROM agendamento WHERE id_agendamento = 1;

UPDATE agendamento 
SET status = 'Cancelado' 
WHERE id_agendamento = 1;

DELETE FROM agendamento WHERE id_agendamento = 1;


INSERT INTO fila_espera (id_cliente, id_profissional, status, hora_entrada, id_servico) 
VALUES (1, 1, 'Aguardando', '2025-10-29 10:30:00', 1);

SELECT * FROM fila_espera;
SELECT * FROM fila_espera WHERE id_fila = 1;

UPDATE fila_espera 
SET status = 'Atendido' 
WHERE id_fila = 1;

DELETE FROM fila_espera WHERE id_fila = 1;


INSERT INTO expediente_profissional (id_profissional, dia, hora_inicio, hora_fim) 
VALUES (1, 2, '09:00:00', '18:00:00');

SELECT * FROM expediente_profissional;
SELECT * FROM expediente_profissional WHERE id_profissional = 1;

UPDATE expediente_profissional 
SET hora_fim = '17:00:00' 
WHERE id_expediente = 1;

DELETE FROM expediente_profissional WHERE id_expediente = 1;


INSERT INTO profissional_especialidade (id_profissional, id_especialidade) 
VALUES (1, 1);

SELECT * FROM profissional_especialidade;

SELECT p.nome, e.nome_especialidade
FROM profissional_especialidade pe
JOIN profissional p ON pe.id_profissional = p.id_profissional
JOIN especialidade e ON pe.id_especialidade = e.id_especialidade;

DELETE FROM profissional_especialidade 
WHERE id_profissional = 1 AND id_especialidade = 1;


INSERT INTO pacote_servico (id_pacote, id_servico, quantidade) 
VALUES (1, 1, 5);

SELECT * FROM pacote_servico;

SELECT p.nome_pacote, s.nome_servico, ps.quantidade
FROM pacote_servico ps
JOIN pacote p ON ps.id_pacote = p.id_pacote
JOIN servico s ON ps.id_servico = s.id_servico;

UPDATE pacote_servico 
SET quantidade = 6 
WHERE id_pacote_servico = 1;

DELETE FROM pacote_servico 
WHERE id_pacote_servico = 1;


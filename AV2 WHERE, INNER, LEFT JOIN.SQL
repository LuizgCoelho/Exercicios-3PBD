-- Lista todos os carros que estão disponíveis para locação no momento.
SELECT 
    v.id,
    v.placa,
    v.marca,
    v.modelo,
    v.tipo,
    v.diaria,
    g.nome AS grupo,
    a.nome AS agencia
FROM Veiculo v
JOIN Grupo_carro g ON v.id_grupo_carro = g.id
JOIN Agencias a ON v.id_agencia = a.id
WHERE v.status = 'Livre';


-- Lista todos os agendamentos realizados.
SELECT
    ag.id AS id_agendamento,
    u.nome AS cliente,
    g.nome AS grupo_carro,
    a1.nome AS agencia_retirada,
    a2.nome AS agencia_devolucao,
    ag.retirada,
    ag.devolucao,
    ag.status
FROM Agendamento ag
JOIN Usuario u ON u.id = ag.id_usuario
JOIN Grupo_carro g ON g.id = ag.id_grupo_carro
JOIN Agencias a1 ON a1.id = ag.id_agencia_retirada
JOIN Agencias a2 ON a2.id = ag.id_agencia_devolucao;


-- Mostra todos os contratos gerados.
SELECT
    c.id AS contrato,
    u.nome AS cliente,
    v.placa,
    v.marca,
    v.modelo,
    f.nome AS motorista,
    c.data_inicio,
    c.data_fim,
    c.status,
    c.termos
FROM Contrato c
JOIN Agendamento a ON a.id = c.id_agendamento
JOIN Usuario u ON u.id = a.id_usuario
JOIN Veiculo v ON v.id = c.id_veiculo
LEFT JOIN Funcionario f ON f.id = c.id_func_motorista;

-- Lista veículos que estão 'Livre' ou em 'Manutenção'.
SELECT
    V.placa,
    V.status AS Status_Veiculo,
    GC.nome AS Grupo_Carro,
    C.data_checklist,
    F.nome AS Ultimo_Inspetor
FROM Veiculo V
LEFT JOIN Checklist C ON V.id = C.id_veiculo 
LEFT JOIN Funcionario F ON C.id_funcionario = F.id
LEFT JOIN Grupo_carro GC ON V.id_grupo_carro = GC.id
WHERE V.status IN ('Livre', 'Manutenção')
ORDER BY C.data_checklist ASC;

-- Retorna somente carros LIVRES que não estão ligados a nenhum contrato no período informado (11/01 a 14/01 de 2026).
SELECT 
    v.id,
    v.placa,
    v.marca,
    v.modelo,
    v.status
FROM Veiculo v
WHERE v.id NOT IN (
    SELECT c.id_veiculo
    FROM Contrato c
    WHERE ('2026-01-11' BETWEEN c.data_inicio AND c.data_fim)
       OR ('2026-01-14' BETWEEN c.data_inicio AND c.data_fim)
)
AND v.status = 'Livre';

-- Mostra quais veículos ESTÃO alugados dentro do período informado.
SELECT 
    v.id,
    v.placa,
    v.marca,
    v.modelo,
    c.data_inicio,
    c.data_fim
FROM Veiculo v
JOIN Contrato c ON c.id_veiculo = v.id
WHERE ('2026-01-11' BETWEEN c.data_inicio AND c.data_fim)
   OR ('2026-01-14' BETWEEN c.data_inicio AND c.data_fim);

-- Mostra todos os contratos com todos os detalhes:
SELECT
    c.id AS contrato,
    u.nome AS cliente,
    v.placa,
    v.marca,
    v.modelo,
    f.nome AS motorista,
    c.data_inicio,
    c.data_fim,
    c.status,
    c.termos
FROM Contrato c
JOIN Agendamento a ON a.id = c.id_agendamento
JOIN Usuario u ON u.id = a.id_usuario
JOIN Veiculo v ON v.id = c.id_veiculo
LEFT JOIN Funcionario f ON f.id = c.id_func_motorista;

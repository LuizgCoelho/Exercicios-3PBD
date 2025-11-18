
SELECT
    C.id AS Contrato_ID,
    U.nome AS Cliente,
    V.placa AS Placa_Veiculo,
    P.valor AS Valor_Pago,
    C.data_inicio,
    P.status AS Status_Pagamento
FROM Contrato C
INNER JOIN Pagamento P ON C.id = P.id_contrato 
INNER JOIN Agendamento A ON C.id_agendamento = A.id
INNER JOIN Usuario U ON A.id_usuario = U.id
INNER JOIN Veiculo V ON C.id_veiculo = V.id
WHERE C.status = 'Ativo';

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

SELECT
    A.nome AS Agencia_Localizacao,
    GC.nome AS Grupo,
    COUNT(V.id) AS Carros_Alocados
FROM Veiculo V
JOIN Agencias A ON V.id_agencia = A.id
JOIN Grupo_carro GC ON V.id_grupo_carro = GC.id
WHERE V.status IN ('Alugado', 'Reservado')
GROUP BY A.nome, GC.nome
ORDER BY Carros_Alocados DESC;

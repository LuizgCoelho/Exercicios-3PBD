SELECT
    V.placa AS Placa,
    V.marca AS Marca,
    V.modelo AS Modelo,
    GC.nome AS Grupo_Carro,
    A.nome AS Agencia_Localizacao,
    V.diaria AS Valor_Diaria,
    V.km AS Quilometragem,
    V.status AS Status
FROM Veiculo V
INNER JOIN Agencias A ON V.id_agencia = A.id
INNER JOIN Grupo_carro GC ON V.id_grupo_carro = GC.id
WHERE V.status = 'Livre'
ORDER BY Agencia_Localizacao, Grupo_Carro;


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

SELECT
    U.nome AS Cliente,
    U.cpf AS CPF_Cliente,
    A.id AS ID_Agendamento,
    C.id AS ID_Contrato,
    V.marca AS Marca,
    V.modelo AS Modelo,
    V.placa AS Placa,
    GC.nome AS Grupo_Carro,
    AR.nome AS Agencia_Retirada,
    AD.nome AS Agencia_Devolucao,
    C.data_inicio AS Data_Inicio_Contrato,
    C.data_fim AS Data_Fim_Contrato,
    C.periodo AS Dias_Aluguel,
    P.valor AS Valor_Total_Pago,
    P.forma AS Forma_Pagamento,
    P.status AS Status_Pagamento
FROM Usuario U
INNER JOIN Agendamento A ON U.id = A.id_usuario
INNER JOIN Contrato C ON A.id = C.id_agendamento
INNER JOIN Veiculo V ON C.id_veiculo = V.id
INNER JOIN Grupo_carro GC ON V.id_grupo_carro = GC.id
INNER JOIN Agencias AR ON A.id_agencia_retirada = AR.id 
INNER JOIN Agencias AD ON A.id_agencia_devolucao = AD.id 
INNER JOIN Pagamento P ON C.id = P.id_contrato
WHERE U.nome = 'Alice Neves';

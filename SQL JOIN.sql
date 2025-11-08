SELECT
  e.nome_especialidade,
  s.nome_servico,
  s.preco,
  s.status
FROM especialidade e
LEFT JOIN servico s ON e.id_especialidade = s.id_especialidade
WHERE e.id_especialidade = 1;


SELECT
  s.nome_servico,
  s.descricao,
  s.preco,
  e.nome_especialidade
FROM servico s
JOIN especialidade e ON s.id_especialidade = e.id_especialidade
WHERE s.id_servico = 1;


SELECT
  p.nome,
  p.email,
  p.status,
  e.nome_especialidade
FROM profissional p
LEFT JOIN profissional_especialidade pe ON p.id_profissional = pe.id_profissional
LEFT JOIN especialidade e ON pe.id_especialidade = e.id_especialidade
WHERE p.id_profissional = 1;


SELECT
  c.nome AS nome_cliente,
  c.email,
  a.data,
  a.hora_inicio,
  s.nome_servico,
  p.nome AS nome_profissional
FROM cliente c
LEFT JOIN agendamento a ON c.id_cliente = a.id_cliente
LEFT JOIN servico s ON a.id_servico = s.id_servico
LEFT JOIN profissional p ON a.id_profissional = p.id_profissional
WHERE
  c.id_cliente = 1
  AND a.data >= CURRENT_DATE;


SELECT
  p.nome_pacote,
  p.valor,
  s.nome_servico,
  ps.quantidade
FROM pacote p
LEFT JOIN pacote_servico ps ON p.id_pacote = ps.id_pacote
LEFT JOIN servico s ON ps.id_servico = s.id_servico
WHERE p.id_pacote = 1;


SELECT
  c.id_contrato,
  c.status,
  c.valor_total,
  cl.nome AS nome_cliente,
  p.data_pagamento,
  p.valor AS valor_pago,
  p.metodo
FROM contrato c
JOIN cliente cl ON c.id_cliente = cl.id_cliente
LEFT JOIN pagamento p ON c.id_contrato = p.id_contrato
WHERE c.id_contrato = 1;


SELECT
  p.id_pagamento,
  p.status,
  p.valor,
  p.data_pagamento,
  c.id_contrato,
  cl.nome AS nome_cliente
FROM pagamento p
JOIN contrato c ON p.id_contrato = c.id_contrato
JOIN cliente cl ON c.id_cliente = cl.id_cliente
WHERE p.id_pagamento = 1;


SELECT
  a.id_agendamento,
  a.data,
  a.hora_inicio,
  a.status,
  c.nome AS nome_cliente,
  p.nome AS nome_profissional,
  s.nome_servico,
  (a.id_contrato IS NOT NULL) AS "Parte de Contrato"
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN profissional p ON a.id_profissional = p.id_profissional
JOIN servico s ON a.id_servico = s.id_servico
WHERE a.id_agendamento = 1;


SELECT
  f.id_fila,
  f.status,
  f.hora_entrada,
  c.nome AS nome_cliente,
  p.nome AS nome_profissional,
  s.nome_servico
FROM fila_espera f
JOIN cliente c ON f.id_cliente = c.id_cliente
JOIN profissional p ON f.id_profissional = p.id_profissional
JOIN servico s ON f.id_servico = s.id_servico
WHERE f.id_fila = 1;


SELECT
  p.nome,
  ep.dia,
  ep.hora_inicio,
  ep.hora_fim
FROM expediente_profissional ep
JOIN profissional p ON ep.id_profissional = p.id_profissional
WHERE ep.id_profissional = 1;


SELECT
  p.nome,
  e.nome_especialidade
FROM profissional_especialidade pe
JOIN profissional p ON pe.id_profissional = p.id_profissional
JOIN especialidade e ON pe.id_especialidade = e.id_especialidade;


SELECT
  p.nome_pacote,
  s.nome_servico,
  ps.quantidade
FROM pacote_servico ps
JOIN pacote p ON ps.id_pacote = p.id_pacote
JOIN servico s ON ps.id_servico = s.id_servico;
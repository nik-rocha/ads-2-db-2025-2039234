-- Nicollas ADS 2 2025: 2039234
-- Carla ADS 2 2025: 2025891

-- 1

SELECT
	m.titulo Título,
 	(
    	SELECT COUNT(*) FROM avaliacao a WHERE m.id_midia = a.id_midia 
    ) AS QuantidadeNotas
FROM midias m
JOIN avaliacao a ON a.id_midia = m.id_midia
ORDER BY a.nota DESC;

-- 2

SELECT
	u.nome Nome,
    u.email Email
FROM usuarios u
WHERE u.email LIKE "%@icloud.com"
AND u.data_cadastro < "2023-01-01";

-- 3

SELECT
	m.titulo Título,
    m.ano_lancamento Ano
FROM midias m
WHERE m.tipo = "Filme"
AND m.ano_lancamento < "2010"
ORDER BY m.ano_lancamento DESC;

-- 4

SELECT
    m.tipo TipoMidia,
    (
    	SELECT COUNT(*) FROM historico_visualizacao hv 
        WHERE hv.id_midia = m.id_midia
    ) AS QuantidadeViews
FROM midias m
JOIN categorias c ON c.id_categoria = m.id_categoria
JOIN historico_visualizacao hv ON hv.id_midia = m.id_midia
GROUP BY m.tipo;

-- 5

SELECT
	m.titulo Título,
   	a.nota NotaAvaliação
FROM midias m
LEFT JOIN avaliacao a ON m.id_midia = a.id_midia
ORDER BY a.nota DESC;

-- 6

SELECT
	CONCAT(u.nome,' ',u.sobrenome) NomeUsuária,
    u.data_nascimento DataNascimento,
    pa.nome_plano NomePlano
FROM usuarios u
JOIN planos_assinatura pa ON u.id_plano = pa.id_plano
WHERE pa.nome_plano IN("Premium", "Família")
AND u.data_nascimento BETWEEN "1989-12-31" AND "2000-01-01";

-- 7

SELECT
	pa.nome_plano AS NomePlano,
    (
    	SELECT SUM(p.valor_pago)
    ) AS TotalPago
FROM planos_assinatura pa
JOIN usuarios u ON u.id_plano = pa.id_plano
JOIN pagamentos p on p.id_usuario = u.id_usuario
WHERE p.data_pagamento BETWEEN "2023-12-31" AND "2025-01-01"
GROUP BY pa.nome_plano
ORDER BY p.valor_pago DESC;


CREATE DATABASE 20212_usjt_ccp1anmcc_hospital;

USE 20212_usjt_ccp1anmcc_hospital;


CREATE TABLE IF NOT EXISTS tb_medico(
	crm INT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_paciente(
	cpf BIGINT PRIMARY KEY,
    nome VARCHAR (200) NOT NULL,
    idade SMALLINT NOT NULL
);

-- 1, 10, 12/05
-- 1, 10, 13/05
CREATE TABLE IF NOT EXISTS tb_consulta(
	crm INT,
    cpf BIGINT,
    data_hora DATETIME,
    PRIMARY KEY (crm, cpf, data_hora),
    CONSTRAINT fk_medico FOREIGN KEY (crm) REFERENCES tb_medico(crm),
    CONSTRAINT fk_paciente FOREIGN KEY (cpf) REFERENCES tb_paciente(cpf)
);

INSERT INTO tb_medico (crm, nome) VALUES (12345, 'José');
INSERT INTO tb_paciente (cpf, nome, idade) VALUES (998877, 'Maria', 22);
INSERT INTO tb_paciente (cpf, nome, idade) VALUES (11111111, 'Antônio', 30);

INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 998877, '2021-10-12 13:53:00');
INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 11111111, '2021-10-17 22:00:00');
INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 998877, '2021-10-13 18:00:00');


SELECT *  FROM tb_medico;
SELECT cpf, nome FROM tb_paciente;

SELECT * FROM tb_consulta ORDER BY data_hora;

SELECT * FROM tb_consulta ORDER BY data_hora DESC;

SELECT
	m.crm, m.nome, c.data_hora
FROM
	tb_medico m
	INNER JOIN tb_consulta c
    ON m.crm = c.crm;
    
SELECT
	m.crm, m.nome 'nome_medico', c.data_hora, p.nome AS 'nome_paciente'
FROM
	tb_medico m
    INNER JOIN tb_consulta c
    ON m.crm = c.crm
    INNER JOIN tb_paciente p
    ON p.cpf = c.cpf;
    
SELECT
	c.data_hora, p.cpf, COUNT(*) as 'total_consultas'
FROM
	tb_consulta c
INNER JOIN tb_paciente p
ON c.cpf = p.cpf
GROUP BY p.cpf;
	



CREATE OR REPLACE VIEW vwProfDepart AS
    SELECT
        CONCAT(p.nome,' ',p.sobrenome) as NomeProfessor,
        d.nome Departamento
    FROM professores p
    JOIN departamentos d ON p.id_departamento = d.id_departamento;
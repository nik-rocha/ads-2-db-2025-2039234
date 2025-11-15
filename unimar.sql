-- Atividade 1:

-- SELECT
-- 	CONCAT(a.nome,' ',a.sobrenome) as NomeCompleto,
--     a.email Email,
--     a.cidade Cidade,
--     a.idade_aluno IdadeAluno,
--     c.nome_curso NomeCurso,
--     t.ano AnoTurma,
--     t.semestre SemestreTurma,
--     m.status StatusMatricula
-- FROM alunos a
-- JOIN matriculas m ON a.id_aluno = m.id_aluno
-- JOIN turmas t ON t.id_turma = m.id_turma
-- JOIN professor_disciplina_curso pdc ON pdc.id_pdc = t.id_pdc
-- JOIN cursos c ON c.id_curso = pdc.id_curso
-- WHERE a.cidade LIKE 'M%' AND
-- a.idade_aluno > 19 AND
-- m.status IN ('Aprovado', 'Cursando') AND
-- c.valor_curso < 2000;

-- Atividade 2:
-- SELECT
-- 	p.nome NomeProfessor,
--     p.sobrenome SobrenomeProfessor,
--     p.email EmailProfessor,
--     di.nome_disciplina NomeDisciplina,
--     c.nome_curso NomeCurso,
--     d.nome NomeDepartamento,
--     d.sigla SiglaDepartamento
-- FROM professores p
-- JOIN departamentos d ON d.id_departamento = p.id_departamento
-- JOIN cursos c ON c.id_departamento = d.id_departamento
-- JOIN grade_curricular gc ON gc.id_curso = c.id_curso
-- JOIN disciplinas di ON di.id_disciplina = gc.id_grade_curricular
-- WHERE p.sobrenome LIKE '%A' AND
-- d.sigla IN ('DCET', 'DCS') AND
-- d.nome LIKE '%A%';

-- Atividade 3:
-- SELECT
-- 	CONCAT(a.nome,' ',a.sobrenome) as NomeCompleto,
--     a.cidade AlunoCidade,
--     c.nome_curso NomeCurso,
--     d.nome_disciplina NomeDisciplina,
--     t.ano TurmaAno,
--     t.semestre TurmaSemestre,
--     m.id_matricula
-- FROM alunos a
-- LEFT JOIN matriculas m ON m.id_aluno = a.id_aluno
-- LEFT JOIN turmas t ON t.id_turma = m.id_turma
-- LEFT JOIN professor_disciplina_curso pdc ON pdc.id_pdc = t.id_pdc
-- LEFT JOIN cursos c ON c.id_curso = pdc.id_curso
-- LEFT JOIN grade_curricular gd ON gd.id_curso = c.id_curso
-- LEFT JOIN disciplinas d ON d.id_disciplina = gd.id_disciplina
-- WHERE a.cidade <> "Marília" AND
-- a.sobrenome LIKE '%r%' AND
-- a.idade_aluno BETWEEN 18 AND 25;

-- Atividade 4:
SELECT 
	CONCAT(a.nome,' ',a.sobrenome) AS NomeCompleto,
    c.nome_curso NomeCurso,
    n.media_final MediaFinal,
    a.cidade CidadeAluno,
    m.status StatusMatricula, 
    CONCAT(p.nome,' ',p.sobrenome) AS NomeProfessor
FROM alunos a
JOIN matriculas m ON m.id_aluno = a.id_aluno
JOIN notas n ON n.id_matricula = m.id_matricula
JOIN turmas t ON t.id_turma = m.id_turma
JOIN professor_disciplina_curso pdc ON pdc.id_pdc = t.id_pdc
JOIN cursos c ON c.id_curso = pdc.id_curso
JOIN professores p ON p.id_professor = pdc.id_professor
WHERE n.media_final > (SELECT AVG(nm.media_final) FROM notas nm) AND
t.ano IN (2024, 2025) AND
m.status IN ('Aprovado', 'Cursando') 
ORDER BY n.media_final DESC
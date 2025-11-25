-- 1
SELECT
	CONCAT(a.nome,' ',a.sobrenome) as NomeCompleto,
    c.nome_curso NomeCurso,
    CONCAT(p.nome,' ',p.sobrenome) as NomeProf
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_aluno = t.id_turma
JOIN professor_disciplina_curso pdc ON pdc.id_pdc = t.id_pdc
JOIN cursos c ON c.id_curso = pdc.id_curso
JOIN professores p ON  p.id_professor = pdc.id_professor
WHERE m.status = 'Cursando'
ORDER BY c.nome_curso, a.nome;

-- 2
SELECT
	c.nome_curso as 'Nome Curso',
    COUNT(m.id_aluno) as TotalAluno
FROM cursos c
JOIN professor_disciplina_curso pdc ON c.id_curso = pdc.id_curso
JOIN turmas t ON t.id_pdc = pdc.id_pdc
JOIN matriculas m ON m.id_turma = t.id_turma
GROUP BY c.id_curso;

-- 3
SELECT
	CONCAT(a.nome,' ',a.sobrenome) as 'Nome do Aluno',
    a.cidade CidadeAluno,
    m.status StatusMatricula
FROM alunos a
LEFT JOIN matriculas m ON a.id_aluno = m.id_matricula;

-- 4
SELECT
	d.nome_disciplina 'Nome da Disciplina',
    CONCAT(p.nome,' ',p.sobrenome) 'Nome do Professor'
FROM disciplinas d
LEFT JOIN professor_disciplina_curso pdc ON pdc.id_disciplina = d.id_disciplina
LEFT JOIN professores p ON p.id_professor = pdc.id_professor;
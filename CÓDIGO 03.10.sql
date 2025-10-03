-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE CURSO;

USE CURSO;

-- Tabela Aluno
CREATE TABLE Aluno (
  Id_Aluno INT PRIMARY KEY AUTO_INCREMENT,
  Nome_Aluno VARCHAR(255),
  Email VARCHAR(255),
  Data_Nascimento DATE
);

-- Tabela Curso
CREATE TABLE Curso (
  Id_Curso INT PRIMARY KEY AUTO_INCREMENT,
  Titulo VARCHAR(255),
  Descricao VARCHAR(255),
  Carga_Horaria INT,
  Status VARCHAR(255)
);

-- Tabela Inscrições
CREATE TABLE Inscricoes (
  Id_Inscricao INT PRIMARY KEY AUTO_INCREMENT,
  Data_Inscricao DATE,
  Aluno_Id INT,
  Curso_Id INT,
  FOREIGN KEY (Aluno_Id) REFERENCES Aluno(Id_Aluno),
  FOREIGN KEY (Curso_Id) REFERENCES Curso(Id_Curso)
);

-- Tabela Avaliacoes
CREATE TABLE Avaliacoes (
  Id_Avaliacao INT PRIMARY KEY AUTO_INCREMENT,
  Inscricao_Id INT,
  Nota DECIMAL(5,2),
  Comentario TEXT,
  FOREIGN KEY (Inscricao_Id) REFERENCES Inscricoes(Id_Inscricao)
);

INSERT INTO Aluno (Id_Aluno, Nome_Aluno, Email, Data_Nascimento) VALUES
(01, 'João Silva', 'joao.silva@email.com', '2000-05-12'),
(02, 'Maria Oliveira', 'maria.oliveira@email.com', '1999-08-23'),
(03, 'Pedro Santos', 'pedro.santos@email.com', '2001-01-15'),
(04, 'Ana Costa', 'ana.costa@email.com', '1998-11-30'),
(05, 'Maria Eduarda', 'maria.eduarda@email.com', '2009-03-24');

INSERT INTO Curso (Titulo, Descricao, Carga_Horaria, Status) VALUES
('Banco de Dados', 'Curso de fundamentos de bancos de dados relacionais', 60, 'ativo'),
('Programação Web', 'Curso de desenvolvimento web com HTML, CSS e JS', 80, 'ativo'),
('Redes de Computadores', 'Curso introdutório sobre redes e protocolos', 40, 'ativo'),
('Engenharia de Software', 'Curso de práticas e metodologias de software', 70, 'ativo'),
('Inteligência Artificial', 'Curso básico de IA e aprendizado de máquina', 100, 'inativo'); -- curso inativo

INSERT INTO Inscricoes (Data_Inscricao, Aluno_Id, Curso_Id) VALUES
('2025-01-15', 1, 1), 
('2025-01-16', 2, 2), 
('2025-01-17', 3, 3), 
('2025-01-18', 4, 4), 
('2025-01-19', 5, 1); 

INSERT INTO Avaliacoes (Inscricao_Id, Nota, Comentario) VALUES
(1, 9.0, 'Excelente curso, muito bem explicado'),
(2, 8.5, 'Gostei bastante, conteúdo atualizado'),
(3, 7.0, 'Bom, mas poderia ter mais exemplos práticos');

-- PARTE 4

select * from Aluno;

UPDATE Aluno 
SET Email = 'joaosilva@email.com'
WHERE Id_Aluno = 1;

UPDATE Curso
SET Carga_Horaria = 70
WHERE Id_Curso = 2;

UPDATE Aluno
SET Nome_Aluno = 'Pedro dos Santos'
WHERE Id_Aluno = 3;

UPDATE Curso
SET Status = 'Ativo'
WHERE Id_Curso = 4; 

UPDATE Avaliacoes
SET Nota = 9.0
WHERE Id_Avaliacao = 2;

-- PARTE 5

DELETE FROM Inscricoes
WHERE Id_Inscricao = 4; 

DELETE FROM Inscricoes
WHERE Curso_Id = 4;

DELETE FROM Curso
WHERE Id_Curso = 4;

DELETE FROM Avaliacoes
WHERE Id_Avaliacao = 3;

DELETE FROM Avaliacoes
WHERE Inscricao_Id IN (SELECT Id_Inscricao FROM Inscricoes WHERE Aluno_Id = 5);

DELETE FROM Inscricoes
WHERE Aluno_Id = 5;

DELETE FROM Aluno
WHERE Id_Aluno = 5;

-- PARTE 6


SELECT Nome_Aluno, Email FROM Aluno;

SELECT * FROM Curso
WHERE Carga_Horaria > 30;

SELECT * FROM Curso
WHERE Status = 'Inativo';

SELECT * FROM Aluno
WHERE YEAR(Data_Nascimento) > 1995;

SELECT * FROM Inscricao
WHERE Nota > 9;

SELECT COUNT(*) AS Total_Cursos FROM Curso;

SELECT * FROM Curso
ORDER BY Carga_Horaria DESC
LIMIT 3;









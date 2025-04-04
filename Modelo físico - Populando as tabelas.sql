
#Cadastro dos professores
insert into tbl_professores (nome, data_nascimento, cpf, rg, email) values
	('Osmar da Silva de Andrade', '1954-11-12', '654.157.094-59', 5464512031, 'osmarsa@yahoo.com.br'),
    ('Adriana Menezes', '1966-06-25', '984.183.441-59', '7561014011', 'menezes1966@gmail.com'),
    ('Antônia Rogéria de Alencar', '1979-03-01', '305.068.704-01', '9116510657', 'toninhatempobom@bol.com.br');
insert into tbl_endereco_professores (logradouro, numero, complemento, bairro, cep, cidade, estado, pais, id_professores) values 
	('Rua Vale Grande', '615', 'Casa', 'Grande', '84100-110', 'Tempo Bom', 'RS', 'Brasil', 1),
    ('Avenida Antônio de Queiroz', '1942', 'Casa', 'Grande', '84100-110', 'Tempo Bom', 'RS', 'Brasil', 2),
    ('Rua Helena Nobre', '54 AP42', 'Condomínio Superleve', 'Brasil', '84120-870', 'Tempo Bom', 'RS', 'Brasil', 3);
insert into tbl_telefones_professores (telefone, id_professores) values 
	('53980119112', 1),
    ('53987015150', 1),
    ('53950480780', 2),
    ('53938043011', 3);

#Cadastro das disciplinas
insert into tbl_disciplinas (nome, id_professores) values 
	('Database Modeling & SQL', 1),
    ('Produção de Jogos em HTML5', 1),
    ('Ética e Moral', 2),
    ('Técnicas de Vendas', 2),
    ('Matemática Básica', 3),
    ('Matemática Financeira', 3);

#Cadastro dos cursos
insert into tbl_area_curso (area) values ('Tecnologia da Informação'), ('Ciências Exatas');
insert into tbl_tipo_curso (tipo) values ('Bacharelado'), ('Tecnólogo'), ('Licenciatura'), ('Especialização'), ('Mestrado'), ('Doutorado');
insert into tbl_disponibilidade_curso (disponibilidade) values ('Disponível'), ('Indisponível');
insert into tbl_cursos (nome, id_tipo_curso, id_area_curso, semestres, parcelas_qtde, parcela_valor, id_disponibilidade_curso) values
	('Desenvolvimento de Jogos', 4, 1, 3, 18, 139.90, 1),
    ('Gestão Comercial', 2, 2, 5, 30, 149.90, 1);
insert into tbl_cursos_disciplinas (id_cursos, id_disciplinas) values 
	(1, 1),
    (1, 2),
    (1, 3),
    (1, 5),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6);

#Cadastro dos alunos
insert into tbl_forma_pagamento (forma_pagamento) values ('Pix'), ('Boleto bancário'), ('Cartão de crédito'), ('Cartão de débito');
insert into tbl_situacao_financeira (situacao) values ('Em dia'), ('Mensalidade por vencer'), ('Mensalidade em atraso'), ('Inadimplente');
insert into tbl_alunos (nome, data_nascimento, cpf, rg, email, ano_ensino_medio, id_forma_pagamento, id_situacao_financeira) values 
	('Marcelo Soares de Azambuja', '2000-01-01', '080.087.135-54', '9804507004', 'supermarcelo1@msn.com', 2017, 1, 1),
    ('Gisele Campos', '1988-02-29', '801.084.987-10', '5056873212', 'giselecampostb@icloud.com', 2006, 2, 2),
    ('Alice da Cunha Peres', '1965-03-10', '189.981.080-59', '8554080711', '1965ouro@gmail.com', 1983, 2, 1),
	('Mário Neves Santos Silva', '2004-10-30', '804.845.305-29', '8073510244', 'marionssilva@yahoo.com.br', 2021, 1, 3),
    ('Rafael Márcio Oliveira Pereira', '2002-11-24', '907.087.576-18', '6878036084', 'rmop000000@gmail.com', 2019, 4, 1);
insert into tbl_endereco_alunos (logradouro, numero, complemento, bairro, cep, cidade, estado, pais, id_alunos) values 
	('Rua Helena Nobre', '54 AP26', 'Condomínio Superleve', 'Brasil', '84120-870', 'Tempo Bom', 'RS', 'Brasil', 1),
    ('Rua Helena Nobre', '54 AP47', 'Condomínio Superleve', 'Brasil', '84120-870', 'Tempo Bom', 'RS', 'Brasil', 2),
    ('Avenida 7 de Setembro', '505', 'Casa', 'Itália', '84120-587', 'Tempo Bom', 'RS', 'Brasil', 3),
    ('Rua Flores da Cunha', '2654', 'Casa dos fundos', 'Antônio Alves', '84120-348', 'Tempo Bom', 'RS', 'Brasil', 4),
    ('Rua Marechal Deodoro', '3158', 'Casa', 'Centro', '84120-010', 'Tempo Bom', 'RS', 'Brasil', 5);
insert into tbl_telefones_alunos (telefone, id_alunos) values 
	('53908702077', 1),
    ('53980750704', 2),
    ('53987507080', 3),
    ('53938070542', 4),
    ('53950870478', 5);

#Cadastro das turmas
insert into tbl_turmas (nome, data_inicio, id_cursos) values 
	('DJ02', '2024-02-01', 1),
	('GC04', '2024-02-01', 2);
insert into tbl_situacao_alunos_cursos (situacao) values ('Pendente'), ('Cursando'), ('Trancado'), ('Outros');
insert into tbl_turmas_alunos (id_turmas, id_alunos, id_situacao_alunos_cursos) values 
	(1, 1, 2),
    (1, 2, 2),
    (1, 3, 2),
	(2, 4, 2),
    (2, 5, 2);

#Cadastro das disciplinas e notas obtidas
insert into tbl_situacao_notas (situacao) values ('Cursando'), ('Aprovado'), ('Recuperação'), ('Reprovado'), ('Não cursou'), ('Outros');
#	Disciplinas encerradas
insert into tbl_notas (id_alunos, id_cursos, id_disciplinas, nota, id_situacao_notas) values 
	(1, 1, 1, 7.1, 2),
    (2, 1, 1, 8.3, 2),
    (3, 1, 1, 6.8, 2),
    (4, 2, 3, 7.8, 2),
    (5, 2, 3, 9.8, 2),
	(1, 1, 2, 8.3, 2),
	(2, 1, 2, 4.5, 3),
    (3, 1, 2, 9.9, 2),
    (4, 2, 4, 5.7, 3),
    (5, 2, 4, 10.0, 2);
# Disciplinas que não estão encerradas
insert into tbl_notas (id_alunos, id_cursos, id_disciplinas, id_situacao_notas) values 
	(1, 1, 3, 1),
    (2, 1, 3, 1),
    (3, 1, 3, 1),
    (4, 2, 5, 1), 
    (5, 2, 5, 1),
    (1, 1, 5, 5),
    (2, 1, 5, 5),
    (3, 1, 5, 5),
    (4, 2, 6, 5),
    (5, 2, 6, 5);


#select * from tbl_professores;
#select * from tbl_endereco_professores;
#select * from tbl_telefones_professores;
#select * from tbl_disciplinas;
#select * from tbl_area_curso;
#select * from tbl_tipo_curso;
#select * from tbl_disponibilidade_curso;
#select * from tbl_cursos;
#select * from tbl_cursos_disciplinas;
#select * from tbl_forma_pagamento;
#select * from tbl_situacao_financeira;
#select * from tbl_alunos;
#select * from tbl_endereco_alunos;
#select * from tbl_telefones_alunos;
#select * from tbl_turmas;
#select * from tbl_situacao_alunos_cursos;
#select * from tbl_turmas_alunos;
#select * from tbl_situacao_notas;
#select * from tbl_notas;


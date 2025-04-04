
create database db_faculdade_sul_e_ar;
use db_faculdade_sul_e_ar;


#Cria as tabelas dos professores
create table tbl_professores (
	id int not null auto_increment unique,
    nome varchar(45) not null,
    data_nascimento date not null,
    cpf varchar(14) not null,
    rg varchar(14) not null,
    email varchar(255) not null
);
create table tbl_endereco_professores (
	id int not null auto_increment unique,
    logradouro varchar(45) not null,
    numero varchar(10) not null,
    complemento varchar(45),
    bairro varchar(45) not null,
    cep varchar(10) not null,
    cidade varchar(45) not null,
    estado varchar(2) not null,
    pais varchar(45) not null,
    id_professores int not null,
    constraint fk_professores_endereco foreign key (id_professores) references tbl_professores(id)
);
create table tbl_telefones_professores (
	id int not null auto_increment unique,
    telefone varchar(20),
    id_professores int not null,
    constraint fk_professores_telefones foreign key (id_professores) references tbl_professores(id)
);

#Cria a tabela das disciplinas
create table tbl_disciplinas (
	id int not null auto_increment unique,
    nome varchar(45),
    id_professores int not null,
    constraint fk_professores_disciplinas foreign key (id_professores) references tbl_professores(id)
);

#Cria as tabelas dos cursos
create table tbl_area_curso (
	id int not null auto_increment unique,
    area varchar(45)
);
create table tbl_tipo_curso (
	id int not null auto_increment unique,
    tipo varchar(45)
);
create table tbl_disponibilidade_curso (
	id int not null auto_increment unique,
    disponibilidade varchar(45)
);
create table tbl_cursos (
	id int not null auto_increment unique,
    nome varchar(45) not null,
    id_tipo_curso int not null,
    id_area_curso int not null,
    semestres int not null,
    parcelas_qtde int not null,
    parcela_valor decimal(7,2) not null,
    id_disponibilidade_curso int not null,
    constraint fk_curso_tipo foreign key (id_tipo_curso) references tbl_tipo_curso(id),
    constraint fk_curso_area foreign key (id_area_curso) references tbl_area_curso(id),
    constraint fk_curso_disponibilidade foreign key (id_disponibilidade_curso) references tbl_disponibilidade_curso(id)
);
create table tbl_cursos_disciplinas (
	id int not null auto_increment unique,
    id_cursos int not null,
    id_disciplinas int not null,
    constraint fk_disciplina_curso foreign key (id_cursos) references tbl_cursos(id),
    constraint fk_curso_disciplina foreign key (id_disciplinas) references tbl_disciplinas(id)
);

#Cria as tabelas de alunos
create table tbl_forma_pagamento (
	id int not null auto_increment unique,
    forma_pagamento varchar(30)
);
create table tbl_situacao_financeira (
	id int not null auto_increment unique,
    situacao varchar(25)
);
create table tbl_alunos (
	id int not null auto_increment unique,
    nome varchar(45) not null,
    data_nascimento date not null,
    cpf varchar(14) not null,
    rg varchar(14) not null,
    email varchar(255) not null,
    ano_ensino_medio int not null,
    id_forma_pagamento int not null,
    id_situacao_financeira int not null,
    constraint fk_aluno_forma_pgto foreign key (id_forma_pagamento) references tbl_forma_pagamento(id),
    constraint fk_aluno_sit_fin foreign key (id_situacao_financeira) references tbl_situacao_financeira(id)
);
create table tbl_endereco_alunos (
	id int not null auto_increment unique,
    logradouro varchar(45) not null,
    numero varchar(10) not null,
    complemento varchar(45),
    bairro varchar(45) not null,
    cep varchar(10) not null,
    cidade varchar(45) not null,
    estado varchar(2) not null,
    pais varchar(45) not null,
    id_alunos int not null,
    constraint fk_alunos_endereco foreign key (id_alunos) references tbl_alunos(id)
);
create table tbl_telefones_alunos (
	id int not null auto_increment unique,
    telefone varchar(20) not null,
    id_alunos int not null,
    constraint fk_alunos_telefones foreign key (id_alunos) references tbl_alunos(id)
);

#Cria as tabelas de turmas
create table tbl_turmas (
	id int not null auto_increment unique,
    nome varchar(45) not null,
    data_inicio date not null,
    id_cursos int not null,
    constraint fk_turma_curso foreign key (id_cursos) references tbl_cursos(id)
);
create table tbl_situacao_alunos_cursos (
	id int not null auto_increment unique,
    situacao varchar(45) not null
);
create table tbl_turmas_alunos (
	id int not null auto_increment unique,
    id_turmas int not null,
    id_alunos int not null,
    id_situacao_alunos_cursos int not null,
    constraint fk_aluno_turma foreign key (id_turmas) references tbl_turmas(id),
    constraint fk_turma_aluno foreign key (id_alunos) references tbl_alunos(id),
    constraint fk_aluno_curso_sit foreign key (id_situacao_alunos_cursos) references tbl_situacao_alunos_cursos(id)
);

#Cria as tabelas de notas
create table tbl_situacao_notas (
	id int not null auto_increment unique,
    situacao varchar(20)
);
create table tbl_notas (
	id int not null auto_increment unique,
    id_alunos int not null,
    id_cursos int not null,
    id_disciplinas int not null,
    nota decimal(3,1),
    id_situacao_notas int not null,
    constraint fk_nota_aluno foreign key (id_alunos) references tbl_alunos(id),
    constraint fk_nota_curso foreign key (id_cursos) references tbl_cursos(id),
    constraint fk_nota_disciplina foreign key (id_disciplinas) references tbl_disciplinas(id),
    constraint fk_nota_situacao foreign key (id_situacao_notas) references tbl_situacao_notas(id)
);

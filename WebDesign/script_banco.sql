create database if not exists wssp;
use wssp;
create table if not exists site (
	id int primary key auto_increment,
    titulo varchar(255) unique,
    logo varchar(500),
    layout tinyint,
    back_menu varchar(255),
    fonte_menu varchar(255),
    back_rodape varchar(255),
    fonte_rodape varchar(255),
    foto_empresa varchar(500),
    foto_produto varchar(500),
    foto_cliente varchar(500),
    fonte_chamada varchar(255),
    back_chamada varchar(255),
    telefone varchar(15),
    email varchar(255),
    back_rodape2 varchar(255),
    fonte_rodape2 varchar(255)
);
create table if not exists foto_slide (
	id int primary key auto_increment,
    id_site int not null,
    caminho varchar(500),
    foreign key (id_site) references site(id) on delete cascade
);
create table if not exists produto (
	id int primary key auto_increment,
    id_site int not null,
    descricao varchar(255),
    foto varchar(500),
    destaque boolean,
    foreign key(id_site) references site(id) on delete cascade
);
create view view_site as
SELECT 	s.id, 
		s.titulo, 
		s.logo, 
        s.layout, 
        s.back_menu,
        s.fonte_menu,
        s.back_rodape,
        s.fonte_rodape,
        s.foto_empresa,
        s.foto_produto,
        s.foto_cliente,
        s.fonte_chamada,
        s.back_chamada,
        s.telefone,
        s.email, 
        s.back_rodape2,
        s.fonte_rodape2,
        f.id id_foto,
        f.caminho
FROM site s left join foto_slide f on s.id = f.id_site;
    
    
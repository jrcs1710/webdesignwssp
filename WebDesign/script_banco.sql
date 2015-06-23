create database if not exists wssp;
use wssp;
create table if not exists site (
	id int primary key,
    titulo varchar(255),
    logo varchar(500),
    layout char(1),
    back_menu varchar(255),
    fonte_menu varchar(255),
    back_rodape varchar(255),
    fonte_rodape varchar(255),
    foto_empresa varchar(500),
    foto_produto varchar(500),
    foto_galeria varchar(500),
    fonte_chamada varchar(255),
    back_chamada varchar(255),
    telefone varchar(12),
    email varchar(255),
    back_rodape2 varchar(255),
    fonte_rodape2 varchar(255)
);
create table if not exists foto_slide (
	id int primary key,
    id_site int not null,
    caminho varchar(500),
    foreign key (id_site) references site(id)
);
create table if not exists produto (
	id int primary key,
    id_site int not null,
    descricao varchar(255),
    foto varchar(500),
    destaque boolean,
    foreign key(id_site) references site(id)
);
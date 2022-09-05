create database tre2022;
use tre2022;



create table municipio(
    cd_municipio INT not null,
    nm_municipio VARCHAR(45) not null,
    CONSTRAINT pk_municipio Primary Key(cd_municipio)
);



create table zona(
    cd_zona INT not null,
    nm_zona VARCHAR(50) not null,
    cd_municipio INT not null,
    CONSTRAINT pk_zona Primary Key(cd_zona),
    CONSTRAINT fk_zona_municipio Foreign Key(cd_municipio) REFERENCES municipio(cd_municipio)
);



create table secao(
    cd_secao INT not null,
    cd_zona INT not null,
    CONSTRAINT pk_secao Primary Key(cd_secao,cd_zona),
    CONSTRAINT fk_secao_zona Foreign Key(cd_zona) REFERENCES zona(cd_zona)
);



create table eleitor(
    cd_eleitor int not null,
    nm_eleitor varchar(50) not null,
    cd_secao int not null,
    cd_zona int not null,
    CONSTRAINT pk_eleitor Primary Key(cd_eleitor),
    CONSTRAINT fk_eleitor_secao Foreign Key(cd_secao, cd_zona) REFERENCES secao(cd_secao, cd_zona)
);



create table partido(
    cd_partido int not null,
    nm_partido varchar(30) not null,
    sg_partido varchar(10) not null,
    CONSTRAINT pk_partido Primary Key(cd_partido)
);



create table candidato(
    cd_candidato int not null,
    nm_candidato varchar(50) not null,
    nm_apelido_candidato varchar(50) not null,
    cd_partido int not null,
    CONSTRAINT pk_candidato Primary Key(cd_candidato),
    CONSTRAINT fk_candidato_partido Foreign Key(cd_partido) REFERENCES partido(cd_partido)
);



create table votacao(
    cd_secao int not null,
    cd_zona int not null,
    cd_candidato int not null,
    qt_votacao int,
    CONSTRAINT pk_votacao Primary Key(cd_secao, cd_zona, cd_candidato),
    CONSTRAINT fk_votacao_secao Foreign Key(cd_secao, cd_zona) REFERENCES secao(cd_secao, cd_zona),
    CONSTRAINT fk_votacao_candidato Foreign Key(cd_candidato) REFERENCES candidato(cd_candidato)
);


insert into Municipio value (01,"Santos");
Insert into Municipio value (02,"São Vicente");
Insert into Municipio value (03,"Praia Grande");



insert into zona values (10, "Etec Aristóteles",01);
insert into zona values (11, "Fernando de Azevedo",01);
insert into zona values (12, "Etec Escolástica Rosa",01);

insert into zona values (13, "Duque de Caixas",02);
insert into zona values (14, "Objetivo",02);
insert into zona values (15, "Etec Ruth Cardoso",02);

insert into zona values (16, "Etec Praia Grande",03);
insert into zona values (17, "Escola Fortec Praia Grande",03);
insert into zona values (18, "Colégio Adventista de Praia Grande",03);

insert into secao values (100,10);
insert into secao values (101,10);
insert into secao values (102,10);

insert into secao values (103,11);
insert into secao values (104,11);
insert into secao values (105,11);

insert into secao values (106,12);
insert into secao values (107,12);
insert into secao values (108,12);

insert into secao values (109,13);
insert into secao values (110,13);
insert into secao values (111,13);

insert into secao values (112,14);
insert into secao values (113,14);
insert into secao values (114,14);

insert into secao values (115,15);
insert into secao values (116,15);
insert into secao values (117,15);


insert into secao values (118,16);
insert into secao values (119,16);
insert into secao values (120,16);

insert into secao values (121,17);
insert into secao values (122,17);
insert into secao values (123,17);

insert into secao values (124,18);
insert into secao values (125,18);
insert into secao values (126,18);

insert into eleitor values (1234,"João.M",100,10);
insert into eleitor values (20450,"João.P",101,10);
insert into eleitor values (20451,"Luan.C",102,10);

insert into eleitor values (20452,"Gabriel.D",103,11);
insert into eleitor values (20453,"Gabriel.R",104,11);
insert into eleitor values (20454,"Leonardo.N",105,11);

insert into eleitor values (20455,"Pedro.S",106,12);
insert into eleitor values (20456,"Mariana.S",107,12);
insert into eleitor values (20457,"Marcela.L",108,12);

insert into eleitor values (20458,"Marcela.L",109,13);
insert into eleitor values (20459,"Raquel.A",110,13);
insert into eleitor values (20460,"Bruna.R",111,13);

insert into eleitor values (20461,"Gustavo.R",112,14);
insert into eleitor values (20462,"Andrey.V",113,14);
insert into eleitor values (20463,"Alexandro.S",114,14);

insert into eleitor values (20464,"Irk.B",115,15);
insert into eleitor values (20465,"Edson.L",116,15);
insert into eleitor values (20466,"Luiz.T",117,15);

insert into eleitor values (20467,"Débora.K",118,16);
insert into eleitor values (20468,"Andrea.S",119,16);
insert into eleitor values (20469,"José.C",120,16);

insert into eleitor values (20470,"Carlos.C",121,17);
insert into eleitor values (20471,"Matheus.J",122,17);
insert into eleitor values (20472,"Luan.J",123,17);

insert into eleitor values (20473,"Rafael.S",124,18);
insert into eleitor values (20474,"Rodrigo.A",125,18);
insert into eleitor values (20475,"Marcela.B",126,18);

insert into partido values (1013,"Partido dos trabalhador","PT");
insert into partido values (1014,"Democratas","DEM");
insert into partido values (1015,"Partido Liberal","PL");

insert into candidato values (013,"luiz inácio lula da silva","lula",1013);
insert into candidato values (011,"Fernando Haddad","Haddad",1013);
insert into candidato values (012,"André Quintão","Quintão",1013);

insert into candidato values (010,"Bruno Araújo","Bruno",1014);
insert into candidato values (09,"Bruna Furlan","Furlan",1014);
insert into candidato values (08,"Nelson Marchenzan. Jr","Marchenzan",1014);

insert into candidato values (017,"Jair Messias Bolsonaro","Bolsonaro",1015);
insert into candidato values (018, "Luiz Nishimori ","Nishimori",1015);
insert into candidato values (019, "Gelson Azevedo ","Azevedo",1015);

insert into votacao values (100,10,13,250);
insert into votacao values (101,10,8,10);
insert into votacao values (102,10,17,100);

insert into votacao values (103,11,9,1000);
insert into votacao values (104,11,13,94);
insert into votacao values (105,11,17,250);

insert into votacao values (106,12,19,10);
insert into votacao values (107,12,13,25);
insert into votacao values (108,12,11,100);

insert into votacao values (109,13,10,85);
insert into votacao values (110,13,17,1);
insert into votacao values (111,13,13,1);

insert into votacao values (112,14,12,15);
insert into votacao values (113,14,11,100);
insert into votacao values (114,14,9,35);

insert into votacao values (115,15,11,111);
insert into votacao values (116,15,9,112);
insert into votacao values (117,15,13,3);

insert into votacao values (118,16,17,4);
insert into votacao values (119,16,13,14);
insert into votacao values (120,16,17,4);

insert into votacao values (121,17,11,400);
insert into votacao values (122,17,9,4000);
insert into votacao values (123,17,10,12);

insert into votacao values (124,18,11,400);
insert into votacao values (125,18,19,11);
insert into votacao values (126,18,18,1);
select*from votacao;


use mydb;

insert into medico
	(id, nome, tipo_profissional, dados_pessoais_id)
values
	(1, "Douglas Barbosa", "generalista", 1),
	(2, "Felipe Raposo", "especialista", 2),
	(3, "Roberto Silva", "residente", 3),
	(4, "Claudio Renan", "generalista", 4),
	(5, "Jonas Renato", "especialista", 5),
	(6, "Debora Neves", "generalista", 6),
	(7, "Claudia Penanço", "residente", 7),
	(8, "Ken Renanço", "generalista", 8),
	(9, "Noemi Silva", "especialista", 9),
	(10, "Helen Amanda", "residente", 10);

insert into dados_pessoais
	(id, nascimento, endereco, telefone, email, cpf, rg)
values
	(1, "2000-11-16", "rua joao 123", "11 993994996", "emailpadrao@gmail.com", "1121111111", "222222223"),
	(2, "2000-05-06", "rua maria 22", "11 994994996", "emailpadrao2@gmail.com", "1311111111", "222222242"),
	(3, "2000-01-23", "rua elias 33", "11 995994996", "emailpadrao3@gmail.com", "1111511111", "222222252"),
	(4, "2000-03-02", "rua flavio 6", "11 996994996", "emailpadrao4@gmail.com", "1161111111", "222222262"),
	(5, "2000-08-12", "rua joao 43", "11 993794996", "emailpadrao5@gmail.com", "1118111111", "222222227"),
	(6, "2000-12-21", "rua maria 23", "11 998994996", "emailpadrao6@gmail.com", "1112111111", "222222282"),
	(7, "2000-07-17", "rua elias 223", "11 999994996", "emailpadrao7@gmail.com", "1331111111", "222222922"),
	(8, "2000-01-30", "rua juan 33", "11 993104996", "emailpadrao8@gmail.com", "1111411111", "222222122"),
	(9, "2000-03-22", "rua flavio 63", "11 991394996", "emailpadrao9@gmail.com", "1151111111", "222232222"),
	(10, "2000-02-27", "rua lenne 643", "11 912994996", "emailpadrao10@gmail.com", "1611111111", "224222222");

insert into especialidades
	(id, nome)
values
	(1, "pediatria"),
	(2, "clínica geral"),
	(3, "gastroenterologia"),
	(4, "dermatologia");

insert into medico_especialidade
	(medico_id, especialidade_id)
values
	(1, 1),
	(1, 3),
	(2, 4),
	(3, 2),
	(3, 1),
	(4, 4),
	(5, 1),
	(5, 2),
	(6, 3),
	(7, 1),
	(7, 2),
	(7, 4),
	(8, 1),
	(8, 2),
	(8, 3),
	(8, 4),
	(9, 4),
	(9, 1),
	(10, 2),
	(10, 3);
    
alter table medico
add column em_atividade varchar(255) not null default "Sim";

update medico
set em_atividade = "Não"
where id > 8;

select * from medico;
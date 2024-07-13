use mydb;

insert into paciente
	(id, nome, dados_pessoais_id)
values
	(1, "Filipi Renan", 11),
	(2, "Pedro orochi", 12),
	(3, "Carlos da silva", 13),
	(4, "Gustavo Lasaros", 14),
	(5, "Renan Oliveira", 15),
	(6, "Marcos soldado", 16),
	(7, "Mariana Hellen", 17),
	(8, "Renan João", 18),
	(9, "Paulo Marcis", 19),
	(10, "Amanda Flavico", 20),
	(11, "Debora Musk", 21),
	(12, "Fabio Junior", 22),
	(13, "Fabricio Melan", 23),
	(14, "Venacia Maria", 24),
	(15, "Cradia Fenancio", 25);

insert into dados_pessoais
	(id, nascimento, endereco, telefone, email, cpf, rg)
values
	(11, "2000-11-16", "rua joao 23", "11 993994996", "emailpadrao1@gmail.com", "1121111112", "122222223"),
	(12, "2000-05-06", "rua maria 12", "11 994994996", "emailpadrao21@gmail.com", "1311111113", "322222242"),
	(13, "2000-01-23", "rua elias 43", "11 995994996", "emailpadrao32@gmail.com", "1111511114", "422222252"),
	(14, "2000-03-02", "rua flavio 7", "11 996994996", "emailpadrao14@gmail.com", "1161111115", "522222262"),
	(15, "2000-08-12", "rua joao 21", "11 993794996", "emailpadrao52@gmail.com", "1118111116", "262222227"),
	(16, "2000-12-21", "rua maria 11", "11 998994996", "emailpadrao36@gmail.com", "1112111117", "622222282"),
	(17, "2000-07-17", "rua elias 13", "11 999994996", "emailpadrao75@gmail.com", "1331111118", "722222922"),
	(18, "2000-01-30", "rua juan 22", "11 993104996", "emailpadrao58@gmail.com", "1111411119", "822222122"),
	(19, "2000-03-22", "rua flavio 56", "11 991394996", "emailpadrao69@gmail.com", "1151111122", "922232222"),
	(20, "2000-02-27", "rua lenne 124", "11 912994996", "emailpadrao120@gmail.com", "1611111121", "234222222"),
	(21, "2000-11-16", "rua joao 123", "11 993994996", "emailpadrao56@gmail.com", "1121111122", "212422223"),
	(22, "2000-05-06", "rua maria 11", "11 994994996", "emailpadrao123@gmail.com", "1311111123", "234222242"),
	(23, "2000-01-23", "rua elias 12", "11 995994996", "emailpadrao99@gmail.com", "1111511124", "332222252"),
	(24, "2000-03-02", "rua flavio 23", "11 996994996", "emailpadrao97@gmail.com", "1161111125", "892222262"),
	(25, "2000-08-12", "rua joao 5", "11 993794996", "emailpadrao75@gmail.com", "11181111126", "999222227");
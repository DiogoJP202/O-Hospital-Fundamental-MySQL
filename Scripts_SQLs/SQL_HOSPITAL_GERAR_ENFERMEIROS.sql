use mydb;

insert into dados_pessoais
	(id, nascimento, endereco, telefone, email, cpf, rg)
values 
	(26, "1999-10-14", "rua joao 23", "11 923944996", "emailpadrao12@gmail.com", "1121111132", "132222223"),
	(27, "1985-09-11", "rua maria 12", "11 944924996", "emailpadrao212@gmail.com", "1311111133", "332222242"),
	(28, "1982-06-25", "rua elias 43", "11 945294996", "emailpadrao322@gmail.com", "1111511134", "432222252"),
	(29, "1989-11-21", "rua flavio 7", "11 926994996", "emailpadrao142@gmail.com", "1161111135", "532222262"),
	(30, "1999-04-22", "rua joao 21", "11 991794996", "emailpadrao522@gmail.com", "1118111133", "263222227"),
	(31, "1989-03-15", "rua maria 11", "11 958994996", "emailpadrao362@gmail.com", "1112111137", "632222282"),
	(32, "2000-07-17", "rua elias 13", "11 969994996", "emailpadrao752@gmail.com", "1331111138", "732222922"),
	(33, "1970-01-30", "rua juan 22", "11 993204996", "emailpadrao582@gmail.com", "1111411133", "832222122"),
	(34, "2001-03-22", "rua flavio 56", "11 991354996", "emailpadrao692@gmail.com", "1151111133", "932232222"),
	(35, "2000-02-27", "rua lenne 124", "11 912554996", "emailpadrao1202@gmail.com", "1611111133", "234232222");

insert into enfermeiro
	(id, nome, cre, dados_pessoais_id)
values 
	(1, "Claudia Maria", "114181", 26),
	(2, "Maria Antonia", "214121", 27),
    (3, "Fernando Rosarie", "233181", 28),
    (4, "Felipe Cloutino", "333181", 29),
    (5, "Ranato Garcia ", "413481", 30),
    (6, "Maria Fernadez", "512181", 31),
    (7, "Fabricio Correia", "134281", 32),
    (8, "Mellon Apple", "213122", 33),
    (9, "Jazion Joao", "214613", 34),
    (10, "Ana Biatriz", "616181", 35);
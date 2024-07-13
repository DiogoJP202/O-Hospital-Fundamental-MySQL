use mydb;

insert into consulta
    (id, data, valor, convenios_id, paciente_id, medico_id, receita_id)
values
    (1, '2015-05-22', 55, 12, 1, 1, 1), 
    (2, '2015-11-12', 133, 3, 2, 2, 2),
    (3, '2016-06-24', 505, 5, 3, 3, 3),
    (4, '2016-05-29', 321, 7, 4, 4, 4),
    (5, '2017-07-11', 145, 8, 5, 5, 5),
    (6, '2017-07-19', 104, 10, 6, 6, 6),
    (7, '2018-12-11', 123, 1, 7, 7, 7),
    (8, '2018-04-07', 332, 15, 8, 8, 8),
    (9, '2019-09-18', 250, null, 1, 9, 9),
    (10, '2019-04-14', 125, null, 2, 10, 10),
    (11, '2020-02-22', 99, null, 3, 1, 11),
    (12, '2020-11-03', 130, null, 11, 2, 12),
    (13, '2021-12-02', 305, null, 12, 3, 13),
    (14, '2021-03-22', 401, null, 13, 4, 14),
    (15, '2022-01-01', 133, null, 14, 5, 15),
    (16, '2022-01-01', 225, null, 15, 6, 16),
    (17, '2021-12-21', 950, null, 11, 7, 17),
    (18, '2021-11-12', 740, 12, 1, 8, 18),
    (19, '2020-04-20', 421, 5, 3, 9, 19),
    (20, '2020-02-16', 111, null, 14, 10, 20);

insert into medico_convenio
	(medico_id, convenio_id)
values
	(1, 12),
	(2, 3),
	(3, 5),
	(4, 7),
	(5, 8),
	(6, 10),
	(7, 1),
	(8, 15),
	(8, 12),
	(9, 5);
    
insert into receita
	(id, nome_medicamento, quantidade, instrucoes)
values
	(1, "Medicamento a", "4", "Utilizar uma capsula a cada 8 horas."),
    (2, "Medicamento b", "1", "Tomar 10ml a cada 8 horas."),
    (3, "Medicamento c", "2", "Utilizar uma capsula a cada 12 horas."),
    (4, "Medicamento d", "3", "Tomar 15ml a cada 5 horas."),
    (5, "Medicamento e", "6", "Tomar 20ml a cada 8 horas."),
    (6, "Medicamento f", "3", "Utilizar uma capsula a cada 5 horas."),
    (7, "Medicamento g", "1", "Utilizar uma capsula a cada 8 horas."),
    (8, "Medicamento h", "8", "Utilizar uma capsula a cada 8 horas."),
    (9, "Medicamento i", "2", "Utilizar uma capsula a cada 12 horas."),
    (10, "Medicamento j", "3", "Tomar 10ml a cada 12 horas."),
    (11, "Medicamento k", "6", "Utilizar uma capsula a cada 5 horas."),
    (12, "Medicamento l", "1", "Utilizar uma capsula a cada 8 horas."),
    (13, "Medicamento m", "3", "Tomar 30ml a cada 12 horas."),
    (14, "Medicamento n", "6", "Utilizar uma capsula a cada 8 horas."),
    (15, "Medicamento o", "4", "Tomar 10ml a cada 12 horas."),
    (16, "Medicamento p", "2", "Utilizar uma capsula a cada 8 horas."),
    (17, "Medicamento q", "1", "Tomar 10ml a cada 12 horas."),
    (18, "Medicamento r", "6", "Utilizar uma capsula a cada 5 horas."),
    (19, "Medicamento s", "9", "Utilizar uma capsula a cada 5 horas."),
    (20, "Medicamento t", "3", "Utilizar uma capsula a cada 8 horas.");
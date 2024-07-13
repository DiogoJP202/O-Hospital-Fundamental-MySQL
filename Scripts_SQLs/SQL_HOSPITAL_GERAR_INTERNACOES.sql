use mydb;

insert into tipo_quarto
	(id, descricao, valor_diaria)
values
	(1, "apartamento", "25"),
    (2, "quarto duplo", "15"),
    (3, "enfermaria", "35");

insert into quartos
	(id, numero, tipo_quarto_id)
values
	(1, 10, 1),
    (2, 15, 2),
    (3, 20, 3),
    (4, 12, 1),
    (5, 55, 2),
    (6, 32, 3),
    (7, 13, 1),
    (8, 33, 2),
    (9, 16, 3),
    (10, 19, 1);
    
insert into internacao 
	(id, data_entrada, data_prev_alta, data_alta, procedimento, quartos_id, paciente_id, medico_id)
values
	(1, "2015-01-01", "2015-02-01", "2015-02-15", "Cuidados e descanso.", 1, 15, 2),
    (2, "2015-05-05", "2015-06-11", "2015-05-30", "Cuidados e descanso.", 3, 2, 3),
    (3, "2016-01-01", "2016-02-01", "2016-02-15", "Cuidados e descanso.", 10, 14, 4),
    (4, "2016-05-11", "2016-05-22", "2016-05-30", "Cuidados e descanso.", 6, 9, 5),
    (5, "2017-01-01", "2017-02-01", "2017-02-11", "Cuidados e descanso.", 8, 14, 2),
    (6, "2017-04-01", "2017-05-21", "2017-04-22", "Cuidados e descanso.", 6, 10, 10), 
    (7, "2018-02-22", "2018-03-16", "2018-03-20", "Cuidados e descanso.", 10, 15, 7),
    (8, "2018-11-11", "2018-11-30", "2018-11-30", "Cuidados e descanso.", 3, 3, 2),
    (9, "2019-07-05", "2019-07-15", "2019-07-20", "Cuidados e descanso.", 9, 4, 10),
    (10, "2019-01-21", "2019-02-21", "2019-02-10", "Cuidados e descanso.", 5, 3, 7);

insert into internacao_enfermeiro
	(internacao_id, enfermeiro_id)
values
	(1, 2),
    (1, 1),
    (2, 4),
    (2, 5),
    (3, 5),
    (3, 3),
    (4, 1),
    (4, 2),
    (5, 3),
    (5, 5),
	(6, 6),
    (6, 4),
	(7, 3),
    (7, 8),
	(8, 9),
    (8, 3),
	(9, 1),
    (9, 3),
	(10, 4),
    (10, 6);
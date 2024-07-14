use mydb;
-- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.

select * 
from consulta 
where data like "2020%" 
and convenios_id is not null;

select avg(valor) 
from consulta 
where data like "2020%" 
and convenios_id is not null;

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

select * 
from internacao 
where  data_alta > data_prev_alta;

-- Receituário completo da primeira consulta registrada com receituário associado.

select r.* 
from consulta as c
inner join receita as r
on c.receita_id = r.id
where c.receita_id is not null
order by data
limit 1;

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).

select * 
from consulta
order by valor
limit 1;

select * 
from consulta
order by valor DESC
limit 1;

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.

select DATEDIFF(i.data_alta, i.data_entrada) AS dias_internacao, 
	t.valor_diaria * DATEDIFF(i.data_alta, i.data_entrada) AS total_internacao 
    from internacao as i
	inner join quartos as q 
    on i.quartos_id = q.id
    inner join tipo_quarto as t
    on q.tipo_quarto_id = t.id;

-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

select i.data_entrada, i.procedimento, q.numero 
from internacao as i
inner join quartos as q
on i.quartos_id = q.id;

-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.

select p.nome, c.data, c.especialidade 
from paciente as p
inner join consulta as c
on c.paciente_id = p.id
inner join dados_pessoais as dp
on dp.id = p.dados_pessoais_id 
where DATEDIFF(c.data, dp.nascimento) < 6480 and c.especialidade <> "pediatria"; -- 6480 são 18 anos representados por dias.

-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.

select p.nome as Paciente, m.nome as Médico, i.data_entrada as 'Data da internação', i.procedimento as Procedimento 
from internacao as i
inner join paciente as p
on  p.id = i.paciente_id
inner join medico as m
on m.id = i.medico_id
inner join medico_especialidade as me
on me.medico_id = m.id
inner join quartos as q
on i.quartos_id = q.id
where me.especialidade_id = 3 and q.tipo_quarto_id = 3;

-- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.

SELECT m.nome, m.crm, COUNT(c.medico_id) AS quantidade_consultas
FROM medico AS m
INNER JOIN consulta AS c 
ON m.id = c.medico_id
GROUP BY m.nome, m.crm;

-- Todos os médicos que tenham "Gabriel" no nome. 

select nome from medico 
where nome like "%Gabriel%";

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

select e.nome, e.cre, COUNT(ei.internacao_id) AS quantidade_intenacoes
from internacao as i
inner join internacao_enfermeiro as ei
on i.id = ei.internacao_id
inner join enfermeiro as e
on e.id = ei.enfermeiro_id
group by e.nome, e.cre
having COUNT(ei.internacao_id) > 1;
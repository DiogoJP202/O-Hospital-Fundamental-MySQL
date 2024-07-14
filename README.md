# O Hospital Fundamental 🏥

> Quer baixar o banco de dados? Basta baixar os arquivos e seguir a ordem de execução dos códigos sql:
> 
> 1- SQL_HOSPITAL;
> 
> 2- SQL_HOSPITAL_GERAR_PACIENTES;
> 
> 3- SQL_HOSPITAL_GERAR_CONVENIOS;
> 
> 4- SQL_HOSPITAL_GERAR_MEDICOS;
> 
> 5- SQL_HOSPITAL_GERAR_CONSULTAS;
> 
> 6- SQL_HOSPITAL_GERAR_ENFERMEIROS;
> 
> 7- SQL_HOSPITAL_GERAR_INTERNACOES;

## Parte 1:

Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:
O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.

### Resultado:

![Diagrama](https://github.com/DiogoJP202/O-Hospital-Fundamental/assets/102389309/be8a5a71-f18a-4e0b-8880-335c61836c2f)
![HospitalSQL](https://github.com/DiogoJP202/O-Hospital-Fundamental/assets/102389309/3258adcb-966e-4dc2-b827-dfef222c536e)

## Parte 2:

### Instruções:

![image](https://github.com/user-attachments/assets/04d09e8c-8fa6-410b-9b1a-6fa7e18bf599)

> Faça a ligação do diagrama acima ao diagrama desenvolvido na atividade antrior, construindo relacionamentos com entidades relacionadas. E eleve o seu diagrama para que já selecionando os tipos de dados que serão trabalhados e em quais situações. 

Por último, crie um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo (considerando as entidades do diagrama da atividade anterior e as novas entidades propostas no diagrama acima). Também crie tabelas para relacionamentos quando necessário. Aplique colunas e chaves primárias e estrangeiras.

### Resultado:

![Diagrama logico](https://github.com/DiogoJP202/O-Hospital-Fundamental/assets/102389309/b6671fed-7613-41f8-b787-f0c056ce5365)

## Parte 3:

### Instruções:

> Jogando nas regras que você criou: 
> Crie scripts de povoamento das tabelas desenvolvidas na atividade anterior

- Inclua ao menos dez médicos de diferentes especialidades.
- Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).
- Inclua ao menos 15 pacientes.
- Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.
- Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas.
- Criar entidade de relacionamento entre médico e especialidade. 
- Criar Entidade de Relacionamento entre internação e enfermeiro. 
- Arrumar a chave estrangeira do relacionamento entre convênio e médico.
- Criar entidade entre internação e enfermeiro.
- Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).
- Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez.
- Ao menos três quartos devem ser cadastrados.
- As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.
- Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
- Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.
- Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.

### Resultado:

![aasds](https://github.com/user-attachments/assets/ee1ec91b-773d-41c4-8adf-01f822c5371a)

## Parte 4: 

### Instruções:

Pensando no banco que já foi criado para o Projeto do Hospital, realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:
- Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 
- Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.

### Resultado:

```mysql
alter table medico
add column em_atividade varchar(255) not null default "Sim";

update medico
set em_atividade = "Não"
where id > 8;
```

## Parte 5:

### TESTANDO O BANCO DE DADOS:

```mysql
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
```

--consulta N# 1--
select
(nombres_doctor || ' ' || apellidos_doctor) AS Doctor,
partos_realizado as Partos_realizados
from doctor

--consulta N# 2--
select (nombres_paciente|| ' ' ||apellidos_paciente) as Paciente, 
sum(doctor.id_doctor) as Doctores_Habidos, 
sum (paciente.id_paciente) as tratamientos

from control_cita 
inner join paciente on control_cita.id_paciente = paciente.id_paciente
inner join doctor on control_cita.id_doctor = doctor.id_doctor

group by 
paciente.id_paciente,
paciente.nombres_paciente,
paciente.apellidos_paciente,
doctor.id_doctor,
doctor.nombres_doctor,
doctor.apellidos_doctor,
doctor.tratamiento_doctor

--CONSULTA N# 3--
select 
n_sala as N°_SALA, 
count(tipo_parto) as Cantidad,
tipo_parto as Parto
from sala
group by 
sala.n_sala,
sala.tipo_parto

--CONSULTA N# 4--
select 
(nombres_chofer|| ' ' || apellidos_chofer) as Chofer,
sum (viajes_total) as Viajes_Realizados
from chofer
group by 
chofer.nombres_chofer,
chofer.apellidos_chofer,
chofer.viajes_total
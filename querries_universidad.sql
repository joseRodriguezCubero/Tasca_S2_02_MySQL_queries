SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento REGEXP '1999';
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif REGEXP 'k$';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.nombre, p.apellido1, p.apellido2, d.nombre AS departamento FROM persona p JOIN departamento d USING (id) ORDER BY apellido1, apellido2, p.nombre;
SELECT a.nombre, anyo_inicio,  anyo_fin FROM asignatura a JOIN curso_escolar USING (id) JOIN persona p USING (id) WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN persona pe ON p.id_profesor = pe.id JOIN asignatura a ON pe.id = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN asignatura a ON am.id_asignatura = a.id JOIN curso_escolar cu ON am.id_curso_escolar = cu.id WHERE p.tipo = 'alumno' AND cu.anyo_inicio = '2018' AND cu.anyo_fin = '2019';
SELECT d.nombre AS 'departamento', p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN departamento d USING (id) WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.* FROM persona p LEFT JOIN departamento d USING (id) WHERE p.tipo = 'profesor' AND d.nombre IS NULL;
SELECT d.* FROM profesor p RIGHT JOIN departamento d ON d.id = p.id_departamento WHERE id_profesor IS NULL;
SELECT p.* FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_departamento = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;
SELECT a.* FROM profesor p RIGHT JOIN asignatura a ON a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL;
SELECT DISTINCT d.* FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura am ON a.id = am.id_asignatura LEFT JOIN curso_escolar c ON am.id_curso_escolar = c.id WHERE a.id IS NULL AND c.id IS NULL;
SELECT count(p.sexo) FROM persona p WHERE p.tipo = 'alumno' AND p.sexo = 'M';
SELECT count(p.sexo) FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento REGEXP '^1999';

-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
-- El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT *
FROM persona
WHERE tipo = 'alumno' AND fecha_nacimiento REGEXP '1999';


-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades 
-- i a més el seu NIF acaba en K.
SELECT *
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif REGEXP 'k$';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre,
-- en el tercer curs del grau que té l'identificador 7.
SELECT *
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. 
-- El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
-- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.nombre, p.apellido1, p.apellido2, d.nombre AS departamento
FROM persona p
JOIN departamento d
USING (id)
ORDER BY apellido1, apellido2, p.nombre;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT a.nombre, c.anyo_inicio,  c.anyo_fin
FROM asignatura a 
JOIN curso_escolar c 
USING (id)
JOIN persona p
USING (id)
WHERE p.nif = '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura 
-- en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre
FROM departamento d
JOIN profesor p 
	ON d.id = p.id_departamento
JOIN persona pe 
	ON p.id_profesor = pe.id
JOIN asignatura a 
	ON pe.id = a.id_profesor
JOIN grado g 
	ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.*
FROM persona p
JOIN alumno_se_matricula_asignatura am
	ON p.id = am.id_alumno
JOIN asignatura a 
	ON am.id_asignatura = a.id
JOIN curso_escolar cu 
	ON am.id_curso_escolar = cu.id
WHERE p.tipo = 'alumno' AND cu.anyo_inicio = '2018' AND cu.anyo_fin = '2019';

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
-- El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
-- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
-- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS 'departamento', p.apellido1, p.apellido2, p.nombre
FROM persona p
LEFT JOIN departamento d 
USING (id)
WHERE p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 2. Retorna un llistat amb els professors/es que no estan associats a un departament
SELECT p.*
FROM persona p
LEFT JOIN departamento d 
USING (id)
WHERE p.tipo = 'profesor' AND d.nombre IS NULL;

-- 3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.*
FROM profesor p
RIGHT JOIN departamento d
ON d.id = p.id_departamento
WHERE id_profesor IS NULL;

-- 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.*
FROM persona p
RIGHT JOIN profesor pr 
ON p.id = pr.id_profesor
LEFT JOIN asignatura a 
ON pr.id_departamento = a.id_profesor
WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;

-- 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.*
FROM profesor p
RIGHT JOIN asignatura a
ON a.id_profesor = p.id_profesor
WHERE a.id_profesor IS NULL;

-- 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT d.*
FROM departamento d 
LEFT JOIN profesor pr 
	ON d.id = pr.id_departamento
LEFT JOIN asignatura a
	ON pr.id_profesor = a.id_profesor
LEFT JOIN alumno_se_matricula_asignatura am
	ON a.id = am.id_asignatura
LEFT JOIN curso_escolar c 
	ON am.id_curso_escolar = c.id
WHERE a.id IS NULL AND c.id IS NULL;

-- Consultes resum:

-- 1. Retorna el nombre total d'alumnes que hi ha.
SELECT count(p.sexo)
FROM persona p
WHERE p.tipo = 'alumno' AND p.sexo = 'M';

-- 2. Calcula quants alumnes van néixer en 1999.
SELECT count(p.sexo)
FROM persona p
WHERE p.tipo = 'alumno' AND p.fecha_nacimiento REGEXP '^1999';

-- 3. Calcula quants professors/es hi ha en cada departament. 
-- El resultat només ha de mostrar dues columnes, una amb el nom del departament 
-- i una altra amb el nombre de professors/es que hi ha en aquest departament. 
-- El resultat només ha d'incloure els departaments que tenen professors/es associats 
-- i haurà d'estar ordenat de major a menor pel nombre de professors/es.



    








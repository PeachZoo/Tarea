PRIMERA*
SELECT empleado.*, departamento.nombre AS nombre_departamento
FROM empleado
LEFT JOIN departamento ON empleado.codigo_departamento = departamento.codigo;

SEGUNDA*
SELECT empleado.*
FROM empleado
LEFT JOIN departamento ON empleado.codigo_departamento = departamento.codigo
WHERE departamento.codigo IS NULL;

TERCERA
SELECT departamento.*
FROM departamento
LEFT JOIN empleado ON departamento.codigo = empleado.codigo_departamento
WHERE empleado.codigo IS NULL;

CUARTA
SELECT
    e.codigo AS codigo_empleado,
    e.nif,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido1_empleado,
    e.apellido2 AS apellido2_empleado,
    d.codigo AS codigo_departamento,
    d.nombre AS nombre_departamento,
    d.presupuesto,
    d.gastos
FROM empleado e
LEFT JOIN departamento d ON e.codigo_departamento = d.codigo
UNION
SELECT
    NULL AS codigo_empleado,
    NULL AS nif,
    NULL AS nombre_empleado,
    NULL AS apellido1_empleado,
    NULL AS apellido2_empleado,
    d.codigo AS codigo_departamento,
    d.nombre AS nombre_departamento,
    d.presupuesto,
    d.gastos
FROM departamento d
ORDER BY nombre_departamento;


QUINTA
SELECT
    e.codigo AS codigo_empleado,
    e.nif,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido1_empleado,
    e.apellido2 AS apellido2_empleado,
    NULL AS codigo_departamento,
    NULL AS nombre_departamento,
    NULL AS presupuesto,
    NULL AS gastos
FROM empleado e
WHERE e.codigo_departamento IS NULL
UNION
-- Departamentos sin empleados
SELECT
    NULL AS codigo_empleado,
    NULL AS nif,
    NULL AS nombre_empleado,
    NULL AS apellido1_empleado,
    NULL AS apellido2_empleado,
    d.codigo AS codigo_departamento,
    d.nombre AS nombre_departamento,
    d.presupuesto,
    d.gastos
FROM departamento d
LEFT JOIN empleado e ON d.codigo = e.codigo_departamento
WHERE e.codigo IS NULL
ORDER BY nombre_departamento;

1CALCULA LA SUMA DEL PRESUPUESTO DE TODOS LOS DEPARTAMENTOS
SELECT SUM(presupuesto) AS suma_presupuesto FROM departamento;

2CALCULA LA MEDIA DEL PRESUPUESTO DE TODOS LOS DEPARTAMENTOS
SELECT AVG(presupuesto) AS media_presupuesto FROM departamento;

3CALCULA VALOR MINIMO DEL PRESUPUESTO DE TODOS LOS DEPARTAMENTOS
SELECT MIN(presupuesto) AS minimo_presupuesto FROM departamento;

4CALCULA EL NOMBRE DEL DEPARTAMENTO Y EL PRESUPUESTO QUE TIENE ASIGNADO,
DEL DEPARTAMENTO CON MENOR PRESUPUESTO
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) FROM departamento);

5CALCULA EL VALOR MAXIMO DEL PRESUPUESTO DE TODOS LOS DEPARTAMENTOS
SELECT MAX(presupuesto) AS maximo_presupuesto FROM departamento;

6CALCULA EL NOMBRE DEL DEPARTAMENTO Y EL PRESUPUESTO QUE TIENE ASIGNADO
DEL DEPARTAMENTO MAYOR PRESUPUESTO 
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) FROM departamento);

7CALCULA EL NUMERO TOTAL DE EMPLEADOS QUE HAY EN LA TABLA DE EMPLEADOS
SELECT COUNT(*) AS total_empleados FROM empleado;
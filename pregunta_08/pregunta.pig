/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
---Cargar data
u = LOAD 'data.tsv' AS (f1:CHARARRAY , f2:BAG{t:TUPLE(p:CHARARRAY)} , f3:MAP[]);
w = FOREACH u GENERATE FLATTEN(f2), FLATTEN(f3);
n = FOREACH w GENERATE ($0,$1) AS tupla;
ordenar = ORDER n BY tupla;
agrupar = GROUP ordenar BY tupla;
C = FOREACH agrupar GENERATE group, COUNT(ordenar);

STORE C INTO 'output' USING PigStorage (',');

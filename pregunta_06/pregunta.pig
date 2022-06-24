/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
---Cargar data
u = LOAD 'data.tsv' AS (f1:CHARARRAY , f2:CHARARRAY , f3:MAP[CHARARRAY]);
s = FOREACH u GENERATE FLATTEN(f3);
r = GROUP s BY key;
C = FOREACH r GENERATE group, COUNT(s);

STORE C INTO 'output' USING PigStorage(',');

/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta local
lines = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);

-- genera una variable que ordena
ordered_data = ORDER lines BY f3 asc;

-- selecciona las primeras 5 palabras
s = LIMIT ordered_data 5;
extraer = FOREACH s GENERATE f3;

-- escribe el archivo de salida en el sistema local
STORE extraer INTO 'output';

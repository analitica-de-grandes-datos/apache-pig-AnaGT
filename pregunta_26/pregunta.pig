/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.csv' USING PigStorage(',')
    AS (
            f1:int,
            f2:chararray,
            f3:chararray,
            f4:chararray,
            f5:chararray,
            f6:int
    );

B = FOREACH lines GENERATE f2 AS (f2:chararray);
C = FILTER B BY STARTSWITH (f2,'M') OR STARTSWITH (f2,'Z') OR STARTSWITH (f2,'R') OR STARTSWITH (f2,'V');

STORE C INTO 'output';


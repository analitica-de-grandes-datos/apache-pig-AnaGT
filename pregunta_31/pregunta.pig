/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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

A = FOREACH lines GENERATE SUBSTRING (f4, 0,4) AS ano;
B = GROUP A BY ano;
C = FOREACH B GENERATE group, COUNT(A);

STORE C INTO 'output' USING PigStorage(',');

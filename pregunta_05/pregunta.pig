/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD 'data.tsv' AS (f1:CHARARRAY , f2:CHARARRAY );
s = FOREACH u GENERATE f2;
words = FOREACH s GENERATE FLATTEN(TOKENIZE(f2)) AS word;
r = GROUP words BY word ;
w = FOREACH r GENERATE group, COUNT(words);
x = LIMIT w 7;

STORE x INTO 'output' USING PigStorage(',');

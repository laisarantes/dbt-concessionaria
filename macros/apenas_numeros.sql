{% macro apenas_numeros(campo) %}

regexp_replace({{campo}}, '[^0-9]', '', 'g')

{% endmacro %}
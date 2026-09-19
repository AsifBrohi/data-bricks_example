{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {%- if target.name == 'prd' or target.name == 'default' or target.name == 'dev' -%}
            {{ custom_schema_name | trim }}
        {%- else -%}
            {{ target.schema ~ '_' ~ custom_schema_name | trim }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro %}

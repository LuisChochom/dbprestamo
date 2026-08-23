# Sistema de Gestión de Préstamos Audiovisuales

## Propósito de la Solución
Normalizar y gestionar de forma íntegra el flujo de préstamos de equipo audiovisual mediante PostgreSQL, garantizando la consistencia mediante claves foráneas y restricciones `CHECK`/`UNIQUE`.

## Requisitos
* Docker y Docker Compose
* Cliente PostgreSQL (`psql` o pgAdmin/DBeaver)

## Configuración del Ambiente
1. Copiar el archivo de variables:
   ```bash
   cp .env.example .env
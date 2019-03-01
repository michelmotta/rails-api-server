# Sobre o projeto

Esta é uma aplicação RestFull servidora desenvolvida utilizando Ruby on Rails e Docker

## Como esse projeto funciona?

Esta aplicação servidora foi desenvolvida utilizando [Docker](https://www.docker.com/), desta forma para conseguir rodar essa aplicação será necessário ter Docker instalado e configurado em sua máquina. Par instalar Docker em sua máquina siga os seguintes links

- [Instalação Docker](https://docs.docker.com/install/)
- [Instalação Docker Compose](https://docs.docker.com/compose/install/)

Após ter Docker devidademente instalado e configurado é possível iniciar a aplicação rodando o seguinte comando pelo terminal dentro da pasta do projeto

`docker-compose up`

Em outro terminal utilize o seguinte comando para criar o banco de dados

`docker-compose run web rake db:create`

Após esses passos é necessário criar as tabelas no bando de dados. Utilize o seguinte comando.

`docker-compose run web rails db:migrate`

## Endpoints disponíveis

Por padrão essa aplicação roda em http://localhost:3000

- Controler Schools

`GET /api/v1/schools`

`GET /api/v1/schools/[id]`

`PUT /api/v1/schools/[id]`

`DELETE /api/v1/schools/[id]`

- Controler Teachers

`GET /api/v1/teachers`

`GET /api/v1/teachers/[id]`

`PUT /api/v1/teachers/[id]`

`DELETE /api/v1/teachers/[id]`
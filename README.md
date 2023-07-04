
>  This is a challenge by [Coodesh](https://coodesh.com/)

# Open Food Facts API

Essa API tem como finalidade mapear e documentar as especificações dos produtos fornecidos pela plataforma [Open Food Facts](https://world.openfoodfacts.org/).

<div align='center' id="technologies">
  <img src="https://img.shields.io/static/v1?label=Framework&message=Ruby-on-rails&color=7159c1&style=for-the-badge&logo=Ruby"/>
  <img src="https://img.shields.io/static/v1?label=Database&message=MongoDB&color=7159c1&style=for-the-badge&logo=MongoDB"/>
  <img src="https://img.shields.io/static/v1?label=Development&message=Docker&color=7159c1&style=for-the-badge&logo=Docker"/>
</div>

Sumário
=================
* [Documentação no Postman]()
* [Dependencias](#dependencies)
    * [Depencias locais](#local-dependencies)
    * [Depencias com docker](#docker-dependencies)
* [Tecnologias](#technologies)
* [Setup do projeto]()
    * [Versão local]()
    * [Versão com Docker]()
* [Startando Servidor]()
* [Startando Sidekiq (Apenas a versão local precisa disso)]()
* [Testes]()
* [Lista de funcionalidades que encontrará nesse repositorio]()
* [Sobre o Scrapper]()

<h2 align="left">Documentação no Postman</h2>

 - Documentação dos endpoints. <a href="https://documenter.getpostman.com/view/17627865/UUxwCUMk">Clique aqui</a> para acessa-la.

<h2 id="dependencies" align="left">Dependencias</h2>

<h3 id="local-dependencies" align="left">Dependencias locais</h3>

 - Ruby v3.1.2
     - Caso não tenha o ruby instalado, recomendo usar o [RVM](https://rvm.io/) para instala-lo.
 - Rails, '~> 7.0.6'
 - Mongodb 7.0
 - Git

<h3 id="docker-dependencies" align="left">Dependencias do Docker</h3>

 - Docker >= 20.10.7
     - Caso não tenha docker/docker-compose, recomendo usar o seguinte link [Docker Compose](https://phoenixnap.com/kb/install-docker-compose-on-ubuntu-20-04), para instala-los ao mesmo tempo.
 - Docker Compose >= 2.3.3

# TODO
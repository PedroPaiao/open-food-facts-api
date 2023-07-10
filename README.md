
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
* [Dependencias](#dependencies)
    * [Depencias locais](#local-dependencies)
    * [Depencias com docker](#docker-dependencies)
* [Tecnologias](#technologies)
* [Setup do projeto](#setup-do-projeto)
    * [Versão local](#setup-local)
    * [Versão com Docker](#setup-docker) (Recomendado) 
* [Startando Servidor](#inicializando-o-servidor)
* [Startando Sidekiq (Apenas a versão local precisa disso)](#inicializando-sidekiq)
* [Testes](#tests)
* [Lista de funcionalidades que encontrará nesse repositorio]()
* [Sobre o Scrapper]()


<h2 id="dependencies" align="left">Dependencias</h2>

<h3 id="local-dependencies" align="left">Dependencias locais</h3>

 - Ruby v3.1.2
     - Caso não tenha o ruby instalado, recomendo usar o [RVM](https://rvm.io/) para instala-lo.
 - Rails, '~> 7.0.6'
 - MongoDB 7.0
 - Git

<h3 id="docker-dependencies" align="left">Dependencias do Docker</h3>

 - Docker >= 20.10.7
     - Caso não tenha docker/docker-compose, recomendo usar o seguinte link [Docker Compose](https://phoenixnap.com/kb/install-docker-compose-on-ubuntu-20-04), para instala-los ao mesmo tempo.
 - Docker Compose >= 2.3.3

<h1 id="setup-do-projeto" align="left">Setup</h1>


**Baixar o projeto**

Acesse a pasta em que guarda seus projetos e clone o projeto (ssh-version)
```bash
$ git clone git@github.com:PedroPaiao/open-food-facts-api.git
```

<h3 id="setup-local">Versão local</h3>

**Setup da gemset (Se estiver usando rvm)**

```bash
$ rvm use .
```

**Instale as depencias de gems**

The tool `bundle` will install all the gems that were defined in the project's Gemset.
```bash
$ gem install bundler:2.3.7
$ bundle install
```

<h3 id="setup-docker">Versão com Docker</h3>

**Buildar a imagem**

Dentro da pasta do projeto, rode o comando de build do docker compose
```bash
$ docker compose build
```

<h1 id="inicializando-o-servidor">Inicializando o servidor</h1>

```bash
$ rails s
```
Ou se estiver usando Docker
```bash
$ docker compose up
```

<h4 align="center">
	<a href="https://www.ruby-lang.org" emoji-code="Ruby"><img class="emojidex-emoji" src="https://cdn.emojidex.com/emoji/px16/Ruby.png" emoji-code="Ruby" alt="Ruby" /></a> Yay! You’re on Rails!  <a href="https://www.ruby-lang.org" emoji-code="Ruby"><img class="emojidex-emoji" src="https://cdn.emojidex.com/emoji/px16/Ruby.png" emoji-code="Ruby" alt="Ruby" /></a>
</h4>

<h3 id="inicializando-sidekiq"> Inicializando o Sidekiq </h3>

```bash
$ sidekiq -q default
```

<h3 id="features">Lista das tarefas que encontrará nesse repositorio</h3>

- [x] Rspec para testes de integracao
- [x] Documentacao Open API 3.0 com rswag
- [x] Integracão com MongoDb através do driver do Mongoid gem
- [x] Spiders para scrappear a plataforma Open Food Facts
- [x] Worker que agenda para rodar todo dia o scrapper de 100 items da plataforma.
- [x] A partir desse Worker outros Jobs são enfilerados apra completarem as inforamacoes dos respectivos produtos.
- [x] Paginacao no formato page, per page

## Fluxo de pensamento

Primeiro analisei o desafio principal a ser abordado, a importacão de dados da plataforma https://world.openfoodfacts.org/, analisei que a home page já retorna exatamente os 100 items que preciso, e conforme as pesquisas forem mudando os items também irão mudar na home page.

Implementei os servicos que recuperam os dados da home page e da pagina de descricão dos produtos especificamente, já implementando uma tratativa de report para caso falhasse a importacão, que futuramente resultaria em um email de notificacão, deixando claro que o base spider é baseado em uma gem muito usada antigamente (https://github.com/Selleo/business_process) no intuito de criar objetos como servicos.

Como tive pouco tempo para trabalhar no desafio (5 dias porém só consegui trabalhar efetivamente poucas horas), foquei no core e nos extras que foram abordados, tendo em vista varias outras tratativas para resolucão desse problema em especifico.

No momento optei por enfilerar 1 job para cada produto em especifico, e cada servico desse ira gerar um relatorio caso falhe.
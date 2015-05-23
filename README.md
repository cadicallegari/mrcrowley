# Mr Crawley

## Usage

### Rails Aplication

Após o setup da base de dados, e a instalação das gems, para iniciar o aplicativo rails utilize o foreman:

> foreman start -f Procfile.dev


### Crawler

O crawler se econtra no seguinte caminho:

> lib/crawler

#### Acceso a API do Twitter
Antes de executar o crawler você deve inserir suas chaves de acesso a API do Twitter no arquivo:

> .env

Não se esqueça de executar o bundle install.


#### Executando o crawler

Para iniciar o crawler basta executar o arquivo mrcrowley.rb passando como parâmetro as palavras que deseja buscar

> ruby mrcrowley.rb word1 word2 word3 ... wordn


### Relatório

Uma rake tasks que mostra o total de tweets e usuários, a quantidade de tweets por hora do dia
e o usuário que mais tweetou, pode ser executada através do seguinte comando:

> rake report:simple


## Design

A solução é composta de dois módulos, a aplicação rails e um script ruby.

A aplicação rails disponibiliza um endpoint '/api/v1/tweets', através da gem Grape, para receber os tweets
e armazená-los associados aos usuários para facilitar a geração de relatórios.

Já o script ruby recebe como parâmetros na linha de comando as palavras que se deseja procurar,
conecta na API do twitter através da gem TweetStream, e a cada mensagem recebida, envia
algumas das informações através da gem HTTParty para a aplicação rails.

Não esqueça de incluir suas chaves de acesso a API do Twitter no arquivo lib/crawler/.env


## TODO

* assync tweet post
* tests

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

Para iniciar o crawler basta executar o arquivo mrcrowley.rb passando como parametro as palavras que deseja buscar

> ruby mrcrowley.rb word1 word2 word3 ... wordn


## Design


## TODO

* assync tweet post

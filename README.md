Feito com 💜 pela Rocketseat

Fastify
Com Node.js, nos deparamos com uma variedade de frameworks que facilitam esse processo de desenvolvimento de aplicações web e APIs , assim como acontece em outras linguagens. 
Por exemplo, em Ruby, você tem Rails ou Sinatra; em Python, Flask ou Django; e em PHP, Laravel ou Lumen. 
Para a trilha de Node.js no NLW Expert, entre as opções disponíveis, decidimos utilizar o Fastify, reconhecido por sua eficiência e simplicidade.
Para começar, precisamos fazer a instalação:
```bash
npm install fastify
```
Em seu arquivo server.js, o próximo passo é importar o Fastify e criar uma instância do servidor da seguinte maneira:
```javascript
import fastify from 'fastify'

const app = fastify()
```
Em seguida, deve configurar esse servidor para “escutar” na porta 3333:
```javascript
app.listen({ port: 3333}).then(() => {
  console.log('HTTP server running on port 3333');
});
```
Agora, ao acessar localhost:3333 no seu navegador, você estará direcionando as requisições para o seu servidor. Agora, ao acessar localhost:3333 no seu navegador, você estará direcionando as requisições para o seu servidor. 
Para testar se tudo está funcionando como esperado, adicione um simples manipulador de eventos que indica que o servidor está ativo e pronto para receber requisições.
Para introduzir rotas no seu servidor, o Fastify oferece uma abordagem direta. Por exemplo, para criar uma rota /hello que responde com 'Hello NLW!', adicionamos o seguinte comando ao seu servidor:
```javascript
app.get('/hello', async (request, reply) => {
  return 'Hello NLW!';
});
```
Ao acessar o localhost:3333/hello, o navegador exibe 'Hello NLW!', demonstrando como o Fastify maneja rotas de forma eficiente. 
Este processo permite definir rotas específicas para diferentes ações, como a criação e visualização de enquetes, detalhes delas, ou até a votação.

---

Docker e Postgress
Além do servidor, um aspecto crucial para a maioria das aplicações web é o banco de dados.
Durante o NLW Expert decidimos usar o PostgreSQL, um sistema de gerenciamento de banco de dados SQL robusto, gratuito e amplamente adotado. 
Ele é ideal tanto para quem está começando quanto para desenvolvedores experientes, adequando-se a uma grande variedade de aplicações web.
Nesse contexto, existem duas opções principais para integrar o PostgreSQL ao seu projeto: instalá-lo diretamente na sua máquina ou optar por uma instância hospedada em serviços como Amazon Web Services, Google Cloud ou Microsoft Azure, tendo como desvantagem o custo para essa ação.  
Instalar o Postgres localmente também tem suas desvantagens, como o risco de uma aplicação interferir na outra devido ao compartilhamento da mesma instância do banco de dados.
A solução moderna para esses desafios é o uso de containers, com o Docker, a ferramenta mais popular nessa categoria. 
O Docker permite criar ambientes isolados (containers) para cada aplicação, garantindo que cada uma tenha sua própria instância do Postgres ou de qualquer outro banco de dados que necessite, sem interferir nas demais aplicações. 
Para começar com o Docker, você deve instalá-lo seguindo as instruções disponíveis no site oficial para o seu sistema operacional. 
Deixamos o link para cada sistema operacional abaixo 😉

MACOS -> https://docs.docker.com/desktop/install/mac-install/
WINDOWS -> https://docs.docker.com/desktop/install/windows-install/
LINUX -> https://docs.docker.com/desktop/install/linux-install/

Após a instalação do Docker, um comando útil para verificar se não há containers ativos é docker ps
Se for a primeira ativação, o resultado esperado é uma lista vazia, indicando que não há containers rodando. Além disso, executar docker -v confirma se o Docker está instalado corretamente.
quote
O Docker é essencial não apenas para desenvolvedores back-end, mas para todos que trabalham com desenvolvimento de software, independentemente da linguagem de programação. Ele simplifica a gestão de dependências e ambientes de desenvolvimento, tornando-se uma ferramenta indispensável na moderna prática de desenvolvimento de software.
quote

No seu editor de código, crie um arquivo chamado docker-compose.yml. Esse arquivo age como uma receita, especificando todos os serviços necessários para sua aplicação, seja Postgres, Redis ou qualquer outro serviço. 
A grande vantagem é que, com esse arquivo, qualquer pessoa pode configurar todo o ambiente necessário para sua aplicação com apenas um comando do Docker, facilitando a instalação.
Para mergulharmos ainda mais, vamos entender a estruturação do arquivo docker-compose.yml, explicando os principais componentes.
Você encontrará o arquivo completo nos materiais da aula prática #01.

Confira este exemplo de como pode ser o seu arquivo docker-compose.yml
```yaml
version: '3.7'

services:
  postgres:
    image: bitname/postgresql:latest
    ports:
      - '5432:5432'
    environment:
      - POSTGRES_USER=docker
      - POSTGRES_PASSWORD=docker
      - POSTGRES_DB=polls
    volumes:
      - polls_pg_data:/bitnami/postgresql

  redis:
    image: bitnami/redis:latest
    environment:
      - 'ALLOW_EMPTY_PASSWORD=yes'
    ports:
      - '6379:6379'
    volumes:
      - 'polls_redis_data:/bitnami/redis/data'

volumes:
  polls_pg_data:
  polls_redis_data:
```
- Version: Especifica a versão do Docker Compose que você está utilizando.
- Services: Lista os serviços que sua aplicação precisa, como Postgres e Redis.
- Image: Define a imagem do Docker para cada serviço.
- Ports: Mapeia portas do container para o seu sistema, permitindo acessos externos.
- Environment: Configura variáveis de ambiente necessárias, como nome de usuário e senha para o Postgres.
- Volumes: Mantém os dados persistentes entre as reinicializações do container, conectando um diretório no container a um local no seu sistema.

Após configurar esse arquivo, basta executar docker-compose up para iniciar todos os serviços definidos.
Isso facilita muito a gestão dos ambientes de desenvolvimento, consolidando o Docker como uma ferramenta essencial para qualquer desenvolvedor, independentemente da linguagem ou tecnologia utilizada.
Depois da leitura desse material você está ainda mais preparado(a) para continuar sua jornada no NLW Expert.

#NeverStopLearning 🚀



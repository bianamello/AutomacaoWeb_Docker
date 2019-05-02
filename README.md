## Compra pelo Site automationPractice

Projeto desenvolvido para testes de compra no site: http://www.automationpractice.com/
Automação Web configurada para subir imagem ruby e criar um link com uma imagem do selenium (Configuração realizada no 
Jenkinsfile)

**O projeto possui as seguintes funcionalidades:**
- [x] Seleciona um item para o carrinho
- [x] Verifica se o item do carrinho é mesmo selecionado na pagina home
- [x] Cria uma conta para o usuário
- [x] Confirma dados de entrega e forma de pagamento
- [x] Verifica o valor total da compra
- [x] Emite uma ordem de compra e verifica se a ordem foi emitida com sucesso.

## Estrutura do projeto:
- Desenvolvido no padrão page object
- Possui relatório em formato html, com evidência dos testes em anexo (imagens) - Pasta reports
- Configurado para rodar no navegador Chrome
- Este projeto está preparado para rodar no pipeline do jenkins (Possui Jenkinsfile).
- Possui configuração para subir 2 imagens docker, sendo uma do ruby e uma do selenium.
- Possui configuração para rodar local

## Configurando para rodar o teste em ambiente LOCAL:
Antes de rodar os testes, por favor instale:

1 - [ruby] - Instalando ruby
- Guia Instalando Ruby no Windows: https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95
- Guia Instalando Ruby no Ubuntu: https://medium.com/qaninja/como-instalar-ruby-com-rbenv-no-ubuntu-a75d1999362b


2 - [Chrome_Driver] - Configurando navegador Chrome para rodar o testes:
- Baixar o arquivo no site: http://chromedriver.chromium.org/downloads. Selecione a versão compatível com o seu sistema.
- Navegue até a pasta onde realizou o download do arquivo e descompacte-o 
- Mover o arquivo descompactado para a seguinte pasta:
	Linux:
   		“/usr/bin/” e para isso vamos executar o comando abaixo:
   		sudo mv chromedriver /usr/bin/
	Windows:
   		C:/Windows

3 - [Rodando os testes na maquina local]
- No terminal, na pasta do projeto, execute o seguinte comando que irá instalar as Gems do projeto:
	bundler install
- Para rodar os testes execute o seguinte comando na pasta do projeto:
	cucumber

## Configurando para rodar o teste no JENKINS:
[Rodando os testes no Jenkins]

- Instalando Docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/

- Instalando Jenkins - Guia: https://jenkins.io/doc/book/installing/
  Rodar os seguintes comandos (Todos juntos - caso seja Ubuntu):
  
  docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean

- No navegador, acessar o Jenkins em: localhost:8080
  Para desbloquear o Jenkins no primeiro acesso:
  
     	- No terminal digitar: docker exec -it NomeContainerJenkins bash (para ver o nome do container digite "docker ps -a")
     	- ls -l
    	- cat EndereçoExibidoAoAcessarLocalHost
     	- Copiar a senha exibida no terminal
     	- Colar a senha no navegador, no campo Administrador Password
     	- Selecionar "plugins sugeridos"
     	- criar usuário (preencher todos os campos com devops - sugestão)
     	- Salvar e finalizar
      
- No Jenkins criar um novo JOB do tipo pipeline
	- Clicar em Novo Job
	- Digitar um nome e selecionar a opção Pipeline
	- No campo Pipeline selecione a opção "Pipeline script from SCM"
	- No campo "SCM" selecionar Git
	- Colar a URL do seu projeto no Git
	- Apertar TAB para autenticar  
	- Script Path: Jenkinsfile
	- Clicar em salvar
  
 - Inserindo plugin de relatório no Jenkins (Projeto está configurado no Jenkinsfile para gerar relatório)
 	- Clicar em Gerenciar Jenkins/ Gerenciar plugins
  	- Clicar em Disponíveis e filtrar por "cucumber reports"
  	- Selecionar e Baixar
  	- Após baixar, selecionar a opção para reiniciar o Jenkins

- Para rodar os testes no pipeline do Jenkins:
	- Clicar no JOB criado e clicar em "Construir agora"
  
 Seu teste será executado no pipeline do Jenkins.


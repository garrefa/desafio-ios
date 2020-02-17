# Criar um aplicativo de consulta a API do [GitHub](https://github.com)#

Criar um aplicativo para consultar a [API do GitHub](https://developer.github.com/v3/) e trazer os repositórios mais populares de Java. Basear-se no mockup fornecido:

![mock.png](./mock.png)


### **Deve conter** ###

- __Lista de repositórios__. Exemplo de chamada na API: `https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1`
  * Paginação na tela de lista, com endless scroll / scroll infinito (incrementando o parâmetro `page`).
  * Cada repositório deve exibir Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks
  * Ao tocar em um item, deve levar a lista de Pull Requests do repositório
- __Pull Requests de um repositório__. Exemplo de chamada na API: `https://api.github.com/repos/<criador>/<repositório>/pulls`
  * Cada item da lista deve exibir Nome / Foto do autor do PR, Título do PR, Data do PR e Body do PR
  * Ao tocar em um item, deve abrir no browser a página do Pull Request em questão

### **A solução DEVE conter** ##

* Versão mínima do iOS : 8.*
* Arquivo .gitignore
* Layout ajustável para diferentes telas de iPhone em portrait
* Gestão de dependências no projeto
* Framework para Comunicação com API
* Mapeamento json -> Objeto

### **Ganha + pontos** ###

* Testes unitários no projeto
* Testes funcionais
* Cache de Imagens

### **Processo de submissão** ###

O candidato deverá implementar a solução e enviar um pull request para este repositório com a solução.

O processo de Pull Request funciona da seguinte maneira:

1. Candidato fará um fork desse repositório (não irá clonar direto!)
2. Fará seu projeto nesse fork
3. Commitará e subirá as alterações para o __SEU__ fork
4. Enviar um pull request pela interface do Github


### **Comentários** ###

1. ficou faltando escrever o nome completo do usuário, cheguei a fazer a label, mas não quis passar muito da hora da entrega e eu teria que fazer um request diferente pra cada usuário, sendo que tenho um numero de requests limitados, então vou ficar devendo isto.

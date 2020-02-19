# **DESAFIO iOS ARENA - Felipe Perius**

Objetivo do projeto é testar as habilidades do canditado na criação de aplicativos para plataforma iOS .

## Começando
Estas instruções irão levá-lo a uma cópia do projeto em funcionamento em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos
O que você precisa para construir, executar e testar o aplicativo:
Xcode 9.3 ou posterior. 
O Deployment target está configurando pra suporta iOS 11.0 ou posterior.

Faça o clone do repositório em sua máquina local.

 Depois será necessario a instalação das dependências com o comando:
```bash
$ pod install
```

Em seguida, abra o projeto no Xcode:
open TesteArenaFelipePerius.xcworkspace Agora você está pronto para começar.

### Uso de dependências 

Nesse projeto utilizei 4 dependecias utilizando cocoaPods:
* Utilizei o  [Alamofire](https://github.com/Alamofire/Alamofire) para facilitar as requisições com API .

* [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper) para fazer o parse dos models do JSON e comecei usando codable mas resolvi usar ObjectMapper mesmo.

* [RxSwift](https://github.com/ReactiveX/RxSwift) para fazer as requisições na camada de serviço com programção reativa.

* [SDWebImage](https://github.com/SDWebImage/SDWebImage) para download das urls de imagens e cache.

### Autor 
- **Felipe Augusto Pimentel Perius**



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

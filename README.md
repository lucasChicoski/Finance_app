# Nome do projeto (Diario de despesas)

# scaffold_project

Esqueleto de um app flutter

contém algumas libs utlizadas por mim para 
o inicio de app como

get_it
-------------
valuenotifier configurado
-------------
roteamento configurado

## Getting Started

--------------
## Arquitetura

lib/
|-- infra/
|   |-- repositories/(Classe)
|   |-- entities/ (Inteface)
|
|-- service/
|   |-- models/ (Classe)
|   
|-- domain/
|   |-- DTO/ (Interface)
|
|-- presentation/
|   |-- pages/
|   |-- view_models/(uses_cases/ gerencia de estado)
|   |-- widgets/
|
|-- utils/
|-- main.dart

## Descrição

Descrição dos Diretórios:

infra: Contém as implementações de acesso a dados, como modelos, repositórios e serviços.

    models: Classes que representam os dados utilizados no aplicativo.
    repositories: Interfaces e implementações dos repositórios que lidam com a obtenção e persistência de dados.
    services: Classes que encapsulam serviços externos, como chamadas de API.

domain: Este módulo contém a lógica de negócios da aplicação.

    entities: Classes de entidades que representam conceitos de negócios.
    repositories: Interfaces dos repositórios que definem as operações relacionadas à lógica de negócios.
    use_cases: Implementações dos casos de uso que orquestram a lógica de negócios.

presentation: Lida com a camada de apresentação da aplicação, seguindo o padrão MVVM.

    pages: Páginas principais do aplicativo.
    view_models: Classes que gerenciam o estado e a lógica de apresentação das páginas.
    widgets: Componentes reutilizáveis e específicos da interface do usuário.

utils: Contém funções e classes utilitárias compartilhadas em todo o projeto.

Explicação Adicional:
Injeção de Dependência (DI): Utilize um pacote de DI, como o get_it, para injetar dependências e facilitar a testabilidade.

Flutter Bloc ou Provider: Considere o uso de flutter_bloc ou provider para gerenciar o estado da aplicação.

Roteamento: Use o pacote fluro ou navigator para gerenciar a navegação entre as páginas.

Testes Unitários e de Widget: Escreva testes unitários para as lógicas de negócios e testes de widget para garantir o bom funcionamento da interface do usuário.

Tratamento de Erros: Implemente uma estratégia eficaz para lidar com erros, como mostrar mensagens de erro ao usuário e registrar os detalhes para análise posterior.

Adapte essa estrutura conforme necessário, dependendo das complexidades específicas do seu projeto. Lembre-se de manter a coesão e a modularidade para facilitar a manutenção e a evolução do código.# Finance_app
# Finance_app

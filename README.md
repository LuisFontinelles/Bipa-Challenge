# Lightning Explorer - Desafio Técnico Bipa

Lightning Explorer é um aplicativo iOS desenvolvido como parte de um desafio técnico para a Bipa. O projeto tem como objetivo monitorar o ranking de conectividade de nós na rede Lightning utilizando a API pública do mempool.space, com foco em SwiftUI e padrões de arquitetura modernos.

## Ferramentas de build e versões utilizadas

* Xcode 16
* Swift 5.10+
* iOS 16.6+
* SwiftUI
* Combine

## Passos para rodar o app

1. Clone o repositório para sua máquina local.
2. Abra o arquivo `LightningExplorer.xcodeproj` utilizando o Xcode.
3. Selecione um simulador ou dispositivo físico rodando iOS 16.6 ou superior.
4. Pressione `Command + R` para compilar e rodar a aplicação.

## Em quais áreas do app você focou?

O desenvolvimento focou em três pilares principais:

1. **Infraestrutura**: Construção de uma camada de rede baseada em protocolos que é modular e reutilizável.
2. **Arquitetura**: Implementação de um padrão MVVM limpo combinado com State Pattern para gerenciamento de interface.
3. **Integridade de Dados**: Garantia de precisão em dados financeiros utilizando tipos Decimal e formatação correta para valores em Bitcoin.

## Qual foi o motivo do seu foco? Que problemas você tentou resolver?

O objetivo principal foi construir uma base de código escalável e de fácil manutenção. Busquei resolver problemas comuns no desenvolvimento mobile, tais como:

* **Interface Previsível**: Uso do State Pattern (Idle, Loading, Loaded, Empty, Error) para garantir que a interface reaja corretamente a cada estágio do ciclo de vida dos dados.
* **Precisão**: Prevenção de erros de ponto flutuante binário ao utilizar Decimal para as capacidades de Bitcoin.
* **Legibilidade**: Utilização de ViewBuilders para decompor views complexas em componentes pequenos e gerenciáveis.

## Quanto tempo você gastou neste projeto?

O projeto foi concluído em aproximadamente 5 horas líquidas de desenvolvimento ativo.

## Você fez alguma concessão (trade-off) neste projeto? O que faria diferente com mais tempo?

* **Concessões**: Visto que a API consumida é de acesso público e não requer autenticação de usuário, o uso de Keychain foi desconsiderado para este escopo. Além disso, utilizei uma struct estática para strings em vez de um arquivo .strings padrão para agilizar o desenvolvimento dentro do prazo estipulado.

* **Simulação de Projeto Real**: Implementei classes de constantes para cores, imagens e strings. Essa abordagem simula um Design System e um Asset Catalog organizado, demonstrando como o projeto seria estruturado em um ambiente corporativo para facilitar a manutenção e a escalabilidade visual.

* **Com mais tempo**: Implementaria uma cobertura completa de testes de interface (UITests) e expandiria os testes unitários para atingir 100% de cobertura em todas as camadas, garantindo a robustez total contra regressões.
* **PAT e ssh**: Eu tive um problema com ssh e pat da minha máquina e nao consegui clonar o repo e commitar os testes unitários, pelo limite de tempo nao consegui implementar os testes unitários.

## Qual você considera ser a parte mais fraca do seu projeto?

A cobertura de testes ainda pode ser expandida. Embora tenha implementado testes unitários simples para validar a lógica principal e a decodificação de dados, a arquitetura permite uma cobertura muito mais profunda, incluindo testes de UI e testes de integração que não foram totalmente explorados no tempo estipulado.

## Há alguma outra informação que você gostaria que soubéssemos?

A camada de networking incluída neste projeto faz parte do meu stack pessoal de desenvolvimento, a qual venho refinando em diversos projetos para lidar com requisições assíncronas de forma eficiente e tipada.

**Desenvolvido por:** Luis Filipe Fontinelles Bezerra  
**LinkedIn:** [https://www.linkedin.com/in/luisfontinelles](https://www.linkedin.com/in/luisfontinelles)

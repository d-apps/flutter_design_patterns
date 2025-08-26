# Design Patterns em Flutter

Esse projeto demonstra os design patterns mais usados.
Serve como referência rápida para desenvolvedores conhecerem ou lembrarem dos padrões.

#### Abstract Factory

Resumo: O Abstract Factory fornece uma interface para criar famílias de objetos relacionados sem 
especificar suas classes concretas. É um "super factory".

Exemplo: Imagine que seu app precisa de temas diferentes (claro e escuro), e cada tema tem vários 
componentes (botões, barras de navegação).

#### Builder

Resumo: O Builder separa a construção de um objeto complexo da sua representação final. 
É ótimo para objetos com muitos parâmetros opcionais.

Exemplo: Imagine que você está criando um User (usuário) com várias informações opcionais, 
como nome, e-mail, idade, e endereço. O Builder te ajuda a construir esse objeto passo a passo.

#### Command

Resumo: O Command encapsula uma solicitação como um objeto, permitindo parametrizar clientes 
com diferentes requisições, filas de solicitações ou até mesmo operações de desfazer.

Exemplo: Imagine um editor de texto onde cada ação (copiar, colar, recortar) é um Command.

#### Composite 

Resumo: O Composite trata um grupo de objetos da mesma forma que um único objeto. É ideal para criar
estruturas de árvore.

Exemplo: Em um app de arquivos, o Composite pode tratar um diretório (que contém outros arquivos e 
diretórios) e um arquivo individual da mesma forma.

#### Decorator

Resumo: O Decorator adiciona novas responsabilidades a um objeto dinamicamente, sem alterar sua estrutura.

Exemplo: Você quer adicionar funcionalidades a um objeto Coffee (café), como leite, açúcar ou 
chantilly. Cada "acréscimo" é um Decorator.

#### Facade

Resumo: O Facade (Fachada) fornece uma interface unificada e simplificada para um sistema complexo.

Exemplo: Em um app que lida com diferentes APIs de pagamento (cartão, boleto, Pix), o Facade pode 
simplificar o processo, escondendo a complexidade de cada API.

#### Factory Method

Resumo: O Factory Method define uma interface para criar objetos, mas deixa as subclasses decidirem 
qual classe instanciar.

Exemplo: Pense em um app que lida com diferentes tipos de notificações (email, push, SMS). 
O Factory Method permite criar a notificação correta sem saber os detalhes de cada tipo.

#### Iterator

Resumo: O Iterator fornece um modo de acessar sequencialmente os elementos de uma coleção sem expor 
sua representação interna.

Exemplo: Em Dart, a maioria das coleções já tem um Iterator embutido (for-in usa isso), mas você 
pode criar o seu para uma classe customizada, como uma lista de coreografias.

#### Mediator

Resumo: O Mediator promove o baixo acoplamento ao evitar que objetos se comuniquem diretamente.

Exemplo: Em um formulário complexo, campos de entrada (TextField) podem se comunicar através de um 
Mediator para validar dados uns dos outros, sem saber da existência de cada um.

#### Singleton

Resumo: O Singleton garante que uma classe tenha apenas uma instância e fornece um ponto global de
acesso a ela.

Exemplo: Uma cliente de que acesso o banco de dados pode ser um Singleton,
garantindo que todas as partes do app usem a mesma instância.

#### Strategy

Resumo: O Strategy define uma família de algoritmos, encapsula cada um e os torna intercambiáveis.

Exemplo: No seu app, você pode ter diferentes algoritmos para calcular o frete de um pedido, 
dependendo do método de envio (expresso, normal, econômico).

#### Visitor

Resumo: O Visitor separa um algoritmo de um objeto sobre o qual ele opera.

Exemplo: Em um sistema de relatórios, o Visitor pode ser usado para exportar diferentes tipos de 
dados (relatório de vendas, de clientes) para diferentes formatos (JSON, XML).
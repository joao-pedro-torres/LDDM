# Entrega de exercícios
#### Autor: João Pedro Torres de Souza Silva

#### Matrícula: 741624 

Repositório de códigos dos exercícios da disciplina de Laboratório de Desenvolvimento Mobile propostos nos slides das aulas.

-----

## Explanação acerca da entrega

A partir do exercício lddm07, as funcionalidades dos exercícios anteriores são compiladas mantendo a coerência entre as páginas.

*   **lddm04**
    
    Contempla a primaira aplicação de Stateless Widgets em uma página de login não 
    funcional, contendo os campos 'E-mail' e 'Password' para entrada de texto, um
    botão 'Enter' e um botão 'Create an account'.

*   **lddm05**

    Contempla a primeira aplicação de Stateful Widgets em uma página de cadastro não 
    funcional, contendo os campos 'Name', 'Date of Birth', 'Phone', 'E-mail' e
    'Password' para entrada de texto, a caixa de seleção 'Gender', os switches
    'Receive notification by', e um slide com botões para manuseio do tamanho de
    fonte na página.

*   **lddm06**

    Contempla a primeira aplicação de navegação entre telas por meio da BottomBar e
    por meio de botões. No exercício entregue, os botẽs 'Home' e 'About' da BottomBar
    navegam, respectivamente, entre as páginas Home (contendo um botão) e About
    (contendo um texto). O botão 'Log in' da página Home leva à página de login,
    modificada do exercício lddm04, cujo botão 'Create an account' leva para a página
    de cadastro modificada do exercício lddm05.

*   **lddm07**

    Compila as funcionalidades dos exercícios anteriores e contempla a primeira
    aplicação de comunicação entre telas. A página de Login recebe um nome pelo
    campo 'Name', um email pelo campo 'E-mail' e uma senha pelo campo 'Password'.
    Se a entrda dos campos 'E-mail' e 'Password' forem, respectivamente,
    "eu@gmail.com" e "1234", o botão 'Enter' levará para a página de boas vindas.
    Caso contrário, será exibido um AlertDialog com um botão 'Fechar'. A página
    de boas vindas recebe o nome inserido no campo 'Name' da página de Login e o
    imprime no AppBar, além de conter 20 itens listados iterativamente que, quando
    pressionados, abrem um AlertDialog com os botões 'Sim' e 'Não'.

*   **lddm08**

    Compila e modifica as funcionalidades dos exercícios anteriores e contempla a
    primeira aplicação de permanência de dados por meio de SharedPreferences. A
    partir da página de cadastro, acessada pelo botão 'Create an account' na tela
    de Login, a aplicação recebe os dados de registro. Após concluir o cadastro,
    ao serem inseridos os dados de login, o botão 'Enter' verifica os dados de
    entrada e, em caso de incompatiblidade, exibe um AlertDialog com o botão 'Fechar'.
    Caso contrário, o botão 'Enter' leva para a página de boas vindas. A partir daí,
    por meio da BottomBar, é possível navegar pelas páginas 'Home' (que imprime o nome
    do usuário), 'List' (que lista 20 itens iterativamente) e 'Profile', que imprime
    os dados do usuáio e possui um botão 'Forget profile', que remove os dados de
    cadastro da memória.

*   **lddm09**
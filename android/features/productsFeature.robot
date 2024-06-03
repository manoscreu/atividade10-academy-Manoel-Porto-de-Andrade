*** Settings ***
Test Setup    Abrir App
Test Teardown    TearDown
Resource    ..//base.robot


*** Test Cases ***
TC001 - Cadastro valido de produto
    Dado que o usuario se encontra na tela inicial do App
    Quando o usuario acessar a area de cadastro de produtos
    E preencher todos os Campos e confirmar o cadastro
    Entao o sistema deve realizar o cadastro do produto


TC002 - Cadastro invalido de protudo
    Dado que o usuario se encontra na tela inicial do App
    Quando o usuario acessar a area de cadastro de produtos
    E confirmar o cadastro
    Entao o sistema avisar o usuario que os campos sao obrigatorios

TC003 - Deve ser possivel aumentar quantidade de produtos
    Dado que ja existe um produto cadastrado no sistema
    Quando o usuario acessar a opçao de aumentar a quantidade no sistema
    E preencher com a quantidade a aumentar
    E confirmar a operaçao de mudança de estoque
    Entao o sistema deve apresentar o valor atualizado

TC004 - Deve ser possivel diminuir quantidade de produtos
    Dado que ja existe um produto cadastrado no sistema
    Quando o usuario acessar a opçao de aumentar a qunatidade no sistema
    E preencher com a quantidade a diminuir
    E confirmar a operaçao de mudança de estoque
    Entao o sistema deve apresentar o valor atualizado

TC005 - Não deve ser possivel diminuir quantidade de produtos abaixo de 0 
    Dado que ja existe um produto cadastrado no sistema

TC006 - Deve ser possivel editar o cadastro de um produto
    Dado que ja existe um produto cadastrado no sistema

TC007 - Deve ser possivel pesquisar um produto
    Dado que ja existe um produto cadastrado no sistema

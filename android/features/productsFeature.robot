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
    Entao o sistema deve apresentar o novo valor maior

TC004 - Deve ser possivel diminuir quantidade de produtos
    Dado que ja existe um produto cadastrado no sistema
    Quando o usuario acessar a opçao de diminuir a quantidade no sistema
    E preencher com a quantidade a diminuir
    E confirmar a operaçao de mudança de estoque
    Entao o sistema deve apresentar o novo valor menor

TC005 - Não deve ser possivel diminuir quantidade de produtos abaixo de 0 
    Dado que ja existe um produto cadastrado no sistema
    Quando o usuario acessar a opçao de diminuir a quantidade no sistema
    E preencher com a quantidade a diminuir que fique abaixo de 0
    E confirmar a operaçao de mudança de estoque
    Entao o sistema deve apresentar uma mensagem com erro estoque insuficiente

TC006 - Deve ser possivel editar o cadastro de um produto
    Dado que ja existe um produto cadastrado no sistema
    Quando o usuario acessar a area de edição de produto
    E alterar o cadastro do produto
    E finalizar a alteraçao
    Entao o sistema deve apresentar o produto atualizado

TC007 - Deve ser possivel excluir um item do sistema
    Dado que ja existe um produto cadastrado no sistema
    Quando o usuario usar a opção de excluir um produto
    Entao o sistema deve apresentar uma mensagem pedindo confimaçao da exclusao
    E o sistema deve excluir o produto do estoque

TC008 - Deve ser possivel cadastrar varios produtos
    [Template]    Deve ser possivel cadastrar varios produtos
        001    Teclado Games             unitario    44     800     01
        002    Monitor queimado          unitario    12     1500    02
        003    Headset da xuxa           unitario    800    10      03
        004    Placa de video quebrada   unitario    10     5000    04

TC009 - Deve ser possivel pesquisar por um produto cadastrado
    Dado que ja existe mais de um produto cadastrado no sistema
    Quando o usuario ativar a opçao de pesquisa
    E pesquisar pelo nome de um produto cadastrado
    Entao o sistema deve apresentar apenas o produto que condiz com o nome

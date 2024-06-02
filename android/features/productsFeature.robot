*** Settings ***
Test Setup    Abrir App
Test Teardown    TearDown
Resource    ..//base.robot


*** Test Cases ***
TC001 Cadastro valido de produto
    Dado que o usuario se encontra na tela inicial do App
    Quando o usuario acessar a area de cadastro de produtos
    E preencher todos os Campos
    E confirmar o cadastro
    Entao o sistema deve realizar o cadastro do produto


TC002 - Cadastro invalido de protudo
    Dado que o usuario se encontra na tela inicial do App
    Quando o usuario acessar a area de cadastro de produtos
    E confirmar o cadastro
    Entao o sistema deve 

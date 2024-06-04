*** Settings ***
Test Setup    Abrir App
Test Teardown    TearDown
Resource    ..//base.robot


*** Test Cases ***
TC001 - Nao deve ser possivel gerar uma exportaçao de dados sem os registros serem criados anteriormente
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area de exportaçao de dados sem alterar produtos antes
    E gerar uma exportaçao
    Entao o sistema nao deve gerar a exportaçao de produtos entradas e saidas

TC002 - Deve ser possivel gerar uma exportaçao se todos os dados foram gerados anteriormente
    Dado que ja existe um produto com movimentaçoes no sistema
    Quando o usuario acessar a area de exportaçao de dados
    E gerar uma exportaçao
    Entao o sistema deve gerar a exportaçao de produtos entradas e saidas

TC003 - Deve ser possivel importar produtos 
    Dado que ja existe um produto com movimentaçoes no sistema
    E o usuario ja fez uma exportaçao de dados
    Quando o usuario acessar a area de importação de produtos 
    Entao o usuario podera fazer a importação de produtos

TC004 - Deve ser possivel importar entradas de produtos 
    Dado que ja existe um produto com movimentaçoes no sistema
    E o usuario ja fez uma exportaçao de dados
    Quando o usuario acessar a area de importação de entradas  
    Entao o usuario podera fazer a importação das entradas 

TC005 - Deve ser possivel importar saidas de produtos 
    Dado que ja existe um produto com movimentaçoes no sistema
    E o usuario ja fez uma exportaçao de dados
    Quando o usuario acessar a area de importação de saidas 
    Entao o usuario podera fazer a importação das saidas

TC006 - Deve ser possivel importar um grupo de produtos
    Dado que ja existe um produto com movimentaçoes no sistema
    E o usuario ja fez uma exportaçao de dados
    Quando o usuario acessar a area de importação de grupos 
    Entao o usuario podera fazer a importação dos grupos 


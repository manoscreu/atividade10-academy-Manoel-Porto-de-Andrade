*** Settings ***
Test Setup    Abrir App
Test Teardown    TearDown
Resource    ..//base.robot



*** Test Cases ***
TC001 - Nao deve ser possivel visualizar as saidas de protudos sem preencher data
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de entradas
    E usar a função de gerar pdf sem inserir datas
    Entao o sistema deve apresentar uma mensagem de erro 

TC002 - Nao deve ser possivel visualizar as saidas de protudos sem preencher data
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de saidas
    E usar a função de gerar pdf sem inserir datas
    Entao o sistema deve apresentar uma mensagem de erro 

TC003 - Deve ser possivel gerar relatorio de estoque sem data
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de estoque
    E usar a função de gerar pdf sem inserir datas
    Entao o pdf deve ser gerado com sucesso

TC004 - Deve ser possivel enviar o relatorio de estoque por email
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de estoque
    E usar a função de gerar pdf sem inserir datas
    Entao deve ser possivel enviar o pdf por email

TC005 - Deve ser possivel visualizar o pdf de relatorio
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de estoque
    E usar a função de gerar pdf sem inserir datas
    Entao deve ser possivel visualizar o pdf gerado

TC006 - Deve ser possivel visualizar as saidas de protudos preenchedo o campo datas
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de entradas
    E usar a função de gerar pdf inserindo datas
    Entao o pdf de entradas deve ser gerado com sucesso
     

TC007 - Deve ser possivel visualizar as entradas de protudos preenchedo o campo datas
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area report
    E acessar a area de saidas
    E usar a função de gerar pdf inserindo datas
    Entao o pdf de saidas deve ser gerado com sucesso
    
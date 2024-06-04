*** Settings ***
Test Setup    Abrir App
Test Teardown    TearDown
Resource    ..//base.robot


*** Test Cases ***
TC001 - Deve ser possivel fazer um backup das informaçoes do sistema
    Dado que o usuario se encontra no menu
    Quando o usuario acessar a area backups
    E usar a função de gerar backup
    Entao o sistema deve gerar um arquivo de backup

TC002 - Deve ser possivel restaurar um backup de informaçoes do sistema
    Dado que ja existe um backup no sistema
    Quando o usuario acessar a area de restauração
    E selecionar um arquivo de restauração e confirmar
    Entao o sistema deve realizar a restauração


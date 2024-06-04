*** Settings ***

Library    XML
Resource    ../base.robot
*** Keywords ***
Clica e espera
    [Arguments]     ${elemento1}    ${elementoAEsperar}
    Click Element    ${elemento1}
    Wait Until Element Is Visible    ${elementoAEsperar}

verificar com OR
    [Arguments]    ${elemento}
    ${verificardor}=    ${elemento}
    Should Contain    ${verificardor.txt}    inventory.pdf generated in     OR    stockentries.pdf generated in      OR      stockouts.pdf generated in  

Cria produtos
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valor}    ${lote}
    Wait Until Element Is Visible    ${buttonNew}
    Click Element    ${buttonNew}
    Wait Until Element Is Visible    ${campoDescription}
    Input Text    ${campoCode}    ${codigo}
    Input Text    ${campoDescription}    ${descricao}
    Input Text    ${campoPacking}    ${unidade}
    Input Text    ${campoAmount}    ${quantidade}
    Input Text    ${campoUnitValue}    ${valor}
    Input Text    ${campoLot}    ${lote}
    Click Element    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}
    Element Should Contain Text    //android.widget.TextView[@text='${descricao}']    ${descricao}

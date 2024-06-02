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
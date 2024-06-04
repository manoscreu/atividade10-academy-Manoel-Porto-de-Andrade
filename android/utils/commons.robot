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

Cria produtos com template
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valor}    ${lote}=
    Wait Until Element Is Visible    ${buttonNew}
    Click Element    ${buttonNew}
    Input Text    ${campoCode}    ${codigo}
    Input Text    ${campoDescription}    ${descricao}
    Input Text    ${campoPacking}    ${unidade}
    Input Text    ${campoAmount}    ${quantidade}
    Input Text    ${campoUnitValue}    ${valor}
    Input Text    ${campoLot}    ${lote}
    Click Element    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}
    Element Should Contain Text    //android.widget.TextView[@text='${descricao}']    ${descricao}



# Dado que ja existe um produto cadastrado no sistema
#     [Arguments]    ${code}    ${descri}   ${packing}     ${qtd}    ${valunit}    ${lot}
#     Wait Until Element Is Visible    br.com.pztec.estoque:id/Button1
#     Click Element    br.com.pztec.estoque:id/Button1
#     Wait Until Element Is Visible    br.com.pztec.estoque:id/txt_descricao
#     Input Text    ${campoCode}           ${code}
#     Input Text    ${campoDescription}    ${descri}
#     Input Text    ${campoPacking}        ${packing}
#     Input Text    ${campoAmount}         ${qtd}
#     Input Text    ${campoUnitValue}      ${valunit}
#     Input Text    ${campoLot}            ${lot}
#     Click Element    br.com.pztec.estoque:id/btn_gravar_assunto
#     Wait Until Element Is Visible    android:id/search_button
#     Element Should Contain Text    //android.widget.TextView[@text='${descri}']    ${descri}


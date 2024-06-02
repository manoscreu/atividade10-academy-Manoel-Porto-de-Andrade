*** Settings ***
Resource    ..//base.robot


*** Variables ***
#Prefixos
${prefixoTextos}        //android.widget.TextView
${prefixoBotoes}        //android.view.View

#Botoes
${allowCam}              id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${allowFiles}            id=com.android.permissioncontroller:id/permission_allow_button
${buttonNew}             id=br.com.pztec.estoque:id/Button1
${buttonMenu}            id=br.com.pztec.estoque:id/Button3
${buttonSearch}          id=android:id/search_button
${buttonValidade}        id=br.com.pztec.estoque:id/data
${buttonSave}            id=br.com.pztec.estoque:id/btn_gravar_assunto
${buttonReport}          id=br.com.pztec.estoque:id/btn_relatorios
${buttonInventory}       id=br.com.pztec.estoque:id/inventario
${buttonEntries}         id=br.com.pztec.estoque:id/relentrada
${buttonOuts}            id=br.com.pztec.estoque:id/relsaida
${buttonGerarPDF}        id=br.com.pztec.estoque:id/btn_gerar
${buttonEmail}           id=br.com.pztec.estoque:id/btn_email
${buttonViewPDF}         id=br.com.pztec.estoque:id/btn_abrir
${buttonStartDate}       id=br.com.pztec.estoque:id/data1
${buttonFinalDate}       id=br.com.pztec.estoque:id/data2
${calendario}            id=android:id/month_view
${dataInicio}            ${prefixoBotoes}    [@content-desc="02 June 2024"]
${dataFim}               ${prefixoBotoes}    [@content-desc="30 June 2024"]
${buttonOkCalendario}    android:id/button1
${buttonPesquisa}        id=android:id/search_button


#Campos input de texto
${campoCode}             id=br.com.pztec.estoque:id/txt_codigo
${campoDescription}      id=br.com.pztec.estoque:id/txt_descricao
${campoPacking}          id=br.com.pztec.estoque:id/txt_unidade
${campoAmount}           id=br.com.pztec.estoque:id/txt_quantidade
${campoUnitValue}        id=br.com.pztec.estoque:id/txt_valunit
${campoLot}              id=br.com.pztec.estoque:id/txt_lote


#Faker


#Textos
${mmDescription}         id=br.com.pztec.estoque:id/txt_descricao
${mmAmount}              ${prefixoTextos}    [contains(@resource-id,"br.com.pztec.estoque:id/txt_quantidade")]
${mmValue}               ${prefixoTextos}    [contains(@resource-id,"br.com.pztec.estoque:id/txt_valunit")]
${textoProductReg}       ${prefixoTextos}    [@text="Product Registration"]
${textoPdfView}          ${prefixoTextos}    [@text="inventory.pdf"]
${textoAllowCam}         id=com.android.permissioncontroller:id/permission_message
${textoMenu}             id=br.com.pztec.estoque:id/textView3
${message}               id=android:id/alertTitle
${textoMessage}          id=android:id/message
${share}                 id=android:id/title
${nomePdf}               id=android:id/content_preview_filename
${textoPdfGerado}        //android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafile"]





*** Keywords ***

Dado que o usuario se encontra no menu
    Element Should Be Visible    ${textoProductReg}
    Clica e espera    ${buttonMenu}    ${textoMenu}
Dado que o usuario se encontra na tela inicial do App
    Wait Until Element Is Visible    ${buttonPesquisa}
    Element Should Be Visible    ${buttonPesquisa}

Quando o usuario acessar a area report
    Clica e espera    ${buttonReport}    ${buttonInventory}

E acessar a area de entradas
    Clica e espera    ${buttonEntries}    ${buttonGerarPDF}

E acessar a area de estoque
    Clica e espera    ${buttonInventory}    ${buttonGerarPDF}

E acessar a area de saidas
    Clica e espera    ${buttonOuts}    ${buttonGerarPDF}
E usar a função de gerar pdf sem inserir datas
    Click Element    ${buttonGerarPDF}

Quando o usuario acessar a area de cadastro de produtos
    Clica e espera    ${buttonNew}    ${campoCode} 

E preencher todos os Campos
    Input Text    ${campoDescription}    Chicletes
    Input Text    ${campoAmount}         200
    Input Text    ${campoUnitValue}      0,25


E confirmar o cadastro
    Click Element    ${buttonSave}
    Wait Until Element Is Visible    ${textoProductReg}

E usar a função de gerar pdf inserindo datas
    Clica e espera    ${buttonStartDate}    ${calendario} 
    Click Element     ${dataInicio}
    Clica e espera    ${buttonOkCalendario}    ${buttonFinalDate}
    Clica e espera    ${buttonFinalDate}    ${calendario}
    Click Element     ${dataFim}
    Clica e espera    ${buttonOkCalendario}    ${buttonFinalDate}
    Click Element     ${buttonGerarPDF}
    Wait Until Element Is Visible    ${textoPdfGerado}

Entao o sistema deve realizar o cadastro do produto
    Wait Until Element Is Visible    ${buttonPesquisa}
    Wait Until Element Is Visible    //android.widget.TextView[@text='Chicletes']
    Element Should Contain Text      //android.widget.TextView[@text='Chicletes']    Chicletes
    Element Should Contain Text      ${mmAmount}         200
    Element Should Contain Text      ${mmValue}      0,25

Entao o pdf deve ser gerado com sucesso
    Element Should Be Visible       ${textoPdfGerado}
    Element Should Contain Text     ${textoPdfGerado}   inventory.pdf generated in
    
Entao o pdf de saidas deve ser gerado com sucesso
    Element Should Be Visible       ${textoPdfGerado}
    Element Should Contain Text     ${textoPdfGerado}   stockouts.pdf generated in  
    
Entao o pdf de entradas deve ser gerado com sucesso
    Element Should Be Visible       ${textoPdfGerado}
    Element Should Contain Text     ${textoPdfGerado}   stockentries.pdf generated in
    

Entao o sistema deve apresentar uma mensagem de erro 
    Element Should Contain Text     ${message}         Message
    Element Should Contain Text     ${textoMessage}    Please select a date range.

Entao deve ser possivel enviar o pdf por email
    Clica e espera    ${buttonEmail}    ${share} 
    Element Should Contain Text         ${nomePdf}    inventory.pdf

Entao deve ser possivel visualizar o pdf gerado
    Clica e espera    ${buttonViewPDF}    ${textoPdfView}
    Element Should Be Visible    ${textoPdfView}
    Element Should Contain Text    ${textoPdfView}    inventory.pdf

Entao o sistema deve 
    Sleep    10000
*** Settings ***
Resource    ..//base.robot


*** Variables ***
#Prefixos
${prefixoTextos}        //android.widget.TextView
${prefixoBotoes}        //android.view.View

#Botoes
${allowCam}              com.android.permissioncontroller:id/permission_allow_foreground_only_button
${allowFiles}            com.android.permissioncontroller:id/permission_allow_button
${buttonNew}             br.com.pztec.estoque:id/Button1
${buttonMenu}            br.com.pztec.estoque:id/Button3
${buttonSearch}          android:id/search_button
${buttonValidade}        br.com.pztec.estoque:id/data
${buttonSave}            br.com.pztec.estoque:id/btn_gravar_assunto
${buttonReport}          br.com.pztec.estoque:id/btn_relatorios
${buttonInventory}       br.com.pztec.estoque:id/inventario
${buttonEntries}         br.com.pztec.estoque:id/relentrada
${buttonOuts}            br.com.pztec.estoque:id/relsaida
${buttonGerarPDF}        br.com.pztec.estoque:id/btn_gerar
${buttonEmail}           br.com.pztec.estoque:id/btn_email
${buttonViewPDF}         br.com.pztec.estoque:id/btn_abrir
${buttonStartDate}       br.com.pztec.estoque:id/data1
${buttonFinalDate}       br.com.pztec.estoque:id/data2
${calendario}            android:id/month_view
${dataInicio}            ${prefixoBotoes}    [@content-desc="02 June 2024"]
${dataFim}               ${prefixoBotoes}    [@content-desc="30 June 2024"]
${buttonOkCalendario}    android:id/button1
${buttonPesquisa}        android:id/search_button


#Campos input de texto
${campoCode}             br.com.pztec.estoque:id/txt_codigo
${campoDescription}      br.com.pztec.estoque:id/txt_descricao
${campoPacking}          br.com.pztec.estoque:id/txt_unidade
${campoAmount}           br.com.pztec.estoque:id/txt_quantidade
${campoUnitValue}        br.com.pztec.estoque:id/txt_valunit
${campoLot}              br.com.pztec.estoque:id/txt_lote


#Faker


#Textos
${mmDescription}         br.com.pztec.estoque:id/txt_descricao
${mmAmount}              ${prefixoTextos}    [contains(@resource-id,"br.com.pztec.estoque:id/txt_quantidade")]
${mmValue}               ${prefixoTextos}    [contains(@resource-id,"br.com.pztec.estoque:id/txt_valunit")]
${textoProductReg}       ${prefixoTextos}    [@text="Product Registration"]
${textoPdfView}          ${prefixoTextos}    [@text="inventory.pdf"]
${textoAllowCam}         com.android.permissioncontroller:id/permission_message
${textoMenu}             br.com.pztec.estoque:id/textView3
${message}               android:id/alertTitle
${textoMessage}          android:id/message
${share}                 android:id/title
${nomePdf}               android:id/content_preview_filename
${textoPdfGerado}        //android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafile"]





*** Keywords ***

Dado que o usuario se encontra no menu
    Wait Until Element Is Visible    ${buttonPesquisa}
    Clica e espera    ${buttonMenu}    ${textoMenu}
Dado que o usuario se encontra na tela inicial do App
    Wait Until Element Is Visible    ${buttonPesquisa}
    Element Should Be Visible    ${buttonPesquisa}

Dado que ja existe um produto cadastrado no sistema
    Wait Until Element Is Visible    ${buttonPesquisa}

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
    Click Element    ${buttonNew}
    Wait Until Element Is Visible    br.com.pztec.estoque:id/txt_descricao 
    Input Text                       ${campoCode}           001
    Input Text                       ${campoDescription}    Chicletes
    Input Text                       ${campoPacking}        Caixa com 100
    Input Text                       ${campoAmount}         10
    Input Text                       ${campoUnitValue}      20
    Input Text                       ${campoLot}            001
    Click Element                    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}


E preencher todos os Campos e confirmar o cadastro
    Input Text                       ${campoCode}           001
    Input Text                       ${campoDescription}    Chicletes
    Input Text                       ${campoPacking}        Caixa com 100
    Input Text                       ${campoAmount}         10
    Input Text                       ${campoUnitValue}      20
    Input Text                       ${campoLot}            001
    Click Element                    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}


E confirmar o cadastro
    Click Element    ${buttonSave}
    

E usar a função de gerar pdf inserindo datas
    Clica e espera    ${buttonStartDate}        ${calendario} 
    Click Element     ${dataInicio}
    Clica e espera    ${buttonOkCalendario}     ${buttonFinalDate}
    Clica e espera    ${buttonFinalDate}        ${calendario}
    Click Element     ${dataFim}
    Clica e espera    ${buttonOkCalendario}     ${buttonFinalDate}
    Click Element     ${buttonGerarPDF}
    Wait Until Element Is Visible               ${textoPdfGerado}

Entao o sistema deve realizar o cadastro do produto
    Element Should Contain Text    //android.widget.TextView[@text='001']              001
    Element Should Contain Text    //android.widget.TextView[@text='Chicletes']        Chicletes
    Element Should Contain Text    //android.widget.TextView[@text='Caixa com 100']    Caixa com 100
    Element Should Contain Text    //android.widget.TextView[@text='10']               10
    Element Should Contain Text    //android.widget.TextView[@text='20,00']            20,00
    Element Should Contain Text    //android.widget.TextView[@text='001']              001
    

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

Entao o sistema avisar o usuario que os campos sao obrigatorios
    Element Should Not Contain Text    ${campoCode}     "    "       
    Element Should Not Contain Text    ${campoDescription}    "    "    
    Element Should Not Contain Text    ${campoPacking}    "    "
    Element Should Not Contain Text    ${campoAmount}    "    "
    Element Should Not Contain Text    ${campoUnitValue}         "    "   
    Element Should Not Contain Text    ${campoLot}          "    "        





    # Input Text                       ${campoCode}           001
    # Input Text                       ${campoDescription}    Chicletes
    # Input Text                       ${campoPacking}        Caixa com 100
    # Input Text                       ${campoAmount}         10
    # Input Text                       ${campoUnitValue}      20
    # Input Text                       ${campoLot}            001
    # Click Element                    ${buttonSave}
    # Wait Until Element Is Visible    ${buttonSearch}

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
${buttonGerar}           br.com.pztec.estoque:id/btn_gerar
${buttonEmail}           br.com.pztec.estoque:id/btn_email
${buttonViewPDF}         br.com.pztec.estoque:id/btn_abrir
${buttonStartDate}       br.com.pztec.estoque:id/data1
${buttonFinalDate}       br.com.pztec.estoque:id/data2
${calendario}            android:id/month_view
${dataInicio}            ${prefixoBotoes}    [@content-desc="02 June 2024"]
${dataFim}               ${prefixoBotoes}    [@content-desc="30 June 2024"]
${buttonOk}              android:id/button1
${buttonPesquisa}        android:id/search_button
${buttonAddAmount}       br.com.pztec.estoque:id/entrada
${buttonDecAmount}       br.com.pztec.estoque:id/saida
${buttonEdit}            br.com.pztec.estoque:id/editar
${buttonDelete}          br.com.pztec.estoque:id/deletar
${buttonSaveAmount}      br.com.pztec.estoque:id/btn_salvar
${buttonBackup}          br.com.pztec.estoque:id/btn_backup
${buttonRestore}         br.com.pztec.estoque:id/btn_restore
${buttonExport}          br.com.pztec.estoque:id/btn_exportar
${buttonImport}          br.com.pztec.estoque:id/btn_importar
${buttonSelectFile}      br.com.pztec.estoque:id/btn_procurar
${buttonEstoque}         //android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${selectBackupApp}       //android.widget.TextView[contains(@resource-id, "android:id/text1") and contains(@text, "APP_")]
${buttonProdutos}        br.com.pztec.estoque:id/btn_produtos
${buttonEntradas}        br.com.pztec.estoque:id/btn_entradas
${buttonSaidas}          br.com.pztec.estoque:id/btn_saidas
${buttonGrupos}          br.com.pztec.estoque:id/btn_grupos
${produtcsCsv}           //android.widget.TextView[contains(@resource-id,"android:id/text1") and contains(@text,"products.csv")]
${entradasCsv}           //android.widget.TextView[contains(@resource-id,"android:id/text1") and contains(@text,"stockentries.csv")]
${saidasCsv}             //android.widget.TextView[contains(@resource-id,"android:id/text1") and contains(@text,"stockouts.csv")]
${gruposCsv}             //android.widget.TextView[contains(@resource-id,"android:id/text1") and contains(@text,"group.csv")]



#Campos input de texto
${campoCode}             br.com.pztec.estoque:id/txt_codigo
${campoDescription}      br.com.pztec.estoque:id/txt_descricao
${campoPacking}          br.com.pztec.estoque:id/txt_unidade
${campoAmount}           br.com.pztec.estoque:id/txt_quantidade
${campoUnitValue}        br.com.pztec.estoque:id/txt_valunit
${campoLot}              br.com.pztec.estoque:id/txt_lote
${inputQuantEntrada}     br.com.pztec.estoque:id/txt_qtdentrada
${inputQuantSaida}       br.com.pztec.estoque:id/txt_qtdsaida
${inputSearch}           android:id/search_src_text



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
${textoQuantAtual}       br.com.pztec.estoque:id/txt_qtdatual
${item1}                 (//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/linha_parte1"])[1]
${textoFileProdutos}     br.com.pztec.estoque:id/datafileprod
${textoFileEntradas}     br.com.pztec.estoque:id/datafileent
${textoFilSaidas}        br.com.pztec.estoque:id/datafilesai
${textoFileGrupos}       br.com.pztec.estoque:id/datafilegrupo





*** Keywords ***

Dado que o usuario se encontra no menu
    Wait Until Element Is Visible    ${buttonPesquisa}
    Clica e espera    ${buttonMenu}    ${textoMenu}
Dado que o usuario se encontra na tela inicial do App
    Wait Until Element Is Visible    ${buttonPesquisa}
    Element Should Be Visible    ${buttonPesquisa}
Dado que ja existe um produto com movimentaçoes no sistema
    Wait Until Element Is Visible    ${buttonPesquisa}
    Click Element    ${buttonNew}
    Wait Until Element Is Visible    ${campoCode} 
    Input Text                       ${campoCode}           001
    Input Text                       ${campoDescription}    Chicletes
    Input Text                       ${campoPacking}        Caixa com 100
    Input Text                       ${campoAmount}         10
    Input Text                       ${campoUnitValue}      20
    Input Text                       ${campoLot}            001
    Click Element                    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}
    Clica e espera    ${buttonAddAmount}    ${textoQuantAtual}
    Input Text    ${inputQuantEntrada}    50
    Click Element    ${buttonSaveAmount}
    Wait Until Element Is Visible    ${buttonPesquisa}
    Clica e espera    ${buttonDecAmount}    ${textoQuantAtual}
    Input Text    ${inputQuantSaida}    10
    Click Element    ${buttonSaveAmount}
    Wait Until Element Is Visible    ${buttonPesquisa}

E o usuario ja fez uma exportaçao de dados
    Clica e espera    ${buttonMenu}    ${textoMenu}
    Clica e espera    ${buttonExport}    ${buttonGerar}
    Clica e espera    ${buttonGerar}    ${message}
    Element Should Contain Text    ${message}    Operation completed!
    Element Should Contain Text    ${textoMessage}    Send
    Clica e espera    ${buttonOk}    ${buttonGerar}
    Element Should Contain Text    ${textoFileProdutos}    products.csv
    Element Should Contain Text    ${textoFileEntradas}    stockentries.csv
    Element Should Contain Text    ${textoFilSaidas}       stockouts.csv
    Element Should Contain Text    ${textoFileGrupos}      group.csv
    Press Keycode    4

Quando o usuario acessar a area de importação de produtos
    Clica e espera    ${buttonImport}    ${buttonProdutos}
    Clica e espera    ${buttonProdutos}    ${buttonEstoque}
Quando o usuario acessar a area de importação de entradas
    Clica e espera    ${buttonImport}    ${buttonProdutos}
    Clica e espera    ${buttonEntradas}    ${buttonEstoque}

Quando o usuario acessar a area de importação de saidas
    Clica e espera    ${buttonImport}    ${buttonProdutos}
    Clica e espera    ${buttonSaidas}    ${buttonEstoque}
Quando o usuario acessar a area de importação de grupos
    Clica e espera    ${buttonImport}    ${buttonProdutos}
    Clica e espera    ${buttonGrupos}    ${buttonEstoque}



Entao o usuario podera fazer a importação de produtos
    Clica e espera    ${buttonEstoque}    ${produtcsCsv}
    Clica e espera    ${produtcsCsv}    ${message}
    Element Should Contain Text    ${message}    ATTENTION
    Element Should Contain Text    ${textoMessage}    All registered products (if any) will be deleted and 1 products from CSV file will be imported. Are you sure you want to run? You can not undo this operation.
    Clica e espera    ${buttonOk}    ${message}
    Element Should Contain Text    ${message}    Message
    Element Should Contain Text    ${textoMessage}    1 records inserted.
    Clica e espera    ${buttonOk}    ${buttonProdutos}

Entao o usuario podera fazer a importação das entradas
    Clica e espera    ${buttonEstoque}    ${entradasCsv}
    Clica e espera    ${entradasCsv}    ${message}
    Element Should Contain Text    ${message}    ATTENTION
    Element Should Contain Text    ${textoMessage}    All registered stock entries (if any) will be deleted and 1 stock entries from CSV file will be imported. Are you sure you want to run? You can not undo this operation.
    Clica e espera    ${buttonOk}    ${message}
    Element Should Contain Text    ${message}    Operation completed!
    Element Should Contain Text    ${textoMessage}    1 records inserted.
    Clica e espera    ${buttonOk}    ${buttonProdutos}

Entao o usuario podera fazer a importação das saidas
    Clica e espera    ${buttonEstoque}    ${saidasCsv}
    Clica e espera    ${saidasCsv}    ${message}
    Element Should Contain Text    ${message}    ATTENTION
    Element Should Contain Text    ${textoMessage}    All registered stock outs (if any) will be deleted and 1 stock outs from CSV file will be imported. Are you sure you want to run? You can not undo this operation.
    Clica e espera    ${buttonOk}    ${message}
    Element Should Contain Text    ${message}    Operation completed!
    Element Should Contain Text    ${textoMessage}    1 records inserted.
    Clica e espera    ${buttonOk}    ${buttonProdutos}

Entao o usuario podera fazer a importação dos grupos 
    Clica e espera    ${buttonEstoque}    ${gruposCsv}
    Clica e espera    ${gruposCsv}    ${message}
    Element Should Contain Text    ${message}    ATTENTION
    Element Should Contain Text    ${textoMessage}    All registered groups (if any) will be deleted and 1 products groups from CSV file will be imported. Are you sure you want to run? You can not undo this operation.
    Clica e espera    ${buttonOk}    ${message}
    Element Should Contain Text    ${message}    Operation completed!
    Element Should Contain Text    ${textoMessage}    1 records inserted.
    Clica e espera    ${buttonOk}    ${buttonProdutos}

Quando o usuario acessar a area de exportaçao de dados sem alterar produtos antes
    Clica e espera    ${buttonExport}    ${buttonGerar}
Quando o usuario acessar a area de exportaçao de dados
    Clica e espera    ${buttonMenu}    ${textoMenu}
    Clica e espera    ${buttonExport}    ${buttonGerar}

    
E gerar uma exportaçao
    Clica e espera    ${buttonGerar}    ${message}
    Element Should Contain Text    ${message}    Operation completed!
    Element Should Contain Text    ${textoMessage}    Send
    Clica e espera    ${buttonOk}    ${buttonGerar}

Entao o sistema nao deve gerar a exportaçao de produtos entradas e saidas
    Element Should Contain Text    ${textoFileProdutos}    File not generated!
    Element Should Contain Text    ${textoFileEntradas}    File not generated!
    Element Should Contain Text    ${textoFilSaidas}       File not generated!
    Element Should Contain Text    ${textoFileGrupos}      group.csv
Entao o sistema deve gerar a exportaçao de produtos entradas e saidas
    Element Should Contain Text    ${textoFileProdutos}    products.csv
    Element Should Contain Text    ${textoFileEntradas}    stockentries.csv
    Element Should Contain Text    ${textoFilSaidas}       stockouts.csv
    Element Should Contain Text    ${textoFileGrupos}      group.csv


E selecionar um arquivo de restauração e confirmar
    Clica e espera    ${buttonSelectFile}    ${buttonEstoque}
    Clica e espera    ${buttonEstoque}    ${selectBackupApp}
    Clica e espera    ${selectBackupApp}   ${message}
    Wait Until Element Is Visible    ${message}
    Element Should Contain Text    ${message}    Confirms to restore
    Element Should Contain Text    ${textoMessage}    Warning: You can not undo this operation. Are you sure you want to continue?
    Clica e espera    ${buttonOk}    ${message}
    Element Should Contain Text    ${message}    Message
    Element Should Contain Text    ${textoMessage}    Operation completed!
    Clica e espera    ${buttonOk}    ${buttonRestore}

Entao o sistema deve realizar a restauração
    Element Should Be Visible    ${buttonRestore}
    Press Keycode    4
    Element Should Be Visible    ${buttonSearch}

Dado que ja existe um backup no sistema
    Wait Until Element Is Visible    ${buttonPesquisa}
    Clica e espera    ${buttonMenu}    ${textoMenu}
    Clica e espera    ${buttonBackup}    ${buttonGerar}
    Click Element    ${buttonGerar}
    Wait Until Element Is Visible    ${message}
    Element Should Contain Text    ${message}      Operation completed!
    Element Should Contain Text    ${textoMessage}    Send
    Click Element    ${buttonOk}
    Press Keycode    4
    Wait Until Element Is Visible    ${buttonRestore}

Quando o usuario acessar a area de restauração
    Clica e espera    ${buttonRestore}    ${buttonSelectFile}

Dado que ja existe um produto cadastrado no sistema
    Wait Until Element Is Visible    ${buttonPesquisa}
    Click Element    ${buttonNew}
    Wait Until Element Is Visible    ${campoCode} 
    Input Text                       ${campoCode}           001
    Input Text                       ${campoDescription}    Chicletes
    Input Text                       ${campoPacking}        Caixa com 100
    Input Text                       ${campoAmount}         10
    Input Text                       ${campoUnitValue}      20
    Input Text                       ${campoLot}            001
    Click Element                    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}


Quando o usuario usar a opção de excluir um produto
    Clica e espera    ${buttonDelete}    ${message}


Quando o usuario acessar a area backups
    Clica e espera    ${buttonBackup}    ${buttonGerar}

E usar a função de gerar backup
    Click Element    ${buttonGerar}
    Wait Until Element Is Visible    ${message}
    Element Should Contain Text    ${message}      Operation completed!
    Element Should Contain Text    ${textoMessage}    Send
    Click Element    ${buttonOk}

Entao o sistema deve gerar um arquivo de backup
    Wait Until Element Is Visible    ${textoPdfGerado}
    Element Should Contain Text    ${textoPdfGerado}    APP_

Entao o sistema deve apresentar uma mensagem pedindo confimaçao da exclusao
    Element Should Contain Text    ${message}         Message
    Element Should Contain Text    ${textoMessage}    Delete?
    Click Element    ${buttonOk}

E o sistema deve excluir o produto do estoque
    Wait Until Element Is Visible    ${buttonSearch}

Quando o usuario acessar a area de edição de produto
    Clica e espera    ${buttonEdit}    ${campoCode}

E alterar o cadastro do produto
    Clear Text    ${campoDescription}
    Input Text    ${campoDescription}    Abacate

Dado que ja existe mais de um produto cadastrado no sistema
    Cria produtos    001    Teclado Games             1un    44     800     01
    Cria produtos    002    Monitor Acer              1un    12     1500    02
    Cria produtos    003    Headset da xuxa           1un    800    10      03
    Cria produtos    004    Placa de video quebrada   1un    10     5000    04

Quando o usuario ativar a opçao de pesquisa
    Click Element    ${buttonSearch}
    Wait Until Element Is Visible    ${inputSearch}

E pesquisar pelo nome de um produto cadastrado
    Input Text    ${inputSearch}      Headset da xuxa   
    Press Keycode    66 

Entao o sistema deve apresentar apenas o produto que condiz com o nome
    Element Should Contain Text    ${campoDescription}  Headset da xuxa 
    Element Should Contain Text    ${campoCode}    003
Deve ser possivel cadastrar varios produtos
    [Arguments]    ${codigo}    ${descricao}    ${unidade}    ${quantidade}    ${valor}    ${lote}=
    Wait Until Element Is Visible    ${buttonNew}
    Click Element    ${buttonNew}
    Wait Until Element Is Visible ${campoDescription}
    Input Text    ${campoCode}    ${codigo}
    Input Text    ${campoDescription}    ${descricao}
    Input Text    ${campoPacking}    ${unidade}
    Input Text    ${campoAmount}    ${quantidade}
    Input Text    ${campoUnitValue}    ${valor}
    Input Text    ${campoLot}    ${lote}
    Click Element    ${buttonSave}
    Wait Until Element Is Visible    ${buttonSearch}
    Element Should Contain Text    //android.widget.TextView[@text='${descricao}']    ${descricao}


E finalizar a alteraçao
    Clica e espera    ${buttonSave}    ${buttonSearch}

Entao o sistema deve apresentar o produto atualizado
    Element Should Contain Text    ${campoDescription}    Abacate
Quando o usuario acessar a opçao de aumentar a quantidade no sistema
    Clica e espera    ${buttonAddAmount}    ${textoQuantAtual}

Quando o usuario acessar a opçao de diminuir a quantidade no sistema
    Clica e espera    ${buttonDecAmount}    ${textoQuantAtual}

Quando o usuario acessar a area report
    Clica e espera    ${buttonReport}    ${buttonInventory}

E acessar a area de entradas
    Clica e espera    ${buttonEntries}    ${buttonGerar}

E acessar a area de estoque
    Clica e espera    ${buttonInventory}    ${buttonGerar}

E preencher com a quantidade a aumentar
    Input Text    ${inputQuantEntrada}    10

E preencher com a quantidade a diminuir
    Input Text    ${inputQuantSaida}    10

E preencher com a quantidade a diminuir que fique abaixo de 0
    Input Text    ${inputQuantSaida}    15

E confirmar a operaçao de mudança de estoque
    Click Element    ${buttonSaveAmount}    

Entao o sistema deve apresentar o novo valor maior
    Wait Until Element Is Visible    ${buttonSearch}
    Element Should Contain Text    ${campoAmount}    20

Entao o sistema deve apresentar o novo valor menor
    Wait Until Element Is Visible    ${buttonSearch}
    Element Should Contain Text    ${campoAmount}    0

E acessar a area de saidas
    Clica e espera    ${buttonOuts}    ${buttonGerar}
E usar a função de gerar pdf sem inserir datas
    Click Element    ${buttonGerar}

Quando o usuario acessar a area de cadastro de produtos
    Click Element    ${buttonNew}
    Wait Until Element Is Visible    br.com.pztec.estoque:id/txt_descricao 


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
    Clica e espera    ${buttonOk}     ${buttonFinalDate}
    Clica e espera    ${buttonFinalDate}        ${calendario}
    Click Element     ${dataFim}
    Clica e espera    ${buttonOk}     ${buttonFinalDate}
    Click Element     ${buttonGerar}
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
    
Entao o sistema deve apresentar uma mensagem com erro estoque insuficiente
    Element Should Contain Text     ${message}         Message
    Element Should Contain Text     ${textoMessage}    Insufficient stock
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

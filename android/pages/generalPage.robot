*** Settings ***
Resource    ..//base.robot
Library    XML

*** Variables ***
#Botoes
${allowCam}              id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${allowFiles}            id=com.android.permissioncontroller:id/permission_allow_button
${buttonNew}             id=br.com.pztec.estoque:id/Button1
${buttonMenu}            id=br.com.pztec.estoque:id/Button3
${buttonSearch}          id=android:id/search_button
${buttonValidade}        id=br.com.pztec.estoque:id/data
${buttonSave}            id=br.com.pztec.estoque:id/btn_gravar_assunto

#Campos de texto
${campoCode}             id=br.com.pztec.estoque:id/txt_codigo
${campoDescription}      id=br.com.pztec.estoque:id/txt_descricao
${campoPacking}          id=br.com.pztec.estoque:id/txt_unidade
${campoAmount}           id=br.com.pztec.estoque:id/txt_quantidade
${campoUnitValue}        id=br.com.pztec.estoque:id/txt_valunit
${campoLot}              id=br.com.pztec.estoque:id/txt_lote




#Textos
${txtProductReg}        //android.widget.TextView[@text="Product Registration"]



*** Keywords ***

*Settings
Resource                          ${EXECDIR}/resources/base.robot  
Test Setup                        Start Session
Test Teardown                     Take Screenshot  ${EXECDIR}/results/evidencias/pass-screenshot-{index}

*Test Cases
Deve realizar um novo pedido
    [Tags]                            1

    ${massa_teste_pedido}             Get JSON  pedido.json

    Go To restaurants Page
    Seleciona um restaurante          ${massa_teste_pedido}    

    FOR  ${produto}  IN  @{massa_teste_pedido["produtos"]}
        Coloca o produto no carrinho  ${produto["nome_produto"]}    
        Valida produto no carrinho    ${produto["nome_produto"]}
    END

    Aciona Fechar Pedido
    Preenche dados pessoais          ${massa_teste_pedido["cliente"]}
    Seleciona forma de pagamento     ${massa_teste_pedido}

*Keywords
Aciona Fechar Pedido      
    ${elemento_titulo_pagina}  set Variable   css=.page-header   
    Click                      css=#cart > div.box-footer > div > a
    Wait for elements state    ${elemento_titulo_pagina}  visible  5
    Get text                   ${elemento_titulo_pagina}  contains  Finalize o seu pedido    

Preenche dados pessoais
    [Arguments]              ${cliente}
    Fill Text                css=input[formcontrolname="name"]               ${cliente["nome_cliente"]}
    Fill Text                css=input[formcontrolname="email"]              ${cliente["emai"]}
    Fill Text                css=input[formcontrolname="emailConfirmation"]  ${cliente["email2"]}
    Fill Text                css=input[formcontrolname="address"]            ${cliente["endereco"]}
    Fill Text                css=input[formcontrolname="number"]             ${cliente["numero"]}
    Fill Text                css=input[formcontrolname="optionalAddress"]    ${cliente["complemento"]}

Seleciona forma de pagamento
    [Arguments]  ${massa_teste_pedido}

    IF           '${massa_teste_pedido["forma_pagamento"]}'=='Dinheiro'
    click        xpath=(//mt-radio//div//label)[1]//div

    ELSE IF      '${massa_teste_pedido["forma_pagamento"]}'=="Cartão de Débito"
    click        xpath=(//mt-radio//div//label)[2]//div

    ELSE IF      '${massa_teste_pedido["forma_pagamento"]}'=="Cartão Refeição"
    click        xpath=(//mt-radio//div//label)[3]//div

    END
 
    log          Selecionado ${massa_teste_pedido["forma_pagamento"]} como forma de pagamento

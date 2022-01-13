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
    Finaliza transacao 


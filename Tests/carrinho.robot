*Settings
Resource                          ${EXECDIR}/resources/base.robot  
Test Setup                        Start Session
Test Teardown                     Take Screenshot  ${EXECDIR}/results/evidencias/pass-screenshot-{index}

*Test Cases

Deve adicionar itens ao carrinho de acordo com o arquivo de massa
    [Tags]                        1
    
    ${massa_teste}                Get JSON  massa.json
   
    Go To restaurants Page  
    Seleciona um restaurante      ${massa_teste}    

    FOR  ${produto}  IN  @{massa_teste["produtos"]}
        Coloca o produto no carrinho  ${produto["nome_produto"]}    
        Valida produto no carrinho    ${produto["nome_produto"]}
    END

    Valida total produto          ${massa_teste["total"]}


Deve adicionar um item ao carrinho
    [Tags]                        2
    
    &{restaurante}                Create dictionary  restaurante=PIZZA BUG  desc=Precisa corrigir bugs em produção depois do expediente? Peça Pizza Bug. 

    Go To restaurants Page  
    Seleciona um restaurante      ${restaurante}    
    Coloca o produto no carrinho  Pizza de mussarela    
    Valida produto no carrinho    Pizza de mussarela
    Coloca o produto no carrinho  Pizza de peperoni    
    Valida produto no carrinho    Pizza de peperoni
    Valida total produto          18,40





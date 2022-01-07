*Settings
Resource                          ${EXECDIR}/resources/base.robot  
Test Setup                        Start Session
Test Teardown                     Take Screenshot  ${EXECDIR}/results/evidencias/pass-screenshot-{index}

*Test Cases
Deve adicionar um item ao carrinho
    [Tags]                        1
    &{restaurante}                Create Dictionary  name=Pizza Bug  desc=Precisa corrigir bugs em produção depois do expediente? Peça Pizza Bug.
   
    Go To restaurants Page  
    Seleciona um restaurante      ${restaurante}    
    Coloca o produto no carrinho  Pizza de peperoni    
    Valida produto no carrinho    Pizza de peperoni
    Valida total produto          15,90

Deve adicionar varios itens ao carrinho
    [Tags]                        2
    &{restaurante}                Create Dictionary  name=Pizza Bug  desc=Precisa corrigir bugs em produção depois do expediente? Peça Pizza Bug.
   
    Go To restaurants Page  
    Seleciona um restaurante      ${restaurante}    
    Coloca o produto no carrinho  Pizza de mussarela    
    Valida produto no carrinho    Pizza de mussarela
    Coloca o produto no carrinho  Pizza de peperoni    
    Valida produto no carrinho    Pizza de peperoni
    Valida total produto          18,40

*Keywords




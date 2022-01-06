*Settings
Resource                     ${EXECDIR}/resources/base.robot  

*Test Cases
Deve buscar um unico restaurante
    #Steps    
    Start Session
    Go To restaurants Page
    Search Restaurants By    Debuger
    Validate Search          DEBUGER KING  1
    Close Browser
    
Deve buscar por categoria
    Start Session
    Go To restaurants Page
    Search Restaurants By    cafe
    Validate Search          STARBUGS COFFEE  1
    Close Browser
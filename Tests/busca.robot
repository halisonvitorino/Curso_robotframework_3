*Settings
Resource                     ${EXECDIR}/resources/base.robot  
Test Setup                   Start Session
Test Teardown                Take Screenshot  pass-screenshot-{index}

*Test Cases
Deve buscar um unico restaurante 
    Go To restaurants Page
    Search Restaurants By    Debuger
    Validate Search          DEBUGER KING  1

Deve buscar por categoria
    Go To restaurants Page
    Search Restaurants By    cafe
    Validate Search          STARBUGS COFFEE  1

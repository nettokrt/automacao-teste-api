#language:pt

Funcionalidade: Teste de API com HTTParty e Cucumber

    @smoke_test @200 @#marcos_netto
    Cenario: Validar status code da resposta
        Quando eu faço uma requisição "<endpoint>" GET
        Entao o status code deve ser 200
        
        Exemplos:
        | endpoint  |
        |  /users   |
        |  /posts   |
        | /comments |
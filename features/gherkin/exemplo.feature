#language:pt

Funcionalidade: Teste de API com HTTParty e Cucumber

    @smoke_test @200 @#marcos_netto
    Cenario: Validar status code da resposta
        Quando que eu faço uma requisição GET
        Entao o status code deve ser 200
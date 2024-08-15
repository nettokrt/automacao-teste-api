Feature: Teste de API com HTTParty e Cucumber

    Scenario: Validar status code da resposta
        Given que eu faço uma requisição GET para "https://jsonplaceholder.typicode.com/posts/1"
        Then o status code deve ser 200
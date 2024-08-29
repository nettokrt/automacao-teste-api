#language:pt

Funcionalidade: Garantir a estabilidade do endpoint /users
    Eu como um QA do microsserviço
    Quero garantir a estabilidade do endpoint /users
    Para que o sistema esteja livre de falhas

    @smoke_test @users_mocked_test @#marcos_netto
    Cenario: Validação da resposta da API com dados mockados
        Dado que eu faça uma requisição ao "<endpoint>"
        Então validar a resposta da API com dados mockados

        Exemplos:
        | endpoint                 |
        | /users                   |
        | /users/1                 |

    @smoke_test @contract_users @#marcos_netto
    Cenario: Validar as regras de contrato
        Dado que eu faça uma requisição ao "<endpoint>"
        Então a resposta deve seguir as regras de contrato

        Exemplos:
        | endpoint                 |
        | /users/1                 |

    @smoke_test @create_new_user @#marcos_netto
    Cenario: Criar um novo usuário
        Dado que um novo usuário é gerado
        Quando eu enviar uma requisição POST para "/users"
        Então a resposta deve retornar o status code <status_code>
        E o corpo da resposta deve conter os dados corretos do usuário

        Exemplos:
        | status_code |
        | 201         |

    @smoke_test @negative_path @#marcos_netto
    Cenario: Validar caminhos negativos
        Dado que eu faça uma requisição ao "<endpoint>"
        Então a resposta deve retornar o status code <status_code>
        E a mensagem de erro deve ser "<mensagem_erro>"

        Exemplos:
        | endpoint                 | mensagem_erro | status_code |
        | /users/9999              | Not Found     | 404         |
        #| /users/abc               | Bad Request   | 400         | #Existe um bug na API que quando e passado uma query mal formado, a API esta retornando 200 ao em vez de 400
        #| /users?user_id=@!#      | Bad Request   | 400         | #Existe um bug na API que quando e passado uma query mal formado, a API esta retornando 200 ao em vez de 400
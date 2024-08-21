# Documentação do Projeto


# Documentação das Funções Utilitárias

## Funções de Comparação: 
### Função: `comparar_dados`

**Descrição**: Compara dados esperados com dados reais, verificando se os valores correspondem. A função realiza a comparação recursivamente para estruturas de dados aninhadas e lança uma exceção se houver discrepâncias.

**Parâmetros**:
- `expected` (Hash): O hash contendo os valores esperados para comparação.
- `actual` (Hash): O hash contendo os valores reais a serem comparados com os valores esperados.
- `path` (String, opcional): O caminho atual na estrutura de dados, utilizado para gerar mensagens de erro mais detalhadas. O valor padrão é uma string vazia.

**Exceção**:
- Lança uma exceção com a mensagem "Falha no campo: #{current_path}. Esperado: #{value}, Obtido: #{actual_value}" se um valor real não corresponder ao valor esperado.

**Comportamento**:
- A função itera sobre cada chave e valor no hash `expected`.
- Se o valor associado a uma chave é um hash, a função faz uma chamada recursiva para comparar os dados aninhados.
- Se o valor não é um hash, a função compara o valor esperado com o valor real.
- Se houver uma discrepância, a função lança uma exceção detalhando o caminho do campo, o valor esperado e o valor obtido.

**Exemplo de Uso**:

```ruby
expected = {
  user: {
    name: "Alice",
    email: "alice@example.com"
  },
  address: {
    city: "Wonderland"
  }
}

actual = {
  user: {
    name: "Alice",
    email: "alice@example.com"
  },
  address: {
    city: "Wonderland"
  }
}

begin
  self.comparar_dados(expected, actual)
  puts "Todos os dados estão corretos."
rescue => e
  puts "Erro: #{e.message}"
end
```

## Funções de Manipulação de Dados

### Função: `validate_type`

**Descrição**: Valida se um valor específico dentro de um hash possui o tipo esperado. Se o valor não estiver presente no hash ou não for do tipo esperado, uma exceção é lançada.

**Parâmetros**:
- `data` (Hash): O hash que contém o valor a ser verificado.
- `key` (Symbol, String): A chave dentro do hash cujo valor será validado.
- `type` (Class): O tipo esperado para o valor associado à chave no hash.

**Exceção**:
- Lança uma exceção com a mensagem "Tipo inválido para '#{key}': esperado #{type}, encontrado #{data[key].class}" se o valor não estiver presente no hash ou não for do tipo esperado.

**Exemplo de Uso**:

```ruby
data = { name: "Alice", age: 30 }
key = :age
expected_type = Integer

begin
  self.validate_type(data, key, expected_type)
  puts "O tipo está correto."
rescue => e
  puts "Erro: #{e.message}"
```
### Função: `verify_status_code`

**Descrição**: Verifica se o código de status retornado pela resposta corresponde ao código esperado. Se os códigos não corresponderem, uma exceção é lançada.

**Parâmetros**:
- `response` (Object): O objeto de resposta que contém o código de status a ser verificado.
- `expected_code` (Integer): O código de status esperado para a resposta.

**Exceção**:
- Lança uma exceção com a mensagem "Status esperado: #{expected_code}, Status obtido: #{response.code}" se o código de status da resposta não corresponder ao código esperado.

**Exemplo de Uso**:

```ruby
response = some_api_call
expected_code = 200

begin
  self.verify_status_code(response, expected_code)
  puts "O código de status está correto."
rescue => e
  puts "Erro: #{e.message}"
end
```
### Função: `validate_email`
**Descrição**: Valida se um endereço de e-mail possui um formato válido. Se o formato do e-mail não estiver correto, uma exceção é lançada.

**Parâmetros**:
- `email` (String): O endereço de e-mail a ser validado.

**Exceção**:
- Lança uma exceção com a mensagem "Formato de e-mail inválido: #{email}" se o e-mail não corresponder ao formato esperado.

**Expressão Regular**:
- A função utiliza a expressão regular `/\A[^@\s]+@[^@\s]+\z/` para verificar o formato do e-mail. Esta expressão valida a presença de um caractere `@` e que há caracteres antes e depois dele, mas não garante uma validação completa do e-mail.

**Exemplo de Uso**:

```ruby
email = "teste@dominio.com"

begin
  self.validate_email(email)
  puts "O e-mail está no formato correto."
rescue => e
  puts "Erro: #{e.message}"
end
```
### Função: `validate_zipcode`


**Descrição**: Valida se um código postal (CEP) possui o formato correto. Se o formato do CEP não estiver correto, uma exceção é lançada.

**Parâmetros**:
- `zipcode` (String): O código postal (CEP) a ser validado.

**Exceção**:
- Lança uma exceção com a mensagem "Formato de CEP inválido: #{zipcode}" se o CEP não corresponder ao formato esperado.

**Expressão Regular**:
- A função utiliza a expressão regular `/^\d{5}-\d{4}$/` para validar o formato do CEP. Esta expressão garante que o CEP esteja no formato "12345-678", com cinco dígitos seguidos por um hífen e mais quatro dígitos.

**Exemplo de Uso**:

```ruby
zipcode = "12345-678"

begin
  self.validate_zipcode(zipcode)
  puts "O CEP está no formato correto."
rescue => e
  puts "Erro: #{e.message}"
end
```
### Função: `validate_geo_coordinates`


**Descrição**: Valida se uma coordenada geográfica está no formato correto. Se o formato da coordenada não estiver correto, uma exceção é lançada.

**Parâmetros**:
- `coordinate` (String): A coordenada geográfica a ser validada.

**Exceção**:
- Lança uma exceção com a mensagem "Formato de coordenada geográfica inválido: #{coordinate}" se a coordenada não corresponder ao formato esperado.

**Expressão Regular**:
- A função utiliza a expressão regular `/^(-?\d+(\.\d+)?)$/` para validar o formato da coordenada. Esta expressão garante que a coordenada seja um número inteiro ou decimal, com um possível sinal negativo na frente.

**Exemplo de Uso**:

```ruby
coordinate = "37.7749"

begin
  self.validate_geo_coordinates(coordinate)
  puts "A coordenada está no formato correto."
rescue => e
  puts "Erro: #{e.message}"
end
```
### Função: `validate_phone`

**Descrição**: Valida se um número de telefone está no formato correto. Se o formato do telefone não estiver correto, uma exceção é lançada.

**Parâmetros**:
- `phone` (String): O número de telefone a ser validado.

**Exceção**:
- Lança uma exceção com a mensagem "Formato de telefone inválido: #{phone}" se o número de telefone não corresponder ao formato esperado.

**Expressão Regular**:
- A função utiliza a expressão regular `/^\d{1,4}-\d{3}-\d{3}-\d{4}( x\d+)?$/` para validar o formato do telefone. Esta expressão permite números de telefone no formato "1234-456-789-0123" com um possível ramal no formato " x1234".

**Exemplo de Uso**:

```ruby
phone = "1234-456-789-0123 x1234"

begin
  self.validate_phone(phone)
  puts "O telefone está no formato correto."
rescue => e
  puts "Erro: #{e.message}"
end
```
### Função: `validate_website`

**Descrição**: Valida se um endereço de website possui um formato correto. Se o formato do website não estiver correto, uma exceção é lançada.

**Parâmetros**:
- `website` (String): O endereço do website a ser validado.

**Exceção**:
- Lança uma exceção com a mensagem "Formato de website inválido: #{website}" se o endereço do website não corresponder ao formato esperado.

**Expressão Regular**:
- A função utiliza a expressão regular `/\A[^\s]+\z/` para validar o formato do website. Esta expressão garante que o website não contenha espaços e que seja uma sequência de caracteres não vazios.

**Exemplo de Uso**:

```ruby
website = "https://www.example.com"

begin
  self.validate_website(website)
  puts "O website está no formato correto."
rescue => e
  puts "Erro: #{e.message}"
end
```
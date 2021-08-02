# Módulo de Web API

## Conceitos úteis apresentados

- Para termos um container para widgets na horizontal, podemos utilizar o `Row`.
Que tem o mesmo comportamento do `Column`, mas funciona na horizontal.
  
- O próprio Flutter já oferece alguns mecanismos padrões para fazer conversão de/para JSON.
Podemos utilizar o `jsonDecode` para converter de JSON para objeto. E `jsonEncode` para converter
  um objeto para JSON.
  ```dart
  // convertendo de JSON para objeto
  final Map<String, dynamic> objJson = jsonDecode(stringJson);
  
  // convertendo um objeto para JSON
  final String json = jsonEncode(objeto);
  ```
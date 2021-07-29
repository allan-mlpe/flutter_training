# Módulo de Persistência

## Conceitos úteis apresentados

- Criar navegação entre rotas:
```dart
Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => WidgetAlvo()
    )
);
````

- Adicionar atributos como altura e largura em Widgets que não tem essas propriedades:
```dart
// podemos envolver o componente com `SizedBox`
SizedBox(
  width: ...,
  height: ...,
  child: WidgetQualquer(...),
)
```

## Banco de dados
- Para trabalhar com o SQL, utilizamos no curso o [SQFlite](https://pub.dev/packages/sqflite). O cookbook do Flutter para utilização
dese framework pode ser encontrato [aqui](https://flutter.dev/docs/cookbook/persistence/sqlite).
  
- Dependências - além do `sqflite`, é importante importar o `path` para abstrair conceitos de caminhos nos diversos Sistemas Operacionais.
```yaml
// pubspec.yaml
...
dependencies:
  flutter:
    sdk: flutter
  sqflite:
  path:
...
```

- Limpar banco de dados: uma das estratégias que podemos utilizar para limpar o banco de dados é usar a linha de código abaixo. Contudo, é recomendável apenas usá-la em ambientes de desenvolvimento e testes.
```dart
// app_database.dart
...
onDowngrade: onDatabaseDowngradeDelete,
...
```
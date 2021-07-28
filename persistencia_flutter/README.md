# Módulo de Persistência

## Conceitos úteis apresentados

- Criar navegação entre rotas:
```
Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => WidgetAlvo()
    )
);
````

- Adicionar atributos como altura e largura em Widgets que não tem essas propriedades:
```
// podemos envolver o componente com `SizedBox`
SizedBox(
  width: ...,
  height: ...,
  child: WidgetQualquer(...),
)
```
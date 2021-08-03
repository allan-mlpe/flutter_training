# Módulo de Web API

## Conceitos úteis apresentados

- Criação de modais de diálogo com o `AlertDialog`.
- Outras opções de estilização de campos de input:

    - `obscureText`: para obfuscar o texto (para senhas);
    - `maxLength`: limitar o tamanho de caracteres que podem ser inseridos no campo;
    - Dentro da propriedade `style`:
    
        - `letterSpacing`: espaçamento entre as letras do texto.
    - Dentro da propriedade `decoration`:
    
        - `border`: definir uma borda para o campo de texto.
- É importante fazer distinção dos contextos de cada widget para não ocorrer o acesso ao um
contexto que já não existe mais na tela (isso é muito comum quando usamos dialogs). Uma estratégia interessante é nomear cada contexto com
  um nome específico.
  ```dart
  showDialog(
      context: context,
      builder: (contextDialog) { // AQUI damos um nome específico ao contexto do dialog
        return ...
      });
  ...
  ```
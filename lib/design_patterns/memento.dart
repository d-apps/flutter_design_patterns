// Memento: O objeto que armazena o estado do Originator
class EditorMemento {
  final String _state;

  EditorMemento(this._state);

  String get state => _state;
}

// Originator: O objeto cujo estado deve ser salvo
class Editor {
  String _content = '';

  void type(String text) {
    _content += text;
    print("Conteúdo atual: $_content");
  }

  // Cria um Memento com o estado atual
  EditorMemento save() {
    print("Salvando estado...");
    return EditorMemento(_content);
  }

  // Restaura o estado de um Memento
  void restore(EditorMemento memento) {
    _content = memento.state;
    print("Restaurando estado. Conteúdo: $_content");
  }
}

// Caretaker: O objeto que gerencia o histórico de Mementos
class History {
  final List<EditorMemento> _history = [];
  final Editor _editor;

  History(this._editor);

  void saveState() {
    _history.add(_editor.save());
  }

  void undo() {
    if (_history.isNotEmpty) {
      final lastState = _history.removeLast();
      _editor.restore(lastState);
    } else {
      print("Nada para desfazer.");
    }
  }
}

void main() {
  final editor = Editor();
  final history = History(editor);

  editor.type('Olá, ');
  history.saveState(); // Salva o estado "Olá, "

  editor.type('mundo!');
  history.saveState(); // Salva o estado "Olá, mundo!"

  print('\n--- Ações de Desfazer ---\n');

  history.undo(); // Restaura para "Olá, "
  history.undo(); // Restaura para "" (estado inicial)
  history.undo(); // Nada para desfazer.
}
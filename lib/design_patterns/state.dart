// A interface comum para todos os estados
abstract class PlayerState {
  void handlePress(PlayerContext context);
}

// O estado "Pausado"
class PausedState implements PlayerState {
  @override
  void handlePress(PlayerContext context) {
    print('Player: Reproduzindo música.');
    context.setState(PlayingState());
  }
}

// O estado "Reproduzindo"
class PlayingState implements PlayerState {
  @override
  void handlePress(PlayerContext context) {
    print('Player: Pausando música.');
    context.setState(PausedState());
  }
}

// O "Contexto", que detém a referência ao estado atual
class PlayerContext {
  PlayerState _state;

  PlayerContext() : _state = PausedState();

  void setState(PlayerState state) {
    _state = state;
  }

  // O comportamento é delegado ao objeto de estado atual
  void handlePress() {
    _state.handlePress(this);
  }
}

void main() {
  final player = PlayerContext();

  player.handlePress(); // Player: Reproduzindo música.
  player.handlePress(); // Player: Pausando música.
  player.handlePress(); // Player: Reproduzindo música.
}
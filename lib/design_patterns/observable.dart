// O Observers que serão notificados pelo Observable
abstract class HeartRateObserver {
  void onHeartRateChanged(int heartRate);
}

// O Observable, que emite o fluxo de dados
class HeartRateMonitor {
  final List<HeartRateObserver> _observers = [];
  int _currentRate = 0;

  void addObserver(HeartRateObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(HeartRateObserver observer) {
    _observers.remove(observer);
  }

  void _notifyObservers() {
    for (var observer in _observers) {
      observer.onHeartRateChanged(_currentRate);
    }
  }

  // Simula uma mudança no estado (nova batida de coração)
  void setNewHeartRate(int newRate) {
    _currentRate = newRate;
    _notifyObservers();
  }
}

// Um Subscriber que atualiza a UI
class DisplayPanel implements HeartRateObserver {
  @override
  void onHeartRateChanged(int heartRate) {
    print("Painel: Nova batida registrada: $heartRate bpm.");
  }
}

// Um Subscriber que registra os dados
class DataLogger implements HeartRateObserver {
  @override
  void onHeartRateChanged(int heartRate) {
    print("Logger: Salvando batida $heartRate no banco de dados.");
  }
}

void main() {
  final monitor = HeartRateMonitor();
  final panel = DisplayPanel();
  final logger = DataLogger();

  monitor.addObserver(panel);
  monitor.addObserver(logger);

  // O monitor emite dados e todos os observers são notificados
  monitor.setNewHeartRate(72);
  monitor.setNewHeartRate(78);
}
// Interface comum para o objeto real e o proxy
abstract class VideoService {
  void listVideos();
}

// Objeto real, que é "pesado" para carregar
class RealVideoService implements VideoService {
  RealVideoService() {
    print("Conectando ao servidor e carregando a lista completa de vídeos...");
  }

  @override
  void listVideos() {
    print("Exibindo a lista de vídeos completa.");
  }
}

// O Proxy, que controla o acesso ao objeto real
class VideoServiceProxy implements VideoService {
  RealVideoService? _realService;

  @override
  void listVideos() {
    // Apenas cria a instância do objeto real quando é realmente necessário
    if (_realService == null) {
      print("Proxy: Acessando o serviço de vídeos...");
      _realService = RealVideoService();
    }
    _realService!.listVideos();
  }
}

void main() {
  // O app interage com o proxy, não com o objeto real
  final videoService = VideoServiceProxy();

  // A primeira chamada cria e carrega o serviço real
  print("Primeira vez que o serviço é usado:");
  videoService.listVideos();

  print("\nSegunda vez que o serviço é usado:");
  // A segunda chamada usa a instância já criada
  videoService.listVideos();
}
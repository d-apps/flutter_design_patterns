// A superclasse (o "template")
abstract class NotifierTemplate {
  // O método "template", que define a ordem das etapas
  void sendNotification(String message) {
    _connect();
    final formattedMessage = _formatMessage(message);
    _send(formattedMessage);
    _disconnect();
  }

  // Etapas fixas (implementadas na superclasse)
  void _connect() {
    print('Conectando ao serviço de notificação...');
  }

  void _disconnect() {
    print('Desconectando...');
  }

  // Etapas que serão implementadas pelas subclasses
  String _formatMessage(String message);
  void _send(String formattedMessage);
}

// A subclasse para enviar e-mails
class EmailNotifier extends NotifierTemplate {
  @override
  String _formatMessage(String message) {
    return 'Assunto: Notificação\n\n$message';
  }

  @override
  void _send(String formattedMessage) {
    print('Enviando e-mail:\n$formattedMessage');
  }
}

// A subclasse para enviar SMS
class SmsNotifier extends NotifierTemplate {
  @override
  String _formatMessage(String message) {
    // SMS não tem formatação de assunto
    return message;
  }

  @override
  void _send(String formattedMessage) {
    print('Enviando SMS: "$formattedMessage"');
  }
}

void main() {
  final emailNotifier = EmailNotifier();
  emailNotifier.sendNotification('Sua coreografia está sendo analisada.');

  print('\n---\n');

  final smsNotifier = SmsNotifier();
  smsNotifier.sendNotification('Nova coreografia postada!');
}
abstract class Notifier {
  void send(String message);
}

class EmailNotifier implements Notifier {
  @override
  void send(String message) {
    print('Sending e-mail: $message');
  }
}

class PushNotifier implements Notifier {
  @override
  void send(String message) {
    print('Sending push notification: $message');
  }
}

class NotifierFactory {
  static Notifier getNotifier(String type) {
    switch (type) {
      case 'email':
        return EmailNotifier();
      case 'push':
        return PushNotifier();
      default:
        throw Exception('Invalid notification type!');
    }
  }
}

void main(){
  final pushNotifier = NotifierFactory.getNotifier('push');
  pushNotifier.send('Your choreography was approved!');
  final emailNotifier = NotifierFactory.getNotifier('email');
  emailNotifier.send('Your choreography was approved, congratulations!');
}
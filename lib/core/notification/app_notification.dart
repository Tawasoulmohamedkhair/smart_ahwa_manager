import 'dart:developer';

abstract class NotificationService {
  void send(String message);
}

class AppNotification implements NotificationService {
  @override
  void send(String message) {
    log('Notification: $message');
  }
}

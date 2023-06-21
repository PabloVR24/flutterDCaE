part of 'notifications_bloc.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;

  NotificationStatusChanged(this.status);
}

//TODO: 2 NOTIFICATIONRECEIVED #PushMessage

class NotificationsReceived extends NotificationsEvent {
  final PushMessage message;

  NotificationsReceived(this.message);
}

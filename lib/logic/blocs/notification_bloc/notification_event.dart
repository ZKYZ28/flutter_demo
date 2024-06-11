part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable{
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class SendNotification extends NotificationEvent {
  final String? title;
  final String? message;

  const SendNotification({required this.title, required this.message});

  @override
  List<Object> get props => [title ?? 'Erreur lors de la récupération du message', message ?? 'Erreur lors de la récupération du message'];
}
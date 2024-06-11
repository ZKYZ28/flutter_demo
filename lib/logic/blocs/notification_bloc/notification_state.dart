part of 'notification_bloc.dart';

enum NotificationStateStatus {notNotified, notified}

class NotificationState extends Equatable {
  final NotificationStateStatus status;
  final String title;
  final String message;

  const NotificationState({
    this.status = NotificationStateStatus.notNotified,
    this.title = "",
    this.message = "",
  });

  NotificationState copyWith({
    NotificationStateStatus? status,
    String? title,
    String? message,
  }) {
    return NotificationState(
        status : status ?? this.status,
        title : title ?? this.title,
        message : message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message, title];
}
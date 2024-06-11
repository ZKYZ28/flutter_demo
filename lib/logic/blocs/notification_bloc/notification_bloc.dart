import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome_sprint/data/repositories/home_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  NotificationBloc() : super(const NotificationState()) {
    on<SendNotification>((event, emit) async {
      emit(state.copyWith(status: NotificationStateStatus.notified, title: event.title, message: event.message));
      emit(state.copyWith(status: NotificationStateStatus.notNotified));
    });
  }
}

part of 'home_bloc.dart';

enum HomeStateStatus {initial, loading, loaded, error}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final String text;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStateStatus.initial,
    this.text = "",
    this.errorMessage = "",
  });

  HomeState copyWith({
    HomeStateStatus? status,
    String? text,
    String? errorMessage
  }) {
    return HomeState(
        status : status ?? this.status,
        text : text ?? this.text,
        errorMessage : errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

}
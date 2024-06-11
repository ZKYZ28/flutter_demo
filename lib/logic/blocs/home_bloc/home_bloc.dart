import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome_sprint/data/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(const HomeState()) {

    on<GetHomeInfo>((event, emit) async {
      try {
        emit(state.copyWith(status: HomeStateStatus.loading));
        await Future.delayed(const Duration(seconds: 1));

        final text = homeRepository.fetchText(event.text);

        emit(state.copyWith(status: HomeStateStatus.loaded, text: text));

        await Future.delayed(const Duration(seconds: 1));
        //throw Exception();
      } on Exception catch (e) {
        emit(state.copyWith(status: HomeStateStatus.error, errorMessage: "Une erreur est survenue"));
      }
    });
  }

}

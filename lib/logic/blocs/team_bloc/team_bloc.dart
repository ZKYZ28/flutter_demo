import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repositories/team_repository.dart';
import '../../../models/team.dart';


part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamRepository _teamRepository;
  late StreamSubscription<List<Team>> _teamsSubscription;

  TeamBloc({required TeamRepository teamRepository})
      : _teamRepository = teamRepository, super(const TeamState()) {

    on<LoadTeams>((event, emit) async {
      try {
        emit(state.copyWith(status: TeamStatus.loading));
        final teams = await _teamRepository.loadTeams();
        emit(state.copyWith(status: TeamStatus.loaded, teams: teams));
      } catch (e) {
        emit(state.copyWith(status: TeamStatus.error, error: e.toString()));
      }
    });

    on<AddTeam>((event, emit) async {
      try {
        await _teamRepository.addTeam(event.name);
      } catch (e) {
        emit(state.copyWith(status: TeamStatus.error, error: e.toString()));
      }
    });

    _teamsSubscription = _teamRepository.teamsStream().listen((teams) {
      add(TeamsUpdated(teams: teams));
    });

    on<TeamsUpdated>((event, emit) {
      emit(state.copyWith(status: TeamStatus.loaded, teams: event.teams));
    });
  }

  @override
  Future<void> close() {
    _teamsSubscription.cancel();
    return super.close();
  }
}

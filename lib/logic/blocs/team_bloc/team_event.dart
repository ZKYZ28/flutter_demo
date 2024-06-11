part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object?> get props => [];
}

class LoadTeams extends TeamEvent {
  const LoadTeams();
}

class AddTeam extends TeamEvent {
  final String name;

  const AddTeam({required this.name});

  @override
  List<Object?> get props => [name];
}

class TeamsUpdated extends TeamEvent {
  final List<Team> teams;

  const TeamsUpdated({required this.teams});

  @override
  List<Object?> get props => [teams];
}

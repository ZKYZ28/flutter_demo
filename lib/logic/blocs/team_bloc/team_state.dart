part of 'team_bloc.dart';

enum TeamStatus { loading, loaded, error }

class TeamState extends Equatable {
  final TeamStatus status;
  final List<Team> teams;
  final String error;

  const TeamState({
    this.status = TeamStatus.loading,
    this.teams = const [],
    this.error = '',
  });

  TeamState copyWith({
    TeamStatus? status,
    List<Team>? teams,
    String? error,
  }) {
    return TeamState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, teams, error];
}

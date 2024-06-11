import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome_sprint/logic/blocs/team_bloc/team_bloc.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TeamBloc>().add(LoadTeams());
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teams')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter team name'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<TeamBloc>().add(AddTeam(name: _controller.text));
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TeamBloc, TeamState>(
              builder: (context, state) {
                if (state.status == TeamStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == TeamStatus.loaded) {
                  return ListView.builder(
                    itemCount: state.teams.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.teams[index].name),
                      );
                    },
                  );
                } else if (state.status == TeamStatus.error) {
                  return Center(child: Text('Failed to load teams: ${state.error}'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

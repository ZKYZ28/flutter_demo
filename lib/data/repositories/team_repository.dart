import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:welcome_sprint/models/team.dart';

class TeamRepository {
  final FirebaseFirestore _firestore;

  TeamRepository(this._firestore);

  Future<List<Team>> loadTeams() async {
    final snapshot = await _firestore.collection('teams').get();
    final teams = snapshot.docs
        .map((doc) => Team.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
    return teams;
  }

  Future<void> addTeam(String name) async {
    final team = Team(id: '', name: name);
    await _firestore.collection('teams').add(team.toMap());
  }

  Stream<List<Team>> teamsStream() {
    return _firestore.collection('teams').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Team.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }
}

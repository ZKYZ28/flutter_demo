class Team {
  String id;
  String name;

  Team({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map, String documentId) {
    return Team(
      id: documentId,
      name: map['name'],
    );
  }
}
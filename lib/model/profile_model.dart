class Profile {
  const Profile({this.name, this.age, this.weight});

  final String name;
  final int age;
  final int weight;

  Profile copyWith({String name, int age, int weight}) {
    return Profile(
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
    );
  }
}

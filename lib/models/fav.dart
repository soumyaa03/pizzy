class User {
  String id;
  final String cat;
  User({this.id = '', required this.cat});
  Map<String, dynamic> toJson() => {'id': id, 'cat': cat};

  static User fromJson(Map<String, dynamic> json) => User(cat: json['cat']);
}

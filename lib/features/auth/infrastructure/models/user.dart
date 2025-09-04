import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String token;
  final DateTime expiration;
  final List<Company> companies;

  User({
    required this.token,
    required this.expiration,
    required this.companies,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json["token"],
    expiration: DateTime.parse(json["expiration"]),
    companies: List<Company>.from(
      json["companies"].map((x) => Company.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiration": expiration.toIso8601String(),
    "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
  };
}

class Company {
  final String companiaId;
  final String nombreCompania;

  Company({required this.companiaId, required this.nombreCompania});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    companiaId: json["CompaniaID"],
    nombreCompania: json["NombreCompania"],
  );

  Map<String, dynamic> toJson() => {
    "CompaniaID": companiaId,
    "NombreCompania": nombreCompania,
  };
}

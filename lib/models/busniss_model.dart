class Business {
  int id;
  String name;

  Business({
    required this.id,
    required this.name,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        name: json["name"],
      );
}

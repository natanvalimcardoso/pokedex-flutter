class Pokemon {
  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['img'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<String>).map((e) => e).toList(),
    ); // aqui olho novamente no site da api como é para puxar os nomes
  }

  Pokemon({
    required this.name,
    required this.image,
    required this.type,
    required this.id,
    required this.num,
  });
}

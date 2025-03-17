import 'dart:convert';

class BookmakersApi {
  final String key;
  final String title;
  final String lastUpdate;
  final List<Market> market;
  BookmakersApi({
    required this.key,
    required this.title,
    required this.lastUpdate,
    required this.market,
  });

  factory BookmakersApi.fromMap(Map<String, dynamic> map) {
    return BookmakersApi(
      key: map['key'] ?? '',
      title: map['title'] ?? '',
      lastUpdate: map['last_update'] ?? '',
      market: List<Market>.from(map['markets']?.map((x) => Market.fromMap(x))),
    );
  }
  factory BookmakersApi.fromJson(String source) =>
      BookmakersApi.fromMap(json.decode(source));
}

//Mercato
class Market {
  final String key;
  final String lastUpdate;
  final List<Outcomes> outcomes;

  Market({
    required this.key,
    required this.lastUpdate,
    required this.outcomes,
  });

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(
      key: map['key'] ?? '',
      lastUpdate: map['last_update'] ?? '',
      outcomes:
          List<Outcomes>.from(map['outcomes']?.map((x) => Outcomes.fromMap(x))),
    );
  }

  factory Market.fromJson(String source) => Market.fromMap(json.decode(source));
}

//Quote
class Outcomes {
  final String name;
  final double price;

  Outcomes({
    required this.name,
    required this.price,
  });

  factory Outcomes.fromMap(Map<String, dynamic> map) {
    return Outcomes(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  factory Outcomes.fromJson(String source) =>
      Outcomes.fromMap(json.decode(source));
}

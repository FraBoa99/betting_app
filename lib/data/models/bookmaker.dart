class Bookmaker {
  String key;
  String regionKey;
  String title;
  String? image;

  Bookmaker({
    required this.key,
    required this.regionKey,
    required this.title,
    this.image,
  });
}

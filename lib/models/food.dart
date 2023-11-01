class Food {
  String name;
  String price;
  String imagePatch;
  String rating;
  Food(
      {required this.name,
      required this.price,
      required this.rating,
      required this.imagePatch});
  String get _name => name;
  String get _price => price;
  String get _imagePatch => imagePatch;
  String get _rating => rating;
}

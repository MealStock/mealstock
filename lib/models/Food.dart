import 'Photo.dart';

class Food {
  int? id;
  final String name;
  final String description;
  final List<Photo> photo;
  final double fats;
  final double proteins;
  final double carbohydrates;
  final Vitamins vitamins;
  final double minerals;
  final Taste taste;

  Food(
    this.fats,
    this.proteins,
    this.carbohydrates,
    this.vitamins,
    this.minerals,
    this.taste,
    this.description,
    this.photo, {
    required this.id,
    required this.name,
  });
}

enum Vitamins {
  A,
  B,
  C,
  D,
  E,
  K,
}

enum Taste {
  Sweet,
  Salty,
  Sour,
  Bitter,
  Neutral,
}

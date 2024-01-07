import 'Photo.dart';

class Badge {
  int? id;
  final String name;
  final String description;
  final Photo photo;
  final String like;
  final String dislike;
  final int points;
  final bool recollectable;

  Badge(
    this.description,
    this.like,
    this.dislike, {
    required this.id,
    required this.name,
    required this.photo,
    required this.points,
    required this.recollectable,
  });
}

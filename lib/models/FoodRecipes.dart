import 'Food.dart';
import 'Comment.dart';
import 'Photo.dart';

class FoodRecipes {
  int? id;
  final List<Food> items;
  final String name;
  final String description;
  final List<Photo> photo;
  final int like;
  final int dislike;
  final int saved;
  final List<Comment> comments;

  FoodRecipes(
    this.like,
    this.saved,
    this.dislike,
    this.comments,
    this.description,
    this.photo, {
    required this.id,
    required this.items,
    required this.name,
  });
}

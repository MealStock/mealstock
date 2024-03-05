import 'comment.dart';
import 'food_recipes.dart';
import 'food.dart';
import 'photo.dart';

class MealPlan {
  int? id;
  final String name;
  final String description;
  final List<Photo> photo;
  final List<FoodRecipes> listOfFoodRecipes;
  final List<Food> listOfFood;
  final FoodRecipes breakfast;
  final FoodRecipes morningSnack;
  final FoodRecipes lunch;
  final FoodRecipes afternoonSnack;
  final FoodRecipes dinner;
  final FoodRecipes eveningSnack;
  final int like;
  final List<Comment> comment;
  final int dislike;
  final int saved;

  MealPlan(
    this.description,
    this.photo,
    this.listOfFoodRecipes,
    this.listOfFood,
    this.breakfast,
    this.morningSnack,
    this.lunch,
    this.afternoonSnack,
    this.dinner,
    this.eveningSnack,
    this.like,
    this.comment,
    this.dislike,
    this.saved, {
    required this.id,
    required this.name,
  });
}

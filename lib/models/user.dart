import 'Badge.dart';
import 'Comment.dart';
import 'FoodRecipes.dart';
import 'MealPlan.dart';

class User {
  int? id;
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final int phone;
  final String gender;
  final double weight;
  final double height;
  final int like;
  final int dislike;
  final List<Comment> comment;
  final List<FoodRecipes> createdFoodRecipes;
  final List<MealPlan> createdMealPlan;
  final List<FoodRecipes> likedFoodRecipes;
  final List<FoodRecipes> savedFoodRecipes;
  final List<MealPlan> likedMealPlan;
  final List<MealPlan> savedMealPlan;
  final double mealScore;
  final int accountLevel;
  final List<Badge> gainedBadge;
  final List<Badge> inProgressBadge;

  User(
    this.phone,
    this.gender,
    this.weight,
    this.height,
    this.createdFoodRecipes,
    this.createdMealPlan,
    this.likedFoodRecipes,
    this.savedFoodRecipes,
    this.likedMealPlan,
    this.savedMealPlan,
    this.mealScore,
    this.accountLevel,
    this.gainedBadge,
    this.inProgressBadge,
    this.like,
    this.dislike,
    this.comment, {
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}

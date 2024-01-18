import 'Badge.dart';
import 'Comment.dart';
import 'FoodRecipes.dart';
import 'MealPlan.dart';

class User {
  String id;
  String userName;
  String firstName;
  String lastName;
  String? email;
  String phone;
  String gender;
  double weight;
  double height;
  int like;
  int dislike;
  List<Comment> comment;
  List<FoodRecipes> createdFoodRecipes;
  List<MealPlan> createdMealPlan;
  List<FoodRecipes> likedFoodRecipes;
  List<FoodRecipes> savedFoodRecipes;
  List<MealPlan> likedMealPlan;
  List<MealPlan> savedMealPlan;
  double mealScore;
  int accountLevel;
  List<Badge> gainedBadge;
  List<Badge> inProgressBadge;

  User({
    required this.phone,
    required this.gender,
    required this.weight,
    required this.height,
    required this.createdFoodRecipes,
    required this.createdMealPlan,
    required this.likedFoodRecipes,
    required this.savedFoodRecipes,
    required this.likedMealPlan,
    required this.savedMealPlan,
    required this.mealScore,
    required this.accountLevel,
    required this.gainedBadge,
    required this.inProgressBadge,
    required this.like,
    required this.dislike,
    required this.comment,
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromFirebase({required String id, String email = ''}) {
    return User(
      id: id,
      email: email,
      userName: '',
      firstName: '',
      lastName: '',
      phone: '',
      gender: '',
      weight: 0,
      height: 0,
      like: 0,
      dislike: 0,
      comment: [],
      createdFoodRecipes: [],
      createdMealPlan: [],
      likedFoodRecipes: [],
      savedFoodRecipes: [],
      likedMealPlan: [],
      savedMealPlan: [],
      mealScore: 0,
      accountLevel: 0,
      gainedBadge: [],
      inProgressBadge: [],
    );
  }
}

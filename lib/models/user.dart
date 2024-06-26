import 'badge.dart';
import 'comment.dart';
import 'food_recipes.dart';
import 'meal_plan.dart';
import 'dart:convert';

class NewUser {
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

  NewUser({
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

  factory NewUser.fromFirebase({required String id, String email = ''}) {
    return NewUser(
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

  factory NewUser.fromJson(String jsonBody) {
    final Map<String, dynamic> jsonData = json.decode(jsonBody);
    final Map<String, dynamic> bodyData = json.decode(jsonData['body']);

    return NewUser(
      id: bodyData['iduser'],
      email: bodyData['email'],
      userName: bodyData['username'],
      firstName: bodyData['firstname'],
      lastName: bodyData['lastname'],
      phone: bodyData['phone'],
      gender: bodyData['gender'],
      weight: bodyData['weight'].toDouble(),
      height: bodyData['height'].toDouble(),
      like: 0,
      dislike: 0,
      comment: [],
      createdFoodRecipes: [],
      createdMealPlan: [],
      likedFoodRecipes: [],
      savedFoodRecipes: [],
      likedMealPlan: [],
      savedMealPlan: [],
      mealScore: bodyData['mealscore'].toDouble(),
      accountLevel: 0,
      gainedBadge: [],
      inProgressBadge: [],
    );
  }
}

class User {
  final String uid;
  final String? email;

  User({required this.uid, this.email});
}

// this is used for authentication

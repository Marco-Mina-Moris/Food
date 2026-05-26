class Meal {
  String? idMeal;
  String? strMeal;
  String? strMealThumb;

  Meal({this.idMeal, this.strMeal, this.strMealThumb});

  Meal.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
  }
}

class MealResponse {
  List<Meal>? meals;

  MealResponse({this.meals});

  MealResponse.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meal>[];
      json['meals'].forEach((v) {
        meals!.add(Meal.fromJson(v));
      });
    }
  }
}

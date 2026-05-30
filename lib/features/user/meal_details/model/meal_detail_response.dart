class MealDetailResponse {
  List<MealDetail>? meals;

  MealDetailResponse({this.meals});

  MealDetailResponse.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <MealDetail>[];
      json['meals'].forEach((v) {
        meals!.add(MealDetail.fromJson(v));
      });
    }
  }
}

class MealDetail {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;

  MealDetail({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
  });

  MealDetail.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
  }
}

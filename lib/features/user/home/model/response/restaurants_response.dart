class RestaurantMenuResponse {
  List<Recipes>? recipes;
  int? total;
  int? skip;
  int? limit;

  RestaurantMenuResponse({this.recipes, this.total, this.skip, this.limit});

  RestaurantMenuResponse.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }


}

class Recipes {
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;

  Recipes(
      {this.id,
        this.name,
        this.ingredients,
        this.instructions,
        this.prepTimeMinutes,
        this.cookTimeMinutes,
        this.servings,
        this.difficulty,
        this.cuisine,
        this.caloriesPerServing,
        this.tags,
        this.userId,
        this.image,
        this.rating,
        this.reviewCount,
        this.mealType});

  // Recipes.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   ingredients = json['ingredients'].cast<String>();
  //   instructions = json['instructions'].cast<String>();
  //   prepTimeMinutes = json['prepTimeMinutes'];
  //   cookTimeMinutes = json['cookTimeMinutes'];
  //   servings = json['servings'];
  //   difficulty = json['difficulty'];
  //   cuisine = json['cuisine'];
  //   caloriesPerServing = json['caloriesPerServing'];
  //   tags = json['tags'].cast<String>();
  //   userId = json['userId'];
  //   image = json['image'];
  //   rating = json['rating'];
  //   reviewCount = json['reviewCount'];
  //   mealType = json['mealType'].cast<String>();
  // }
  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ingredients = json['ingredients']?.cast<String>();
    instructions = json['instructions']?.cast<String>();
    prepTimeMinutes = json['prepTimeMinutes'];
    cookTimeMinutes = json['cookTimeMinutes'];
    servings = json['servings'];
    difficulty = json['difficulty'];
    cuisine = json['cuisine'];
    caloriesPerServing = json['caloriesPerServing'];
    tags = json['tags']?.cast<String>();
    userId = json['userId'];
    image = json['image'];
    rating = (json['rating'] as num?)?.toDouble(); // ✅ إصلاح الخطأ هنا
    reviewCount = json['reviewCount'];
    mealType = json['mealType']?.cast<String>();
  }



}
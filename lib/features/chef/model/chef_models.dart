class ChefOrder {
  final String id;
  final String customerName;
  final String dishes;
  final double totalPrice;
  String status; // "Pending", "Preparing", "Completed"
  final String timeAgo;
  final String customerImage;

  ChefOrder({
    required this.id,
    required this.customerName,
    required this.dishes,
    required this.totalPrice,
    required this.status,
    required this.timeAgo,
    required this.customerImage,
  });
}

class ChefMeal {
  final String id;
  final String name;
  final double price;
  final String category;
  final String description;
  final String image;
  bool isAvailable;

  ChefMeal({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    this.isAvailable = true,
  });
}

class ChefReview {
  final String id;
  final String userName;
  final double rating;
  final String comment;
  final String date;

  ChefReview({
    required this.id,
    required this.userName,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

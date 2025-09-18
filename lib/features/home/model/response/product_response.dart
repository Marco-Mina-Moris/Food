// class ProductResponse {
//   List<Products>? products;
//   int? total;
//   int? skip;
//   int? limit;
//
//   ProductResponse({this.products, this.total, this.skip, this.limit});
//
//   ProductResponse.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//     total = json['total'];
//     skip = json['skip'];
//     limit = json['limit'];
//   }
// }
//
// class Products {
//   int? id;
//   String? title;
//   String? description;
//   String? category;
//   double? price;
//   double? discountPercentage;
//   double? rating;
//   int? stock;
//   List<String>? tags;
//   String? brand;
//   String? sku;
//   int? weight;
//   Dimensions? dimensions;
//   String? warrantyInformation;
//   String? shippingInformation;
//   String? availabilityStatus;
//   List<Reviews>? reviews;
//   String? returnPolicy;
//   int? minimumOrderQuantity;
//   Meta? meta;
//   List<String>? images;
//   String? thumbnail;
//
//   Products({
//     this.id,
//     this.title,
//     this.description,
//     this.category,
//     this.price,
//     this.discountPercentage,
//     this.rating,
//     this.stock,
//     this.tags,
//     this.brand,
//     this.sku,
//     this.weight,
//     this.dimensions,
//     this.warrantyInformation,
//     this.shippingInformation,
//     this.availabilityStatus,
//     this.reviews,
//     this.returnPolicy,
//     this.minimumOrderQuantity,
//     this.meta,
//     this.images,
//     this.thumbnail,
//   });
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     category = json['category'];
//     price = json['price'];
//     discountPercentage = json['discountPercentage'];
//     rating = json['rating'];
//     stock = json['stock'];
//     tags = json['tags'].cast<String>();
//     brand = json['brand'];
//     sku = json['sku'];
//     weight = json['weight'];
//     dimensions =
//         json['dimensions'] != null
//             ? new Dimensions.fromJson(json['dimensions'])
//             : null;
//     warrantyInformation = json['warrantyInformation'];
//     shippingInformation = json['shippingInformation'];
//     availabilityStatus = json['availabilityStatus'];
//     if (json['reviews'] != null) {
//       reviews = <Reviews>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Reviews.fromJson(v));
//       });
//     }
//     returnPolicy = json['returnPolicy'];
//     minimumOrderQuantity = json['minimumOrderQuantity'];
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//     images = json['images'].cast<String>();
//     thumbnail = json['thumbnail'];
//   }
// }
//
// class Dimensions {
//   double? width;
//   double? height;
//   double? depth;
//
//   Dimensions({this.width, this.height, this.depth});
//
//   Dimensions.fromJson(Map<String, dynamic> json) {
//     width = json['width'];
//     height = json['height'];
//     depth = json['depth'];
//   }
// }
//
// class Reviews {
//   int? rating;
//   String? comment;
//   String? date;
//   String? reviewerName;
//   String? reviewerEmail;
//
//   Reviews({
//     this.rating,
//     this.comment,
//     this.date,
//     this.reviewerName,
//     this.reviewerEmail,
//   });
//
//   Reviews.fromJson(Map<String, dynamic> json) {
//     rating = json['rating'];
//     comment = json['comment'];
//     date = json['date'];
//     reviewerName = json['reviewerName'];
//     reviewerEmail = json['reviewerEmail'];
//   }
// }
//
// class Meta {
//   String? createdAt;
//   String? updatedAt;
//   String? barcode;
//   String? qrCode;
//
//   Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     barcode = json['barcode'];
//     qrCode = json['qrCode'];
//   }
// }

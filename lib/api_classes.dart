class GreggsAPI {
  String? shopCode;
  List<FoodItems>? foodItems;

  GreggsAPI({this.shopCode, this.foodItems});

  GreggsAPI.fromJson(Map<String, dynamic> json) {
    shopCode = json['shopCode'];
    if (json['foodItems'] != null) {
      foodItems = <FoodItems>[];
      json['foodItems'].forEach((v) {
        foodItems!.add(FoodItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shopCode'] = shopCode;
    if (foodItems != null) {
      data['foodItems'] = foodItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodItems {
  String? articleCode;
  String? availableFrom;
  String? availableUntil;
  double? eatOutPrice;
  double? eatInPrice;
  String? articleName;
  List<String>? dayParts;
  String? internalDescription;
  String? customerDescription;
  String? imageUri;
  String? thumbnailUri;

  FoodItems(
      {this.articleCode,
      this.availableFrom,
      this.availableUntil,
      this.eatOutPrice,
      this.eatInPrice,
      this.articleName,
      this.dayParts,
      this.internalDescription,
      this.customerDescription,
      this.imageUri,
      this.thumbnailUri});

  FoodItems.fromJson(Map<String, dynamic> json) {
    articleCode = json['articleCode'];
    availableFrom = json['availableFrom'];
    availableUntil = json['availableUntil'];
    eatOutPrice = json['eatOutPrice'];
    eatInPrice = json['eatInPrice'];
    articleName = json['articleName'];
    dayParts = json['dayParts'].cast<String>();
    internalDescription = json['internalDescription'];
    customerDescription = json['customerDescription'];
    imageUri = json['imageUri'];
    thumbnailUri = json['thumbnailUri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['articleCode'] = articleCode;
    data['availableFrom'] = availableFrom;
    data['availableUntil'] = availableUntil;
    data['eatOutPrice'] = eatOutPrice;
    data['eatInPrice'] = eatInPrice;
    data['articleName'] = articleName;
    data['dayParts'] = dayParts;
    data['internalDescription'] = internalDescription;
    data['customerDescription'] = customerDescription;
    data['imageUri'] = imageUri;
    data['thumbnailUri'] = thumbnailUri;
    return data;
  }
}
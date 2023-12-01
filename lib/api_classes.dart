//converted JSON to object
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


// {
//     "shopCode": "1234",
//     "foodItems": [
//         {
//             "articleCode": "1000446",
//             "availableFrom": "2020-12-30T00:00:00Z",
//             "availableUntil": "2045-05-13T23:59:59Z",
//             "eatOutPrice": 1.05,
//             "eatInPrice": 1.15,
//             "articleName": "Sausage Roll",
//             "dayParts": [
//                 "Breakfast",
//                 "Lunch",
//                 "Evening"
//             ],
//             "internalDescription": "Sausage Roll",
//             "customerDescription": "The Nation’s favourite Sausage Roll.\n\nMuch like Elvis was hailed the King of Rock, many have appointed Greggs as the (unofficial) King of Sausage Rolls.\n\nFreshly baked in our shops throughout the day, this British classic is made from seasoned sausage meat wrapped in layers of crisp, golden puff pastry, as well as a large dollop of TLC. It’s fair to say, we’re proper proud of them.\n\nAnd that’s it. No clever twist. No secret ingredient. It’s how you like them, so that’s how we make them.\n\n",
//             "imageUri": "https://articles.greggs.co.uk/images/1000446.png?1623244287449",
//             "thumbnailUri": "https://articles.greggs.co.uk/images/1000446-thumb.png?1623244287450"
//         },
//         {
//             "articleCode": "1000447",
//             "availableFrom": "2020-12-30T00:00:00Z",
//             "availableUntil": "2045-05-13T23:59:59Z",
//             "eatOutPrice": 2.05,
//             "eatInPrice": 2.15,
//             "articleName": "Cheese & Onion Bake",
//             "dayParts": [
//                 "Breakfast",
//                 "Lunch",
//                 "Evening"
//             ],
//             "internalDescription": "Cheese & Onion Bake",
//             "customerDescription": "A classic duo of cheese and onion wrapped in a light puff pastry.\n\nNow, we’re not one for bold claims. We’d never, for example, claim that we invented the internet, or that we discovered France. So, we’re certainly not going to stamp our name on ‘cheese and onion’. After all, that tasty flavour combination has been around for ages.\n\nBut what we will say is, very few have managed to bundle the classic duo into a savoury quite like our Cheese and Onion Bake. Made with a blend of cheeses and diced onion, they’re freshly baked in our shops every day.\n\nFresh, simple, and with more cheese than a 90’s rom com. Perhaps it’s time you rediscovered this tasty classic.",
//             "imageUri": "https://articles.greggs.co.uk/images/1000516.png?1627889851069",
//             "thumbnailUri": "https://articles.greggs.co.uk/images/1000516.png?1627889851069"
//         }
//     ]
// }
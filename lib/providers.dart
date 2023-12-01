import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greggs_booking/api_classes.dart';
import 'package:http/http.dart' as http;

final greggNetworkImageProvider = Provider<Image>((ref) => Image.network(
      "https://hammersmithbroadway.co.uk/wp-content/uploads/2022/10/Greggs-logo.png",
      height: 40,
      width: 40,
    ));

final greggsAPIProvider =
    FutureProvider<GreggsAPI>((ref) async => fetchGreggsAPI());

final itemQuantityProvider =
    StateProvider.family<int, String>((ref, articleCode) => 0);
final userChoiceProvider = StateProvider<bool?>(
    (ref) => null); // true for Eat In, false for Eat Out, null for no choice

final finalBasketItemProvider = Provider<List<FinalBasketItem>>((ref) {
  final foodItems = ref.watch(greggsAPIProvider).value?.foodItems ?? [];
  return foodItems
      .map((item) {
        final quantity =
            ref.watch(itemQuantityProvider(item.articleCode ?? ''));
        return FinalBasketItem(
          foodItem: item,
          quantity: quantity,
        );
      })
      .where((finalBasketItem) => finalBasketItem.quantity > 0)
      .toList();
});

class FinalBasketItem {
  final FoodItems foodItem;
  final int quantity;

  FinalBasketItem({required this.foodItem, required this.quantity});
}

Future<GreggsAPI> fetchGreggsAPI() async {
  var url =
      'https://raw.githubusercontent.com/sgaabdu4/greggs_booking/main/greggs_api_json.json';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return GreggsAPI.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load API data');
  }
}

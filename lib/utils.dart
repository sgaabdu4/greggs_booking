// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:greggs_booking/api_classes.dart';
import 'package:greggs_booking/coming_soon_page.dart';
import 'package:greggs_booking/providers.dart';

class CheckOutButtonWidget extends ConsumerWidget {
  const CheckOutButtonWidget({
    super.key,
    required this.nextpage,
  });

  final Widget? nextpage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalBasketItems = ref.watch(finalBasketItemProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: InkWell(
        onTap: () {
          if (finalBasketItems.isNotEmpty) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => nextpage ?? const ComingSoon()));
          } else {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => const AlertDialog(
                      title: Text('Add Basket'),
                      content: Text('Please add something into the basket.'),
                    ));
          }
        },
        child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: const Center(
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }
}

class BasketTotalWidget extends ConsumerWidget {
  const BasketTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userChoice = ref.watch(userChoiceProvider);
    final foodItems = ref.watch(greggsAPIProvider).value?.foodItems ?? [];
    double total = 0.0;

    for (var item in foodItems) {
      final quantity = ref.watch(itemQuantityProvider(item.articleCode ?? ''));
      final price = userChoice == true ? item.eatInPrice : item.eatOutPrice;
      total += (price ?? 0) * quantity;
    }
    return Container(
      height: 40,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      margin: const EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 161, 30, 25)),
      child: Row(
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Basket Total:',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            '£${total.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class FoodItemInformationWidget extends StatelessWidget {
  const FoodItemInformationWidget({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final FoodItems foodItem;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          '${foodItem.articleName}',
                        ),
                      )),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        color: Colors.amber,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Image.network('${foodItem.imageUri}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Availability',
                            textScaler: TextScaler.linear(0.8),
                          ),
                          for (String meal in foodItem.dayParts ?? [])
                            MealWidget(meal: meal),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Us',
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '${foodItem.customerDescription}',
                              textScaler: const TextScaler.linear(0.8),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealWidget extends StatelessWidget {
  const MealWidget({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final String meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Text(
        meal,
        textScaler: const TextScaler.linear(0.8),
      ),
    );
  }
}

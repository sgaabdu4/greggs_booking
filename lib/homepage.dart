// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:greggs_booking/api_classes.dart';
import 'package:greggs_booking/providers.dart';
import 'package:greggs_booking/utils.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<FoodItems> foodItems =
        ref.watch(greggsAPIProvider).value?.foodItems ?? [];
    bool? isEatIn = ref.watch(userChoiceProvider);

    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const WelcomeHeading(),
            const SizedBox(height: 20),
            const CurrentLocationWidget(),
            const SizedBox(height: 20),
            if (isEatIn == null) ...[
              const EatInEatOutQuestion(),
              const SizedBox(height: 20),
            ],
            const EatInEatOutWidget(),
            if (isEatIn != null) ...[
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (FoodItems foodItem in foodItems)
                        FoodItemWidget(foodItem: foodItem),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const BasketTotalWidget(),
              const SizedBox(height: 10),
              const PaymentButtonWidget(),
            ]
          ],
        ),
      )),
    );
  }
}

class FoodItemWidget extends ConsumerWidget {
  const FoodItemWidget({
    super.key,
    required this.foodItem,
  });

  final FoodItems foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity =
        ref.watch(itemQuantityProvider(foodItem.articleCode ?? ''));
    bool? isEatIn = ref.watch(userChoiceProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Stack(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    foodItem.thumbnailUri ?? '',
                    width: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 190,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            foodItem.articleName ?? '',
                            style: const TextStyle(color: Colors.white),
                            textScaler: const TextScaler.linear(1.5),
                          ),
                        ),
                      ),
                      Text(
                        '£${(isEatIn == true) ? foodItem.eatInPrice : foodItem.eatOutPrice ?? ''} per piece',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (quantity > 0) {
                                ref
                                    .read(itemQuantityProvider(
                                            foodItem.articleCode ?? '')
                                        .notifier)
                                    .state--;
                              }
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: const Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 20,
                            width: 20,
                            color: Colors.amber,
                            child: Text(
                              '$quantity',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              ref
                                  .read(itemQuantityProvider(
                                          foodItem.articleCode ?? '')
                                      .notifier)
                                  .state++;
                            },
                            child: Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: const Icon(
                                  Icons.add,
                                  size: 15,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            FoodItemInformationWidget(foodItem: foodItem)),
                    icon: const Icon(
                      Icons.info,
                      color: Colors.white,
                    ))),
          )
        ],
      ),
    );
  }
}

class EatInEatOutQuestion extends StatelessWidget {
  const EatInEatOutQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Do you want to Eat In or Eat Out?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class EatInEatOutWidget extends ConsumerWidget {
  const EatInEatOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? isEatIn = ref.watch(userChoiceProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        (isEatIn != true)
            ? Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      ref.read(userChoiceProvider.notifier).state = true;
                    },
                    child: const Text(
                      'Eat In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              )
            : const Expanded(
                child: FilledButton(onPressed: null, child: Text('Eat In'))),
        const SizedBox(width: 10),
        (isEatIn != false)
            ? Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      ref.read(userChoiceProvider.notifier).state = false;
                    },
                    child: const Text(
                      'Eat Out',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              )
            : const Expanded(
                child: FilledButton(onPressed: null, child: Text('Eat Out'))),
      ],
    );
  }
}

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
      child: Consumer(builder: (context, ref, child) {
        String location = ref.watch(greggsAPIProvider).value?.shopCode ?? '';
        return Text(
          'Current Location: $location',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        );
      }),
    );
  }
}

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://hammersmithbroadway.co.uk/wp-content/uploads/2022/10/Greggs-logo.png',
            height: 75,
            width: 75,
          ),
        ),
        const Spacer(),
        const Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.bold),
          textScaler: TextScaler.linear(2),
        ),
        const Spacer(),
      ],
    );
  }
}

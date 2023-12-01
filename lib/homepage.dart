import 'package:flutter/material.dart';
import 'package:greggs_booking/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WelcomeHeading(),
            SizedBox(height: 20),
            CurrentLocationWidget(),
            SizedBox(height: 20),
            EatInEatOutQuestion(),
            SizedBox(height: 20),
            EatInEatOutWidget(),
            SizedBox(height: 20),
            FoodItem(),
            Spacer(),
            BasketTotalWidget(),
            SizedBox(height: 10),
            PaymentButtonWidget(),
          ],
        ),
      )),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  'https://articles.greggs.co.uk/images/1000446-thumb.png?1623244287450',
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sausage Roll',
                      style: TextStyle(color: Colors.white),
                      textScaler: TextScaler.linear(1.5),
                    ),
                    const Text(
                      '£1.05 per piece',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
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
                          child: const Text(
                            '0',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {},
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
                          const FoodItemInformationWidget()),
                  icon: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ))),
        )
      ],
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

class EatInEatOutWidget extends StatelessWidget {
  const EatInEatOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Eat In',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Eat Out',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        // const Expanded(
        //     child: FilledButton(onPressed: null, child: Text('Eat Out'))),
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
      child: const Text(
        'Current Location: 1234',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
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

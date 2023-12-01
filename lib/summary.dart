import 'package:flutter/material.dart';
import 'package:greggs_booking/utils.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.network(
                'https://hammersmithbroadway.co.uk/wp-content/uploads/2022/10/Greggs-logo.png',
                height: 40,
                width: 40,
              ),
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Summary',
            textScaler: TextScaler.linear(1),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
                  child: Text(
                    'Current Location: 1234',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                    width: double.maxFinite,
                    child: FilledButton(
                        onPressed: null,
                        child: Text(
                          'Eat Out',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 120,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://articles.greggs.co.uk/images/1000446-thumb.png?1623244287450',
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sausage Roll',
                                  textScaler: TextScaler.linear(1.5),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '£1.05 per piece',
                                  textScaler: TextScaler.linear(0.75),
                                  // style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Quantity: 5',
                                  textScaler: TextScaler.linear(1.2),
                                  // style: TextStyle(fontWeight: FontWeight.bold),
                                ),
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
                ),
                const Spacer(),
                const BasketTotalWidget(),
                const SizedBox(
                  height: 10,
                ),
                const PaymentButtonWidget(),
              ],
            ),
          ),
        ));
  }
}

class SummaryHeading extends StatelessWidget {
  const SummaryHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(1), // Border width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://hammersmithbroadway.co.uk/wp-content/uploads/2022/10/Greggs-logo.png',
              height: 75,
              width: 75,
            ),
          ),
        ),
        const Spacer(),
        const Text(
          'Summary',
          textScaler: TextScaler.linear(2),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}

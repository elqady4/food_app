import 'package:food_app_ui/pages/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
            ),
            Divider(
              thickness: 1,
            ),
            _price(),
            _submitButton(context),
          ],
        ),
      ),
    );
  }
}

Widget _price() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '10 items',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        '',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

Widget _submitButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
    child: TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.amber.withOpacity(0.8).withRed(980)),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4),
        width: double.infinity / 2,
        child: Text(
          'Next',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    ),
  );
}

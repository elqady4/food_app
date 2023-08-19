import 'package:food_app_ui/pages/cart/cart_screen.dart';
import 'package:food_app_ui/slider_screen.dart';
import 'package:flutter/material.dart';

class foodItem extends StatelessWidget {
  const foodItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/hamburger.png',
                height: 100,
                width: size.width / 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Meal Name type Here',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'TheSansArabic',
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '100',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: 'TheSansArabic',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: 'TheSansArabic',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.withOpacity(0.8),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(context, SliderPage(CartScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'ADD',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: 'TheSansArabic',
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.add, color: Colors.black)
                    ],
                  )),
            ],
          ),
          Divider(color: Colors.amber, thickness: 1),
        ],
      ),
    );
  }
}

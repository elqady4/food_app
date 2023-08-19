import 'package:food_app_ui/pages/auth/register_screen.dart';
import 'package:food_app_ui/pages/cart/cart_screen.dart';
import 'package:food_app_ui/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
          key: _key,
          appBar: SliderAppBar(
              appBarColor: Colors.white,
              title: Text('Food Home',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TheSansArabic',
                      color: Colors.brown.withOpacity(0.6))),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context, SliderPage(CartScreen()));
                  },
                  icon: Icon(Icons.shopping_cart))),
          slider: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 180,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SliderPage(RegisterPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Colors.amber.withOpacity(0.7),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person_add),
                          Text('Register Now For More Options',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'TheSansArabic',
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  NavigatorButton(title: 'Home', IconData: Icons.home),
                  NavigatorButton(title: 'Account', IconData: Icons.person),
                  NavigatorButton(title: 'Settings', IconData: Icons.settings),
                  NavigatorButton(title: '19222', IconData: Icons.call),
                ],
              ),
            ),
          ),
          child: widget.child),
    );
  }

  GestureDetector NavigatorButton(
      {required String title, required IconData IconData}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                color: Colors.black.withOpacity(0.9),
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 4),
                spreadRadius: 0.0)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          color: Colors.amber.withOpacity(0.8).withRed(980),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              IconData,
              size: 45,
              color: Colors.black,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.8))),
          ],
        ),
      ),
    );
  }
}

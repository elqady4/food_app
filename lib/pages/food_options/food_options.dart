import 'package:food_app_ui/constants.dart';
import 'package:food_app_ui/models/food_type_model.dart';
import 'package:food_app_ui/widgets/meal_card.dart';
import 'package:flutter/material.dart';

class FoodOptions extends StatelessWidget {
  const FoodOptions({
    super.key,
    required this.title,
    required this.foodType,
  });

  final String title;
  final FoodTypeModel foodType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const tweeDuration = Duration(milliseconds: 900);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            _appBar(tweeDuration, size),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder<double>(
                duration: tweeDuration,
                tween: Tween(begin: 1, end: 0),
                curve: Curves.easeOut,
                builder: (context, value, _) {
                  return Transform.translate(
                    offset: Offset(0, 500 * value),
                    child: Container(
                      height: size.height * .6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _centerSideSpecs(value, size),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 100,
              bottom: size.height * .61,
              child: Hero(
                tag: foodType.id,
                child: Image.asset(foodType.img),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _centerSideSpecs(double value, Size size) {
    return Expanded(
      child: Transform.translate(
        offset: Offset(1, 0),
        child: SizedBox(
          height: size.height / 1.67,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return foodItem();
            },
          ),
        ),
      ),
    );
  }

  TweenAnimationBuilder<double> _appBar(Duration tweeDuration, Size size) {
    return TweenAnimationBuilder<double>(
      duration: tweeDuration,
      tween: Tween(begin: 1, end: 0),
      curve: Curves.easeOut,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, -500 * value),
          child: Container(
            height: size.height * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.amber.withOpacity(0.8).withRed(980),
                  Colors.amber.withOpacity(0.9).withRed(980),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.chevron_left)),
                            Text(title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search)),
                          ],
                        ),
                        Text(
                          foodType.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'TheSansArabic',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

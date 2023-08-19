import 'dart:ui';
import 'package:food_app_ui/models/food_type_model.dart';
import 'package:food_app_ui/pages/food_options/food_options.dart';
import 'package:food_app_ui/widgets/food_type_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodType extends StatefulWidget {
  FoodType({
    Key? key,
    required this.title,
    required this.cars,
  }) : super(key: key);

  final String title;
  List<FoodTypeModel> cars;

  @override
  State<FoodType> createState() => _FoodTypeState();
}

class _FoodTypeState extends State<FoodType> {
  late PageController _pageController;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .75);
    _pageController.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      _page = _pageController.page!;
    });
  }

  void openDetails(FoodTypeModel car) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, animation, animation2) {
          return FadeTransition(
            opacity: animation,
            child: FoodOptions(
              title: widget.title,
              foodType: car,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(onScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 600,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: size.width > 500 ? 4 : 3,
        children: List.generate(
          widget.cars.length,
          (index) => Transform.scale(
            scale: lerpDouble(1, 1, (_page - index)),
            child: FoodTypeCard(
              car: widget.cars[index],
              onTap: () => openDetails(widget.cars[index]),
            ),
          ),
        ),
      ),
    );
  }
}

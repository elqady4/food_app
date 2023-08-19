import 'package:food_app_ui/constants.dart';
import 'package:food_app_ui/models/food_type_model.dart';
import 'package:flutter/material.dart';

class FoodTypeCard extends StatefulWidget {
  static const double height = 200;
  const FoodTypeCard({
    super.key,
    required this.car,
    this.onTap,
  });

  final FoodTypeModel car;
  final VoidCallback? onTap;

  @override
  State<FoodTypeCard> createState() => _FoodTypeCardState();
}

class _FoodTypeCardState extends State<FoodTypeCard> {
  final animationDuration = const Duration(milliseconds: 1500);
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          animate = !animate;
          if (animate) {
            Future.delayed(animationDuration, () {
              setState(() {
                animate = false;
              });
            });
          }
        });
        Future.delayed(
          const Duration(milliseconds: 600),
          widget.onTap?.call,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SizedBox(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(padding / 2),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(children: [
                          TextSpan(
                            text: widget.car.name,
                            style: const TextStyle(
                                fontFamily: 'TheSansArabic',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: Hero(
                  tag: widget.car.id,
                  child: TweenAnimationBuilder<double>(
                    key: Key(animate.toString()),
                    duration: animationDuration,
                    tween: Tween(begin: animate ? 0 : 1, end: 1),
                    builder: (context, double value, _) {
                      return Transform.scale(
                        scale: (2 - const ElasticOutCurve(.5).transform(value))
                            .clamp(.8, 1),
                        child: Image.asset(
                          widget.car.img,
                          height: size.width > 440
                              ? size.width / 6
                              : size.width / 5,
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

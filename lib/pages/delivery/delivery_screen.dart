import 'package:food_app_ui/models/food_type_model.dart';
import 'package:food_app_ui/widgets/food_type.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodType(
      title: 'Make Your Choise',
      cars: foodTypeList,
    );
  }
}

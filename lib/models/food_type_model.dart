class FoodTypeModel {
  final int id;
  final String name;
  final String img;

  const FoodTypeModel(
      {required this.id, required this.name, required this.img});
}

const List<FoodTypeModel> foodTypeList = [
  FoodTypeModel(
      id: 1, name: 'Side Dishies', img: 'assets/images/side_dish.png'),
  FoodTypeModel(id: 2, name: 'Burger', img: 'assets/images/hamburger.png'),
  FoodTypeModel(id: 3, name: 'Strips Meals', img: 'assets/images/strips.png'),
  FoodTypeModel(
      id: 4, name: 'Family Meals', img: 'assets/images/family_meal.png'),
  FoodTypeModel(
      id: 5, name: 'Individual', img: 'assets/images/indivual_meal.png'),
  FoodTypeModel(
      id: 6, name: 'Individual', img: 'assets/images/family_meal.png'),
  FoodTypeModel(
      id: 7, name: 'Individual', img: 'assets/images/indivual_meal.png'),
  FoodTypeModel(id: 8, name: 'Individual', img: 'assets/images/side_dish.png'),
  FoodTypeModel(id: 9, name: 'Individual', img: 'assets/images/hamburger.png'),
];

const List<FoodTypeModel> trendFoodList = [
  FoodTypeModel(
      id: 1, name: 'Side Dishies', img: 'assets/images/side_dish.png'),
  FoodTypeModel(id: 2, name: 'Strips Meals', img: 'assets/images/strips.png'),
  FoodTypeModel(
      id: 3, name: 'Individual', img: 'assets/images/indivual_meal.png'),
];

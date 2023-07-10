import 'package:flutter/material.dart';
import 'package:mealsapp/commonWidgets/common_image_card.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screen/meal_detail.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    void _onSelectMeal(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealDetail(
                meal: meal,
                onToggleFavorite: onToggleFavorite,
              )));
    }

    ;

    return CommonImageCardWidget(
      imageUrl: meal.imageUrl,
      title: meal.title,
      duration: '${meal.duration} min',
      complexityText: complexityText,
      affordabilityText: affordabilityText,
      onTap: () {
        _onSelectMeal(context);
      },
    );
  }
}

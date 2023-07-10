import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/meals_provider.dart';
import 'package:mealsapp/screen/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    void _selectCategory(BuildContext context, Category category) {
      final filteredMeals =
          meals.where((meal) => meal.categories.contains(category.id)).toList();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorite: widget.onToggleFavorite)));
    }

    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...availableCategories
            .map((e) => CategoryGridItem(
                  category: e,
                  onSelectCategory: () {
                    _selectCategory(context, e);
                  },
                ))
            .toList()
      ],
    );
  }
}

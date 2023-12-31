import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/commonWidgets/beautiful_drawer.dart';
import 'package:mealsapp/commonWidgets/custom_alert.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favourite_provider.dart';
import 'package:mealsapp/screen/categories.dart';
import 'package:mealsapp/screen/filters.dart';
import 'package:mealsapp/screen/meals.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlert(
            title: 'Remove favourite meal',
            message: '${meal.title}',
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlert(
            title: "Add favourite meal",
            message: '${meal.title}',
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    print(_favouriteMeals);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    Widget activePage = CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        title: "Favourite",
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: BeautifulDrawer(
        headerTitle: 'Cooking up',
        headerSubtitle: '',
        headerImage: Icons.fastfood,
        drawerItems: [
          DrawerItem(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              // Handle tap action
            },
          ),
          DrawerItem(
            icon: Icons.filter,
            title: 'Filter',
            onTap: () {
              _setScreen("filters");
            },
          ),
        ],
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/widgets/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> _favoriteMeals = [];
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(
    Meal meal,
    String message,
  ) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('${meal.title} $message')));
  }

  void _toggleMealFavStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    isExisting
        ? setState(() {
            _favoriteMeals.remove(meal);

            _showInfoMessage(meal, 'is no longer a favoris');
          })
        : setState(() {
            _favoriteMeals.add(
              meal,
            );
            _showInfoMessage(meal, 'is added to favoris');
          });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleMealFav: _toggleMealFavStatus,
    );
    var activeTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsSCreen(
        toggleMealFav: _toggleMealFavStatus,
        meals: _favoriteMeals,
        title: 'Your Favorites',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amber,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}

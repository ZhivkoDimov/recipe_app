import 'package:flutter/material.dart';
import 'card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CookBook"),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Center(
                child: ListView(
                  children: [
                    CustomCard(
                      title: "Pancakes",
                      description: "Fluffy pancakes with syrup.",
                      icon: Icons.breakfast_dining,
                    ),
                    CustomCard(
                      title: "Omelette",
                      description: "Delicious omelette with vegetables.",
                      icon: Icons.breakfast_dining,
                    ),
                    // Add more breakfast recipes here
                  ],
                ),
              ),
              Center(
                child: ListView(
                  children: [
                    CustomCard(
                      title: "Caesar Salad",
                      description: "Fresh Caesar salad with dressing.",
                      icon: Icons.lunch_dining,
                    ),
                    CustomCard(
                      title: "Grilled Chicken",
                      description: "Juicy grilled chicken with sides.",
                      icon: Icons.lunch_dining,
                    ),
                    // Add more lunch recipes here
                  ],
                ),
              ),
              Center(
                child: ListView(
                  children: [
                    CustomCard(
                      title: "Spaghetti Bolognese",
                      description: "Classic spaghetti with meat sauce.",
                      icon: Icons.dinner_dining,
                    ),
                    CustomCard(
                      title: "Steak",
                      description: "Grilled steak with vegetables.",
                      icon: Icons.dinner_dining,
                    ),
                    // Add more dinner recipes here
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pageController.jumpToPage(0);
                    },
                    child: Text("Breakfast", style: TextStyle(color: _currentPage == 0 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pageController.jumpToPage(1);
                    },
                    child: Text("Lunch", style: TextStyle(color: _currentPage == 1 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text("Dinner", style: TextStyle(color: _currentPage == 2 ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
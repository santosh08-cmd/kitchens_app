import 'package:flutter/material.dart';
import 'package:restaurants_app/screens/add_edit_coupon_screen.dart';
import 'package:restaurants_app/screens/dashboard_screen.dart';
import 'package:restaurants_app/screens/logout_screen.dart';
import 'package:restaurants_app/screens/order_screen.dart';
import 'package:restaurants_app/screens/product_screen.dart';

class DrawerServices {
  Widget drawerScreen(title) {
    if (title == 'Dashboard') {
      return MainScreen();
    }
    if (title == 'Product') {
      return ProductScreen();
    }
    if (title == 'Orders') {
      return OrderScreen();
    }
    if (title == 'Logout') {
      return LogOutScreen();
    }
    return MainScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> options = [
    'Dashboard',
    'Product',
    'Orders',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: [
          Container(
            height: 56,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FloatingActionButton(
                    backgroundColor:
                        selectedIndex == index ? Colors.green : Colors.grey,
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      options[index],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Center(
                child: DrawerServices().drawerScreen(options[selectedIndex]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              // Add your action here
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

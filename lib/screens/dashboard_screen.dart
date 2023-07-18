import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:restaurants_app/screens/order_screen.dart';
import 'package:restaurants_app/screens/product_screen.dart';

import 'logout_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String chatUrl =
      'https://com.example.userhygenicfoodapp/chat'; // Replace with your chat URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Welcome to home and hygienic food'),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change button color to green
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text('Product'),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change button color to green
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text('Orders'),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _launchChatURL(chatUrl);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change button color to green
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text('Chat Bot'),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogOutScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change button color to green
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchChatURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about-screen.dart';
import 'contactus-screen.dart';
import 'package:flutter/services.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  num counter = 0;

  // Navigate to Contact Us screen
  void _navigateToContactUs(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ContactUs()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text(
          'Counter App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 5,
            wordSpacing: 5,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.black),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade900),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerItem(Icons.home, 'Home', () {
              Navigator.pop(context);
              setState(() {
                counter = 0; // Reset counter
              });
            }),
            _buildDrawerItem(Icons.contact_mail, 'Contact Us', () {
              Navigator.pop(context);
              _navigateToContactUs(context);
            }),
            _buildDrawerItem(Icons.info, 'About', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            }),
            _buildDrawerItem(Icons.restore, 'Reset Counter', () {
              Navigator.pop(context);
              _showResetDialog();
            }),
            _buildDrawerItem(Icons.exit_to_app, 'Exit', () {
              Navigator.pop(context);
              _showExitDialog();
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showResetDialog,
        backgroundColor: Colors.white10,
        child: Icon(Icons.refresh, color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/countericon.png', height: 150),
                  Text(
                    '$counter',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildCounterButton('Increment', () {
                    setState(() {
                      counter++;
                    });
                  }),
                  _buildCounterButton('Decrement', () {
                    setState(() {
                      if (counter > 0) {
                        counter--;
                      }
                    });
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Developed by Mr Asghar', // Your name here
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build drawer items
  ListTile _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Method to show reset counter dialog
  void _showResetDialog() {
    Get.defaultDialog(
      title: 'Reset Counter',
      content: Text('Are you sure you want to reset the counter?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              counter = 0; // Reset counter
            });
            Get.back();
          },
          child: Text('Yes'),
        ),
      ],
    );
  }

  // Method to show exit app dialog
  void _showExitDialog() {
    Get.defaultDialog(
      title: 'Exit App',
      content: Text('Are you sure you want to exit the app?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            SystemNavigator.pop(); // Exit app
          },
          child: Text('Yes'),
        ),
      ],
    );
  }

  // Helper method to build counter buttons
  Widget _buildCounterButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 200, // Adjust the width of the button
      height: 100, // Set a fixed height for the buttons
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}

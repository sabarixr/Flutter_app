import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'lib/assets/homebg.jpg',
            fit: BoxFit.cover,
          ),

          Center(
            child: Container(
              width: 400,
              height: 300,
              color: Colors.white.withOpacity(0.7), // Adjust opacity as needed
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Time to study",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 30, // Adjusted font size
                      shadows: [
                        Shadow(
                          color: Colors.blue,
                          blurRadius: 10.0,
                          offset: Offset(5.0, 5.0),
                        ),
                        Shadow(
                          color: Colors.red,
                          blurRadius: 10.0,
                          offset: Offset(-5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Swipe up!!!")
                        ],
                      ),
                    ],
                  ),
                  // Other widgets you may want to add

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

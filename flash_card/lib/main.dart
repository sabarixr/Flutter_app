import 'package:flutter/material.dart';
import 'package:flash_card/subject_pages.dart';
import 'package:flash_card/homepage.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int __currindex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Quiz zone",style: TextStyle(color: Colors.white),),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: PageView(
        controller: _pageController,
       /* onPageChanged: (newIndex) {
          setState(() {
            __currindex = newIndex;
          });
        },*/
        scrollDirection: Axis.vertical,
        children: [
          HomePage(),
          SecondPage(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

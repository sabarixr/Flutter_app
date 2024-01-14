import 'package:flash_card/subjects.dart';
import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _currindex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.biotech_outlined,
          color: Colors.green,
        ),
        label: "Chemistry"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.computer,
          color: Colors.blueGrey,
        ),
        label: "CS"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.electric_bolt,
          color: Colors.yellow,
        ),
        label: "EEE"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.calculate,
          color: Colors.orange,
        ),
        label: "maths"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.rocket_launch_sharp,
          color: Colors.black,
        ),
        label: "Physics"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex) {
            setState(() {
              _currindex = newIndex;
            });
          },
          children: [
            Chemistry(),
            Cs(),
            Eee(),
            Math(),
            Physics(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currindex,
          items: _bottomNavigationBarItems,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 500), curve: Curves.easeIn);
          },
          selectedItemColor: Colors.black26,
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: 3),
      Container(
        child: Center(
          child: Text(
            'Tab 2',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      )
    ];
  }

  tabListener() {
    setState(() {});
  }

  @override
  dispose() {
    controller!.removeListener(tabListener);
    super.dispose();
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
        currentIndex: controller!.index,
        onTap: (int index) {
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edgesensor_high_outlined,
              ),
              label: '주사위'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: '설정')
        ]);
  }
}

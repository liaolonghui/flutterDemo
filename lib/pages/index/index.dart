// Index
import 'package:flutter/material.dart';
import '../home/home.dart';
import '../discover/discover.dart';
import '../me/me.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  List pages = [const HomePage(), const DiscoverPage(), const MePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffffc81f),
        unselectedItemColor: const Color(0xff333333),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '探索'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: '我的'
          ),
        ]
      ),
    );
  }
}
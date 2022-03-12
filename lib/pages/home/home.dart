import 'package:flutter/material.dart';
import '../search/search.dart';
import '../news/news.dart';
import '../lab/lab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Color(0xff333333),
          ),
          onPressed: () {
            // 跳转至搜索页面
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
              return const SearchPage();
            }));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Color(0xff333333),
            ),
            onPressed: () {
              // 跳转至编辑页面
              Navigator.pushNamed(context, '/edit', arguments: { 'editId': 999 });
            },
          ),
        ],
        title: TabBar(
          labelStyle: const TextStyle(
            fontSize: 18
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16
          ),
          labelColor: const Color(0xff333333),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: const Color(0xffffc81f),
          controller: tabController,
          tabs: const <Widget>[
            Tab(
              text: '新闻',
            ),
            Tab(
              text: '实验室',
            )
          ],
        )
      ),
      body: TabBarView(
        controller: tabController,
        children: const <Widget>[
          NewsPage(),
          LabPage(),
        ]
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../search/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: const Text('首页', style: TextStyle(color: Color(0xff333333),),),
      ),
      body: const Text('首页内容'),
    );
  }
}
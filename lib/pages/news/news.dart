import 'package:flutter/material.dart';
import './child//mySwiper.dart';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List banners = [];
  List feeds = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Response res = await Dio().get('http://app3.qdaily.com/app3/homes/index_v2/0.json');
    setState(() {
      banners = res.data["response"]["banners"];
      feeds = res.data["response"]["feeds"];
    });
  } 

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:  (BuildContext context, int index) {
        if (index == 0) {
          // 0就显示轮播图
          return MySwiper(banners);
        } else {
          return Container(
            child: Text("俺是${index + 1}"),
            color: const Color(0xfffafafa),
            height: 100,
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 2,
          color: const Color(0xffeeeeee),
        );
      },
      itemCount: 10
    );
  }
}
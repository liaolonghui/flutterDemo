import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './child//mySwiper.dart';
import './child/myItem.dart';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List banners = [];
  List feeds = [];
  String lastKey = "0";
  bool flag = true; // 防止下拉多次
  final ScrollController _scrollControl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollControl.addListener(() async {
      if (_scrollControl.position.pixels == _scrollControl.position.maxScrollExtent) {
        // 到底部了
        if (flag) {
          flag = false;
          getData();
        }
      }
    });
    getData();
  }

  Future<void> onRefresh() async {
    lastKey = "0";
    return getData();
  }

  void getData() async {
    Response res = await Dio().get('http://app3.qdaily.com/app3/homes/index_v2/$lastKey.json');
    if (lastKey != "0") {
      await Future.delayed(const Duration(seconds: 1), () {}); // 加1s延迟，看效果
    }
    setState(() {
      if (lastKey == "0") {
        banners = res.data["response"]["banners"];
        feeds = res.data["response"]["feeds"];
      } else {
        feeds.addAll(res.data["response"]["feeds"]);
      }
    });
    lastKey = res.data["response"]["last_key"];
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: const Color(0xffffc81f),
      child: ListView.separated(
        controller: _scrollControl,
        itemBuilder:  (BuildContext context, int index) {
          if (index == 0) {
            // 0就显示轮播图
            return MySwiper(banners);
          } else if (index == feeds.length) {
            // 如果是最后一个则加个加载效果
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  MyItemWidget(feeds[index - 1]),
                  Container(
                    height: 50,
                    color: const Color(0xffeeeeee),
                    child: const SpinKitThreeInOut(
                      color: Color(0xffffc81f),
                      size: 50.0,
                    ),
                  ),
                ],
              )
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: MyItemWidget(feeds[index - 1]),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 5,
            color: const Color(0xffeeeeee),
          );
        },
        itemCount: feeds.length + 1, // 有一个是轮播图，所有加1
      ),
      onRefresh: onRefresh,
    );
  }
}
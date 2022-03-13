// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyItemWidget extends StatelessWidget {
  final Map feed;

  const MyItemWidget(this.feed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // type是2则图片在上
    if (feed["type"] == 2) {
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 195.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(feed["image"]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            child: Text(
              feed["post"]["title"],
              style: const TextStyle(
                color: Color(0xff333333),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              feed["post"]["description"],
              style: const TextStyle(
                color: Color(0xff999999),
                fontSize: 14,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  feed["post"]["title"],
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    feed["post"]["category"]["title"],
                    style: const TextStyle(
                      color: Color(0xff999999),
                      fontSize: 14,
                    ),
                  ),
                ),
              ]
            ),
            flex: 1,
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Image.network(
              feed["image"],
              fit: BoxFit.cover,
            ),
            flex: 1,
          )
        ],
      );
    }
  }
}
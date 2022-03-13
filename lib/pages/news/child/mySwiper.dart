// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MySwiper extends StatelessWidget {
  final List banners;
  const MySwiper(this.banners, {Key? key}) : super(key: key);

  final DotSwiperPaginationBuilder builder = const DotSwiperPaginationBuilder(
    activeColor: Color(0xffffc81f),
    space: 5,
    size: 7
  );

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return Container(
        height: 200,
        color: const Color(0xffeeeeee),
      );
    }
    return Container(
      height: 200,
      color: const Color(0xffeeeeee),
      child: Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        duration: 500,
        pagination: SwiperPagination(builder: builder),
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int index) {
          // Image.network(banners[index]["image"])
          return Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(banners[index]["image"]),
                fit: BoxFit.cover,
              )
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    color: const Color.fromARGB(50, 0, 0, 0),
                  ),
                ),
                Positioned(
                  child: Text(
                    banners[index]["post"]["title"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  left: 20,
                  right: 20,
                  bottom: 30,
                )
              ]
            ),
          );
       },),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchNews.dart';
import 'package:news_app/model/newsArt.dart';
import 'package:news_app/view/widgets/NewsContainer.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNew.fetchNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        onPageChanged: (value){
          setState(() {
            isLoading=true;
          });
          GetNews();
        },
        scrollDirection: Axis.vertical,
          itemBuilder: (context,index){

            return isLoading? Center(child: CircularProgressIndicator(),):NewsContainer(
              imgUrl: newsArt.imgUrl,
              newsDes: newsArt.newsDes,
              newsHead: newsArt.newsHead,
              newsUrl: newsArt.newsUrl,
              newsCnt: newsArt.newsCnt,
            );
      }),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vandi/widgets/lorry.dart';
import 'package:vandi/widgets/minitempo.dart';
import 'package:vandi/widgets/tempo.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mypage(),
    );
  }
}

class Mypage extends StatefulWidget {
  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  PageController controller = PageController(initialPage: 0);

  List<Widget> pages = [];

  var currentpage = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    pages.add(
      ListView(
        children: [
          Container(
              height: mediaQueryData.size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    
                    height: mediaQueryData.size.height / 2,
                    width: mediaQueryData.size.width / 2,
                    child: LayoutBuilder(
                        builder: (BuildContext, BoxConstraints Constraints) {
                      print(Constraints.maxHeight * 0.60);
                      return Image(

                          image: AssetImage("images/tempo.png"));
                    }),
                  ),
                  Container(
                      height: mediaQueryData.size.height / 8,
                      width: mediaQueryData.size.width / 8,
                      child: LayoutBuilder(
                        builder: (BuildContext, BoxConstraints Constraints) {
                          return Container(
                              height: Constraints.maxHeight,
                              width: Constraints.maxWidth,
                              child: FloatingActionButton(
                                onPressed: () {
                                  pages.add(Tempo(
                                      pages: pages, controller: controller));
                                  controller.jumpToPage(1);
                                },
                                child: Icon(Icons.arrow_right),
                              ));
                        },
                      )),
                ],
              )),
         Container(
              height: mediaQueryData.size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: mediaQueryData.size.height / 2,
                      width: mediaQueryData.size.width / 2,
                      child: LayoutBuilder(
                          builder: (BuildContext, BoxConstraints Constraints) {
                        return Image(
                            height: Constraints.maxHeight * 0.50,
                            width: Constraints.maxWidth * 0.50,
                            image: AssetImage("images/minitempo.png"));
                      })),
                  Container(
                      height: mediaQueryData.size.height / 8,
                      width: mediaQueryData.size.width / 8,
                      child: LayoutBuilder(
                          builder: (BuildContext, BoxConstraints Constraints) {
                        return Container(
                            height: Constraints.maxHeight,
                            width: Constraints.maxWidth,
                            child: FloatingActionButton(
                              onPressed: () {
                                pages.add(minitempo(
                                    pages: pages, controller: controller));
                                controller.jumpToPage(1);
                              },
                              child: Icon(Icons.arrow_right),
                            ));
                      }))
                ],
              )),
          Container(
              height: mediaQueryData.size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: mediaQueryData.size.height / 2,
                      width: mediaQueryData.size.width / 2,
                      child: LayoutBuilder(
                          builder: (BuildContext, BoxConstraints Constraints) {
                        return Image(
                            height: Constraints.maxHeight * 0.50,
                            width: Constraints.maxWidth * 0.50,
                            image: AssetImage("images/lorry.png"));
                      })),
                  Container(
                      height: mediaQueryData.size.height / 8,
                      width: mediaQueryData.size.width / 8,
                      child: LayoutBuilder(
                          builder: (BuildContext, BoxConstraints Constraints) {
                        return Container(
                            height: Constraints.maxHeight,
                            width: Constraints.maxWidth,
                            child: FloatingActionButton(
                              onPressed: () {
                                pages.add(Lorry(
                                    pages: pages, controller: controller));
                                controller.jumpToPage(1);
                              },
                              child: Icon(Icons.arrow_right),
                            ));
                      }))
                ],
              ))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("VANDI"),
          
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: pages,
          onPageChanged: (value) {
            controller.jumpToPage(1);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:vandi/widgets/tempo.dart';

import 'package:vandi/widgets/workerpage.dart';
import 'package:vandi/widgets/uploding.dart';
import 'package:vandi/widgets/uplodedpage.dart';

class Savaari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mypage(),
    );
  }
}

class Mypage extends StatefulWidget {
  const Mypage({super.key});
  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  var img = [
    {"image": "tempo.png"},
    {"image": "minitempo.png"},
    {"image": "lorry.png"},
  ];
  var txt = [
    {"texts": "TEMPO"},
    {"texts": "MINITEMPO"},
    {"texts": "LORRY"}
  ];

  PageController controller = PageController();

  PageController worker_controller = PageController();

  PageController upload_controller = PageController();

  PageController uploaded_controller = PageController();

  List<Widget> pages = [];

  List<Widget> worker_page = [];

  List<Widget> upload_page = [];

  List<Widget> uploaded_page = [];

  var currentpage = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    pages.add(Container(
        child: ListView.builder(
      itemCount: img.length,
      itemBuilder: (context, index) {
        return Container(
            height: mediaQueryData.size.height / 4,
            width: mediaQueryData.size.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: mediaQueryData.size.height / 2,
                  width: mediaQueryData.size.width / 2,
                  child: LayoutBuilder(
                      builder: (BuildContext, BoxConstraints Constraints) {
                    return Column(
                      children: [
                        Image(
                            image: AssetImage("images/${img[index]["image"]}"),
                            height: Constraints.maxHeight * 0.8),
                        Container(
                          height: Constraints.maxHeight * 0.2,
                          child: Center(
                            child: Text(
                              "${txt[index]["texts"]}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                Container(
                    height: mediaQueryData.size.height / 2,
                    width: mediaQueryData.size.width / 2,
                    alignment: Alignment.topCenter,
                    child: LayoutBuilder(
                      builder: (BuildContext, BoxConstraints Constraints) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: Constraints.maxHeight * 0.23),
                          height: Constraints.maxHeight * 0.3,
                          width: Constraints.maxWidth * 0.3,
                          child: FloatingActionButton(
                            onPressed: () {
                              pages.add(
                                  Tempo(pages: pages, controller: controller));
                              controller.jumpToPage(1);
                            },
                            child: Icon(Icons.arrow_right),
                          ),
                        );
                      },
                    )),
              ],
            ));
      },
    )));
    worker_page.add(ListView(
      children: [
        Work(
          controller: controller,
          worker_controller: worker_controller,
          worker_page: worker_page,
        )
      ],
    ));
    upload_page.add(Uploadings(
      upload_controller: controller,
      upload_page: upload_page,
    ));
    uploaded_page.add(Uploded(
      uploaded_controller: uploaded_controller,
      uploaded_page: uploaded_page,
    ));

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBar(
              title: Center(
                child: Text(
                  "VANDI",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.pink,
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              ),
            ),
          ),
          body: Container(
              child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 0.5,
              flexibleSpace: Center(
                  child: Container(
                height: 78,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.pink,
                  Colors.blue,
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
              )),
              bottom: TabBar(
                  indicatorColor: Colors.yellow,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.emoji_transportation,
                        color: Colors.white,
                        size: 30,
                      ),
                      child: Text(
                        'vandi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.people_sharp,
                          color: Colors.white, size: 30),
                      child: Text(
                        'Workers',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.work, color: Colors.white, size: 30),
                      child: Text(
                        'upload',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.work_history,
                          color: Colors.white, size: 30),
                      child: Text(
                        'Work',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
            ),
            SliverFillRemaining(
                child: TabBarView(
              children: [
                PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: pages,
                  onPageChanged: (value) {
                    controller.jumpToPage(1);
                  },
                ),
                // SizedBox(
                //     height: double.infinity,
                // child:
                PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: worker_controller,
                  children: worker_page,
                  onPageChanged: (value) {
                    controller.jumpToPage(1);
                  },
                ),
                // ),
                PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: upload_controller,
                  children: upload_page,
                  onPageChanged: (value) {
                    controller.jumpToPage(1);
                  },
                ),
                PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: uploaded_controller,
                  children: uploaded_page,
                  onPageChanged: (value) {
                    controller.jumpToPage(1);
                  },
                ),
              ],
            )),
          ])),
        ));
  }
}

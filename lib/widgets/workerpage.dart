import 'package:flutter/material.dart';
import 'package:vandi/widgets/mason.dart';
import 'package:vandi/widgets/carpenter.dart';
import 'package:vandi/widgets/electrician.dart';
import 'package:vandi/widgets/mechanic.dart';
import 'package:vandi/widgets/plumber.dart';
import 'package:vandi/widgets/painting.dart';
import 'package:vandi/widgets/sealing.dart';
import 'package:vandi/widgets/steel.dart';
import 'package:vandi/widgets/tile.dart';

class Work extends StatefulWidget {
  final controller;
  final worker_controller;
  final worker_page;
  Work(
      {super.key,
      required this.controller,
      required this.worker_controller,
      this.worker_page});
  @override
  State<Work> createState() => _workState();
}

var images = [
  {"image": "mason.png"},
  {"image": "carpenter.png"},
  {"image": "electrician.png"},
  {"image": "mechanic.png"},
  {"image": "plumber.png"},
  {"image": "painting.png"},
  {"image": "sealing.png"},
  {"image": "steel.png"},
  {"image": "tile.png"},
];
var text1 = [
  {"text": "MASON"},
  {"text": "CARPENTER"},
  {"text": "ELECTRICIAN"},
  {"text": "MECHANIC"},
  {"text": "PLUMBER"},
  {"text": "PAINTING"},
  {"text": "SEALING"},
  {"text": "STEEL"},
  {"text": "TILE"},
];

class _workState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    PageController controller = widget.controller;
    List worker_page = widget.worker_page;
    PageController worker_controller = widget.worker_controller;

    return Container(
        height: mediaQueryData.size.height,
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (contex, index) {
              return Container(
                  height: mediaQueryData.size.height / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: mediaQueryData.size.width * 0.5,
                        child: LayoutBuilder(builder:
                            (BuildContext, BoxConstraints Constraints) {
                          return Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "images/${images[index]['image']}"),
                                  height: Constraints.maxHeight * 0.8),
                              Container(
                                height: Constraints.maxHeight * 0.2,
                                child: Center(
                                  child: Text("${text1[index]['text']}"),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      Container(
                          height: mediaQueryData.size.height / 15,
                          width: mediaQueryData.size.width * 0.5,
                          alignment: Alignment.center,
                          child: LayoutBuilder(
                            builder:
                                (BuildContext, BoxConstraints Constraints) {
                              return Container(
                                  height: Constraints.maxHeight * 0.8,
                                  width: Constraints.maxWidth * 0.3,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      if (text1[index]['text'] == 'MASON') {
                                        worker_page.add(Mason(
                                            worker_page: worker_page,
                                            worker_controller:
                                                worker_controller));
                                      } else if (text1[index]['text'] ==
                                          'CARPENTER') {
                                        worker_page.add(Carpenter(
                                            worker_page: worker_page,
                                            worker_controller:
                                                worker_controller));
                                      } else if (text1[index]['text'] ==
                                          'ELECTRICIAN') {
                                        worker_page.add(Electrician(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      } else if (text1[index]['text'] ==
                                          'MECHANIC') {
                                        worker_page.add(Mechanic(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      } else if (text1[index]['text'] ==
                                          'PLUMBER') {
                                        worker_page.add(Plumber(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      } else if (text1[index]['text'] ==
                                          'PAINTING') {
                                        worker_page.add(Painting(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      } else if (text1[index]['text'] ==
                                          'SEALING') {
                                        worker_page.add(Sealing(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      } else if (text1[index]['text'] ==
                                          'STEEL') {
                                        worker_page.add(Steel(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      } else {
                                        worker_page.add(Tile(
                                          worker_controller: worker_controller,
                                          worker_page: worker_page,
                                        ));
                                      }
                                      worker_controller.jumpToPage(1);
                                    },
                                    child: Icon(Icons.arrow_right),
                                  ));
                            },
                          )),
                    ],
                  ));
            }));
  }
}

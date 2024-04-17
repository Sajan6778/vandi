import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class minitempo extends StatefulWidget {
  final List pages;
  final PageController controller;

  const minitempo({super.key, required this.pages, required this.controller});

  @override
  State<minitempo> createState() => _minitempostate();
}

var details = [
  {
    'image': 'tempo1.png',
    'owner_name': 'bringo',
    'address': 'pattarivilai,near mondaymarket',
    'vandi_name': 'shadow',
    'vandi_no': 'TN 61 AA5197',
    'phone_no': '8220129330'
  },
  {
    'image': 'minitempo2.png',
    'owner_name': 'bringo',
    'address': 'pattarivilai,near mondaymarket',
    'vandi_name': 'shadow',
    'vandi_no': 'TN 61 AA5197',
    'phone_no': '8220129330'
  },
  {
    'image': 'minitempo3.png',
    'owner_name': 'bringo',
    'address': 'pattarivilai,near mondaymarket',
    'vandi_name': 'shadow',
    'vandi_no': 'TN 61 AA5197',
    'phone_no': '8220129330'
  },
  {
    'image': 'minitempo4.png',
    'owner_name': 'bringo',
    'address': 'pattarivilai,near mondaymarket',
    'vandi_name': 'shadow',
    'vandi_no': 'TN 61 AA5197',
    'phone_no': '8220129330'
  },
  {
    'image': 'minitempo5.png',
    'owner_name': 'bringo',
    'address': 'pattarivilai,near mondaymarket',
    'vandi_name': 'shadow',
    'vandi_no': 'TN 61 AA5197',
    'phone_no': '8220129330'
  },
  {
    'image': 'minitempo6.png',
    'owner_name': 'bringo',
    'address': 'pattarivilai,near mondaymarket',
    'vandi_name': 'shadow',
    'vandi_no': 'TN 61 AA5197',
    'phone_no': '8220129330'
  },
];

class _minitempostate extends State<minitempo> {
  final ValueNotifier counter = ValueNotifier(0);

  var items = ["name", "address", "location"];

  final z = Icon(Icons.call);

  @override
  Widget build(BuildContext context) {
    List pages = widget.pages;
    PageController controller = widget.controller;

    MediaQueryData mediaQueryData = MediaQuery.of(context);

    final String phonenumber = "9345129432";

    return (Container(
      child: Column(
        children: [
          Container(
            height: mediaQueryData.size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    pages.removeAt(1);

                    controller.jumpToPage(0);
                  },
                  child: Icon(
                    Icons.arrow_left,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
          Container(
              height: mediaQueryData.size.height * 0.759,
              child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: mediaQueryData.size.height * 0.22,
                        child: LayoutBuilder(builder:
                            (BuildContext, BoxConstraints constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Container(
                                      width: constraints.maxWidth * 0.30,
                                      height: constraints.maxHeight * 0.30,
                                      child: Image(
                                        image: AssetImage(
                                            "images/${details[index]['image']}"),
                                      )),
                                  Container(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Ratings",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            size: 12,
                                          ),
                                        ],
                                      ))
                                ]),
                              ),
                              Container(
                                  width: constraints.maxWidth * 0.10,
                                  child: Icon(
                                    Icons.arrow_circle_right,
                                  )),
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) {
                                        return Container(
                                          color: Colors.white,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .5,
                                          
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(width: 8),
                                                  Text('owner name:'),
                                                  Text(details[index]
                                                          ['owner_name']
                                                      .toString()),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 8),
                                                  Text('vandi name:'),
                                                  Text(details[index]
                                                          ['vandi_name']
                                                      .toString()),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 8),
                                                  Text('vandi number:'),
                                                  Text(details[index]
                                                          ['vandi_no']
                                                      .toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child:  Text(
                                    'Details',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                              Container(
                                  width: constraints.maxWidth * 0.27,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        var number = details[index]['phone_no']
                                            .toString();
                                        FlutterPhoneDirectCaller.callNumber(
                                            number);
                                      },
                                      child: Row(
                                        children: [
                                          z,
                                          Text(
                                            "call",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ))),
                            ],
                          );
                        }));
                  }))
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:vandi/widgets/colors.dart';

class Mason extends StatefulWidget {
  final List worker_page;

  final PageController worker_controller;

  const Mason(
      {super.key, required this.worker_page, required this.worker_controller});

  @override
  State<Mason> createState() => _MasonState();
}

var details1 = [
  {
    "image": "mason1.png",
    "name": "Bringo",
    "Address": "patterivilai,mondaymarket",
    "work": "Mason",
  },
  {
    "image": "mason2.png",
    "name": "siva",
    "Address": "krishnankoil,vadaseri",
    "work": "Mason",
  },
  {
    "image": "mason3.png",
    "name": "shyjan",
    "Address": "kodimunai,kolachal",
    "work": "Mason",
  },
  {
    "image": "mason4.png",
    "name": "benoj",
    "Address": "kodimunai,kolachal",
    "work": "Mason",
  },
  {
    "image": "mason5.png",
    "name": "ashfaq",
    "Address": "kodimunai,kolachal",
    "work": "Mason",
  },
  {
    "image": "mason6.png",
    "name": "avinash",
    "Address": "kodimunai,kolachal",
    "work": "Mason",
  }
];

class _MasonState extends State<Mason> {
  @override
  Widget build(BuildContext context) {
  
    List worker_page=widget.worker_page;
    PageController controller = widget.worker_controller;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final z = Icon(Icons.call);

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
                    worker_page.removeAt(1);

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
                  itemCount: details1.length,
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
                                            "images/${details1[index]['image']}"),
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
                                    backgroundColor:AppColors.bluecolor,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (_) {
                                        return Container(
                                          color:AppColors.containerColor,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .5,
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(width: 8),
                                                  Text('Name:'),
                                                  Text(details1[index]["name"]
                                                      .toString()),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(width: 8),
                                                  Text('Address:'),
                                                  Text(details1[index]
                                                          ['Address']
                                                      .toString()),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(width: 8),
                                                  Text('work:'),
                                                  Text(details1[index]['work']
                                                      .toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'details',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                          AppColors.containerColor),
                                  ),
                                ),
                              ),
                              Container(
                                  width: constraints.maxWidth * 0.27,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        var number = details1[index]['phone_no']
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

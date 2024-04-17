import 'package:flutter/material.dart';

class Workerdropdown extends StatefulWidget {
  const Workerdropdown({super.key});

  @override
  State<Workerdropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Workerdropdown> {
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.blue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: SafeArea(
            child: Center(
                child: Container(
                    alignment: Alignment.center,
                    height: a.height * 0.20,
                    width: a.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: a.height / 20,
                              width: a.width * 0.8,
                              child: DropdownButtonFormField(
                                value: selectedValue1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  prefixIcon: Icon(
                                    Icons.select_all_outlined,
                                    color: Colors.blue,
                                  ),
                                  labelText: "Select worker",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue1 = value;
                                  });
                                },
                                items: ["Mason", "Carpenter", "Electrician","Machanic","Plumber","Painting","Sealing","Steel","Tile"]
                                    .map((data) => DropdownMenuItem(
                                          value: data,
                                          child: Text(data),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.blue],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          height: a.height / 20,
                          width: a.width * 0.4,
                          child: TextButton(
                              onPressed: () {
                                if (selectedValue1 == "Mason") {
                                  Navigator.pushNamed(context, "/");
                                } else if (selectedValue1 == "Carpenter") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Electrician") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Machanic") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Plumber") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Painting") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Sealing") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Steel") {
                                  Navigator.pushNamed(context, "/");
                                }
                                 else if (selectedValue1 == "Tile") {
                                  Navigator.pushNamed(context, "/");
                                }
                              },
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        )
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}

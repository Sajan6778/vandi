import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  @override
  Widget build(BuildContext context) {
    var MediaQuery1 = MediaQuery.of(context).size;

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
                    height: MediaQuery1.height * 0.20,
                    width: MediaQuery1.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(width:1),
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
                              height: MediaQuery1.height / 20,
                              width: MediaQuery1.width * 0.8,
                              child: DropdownButtonFormField(
                                value: selectedValue1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  prefixIcon: Icon(
                                    Icons.select_all_outlined,
                                    color: Colors.blue,
                                  ),
                                  labelText: "Select vehicle",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue1 = value;
                                  });
                                },
                                items: ["Tempo", "Minitempo", "Lorry"]
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
                          height: MediaQuery1.height / 20,
                          width: MediaQuery1.width * 0.4,
                          child: TextButton(
                              onPressed: () {
                                if (selectedValue1 == "Tempo") {
                                  Navigator.pushNamed(context, "/");
                                } else if (selectedValue1 == "Minitempo") {
                                  Navigator.pushNamed(context, "minitempos");
                                } else if (selectedValue1 == "Lorry") {
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

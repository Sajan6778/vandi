import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:vandi/widgets/colors.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var names;
  var passwords;
  var ages;
  var emails;
  var phonenos;
  var pincodes;
  var usernames;
  var genders;
  var areas;
  var catagorieses;

  bool _obscureText = true;

  List<String> country = ["TamilNadu", "Kerala", "Srilanka"];

  @override
  Widget build(BuildContext context) {
    print("helloooo");
    var mylist = ["Male", "Female", "Others"];

    var a = MediaQuery.of(context).size;

    List<Widget> fields = [
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.containerColor,
            ),
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (Value) {
                names = Value;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.bluecolor,
                ),
                labelText: "name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (Value) {
                ages = Value;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.hourglass_empty,
                  color: AppColors.bluecolor,
                ),
                labelText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
              value: genders,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                prefixIcon: Icon(
                  Icons.location_city,
                  color: AppColors.bluecolor,
                ),
                labelText: "Gender",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  genders = value;
                });
              },
              items: ["Male", "Female"]
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (Value) {
                emails = Value;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColors.bluecolor,
                ),
                labelText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (Value) {
                phonenos = Value;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                  color: AppColors.bluecolor,
                ),
                labelText: "Phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
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
              value: areas,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                prefixIcon: Icon(
                  Icons.location_city,
                  color: AppColors.bluecolor,
                ),
                labelText: "area",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  areas = value;
                });
              },
              items: country
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (Value) {
                pincodes = Value;
              },
              decoration: InputDecoration(
                fillColor: AppColors.containerColor,
                prefixIcon: Icon(
                  Icons.pin,
                  color: AppColors.bluecolor,
                ),
                labelText: "Pincode",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
    ];

    fields.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: a.height / 20,
          width: a.width * 0.8,
          child: DropdownButtonFormField(
            value: catagorieses,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              prefixIcon: Icon(
                Icons.more_vert,
                color: AppColors.bluecolor,
              ),
              labelText: "catagories",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (value) {
              setState(() {
                catagorieses = value;
              });
            },
            items: ["Customer", "Transport", "Worker"]
                .map((data) => DropdownMenuItem(
                      value: data,
                      child: Text(data),
                    ))
                .toList(),
          ),
        ),
      ],
    ));
    fields.add(SizedBox(
      height: 20,
    ));
    fields.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.containerColor,
            ),
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (Value) {
                usernames = Value;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.bluecolor,
                ),
                labelText: "username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    fields.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.containerColor,
              ),
              height: a.height / 35,
              width: a.width * 0.6,
              child: Text("")),
        ],
      ),
    );
    fields.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.containerColor,
            ),
            height: a.height / 20,
            width: a.width * 0.8,
            child: TextFormField(
              onChanged: (value) {
                passwords = value;
              },
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(
                  Icons.password,
                  color: AppColors.bluecolor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    fields.add(SizedBox(
      height: 20,
    ));
    print("sajan");
    fields.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                AppColors.gradientStartColor,
                AppColors.gradientEndColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          height: a.height / 20,
          width: a.width * 0.4,
          child: TextButton(
              onPressed: () {
                print("helloo");
                Future<void> fetchData() async {
                  print("hiiiiiiiiiii");
                  // Map<String, dynamic> data = {
                  //   "name": "John",
                  //   "age": 30,
                  //   "isStudent": false,
                  //   "grades": [85, 90, 95],
                  //   "address": {"city": "New York", "zip": "10001"}
                  // };
                  dynamic credentialJson = {
                    "name": names,
                    "age": ages,
                    "gender": genders,
                    "phone_number": phonenos,
                    "pincode": pincodes,
                    "categories": catagorieses,
                    "area": areas
                  };

                  dynamic userDataJson = {
                    "username": usernames,
                    "password": passwords
                  };

                  print(credentialJson);
                  print(userDataJson);

                  final response = await http.post(
                      Uri.parse('https://abimon.pythonanywhere.com/register'),
                      headers: {
                        'Content-Type': 'application/json',
                      },
                      body: json.encode({
                        "credential": credentialJson,
                        "user_data": userDataJson
                      }));

                  if (response.statusCode == 200) {
                    Map<String, dynamic> responseData =
                        json.decode(response.body);
                    dynamic message = responseData['message'];
                    print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
                    print(message);
                    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                    print(response.body);
                  }
                }

                fetchData();

                if (catagorieses == "Customer") {
                  Navigator.pushNamed(context, "/");
                } else if (catagorieses == "Vehicle") {
                  Navigator.pushNamed(context, "vehicle");
                } else if (catagorieses == "workers") {
                  Navigator.pushNamed(context, "workers");
                }
              },
              child: Center(
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: AppColors.containerColor),
                ),
              )),
        ),
      ],
    ));

    fields.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: a.height / 20,
          width: a.width * 0.2,
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(color: AppColors.green),
                ),
              )),
        ),
      ],
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.gradientStartColor,
                AppColors.gradientEndColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            ),
            title: Center(
              child: Text("REGITRATION FORM"),
            ),
          ),
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.gradientStartColor,
                AppColors.gradientEndColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: SafeArea(
                  child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: a.height * 0.89,
                          width: a.width * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.containerColor),
                          child: Form(
                            child: SingleChildScrollView(
                              child: Column(
                                children: fields,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              )))),
    );
  }
}

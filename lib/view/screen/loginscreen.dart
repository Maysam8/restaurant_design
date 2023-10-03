import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myproject/view/screen/categories_screen.dart';
import 'package:myproject/view/screen/signupscreen.dart';

import 'package:http/http.dart' as http;

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool showPassword = false;
  double? height;
  double? width;
  String countryCode = "+962";
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 32, 31),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 150),
            width: width,
            height: height! * .71,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to my restaurant",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  " loginscreen with your phone number:",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IntlPhoneField(
                    controller: phoneTextEditingController,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "786983720",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle:
                          TextStyle(color:  Color.fromARGB(255, 228, 98, 11)),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    initialCountryCode: "JO",
                    onChanged: (phone) {
                      countryCode = phone.countryCode;
                    },
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: TextField(
                    controller: passwordTextEditingController,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:  Color.fromARGB(255, 228, 98, 11),
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      hintText: "enter_your_password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 228, 98, 11)),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(top: 35),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                  
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 228, 98, 11)), // لون الخلفية
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "dont have an account",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 66, 63, 63),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ));
                    },
                    child: Text(
                      "register now!",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 228, 98, 11),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }

  /*login() async {
    final response = await http.post(
        Uri.parse(""),
        body: {
          "Phone": phoneTextEditingController.text,
          "Password": passwordTextEditingController.text,
          "ConCode": countryCode,
        });
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      if (jsonBody["result"]) {
        var Id = jsonBody["Id"];
        var Name = jsonBody["Name"];
        var Id_usertype = jsonBody["Id_usertype"];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Allcategoriesscreen(),
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("phone number or password not correct"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              );
            });
      }}
    }*/
  }


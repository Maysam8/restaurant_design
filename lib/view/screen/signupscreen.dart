import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController =
      TextEditingController();
  double? height;
  double? width;
  bool agreeTerms = false;
  String countryCode = "+962";
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 23, 23),
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: width,
                margin: EdgeInsets.only(
                  top: height! * .10,
                ),
                padding: const EdgeInsets.all(
                  20,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "create new account",
                        style: GoogleFonts.poppins(
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
                        "hello we are glad you have joined our family",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 66, 63, 63),
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
                        child: TextField(
                          controller: nameTextEditingController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "full_name",
                            hintText: "enter_your_name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                31.5,
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 228, 98, 11)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 228, 98, 11)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                          initialCountryCode: "JO",
                          onChanged: (phone) {
                            countryCode = phone.countryCode;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "email",
                            hintText: "demo@demo.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                31.5,
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 228, 98, 11)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: TextField(
                          controller: passwordTextEditingController,
                          obscureText: !showPassword,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:  Color.fromARGB(255, 228, 98, 11)
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                            hintText: "enter_your_password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                31.5,
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 228, 98, 11)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: TextField(
                            controller: confirmpasswordTextEditingController,
                            obscureText: !showConfirmPassword,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "confirm_password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  showConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromARGB(255, 228, 98, 11)
                                ),
                                onPressed: () {
                                  setState(() {
                                    showConfirmPassword = !showConfirmPassword;
                                  });
                                },
                              ),
                              hintText: " re enter your password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(31.5),
                              ),
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 228, 98, 11),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.black,
                              value: agreeTerms,
                              onChanged: (val) {
                                setState(() {
                                  agreeTerms = val!;
                                });
                              }),
                          Text(
                            "i agree to",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            " terms of service and privacy policy",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 18),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 228, 98, 11)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "already have an account",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "login",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color.fromARGB(255, 228, 98, 11),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]))));
  }
}

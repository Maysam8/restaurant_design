import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/model/items_model.dart';
import 'package:myproject/view/screen/categories_screen.dart';

class pizzalist extends StatefulWidget {
  const pizzalist({Key? key}) : super(key: key);

  @override
  State<pizzalist> createState() => _pizzalistState();
}

class _pizzalistState extends State<pizzalist> {
  List<ItemModel> Items = [
    ItemModel(
      Id: "1",
      Name: "Supreme Pizza",
      ImageURL: "images/pizza/1.jpg",
      Price: "6.9 \$",
    ),
    ItemModel(
      Id: "2",
      Name: "BBQ Chicken Pizza",
      ImageURL: "images/pizza/2.jpg",
      Price: "3.9 \$",
    ),
    ItemModel(
      Id: "3",
      Name: "Buffalo Chicken Pizza",
      ImageURL: "images/Pizza/4.jpg",
      Price: "2.9 \$",
    ),
    ItemModel(
      Id: "4",
      Name: "Mushroom Pizza",
      ImageURL: "images/Pizza/5.jpg",
      Price: "3.0 \$",
    ),
    ItemModel(
      Id: "4",
      Name: "Vegetarian Pizza",
      ImageURL: "images/Pizza/6.jpg",
      Price: "5.4 \$",
    ),
  ];

  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/pizza/2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart,
                              color: Color.fromARGB(255, 228, 98, 11)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 8,
                  child: Text(
                    "Pizza",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 206, 201, 199),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: Items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 49, 48, 47),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        Items[index].ImageURL,
                        width: 95,
                        height: 95,
                        fit: BoxFit.cover,
                      ),
                      title: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          Items[index].Name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color.fromARGB(255, 223, 222, 222),
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      subtitle: Container(
                          margin: EdgeInsets.only(left: 20, bottom: 5),
                          child: Text(
                            Items[index].Price,
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 175, 174, 174), // لون النص الفرعي
                              fontSize: 14,
                            ),
                          )),
                      trailing: IconButton(
                          icon: Icon(Icons.add,
                              color: Color.fromARGB(255, 228, 98, 11)),
                          onPressed: () {}),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

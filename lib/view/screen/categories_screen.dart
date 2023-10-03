import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myproject/model/categories_model.dart';
import 'package:myproject/view/screen/Pizzaitem.dart';
import 'package:myproject/view/screen/Spaghettiscreen.dart';
import 'package:myproject/view/screen/burgeritem.dart';
import 'package:myproject/view/screen/drinkesscreen.dart';
import 'package:myproject/view/screen/saladscreen.dart';
import 'package:myproject/view/screen/seefodescreen.dart';

class Allcategoriesscreen extends StatefulWidget {
  const Allcategoriesscreen({super.key});

  @override
  State<Allcategoriesscreen> createState() => _allcategoriesscreenState();
}

class _allcategoriesscreenState extends State<Allcategoriesscreen> {
  List<CategoriesModel> listItem = [
    CategoriesModel(
      Id: "1",
      Name: "Burger",
      ImageURL: "images/burger/1.jpg",
    ),
    CategoriesModel(
      Id: "2",
      Name: "Pizza",
      ImageURL: "images/Pizza/2.jpg",
    ),
    CategoriesModel(
      Id: "3",
      Name: "Sea​food",
      ImageURL: "images/seefood/a.jpg",
    ),
    CategoriesModel(
      Id: "4",
      Name: "Spaghetti",
      ImageURL: "images/Spaghetti/1.jpg",
    ),
    CategoriesModel(
      Id: "5",
      Name: "Salad",
      ImageURL: "images/Salad/1.jpg",
    ),
    CategoriesModel(
      Id: "6",
      Name: "Drinks",
      ImageURL: "images/drink/3.jpg",
    ),
  ];
  int selacted = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
     
      body: Container(
          margin: EdgeInsets.only(top: 40),
          child: GridView.builder(
              itemCount: listItem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (listItem[index].Name == "Burger") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const burgerlist(),
                          ),
                        );
                      } else if (listItem[index].Name == "Sea​food") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const seafooditems(),
                          ),
                        );
                      } else if (listItem[index].Name == "Drinks") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const drinkesitem(),
                          ),
                        );
                      } else if (listItem[index].Name == "Pizza") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const pizzalist(),
                          ),
                        );
                      } else if (listItem[index].Name == "Salad") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const saladitem(),
                          ),
                        );
                      } else if (listItem[index].Name == "Spaghetti") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const spagheittiitem(),
                          ),
                        );
                      }
                    },
                    child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                listItem[index].ImageURL,
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            listItem[index].Name,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 192, 191, 191),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ));
              })),
      /*   bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 32, 32, 31),
        color: const Color.fromARGB(255, 49, 48, 47),
        items: [
          Icon(Icons.category,
              size: 30, color: Color.fromARGB(255, 228, 98, 11)),
          Icon(Icons.person, size: 30, color: Color.fromARGB(255, 228, 98, 11)),
          Icon(Icons.list, size: 30, color: Color.fromARGB(255, 228, 98, 11)),
        ],
        onTap: (index) {
        
        },
      ),*/
    );
  }
}

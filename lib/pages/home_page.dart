import 'package:bensetta_shop/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';
import 'page1.dart';
import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'search_bar_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page1(),
    const Page2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248,	244, 240),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
          return CartPage();
        })),
        backgroundColor: Colors.black87,
        child: Icon(Icons.shopping_cart, color: Colors.white,),
      ),
      body: Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star,color: Color.fromARGB(255, 248,	244, 240), size: 50.0,),
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return IntroPage();
                    },
                  )),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.pin_drop,
                      color: Colors.grey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),

                  ),
                ),
                const Text('Location',style: TextStyle(color: Colors.grey, fontSize: 15)),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return IntroPage();
                    },
                  )),
                  child: Container(
                    //decoration: BoxDecoration(
                      //color: Colors.black38,
                      //borderRadius: BorderRadius.circular(12),
                    //),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),

                  ),
                ),
              ],
            ),
            //const Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              //children: [
                //Text('  Lets order fresh and organic items for you',style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold) ),
              //],
            //),
            const Divider(thickness: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height:200,
                  width:410,
                  padding: const EdgeInsets.all(12),
                  child: Image.asset("lib/images/bbanner.png"),
                ),
              ],
            ),
            Column (mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 420,
                  decoration: const BoxDecoration(color: Color.fromRGBO(20, 20, 200, 200)),
                  child: const Text("Fresh Items",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 440,
                  width: 360,// Set a fixed height for the GridView
                  child: Consumer<CartModel>(
                    builder: (context, value, child){
                      return GridView.builder(
                        itemCount: value.shopItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1/ 1.3,
                        ),
                        itemBuilder: (context, index){
                          return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel>(context,listen: false)
                                  .addItemToCart(index);
                            },

                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return Page1();
                    },
                  )),
                  child: Container(

                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.home,
                      color: Colors.black87,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return Page2();
                    },
                  )),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black87,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return Page1();
                    },
                  )),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.history,
                      color: Colors.black87,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context){
                      return Page1();
                    },
                  )),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.black87,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}


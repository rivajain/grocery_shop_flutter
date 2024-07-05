import 'package:bensetta_shop/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart'),),
      body: Consumer<CartModel>(
        builder: (context, value, child){
          return Column(
            children:[
              Expanded(
                child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12.0),
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              ),
                          child:ListTile(
                            leading: Image.asset(value.cartItems[index][2],
                              height:36,
                            ),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text('\$'+value.cartItems[index][1]),
                            trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () =>
                                    Provider.of<CartModel>(context, listen: false).removeItemFromCart(index),
                            ),
                          ),
                        ),
                      );
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(24),
                    child : Row(
                      children:[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Total Price",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(value.calculateTotal(),
                              style: const TextStyle(color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

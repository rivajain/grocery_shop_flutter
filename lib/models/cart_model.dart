import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems =[
    ['Avocado','4.00','lib/images/avacado.png',Colors.green],
    ['Banana','4.00','lib/images/banana.png',Colors.yellow],
    ['Lemon','4.00','lib/images/lemon.png',Colors.orangeAccent],
    ['Cherries','4.00','lib/images/cherries.png',Colors.pink],
    ['Milk','4.00','lib/images/milk.png',Colors.purple],
    ['Strawberries','4.00','lib/images/berry.png',Colors.red],
    ['Peach','4.00','lib/images/peach.png',Colors.redAccent],
    ['Grapes','4.00','lib/images/grapes.png',Colors.blueAccent],
    ['Jam','4.00','lib/images/jam.png',Colors.purpleAccent],
  ];
  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculateTotal(){
    double totalPrice =0;
    for (int i=0; i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
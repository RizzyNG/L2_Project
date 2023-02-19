import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Map<int, int> _cart = {}; //state data
  Map<int, int> _sizes = {};
  Map<int, int> _id = {};

//Getters
  Map<int, int> get cart => _cart;
  Map<int, int> get counter => _sizes;
  Map<int, int> get id => _id;

  int get cartCount => _cart.length;

  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

//reduce method - add each value from the list

  void addToCart(index, dropdownvalue, counter) {
    //need to make unique for sizes
    var multi = (index + 1) * dropdownvalue;
    if (_cart.containsKey(multi)) {
      //index values are 0-5 //check if the size is same as the size where the cart = index
      if (_sizes.containsValue(dropdownvalue)) {
        _cart[multi] += counter;
        _sizes[multi] = dropdownvalue;
        _id[multi] = index;
      } else {
        _cart[multi] = counter;
        _sizes[multi] = dropdownvalue;
        _id[multi] = index;
      }
    } else {
      _cart[multi] = counter;
      _sizes[multi] = dropdownvalue;
      _id[multi] = index;
    }

    //Call this whenever there is some change in any field of change notifier.
    notifyListeners();
  }

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      _sizes.remove(index);
      _id.remove(index);

      //Call this whenever there is some change in any field of change notifier
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartProvider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inject Provider Instance
    var cartProvider = Provider.of<CartProvider>(context);
    var cart = cartProvider.cart;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          key: key,
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.back_),
        // ),
        title: Text("Your Cart"),
        actions: [
          Center(
            child: Text(
              'Total: ' + cartProvider.cartCount.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView.separated(
        itemCount: cart.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 8,
        ),
        itemBuilder: (context, index) {
          var id = cartProvider.id;
          var ids = id.values.toList()[index];

          int cartIndex = cart.keys.toList()[index];
          int count = cart[cartIndex];

          var size = cartProvider.counter;
          int sizes = size.values.toList()[index];
          return Card(
            color: Colors.lightBlueAccent[50],
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 150,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/sport_${ids + 1}.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Pax: ' + count.toString(),
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Size: ' + sizes.toString(),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.clear),
                        color: Colors.black,
                        onPressed: () {
                          cartProvider.clear(cartIndex);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

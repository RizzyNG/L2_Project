import 'package:flutter/material.dart';
import 'CartProvider.dart';
import 'CartPage.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final int index;
  final String imgPath;
  final String shoeName;
  final String shoePrice;
  final int photo;
  DetailPage(
      {Key key,
      @required this.index,
      @required this.imgPath,
      @required this.shoeName,
      @required this.shoePrice,
      @required this.photo})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var sizes = [
    '1200',
    '1300',
    '1400',
    '1500',
    '1600',
    '1700',
  ];
  String dropdownvalue = 'Choose a Time'; //Choose a size
  int counter = 0;
  bool _size = false;
  bool _quantity = false;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'), //leading to go to product page
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            child: Hero(
              tag: widget.photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Image(
                    image: AssetImage(widget.imgPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.shoeName,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Choose a Time: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              DropdownButton(
                hint: Text(dropdownvalue),
                icon: const Icon(Icons.arrow_drop_down),
                items: sizes.map((String e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                    _size = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pax: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    counter++;
                    if (counter > 0) {
                      _quantity = true;
                    }
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(this.counter.toString()),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (counter > 0) {
                    setState(() {
                      counter--;
                      if (counter > 0) {
                        _quantity = true;
                      } else {
                        _quantity = false;
                      }
                    });
                  }
                },
              ),
            ],
          ),
          ElevatedButton(
            // color: Colors.blue,
            child: Text('Go to Cart'),
            onPressed: _quantity && _size
                ? () {
                    if (sizes.contains(dropdownvalue)) {
                      if (counter >= 1) {
                        cartProvider.addToCart(
                            widget.index, int.parse(dropdownvalue), counter);
                      }
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'detailpage.dart';

class ProductPage extends StatelessWidget {
  final _shoeName = [
    'Swim Here',
    'Fly Here',
    'Gym Here',
    'Play Pool',
  ];

  final _shoePrice = [
    '\$5.0',
    '\$15.0',
    '\$10.0',
    '\$10.0',
  ];
  @override
  Widget build(BuildContext context) {
    //Inject Provider Instance
    // var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _buildGridCards(
                context,
                index,
                'images/sport_${index + 1}.jpg',
                _shoeName[index],
                _shoePrice[index]);
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 8,
          ),
          itemCount: _shoeName.length,
        ));
  }
}

Widget _buildGridCards(BuildContext context, int index, String imgPath,
    String shoeName, String shoePrice) {
  int photo = index;
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
            child: Hero(
              tag: photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          index: index,
                          imgPath: imgPath,
                          shoeName: shoeName,
                          shoePrice: shoePrice,
                          photo: photo,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 500,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imgPath),
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
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: ListTile(
              title: Text(
                shoeName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                shoePrice,
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.black,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      index: index,
                      imgPath: imgPath,
                      shoeName: shoeName,
                      shoePrice: shoePrice,
                      photo: photo,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // ],
      // )
    ),
  );
}

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                'About',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 330,
              child: Image.asset('images/BookLogo.jpg'),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                'Book smart, BookHere.',
                style: TextStyle(color: Colors.blue[400], fontSize: 25),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 330,
              child: Text(
                  'Welcome to BookHere!, the ultimate booking app that connects you with a wide range of Sports providers in your area. We are here to simplify the process of booking appointments and reservations for everything. BookHere was founded with the goal of making it easy for busy people to find and book services on-the-go. Our platform is designed with the user in mind, offering a seamless, efficient, and hassle-free experience.',
                  style: TextStyle(fontSize: 15)),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'Partnered Company',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 400,
                child: Text(
                  '   ActiveHH',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[400]),
                )),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('images/ActiveHH.jpg'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              child: Text(
                  'Welcome to ActiveHH Sports Facility! At ActiveHH, we believe that staying active is essential to living a happy and healthy life. That is why we offer a wide range of sports and fitness activities for people of all ages and abilities. Whether you are a seasoned athlete or just starting out, we have got something for everyone.',
                  style: TextStyle(fontSize: 15)),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 400,
                child: Text(
                  '   HFly',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[400]),
                )),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('images/HFly.jpg'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              child: Text(
                  "Welcome to HFly Flying Sports Facility! At HFly, we believe that soaring through the air is the ultimate rush. That is why we offer a wide range of flying sports and activities for people of all ages and abilities. Whether you are an experienced flyer or just starting out, we have got something for everyone.",
                  style: TextStyle(fontSize: 15)),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

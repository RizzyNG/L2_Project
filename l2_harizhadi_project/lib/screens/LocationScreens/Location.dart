import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'map.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPage createState() => _LocationPage();
}

class _LocationPage extends State<LocationPage> {
  var location = new Location();
  LocationData userLocation;
  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 400,
                    child: Text(
                      '       ActiveHH',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400]),
                    )),
                Container(
                  width: 400,
                  child: Text('Address: 795 Ang Mo Kio Ave 1, Singapore 569976',
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 400,
                    child: Text(
                      '           HFly',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400]),
                    )),
                Container(
                  width: 400,
                  child: Text(
                      "Address: 43 Siloso Beach Walk, #01-01, iFly, Singapore 099010",
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MapPage(userLocation: userLocation)));
                        },
                        color: Colors.blue,
                        child: Text(
                          "Show Map",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarthome/components/SmartDevice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double padd = 25.0;

  List mySMartDevices = [
    ['Smart TV', 'lib/assets/smart-tv.png', false],
    ['Smart AC', 'lib/assets/air-conditioner.png', true],
    ['Smart FUN', 'lib/assets/fan.png', true],
    ['Smart BULB', 'lib/assets/light-bulb.png', true],
    ['Smart BULB', 'lib/assets/light-bulb.png', true],
    ['Smart BULB', 'lib/assets/light-bulb.png', true],
  ];

  void powerChanged(int index,bool value) {
   setState(() {
     mySMartDevices[index][2] = value;
   });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // App bar icons
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padd, vertical: padd),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //menu icon
            Image.asset(
              'lib/assets/menu.png',
              height: 45,
              color: Colors.grey[800],
            ),

            Icon(
              Icons.person,
              color: Colors.grey[800],
            )
          ]),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: padd),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Hello there",
                style: TextStyle(
                  color: Colors.grey[800],
                )),
            Text(
              "Samson Mokaya",
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey[850],
              ),
            ),
            SizedBox(
              height: padd,
            ),
            Text("Smart Devices",
                style: TextStyle(
                  color: Colors.grey[800],
                ))
          ]),
        ),

        Expanded(
            child: GridView.builder(
                itemCount: mySMartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(padd),
                    child: SmartDevice(
                      device: mySMartDevices[index][0],
                      iconPath: mySMartDevices[index][1],
                      powerOn: mySMartDevices[index][2],
                      onChanged: (value) => powerChanged(index, value),
                    ),
                  );
                }))
      ])),
    );
  }
}



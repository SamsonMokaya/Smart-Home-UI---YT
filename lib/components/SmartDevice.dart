import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDevice extends StatelessWidget {
  final String device;
  final String iconPath;
  final bool powerOn;
  final Function(bool)? onChanged;

  const SmartDevice({
    super.key,
    required this.device,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: powerOn? Colors.grey[900] : Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              height: 60,
              color: powerOn? Colors.grey[200] : Colors.grey[800],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      device,
                      style: TextStyle(
                        color:powerOn? Colors.grey[200] : Colors.grey[800],
                        fontFamily: 'Material Icons',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChanged,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

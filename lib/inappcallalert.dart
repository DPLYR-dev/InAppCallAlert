library inappcallalert;

import 'package:flutter/material.dart';

/// A Call Alert.
class CallAlert extends StatelessWidget {
  final String callerName;
  CallAlert({@required this.callerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Caller Image/Icon
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),

            // Caller Name
            Text(callerName),

            // Mute or Agree
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(
                                Icons.volume_mute,
                              ),
                            ),
                            Container(
                              child: Icon(Icons.call),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:6.0,horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Mute"), Text("Agree")],
                ),
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

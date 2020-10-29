library inappcallalert;

import 'package:flutter/material.dart';

/// A Call Alert.
class CallAlert extends StatelessWidget {
  final String callerName;
  final ImageProvider callerImage;
  final TextStyle callerNameStyle;
  CallAlert({@required this.callerName,this.callerImage,this.callerNameStyle});


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
            Column(
              children: [
                // Caller Image/Icon
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blue,
                ),

                // Caller Name
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    callerName,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 75,
            ),
            // Mute or Agree
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(60)),
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
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.volume_off,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.call,
                                color: Colors.green,
                              ),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mute",

                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Agree",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        )
                      ],
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

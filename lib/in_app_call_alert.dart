library inappcallalert;

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

/// A Call Alert.
class CallAlert extends StatefulWidget {
  final String callerName;
  final String ringtonePath;
  final ImageProvider callerImage;
  final TextStyle callerNameStyle;
  final primaryColor;
  final backgroundColor;
  final Function onAgree;
  final muted;
  CallAlert(
      {@required this.callerName,
      @required this.ringtonePath,
      this.callerImage,
      this.callerNameStyle,
      this.primaryColor = Colors.blue,
      this.backgroundColor = Colors.white,
      this.onAgree,
      this.muted = false});

  @override
  _CallAlertState createState() => _CallAlertState();
}

class _CallAlertState extends State<CallAlert> {
  AudioCache audioCache = AudioCache(prefix: 'audio/');
  AudioPlayer audioPlayer = AudioPlayer();

  bool muted = false;
  _playLocal() async {
    audioPlayer = await audioCache.loop(
      widget.ringtonePath,
    );

    setState(() {});
    if (widget.muted == true) {
      setState(() {
        muted = true;
      });
      _muteAudio();
    }
  }

  @override
  void initState() {
    super.initState();
    _playLocal();
  }

  _muteAudio() async {
    await audioPlayer.setVolume(0.0);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
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
                  backgroundColor: widget.primaryColor,
                ),

                // Caller Name
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.callerName,
                    style: widget.callerNameStyle == null
                        ? TextStyle(
                            fontSize: 22,
                            color: widget.primaryColor,
                            fontWeight: FontWeight.w500)
                        : widget.callerNameStyle,
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
                      color: widget.primaryColor,
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
                            InkWell(
                              onTap: () async {
                                if (muted == true) {
                                  await audioPlayer.setVolume(1);
                                  setState(() {
                                    muted = false;
                                  });
                                } else {
                                  setState(() {
                                    muted = true;
                                  });
                                  _muteAudio();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  muted == true
                                      ? Icons.volume_up
                                      : Icons.volume_off,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                widget.onAgree == null
                                    ? Navigator.pop(context)
                                    : widget.onAgree();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.green,
                                ),
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
                          muted == true ? "Unmute" : "Mute",
                          style: TextStyle(
                              fontSize: 16,
                              color: widget.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Agree",
                          style: TextStyle(
                              fontSize: 16,
                              color: widget.primaryColor,
                              fontWeight: FontWeight.w500),
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

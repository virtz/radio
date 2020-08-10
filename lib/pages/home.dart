import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';

import '../main.dart';

class Home extends StatefulWidget {
  var playerState = FlutterRadioPlayer.flutter_radio_paused;

  var volume = 0.8;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();

  String url = "https://streamingv2.shoutcast.com/mapoly-radio";
  bool isPlaying = false;
  bool visible = false;

  int _currentIndex = 0;
  final List<Widget> _children = [
    new MyApp(),
  ];

  @override
  void initState() {
    super.initState();
    initRadioService();
  }

  // Future<void> audioStart() async {
  //   await FlutterRadio.audioStart();
  //   print('audio started');
  // }
  Future<void> initRadioService() async {
    try {
      await _flutterRadioPlayer.init("Mapoly Radio", "Live", url, "false");
    } on PlatformException {
      print("Exception occurred while trying to register the services.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text('Mapoly Radio'),
        backgroundColor: Colors.blueGrey.shade900,
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          StreamBuilder(
              stream: _flutterRadioPlayer.isPlayingStream,
              initialData: widget.playerState,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                String returnData = snapshot.data;
                print("object data: " + returnData);
                switch (returnData) {
                  case FlutterRadioPlayer.flutter_radio_stopped:
                    return RaisedButton(
                        child: Center(child: Text("Start listening now")),
                        onPressed: () async {
                          await initRadioService();
                        });
                    break;
                  case FlutterRadioPlayer.flutter_radio_loading:
                    return Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.white, strokeWidth: 2),
                    );
                  case FlutterRadioPlayer.flutter_radio_error:
                    return RaisedButton(
                        child: Text("Retry ?"),
                        onPressed: () async {
                          await initRadioService();
                        });
                    break;
                  default:
                    return Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: Icon(Icons.radio,
                                  size: 250, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    
                                      onPressed: () async {
                                        print("button press data: " +
                                            snapshot.data.toString());
                                        await _flutterRadioPlayer.playOrPause();
                                      },
                                      icon: snapshot.data ==
                                              FlutterRadioPlayer
                                                  .flutter_radio_playing
                                          ? Icon(Icons.pause_circle_outline,
                                              size: 50, color: Colors.white)
                                          : Icon(Icons.play_circle_outline,
        
        
                                              size: 50, color: Colors.white)),
                                  IconButton(
                                      onPressed: () async {
                                        await _flutterRadioPlayer.stop();
                                      },
                                      icon: Icon(Icons.stop,
                                          size: 50, color: Colors.white))
                                ]),
                          ),
                        ],
                      ),
                    );
                    break;
                }
              }),
          // Slider(
          //     value: widget.volume,
          //     min: 0,
          //     max: 1.0,
          //     onChanged: (value) => setState(() {
          //           widget.volume = value;
          //           _flutterRadioPlayer.setVolume(widget.volume);
          //         })),
          // Text("Volume: " + (widget.volume * 100).toStringAsFixed(0))
        ],
      ),
      // bottomNavigationBar: new BottomNavigationBar(
      //     currentIndex: this._currentIndex,
      //     onTap: (int index) {
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: new Icon(Icons.home), title: new Text('Home')),
      //       BottomNavigationBarItem(
      //           icon: new Icon(Icons.pages), title: new Text('Second Page'))
      //     ]),
    );
  }
}

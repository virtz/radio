import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  var playerState = FlutterRadioPlayer.flutter_radio_paused;

  var volume = 0.8;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();

  String url = "http://streamingv2.shoutcast.com/mapoly2";
  bool isPlaying = false;
  bool visible = false;

  // int _currentIndex = 0;
  // final List<Widget> _children = [
  //   new MyApp(),
  // ];

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
      await _flutterRadioPlayer.init("AfriStar Radio", "Live", url, "false");
    } on PlatformException {
      print("Exception occurred while trying to register the services.");
    }
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('AfriStar Radio', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          StreamBuilder(
              stream: _flutterRadioPlayer.isPlayingStream,
              initialData: widget.playerState,
              builder:
                  (BuildContext context, AsyncSnapshot<String> snapshot) {
                String returnData = snapshot.data;
                print("object data: " + returnData);
                switch (returnData) {
                  case FlutterRadioPlayer.flutter_radio_stopped:
                    return Center(
                      child: RaisedButton(
                          child: Center(child: Text("Start listening now")),
                          onPressed: () async {
                            await initRadioService();
                          }),
                    );
                    break;
                  case FlutterRadioPlayer.flutter_radio_loading:
                    return Center(
                        child: Container(
                            child:
                                Lottie.asset('assets/lottie/loader2.json')));
                  case FlutterRadioPlayer.flutter_radio_error:
                    return RaisedButton(
                        child: Text("Retry ?"),
                        onPressed: () async {
                          await initRadioService();
                        });
                    break;
                  default:
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                           shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(30),
                    topRight:Radius.circular(30)
                  )),
                          elevation: 10.0,
                          shadowColor: Colors.yellow,
                          
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child:isPlaying? Container(
                                    child: Lottie.asset(
                                        'assets/lottie/home2.json')):Container(),
                              ),
                               Expanded(
                                flex: 3,
                                child:isPlaying? Container(
                                    child: Lottie.asset(
                                        'assets/lottie/wave.json',reverse: true,animate: true)):Container(),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () async {
                                            print("button press data: " +
                                                snapshot.data.toString());
                                            await _flutterRadioPlayer
                                                .playOrPause();
                                                setState(() {
                                                  isPlaying = true;
                                                });
                                          },
                                          icon: snapshot.data ==
                                                  FlutterRadioPlayer
                                                      .flutter_radio_playing
                                              ? Icon(Icons.pause_circle_outline,
                                                  size: 50, color: Colors.black)
                                              : Icon(Icons.play_circle_outline,
                                                  size: 50,
                                                  color: Colors.black)),
                                      IconButton(
                                          onPressed: () async {
                                            await _flutterRadioPlayer.stop();
                                            setState(() {
                                              isPlaying = false;
                                            });
                                          },
                                          icon: Icon(Icons.stop,
                                              size: 50, color: Colors.black))
                                    ]),
                              ),
                            ],
                          ),
                        ),
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

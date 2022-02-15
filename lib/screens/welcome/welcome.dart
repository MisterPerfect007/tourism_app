import 'package:flutter/material.dart';
import 'package:tourism_app/screens/welcome/moving_btn.dart';
import 'package:video_player/video_player.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/beach1.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.play();
    _controller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            VideoPlayer(_controller),
            
            Positioned(
              bottom: 50,
              child: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Explorez \nles beautés du monde',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                  
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Vivez des beaux moments dans de beaux endroits',
                        style: TextStyle(
                          // backgroundColor: Color.fromRGBO(0, 0, 0, 0.2),
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontSize: 18,
                          // fontWeight: FontWeight.w600
                        ),

                      ),
                      SizedBox(height: 40),
                      MovingBtn()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

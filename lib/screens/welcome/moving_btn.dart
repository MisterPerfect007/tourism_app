import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';


class MovingBtn extends StatefulWidget {
  MovingBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<MovingBtn> createState() => _MovingBtnState();
}

class _MovingBtnState extends State<MovingBtn> {
  bool isBtnDragged = false;
  bool movingArrows = false;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        movingArrows = !movingArrows;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black87,
            Colors.black12
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(50))

      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 15,
            child: Stack(
              children: [
                Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 40,
                  color: movingArrows ? Colors.white : Colors.grey,
                ),
                Positioned(
                  bottom: 15,
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 40,
                    color:  movingArrows ?  Colors.grey : Colors.white,
                  )
                  ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: isBtnDragged ? 80 : 15,
            child: GestureDetector(
              onVerticalDragUpdate: (details){
                if(details.delta.dy < -5){
                  setState(() {
                    isBtnDragged = true;
                  });
                }
              },
              onVerticalDragEnd: (details) {
                sleep(Duration(milliseconds: 300));
                print("drag end");
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                alignment: Alignment.center,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      offset: Offset(0,0),
                      blurRadius: 5,
                      spreadRadius: 3
                    )
                  ],
                  color: isBtnDragged ? Colors.black.withOpacity(0.2) : Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(60))
                ),
                child: Text(
                  'Go',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}

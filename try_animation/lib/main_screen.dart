import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation;
  Animation anim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

   anim = ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);

    animation = CurvedAnimation(
      curve: Curves.ease,
      parent: controller,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });

    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      } else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: animation.value * 100,
                width: animation.value * 100,
                color: anim.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

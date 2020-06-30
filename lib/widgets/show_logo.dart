import 'package:flutter/material.dart';
import 'package:foodieng/widgets/loading.dart';

class FoodieAnimatedLogo extends StatefulWidget {
  const FoodieAnimatedLogo({
    Key key,
  }) : super(key: key);

  @override
  _FoodieAnimatedLogoState createState() => _FoodieAnimatedLogoState();
}

class _FoodieAnimatedLogoState extends State<FoodieAnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(0, animationController.value * 25),
              child: Opacity(
                opacity: animationController.value,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          colorBlendMode: BlendMode.softLight,
                          image: AssetImage("assets/images/foodieng_logo.png"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Do more with Food",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Gill Bold',
                            fontSize: MediaQuery.of(context).size.height / 25,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Finally a Platform for Food Lovers",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Gill',
                                fontSize:
                                    MediaQuery.of(context).size.width / 25)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Center(child: LoadingWidget()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          animation: animationController,
        ),
      ),
    );
  }
}

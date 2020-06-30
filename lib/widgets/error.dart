import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Error extends StatelessWidget {
  Function action;
  Error({@required this.action});
  _onErrorButtonPressed() {
    action();
    //provider.of<LoginBloc>(context).add(event)
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/error.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                "An Error Occurred !!!",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Gill",
                    fontSize: 20),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/refresh.svg",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xff462618),
                onPressed: () => _onErrorButtonPressed(),
                child: Text('Try Again',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

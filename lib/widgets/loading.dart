import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Loading(
      indicator: BallPulseIndicator(),
      size: MediaQuery.of(context).size.width * 0.30,
      color: Theme.of(context).primaryColor,
    );
  }
}

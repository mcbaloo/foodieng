import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: cupertinoActivityIndicator,
      image: "image.png",
      placeholderScale: 5,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatelessWidget {
  final Color color;
  final double size;

  const LoaderWidget({Key key, this.color = Colors.black, this.size = 50.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      lineWidth: 1,
      size: size,
    );
  }
}

import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Positioned(
              right: 0,
              top: 0,
              child: SizedBox(
                child: Image.asset('assets/image/logo_uni_1.png'),
                width: 200,
                height: 200,
              ),
            ),
          ), 
        ),
      ],
    );
  }
}
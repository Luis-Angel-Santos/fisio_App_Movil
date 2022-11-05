import 'package:flutter/material.dart';

class AuthBackgroundAlt extends StatelessWidget {
  final Widget child;

  const AuthBackgroundAlt({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          SizedBox(
              height: 140.0,
              width: 140.0,
              child: Image.asset('assets/Logo.png'))
        ],
      ),
    ));
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackgorund(),
      child: Stack(
        children: [
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -50,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 120,
            right: 20,
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackgorund() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(0, 119, 182, 1),
      Color.fromRGBO(0, 180, 216, 1)
    ]));
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}

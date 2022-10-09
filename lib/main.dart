import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Clip(), //runs the app from home panel
  ));
}

class Clip extends StatefulWidget {
  const Clip({Key? key}) : super(key: key);

  @override
  _ClipState createState() => _ClipState();
}

class _ClipState extends State<Clip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 220,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF343090), Color(0xFF5f59f7)],
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                left: 55,
                right: 55,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    // spreadRadius: 2,
                    color: Colors.grey,
                    offset: Offset(2, 8),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    // path.lineTo(0, size.height); //starting point

    var controllPoint = Offset(size.width / 5, size.height / 2);
    // var controllPoint =
    //     Offset(size.width / 2, size.height); // point from where the curve start
    var endPoint =
        Offset(size.width, size.height); // point where the curve ends
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, controllPoint.dx, controllPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

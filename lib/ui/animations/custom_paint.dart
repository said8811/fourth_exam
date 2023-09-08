import 'package:fifth_exam/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Example9 extends StatefulWidget {
  const Example9({Key? key}) : super(key: key);

  @override
  State<Example9> createState() => _Example9State();
}

class _Example9State extends State<Example9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("CUstom PAint"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(color: MyColors.C_green),
                  child: CustomPaint(
                    size: const Size(500, 500),
                    painter: MyPainter(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;

    Path paths = Path();

    paths.lineTo(0, size.height * 0.3);

    paths.cubicTo(
      size.width * 0.7,
      size.height * 0.2,
      size.width * 0.1,
      size.height * 0.3,
      size.width * 0.3,
      size.height * 0.3,
    );

    paths.lineTo(size.width, 0);
    canvas.drawPath(paths, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

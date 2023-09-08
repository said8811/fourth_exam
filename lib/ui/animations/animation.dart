import 'package:fifth_exam/ui/animations/custom_paint.dart';
import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  Color colors = Colors.grey;
  _grenn() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => colors = Colors.green);
  }

  @override
  void initState() {
    _grenn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Example9()));
              },
              icon: const Icon(Icons.change_circle))
        ],
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 10),
          tween: Tween(begin: 0.0, end: 5),
          builder: (context, value, child) {
            return Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.grey,
                      strokeWidth: 8,
                      value: value.toDouble(),
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.done,
                    size: 50,
                    color: colors,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

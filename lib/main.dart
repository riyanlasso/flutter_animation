import 'package:flutter/material.dart';

void main() => runApp(const LogoApp());

// class AnimatedLogo extends AnimatedWidget {
//   const AnimatedLogo({super.key, required Animation<double> animation})
//       : super(listenable: animation);

//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         height: animation.value,
//         width: animation.value,
//         child: const FlutterLogo(),
//       ),
//     );
//   }
// }

// class LogoApp extends StatefulWidget {
//   const LogoApp({super.key});

//   @override
//   State<LogoApp> createState() => _LogoAppState();
// }
// menampilkan logo

// class _LogoAppState extends State<LogoApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         height: 300,
//         width: 300,
//         child: const FlutterLogo(),
//       ),
//     );
//   }
// }

// zoom in
// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this);

//     animation = Tween<double>(begin: 0, end: 300).animate(controller);
//     animation.addListener(() {
//       setState(() {});
//     });

//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         height: 300,
//         width: 300,
//         height: animation.value,
//         width: animation.value,
//         child: const FlutterLogo(),
//       ),
//     );
//   }
//   // @override
//   // void dispose() { // kurang tau fungsinya
//   //   controller.dispose();
//   //   super.dispose();
//   // }
// }

// forward reverse condition
// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this);
//     animation = Tween<double>(begin: 0, end: 300).animate(controller)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller.forward();
//         }
//       })
//       ..addStatusListener((status) => print('$status'));
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) => AnimatedLogo(animation: animation);

// @override
// void dispose() {
//   controller.dispose();
//   super.dispose();
// }
// }

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition(
      {required this.child, required this.animation, super.key});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class CustomFloationActionButton extends StatelessWidget {
  const CustomFloationActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return FloatingActionButton(
      backgroundColor: const Color(0xff5B618A),
      child: Container(
        width: w(65),
        height: h(65),
        child: const Icon(
          Icons.add,
          size: 45,
          color: Color.fromARGB(255, 223, 223, 223),
          //TODO errro in shadows

          /* shadows: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],*/
        ),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color(0xffB99AC2), Color(0xff906F9ABD)])),
      ),
      onPressed: () {},
    );
  }
}
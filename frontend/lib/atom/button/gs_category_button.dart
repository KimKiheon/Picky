import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GsButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(Size(90, 70)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1.0,
            ),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(4.0),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/gs.jpg',
            width: 45,
            height: 45,
          ),
          SizedBox(height: 4),
          Text(
            'GS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

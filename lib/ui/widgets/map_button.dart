import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 7,
          )
        ]),
        child: Icon(
          icon,
          color: Colors.blueGrey,
          size: 37,
        ),
      ),
    );
  }
}

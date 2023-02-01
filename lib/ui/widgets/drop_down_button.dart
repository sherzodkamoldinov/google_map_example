import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({Key? key, required this.item}) : super(key: key);
  final ValueChanged item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(10),
        icon: const SizedBox.shrink(),
        underline: const SizedBox.shrink(),
        hint: Row(
          children: [
            Icon(Icons.add_home_rounded, color: Colors.green.shade400),
            const SizedBox(width: 5),
            const Text('Marker'),
          ],
        ),
        items: [
          DropdownMenuItem(
            onTap: () {
              item.call(Icon(Icons.home, color: Colors.red));
            },
            value: 'Home',
            child: Row(
              children: const [
                Icon(Icons.home, color: Colors.red),
                SizedBox(width: 5),
                Text('Home'),
              ],
            ),
          ),
          DropdownMenuItem(
            onTap: () {
              item.call(Icon(Icons.location_city, color: Colors.blueGrey));
            },
            value: 'Work',
            child: Row(
              children: const [
                Icon(Icons.location_city, color: Colors.blueGrey),
                SizedBox(width: 5),
                Text('Work'),
              ],
            ),
          ),
          DropdownMenuItem(
            onTap: () {
              item.call(Icon(Icons.airlines_rounded, color: Colors.amber));
            },
            value: "Here",
            child: Row(
              children: const [
                Icon(Icons.airlines_rounded, color: Colors.amber),
                SizedBox(width: 5),
                Text('Here'),
              ],
            ),
          ),
        ],
        onChanged: (String? value) {},
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderConvenciones extends StatelessWidget {
  const HeaderConvenciones({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            "Convenciones",
            style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 255, 5, 5),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BackButtonItem extends StatelessWidget {
  const BackButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 15),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

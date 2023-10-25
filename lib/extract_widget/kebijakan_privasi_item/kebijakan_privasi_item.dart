import 'package:flutter/material.dart';

class KebijakanPrivasiIsiItem extends StatelessWidget {
  const KebijakanPrivasiIsiItem({super.key, required this.isiItem});
  final String isiItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(isiItem),
    );
  }
}
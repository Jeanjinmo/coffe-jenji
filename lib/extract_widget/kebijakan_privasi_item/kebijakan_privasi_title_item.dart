import 'package:flutter/material.dart';

class KebijakanPrivasiTitleItem extends StatelessWidget {
  const KebijakanPrivasiTitleItem({super.key, required this.titleName});
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        titleName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
    );
  }
}
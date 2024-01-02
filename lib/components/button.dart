import "package:flutter/material.dart";

class SushiButton extends StatelessWidget {
  final String text;
  final double? height;
  final IconData? icon;
  const SushiButton({super.key, required this.text, this.height, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(248, 146, 86, 86),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
            children: [
              Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
              (icon!=null?Icon(icon, color: Colors.white, size: 30,):SizedBox.shrink()),
            ],
          ),
      ),
    );
  }
}

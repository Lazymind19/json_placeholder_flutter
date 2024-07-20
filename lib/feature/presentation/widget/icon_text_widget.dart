
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const IconTextWidget({
    super.key,required this.icon,required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Icon(icon),
                SizedBox(width: 20,),
                Expanded(child: Text(text!,))
              ],
            );
  }
}

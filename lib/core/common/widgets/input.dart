import 'package:flutter/material.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class RInput extends StatelessWidget {
  final String hitText;
  final String label;

  const RInput({
    super.key,
    required this.hitText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RText(
          text: label,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: TextFormField(
            decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

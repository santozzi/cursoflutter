import 'package:flutter/material.dart';
import 'package:yesnomaybe/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final String message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colors.primary, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

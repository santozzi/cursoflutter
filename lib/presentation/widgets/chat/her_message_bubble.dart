import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(58.0),
              child: Text(message,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            )),
        const SizedBox(
          height: 5,
        ),
        const _ImageBubble(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
          'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif',
          width: size.width * 0.70,
          height: 150,
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Sergio esta enviando una imagen'));
      }),
    );
  }
}

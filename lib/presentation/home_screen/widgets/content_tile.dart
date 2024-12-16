import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Hello Tony, '),
            Text(
              'What fruit salad',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          'What fruit salad combo do you want today?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

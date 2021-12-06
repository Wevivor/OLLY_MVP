import 'package:flutter/material.dart';

class ContentsItem extends StatelessWidget {
  const ContentsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '블루베리 바나나 토스트를 ....',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              Image.asset(
                'assets/icon/icon_star_active.png',
                width: 20,
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}

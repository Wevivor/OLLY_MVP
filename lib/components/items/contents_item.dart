import 'package:flutter/material.dart';

class ContentsItem extends StatelessWidget {
  const ContentsItem({
    Key? key, this.isChecked = false, this.editMode = false,
  }) : super(key: key);
  final bool isChecked;
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
            ),
          ],
        ),
        editMode?Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.all(12),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3)
            ),
            child: isChecked?const Center(
              child: Icon(Icons.check, size: 20,),
            ): Container(),
          ),
        ):Container()
      ],
    );
  }
}

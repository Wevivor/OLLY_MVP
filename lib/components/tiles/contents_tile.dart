import 'package:flutter/material.dart';

class ContentsTile extends StatelessWidget {
  const ContentsTile({
    Key? key, this.editMode = false, this.isChecked = false, required this.onPressed,
  }) : super(key: key);
  final bool editMode;
  final bool isChecked;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,),
          child: Row(
            children: [
              Container(
                width: 80,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '코로나19로 성장 멈춘 한국패션시장',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '지난해 한국패션시장은 전년대비 2% 감소한 40조 8000억원 규모로 나타났다.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                      const Flexible(child: SizedBox()),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset('assets/icon/icon_star_active.png', width: 20, height: 20,),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3)
            ),
            child: const Center(
              child: Icon(Icons.check, size: 20,),
            ),
          ),
        )
      ],
    );
  }
}

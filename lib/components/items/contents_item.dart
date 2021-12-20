import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sorty/utils/icon_list.dart';

class ContentsItem extends StatelessWidget {
  const ContentsItem({
    Key? key, required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
              children:  [
                const Text(
                  '블루베리 바나나 토스트를 ....',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
                GestureDetector(
                    onTap: (){
                       showMaterialModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          builder: (context) => Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width -52 )/2),
                                  width: 52,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  title: const Text('Favorite에 저장', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  leading: Image.asset(IconList.ICON_BOOKMARK, width: 32, height: 32, fit: BoxFit.cover,),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  title: const Text('공유', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  leading: Image.asset(IconList.ICON_SHARE, width: 32, height: 32,),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  title: const Text('삭제', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  leading: Image.asset(IconList.ICON_DELETE, width: 32, height: 32,),
                                ),
                                ListTile(
                                  onTap: () => Navigator.pop(context),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  title: const Text('취소', style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  leading: Image.asset(IconList.ICON_CANCEL, width: 32, height: 32,),
                                ),
                              ],
                            ),
                          ));
                    },
                    child: const Icon(Icons.more_horiz, size: 16,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

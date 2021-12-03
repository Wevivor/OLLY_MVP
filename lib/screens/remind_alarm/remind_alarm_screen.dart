import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RemindAlarmScreen extends StatefulWidget {
  const RemindAlarmScreen({Key? key}) : super(key: key);
  static const String id = '/alarm/remind';

  @override
  State<RemindAlarmScreen> createState() => _RemindAlarmScreenState();
}

class _RemindAlarmScreenState extends State<RemindAlarmScreen>
    with TickerProviderStateMixin {
  late SlidableController _slidableController;

  @override
  void initState() {
    _slidableController = SlidableController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context), body: _buildNotificationItem(context)),
    );
  }

  ListView _buildNotificationItem(context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Slidable(
              key: ValueKey('remind_$index'),
              controller: _slidableController,
              actionExtentRatio: 0.2,
              actionPane: const SlidableScrollActionPane(),
              actions: const [
                IconSlideAction(
                  icon: Icons.edit,
                  color: Colors.indigo,
                  caption: '수정',
                ),
                IconSlideAction(
                  icon: Icons.delete,
                  color: Colors.red,
                  caption: '삭제',
                )
              ],
              child: const RemindAlarm());
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
          );
        },
        itemCount: 3);
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.grey[500],
      title: const Text(
        '리마인드 알림',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}

class RemindAlarm extends StatelessWidget {
  const RemindAlarm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4)),
      ),
      title: const Text(
        '마감기한 전까지 다시보기',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16),
      ),
      subtitle: const Text(
        '스타트업 코딩 챌린지 지원자 모집 지원',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12),
      ),
      trailing: IconButton(
        onPressed: () {
          Slidable.of(context)?.open();
        },
        icon: const Icon(
          Icons.more_vert,
          size: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

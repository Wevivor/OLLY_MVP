import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RemindAlarmSettingScreen extends StatefulWidget {
  const RemindAlarmSettingScreen({Key? key}) : super(key: key);
  static const String id = 'alarm/setting';

  @override
  State<RemindAlarmSettingScreen> createState() =>
      _RemindAlarmSettingScreenState();
}

class _RemindAlarmSettingScreenState extends State<RemindAlarmSettingScreen> {
  late DateRangePickerController _controller;
  DateTime _date = DateTime.now();
  DateTime _alarm = DateTime.now();

  @override
  void initState() {
    _controller = DateRangePickerController();
    if (_controller.displayDate != null) {
      _date = _controller.displayDate!;
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          _buildCommentArea(),
          const SizedBox(
            height: 20,
          ),
          _buildCustomDatePickerHeader(),
          _buildDatePicker(context),
          const SizedBox(
            height: 20,
          ),
          _buildTimePicker()
        ],
      ),
    );
  }

  //타임 피커

  Row _buildTimePicker() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ToggleSwitch(
              minWidth: 60.0,
              minHeight: 60,
              cornerRadius: 8.0,
              activeBgColors: const [
                [Colors.black],
                [Colors.black]
              ],
              inactiveBgColor: Colors.grey[500]!,
              curve: Curves.decelerate,
              animate: true,
              animationDuration: 1000,
              borderWidth: 1,
              borderColor: [Colors.grey.withOpacity(0.3)],
              activeFgColor: Colors.white,
              inactiveFgColor: Colors.white,
              initialLabelIndex: _alarm.hour >= 12? 1: 0,
              totalSwitches: 2,
              labels: const ['오전', '오후'],
              radiusStyle: true,
              onToggle: _toggleAMPM,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: (){
                BottomPicker.time(title: '시간을 선택해주세요',
                  buttonText: '확인',
                  minDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute),
                  maxDateTime: DateTime(DateTime.now().year + 100),
                  dismissable: true,
                  displayButtonIcon: true,
                  bottomPickerTheme: BOTTOM_PICKER_THEME.MORNING_SALAD,
                  buttonSingleColor: Colors.transparent,
                  onSubmit: (value){
                  setState(() {
                    _alarm = value;
                  });
                  },

                ).show(context);
              },
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text(
                      DateFormat('hh : mm').format(_alarm),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
  }

  void _toggleAMPM(index) {
              if(index == 0 &&  _alarm.hour >= 12){
                setState(() {
                  _alarm = _alarm.subtract(const Duration(hours: 12));
                });
              }else if(index ==1 && _alarm.hour < 12){
                setState(() {
                 _alarm = _alarm.add(const Duration(hours: 12));
                });
              }
            }

  //날짜 선택 피커 생성

  Container _buildDatePicker(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.4,
      child: SfDateRangePicker(
        controller: _controller,
        view: DateRangePickerView.month,
        monthViewSettings: const DateRangePickerMonthViewSettings(
            showTrailingAndLeadingDates: false),
        headerHeight: 0,
        headerStyle: const DateRangePickerHeaderStyle(
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        initialSelectedDate: DateTime.now(),
        selectionMode: DateRangePickerSelectionMode.single,
        showNavigationArrow: true,
      ),
    );
  }

  //앱바

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.grey,
      title: const Text(
        '리마인드 알림 설정',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          )),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            '완료',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  //달력 선택 커스텀 헤더

  Row _buildCustomDatePickerHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 40),
          width: 200,
          child: Text(
            DateFormat('yyyy년 MM월').format(_date),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(child: Container()),
        SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                setState(() {
                  _controller.backward!();
                });
              },
            )),
        SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black,
              ),
              color: Colors.white,
              highlightColor: Colors.lightGreen,
              onPressed: () {
                setState(() {
                  _controller.forward!();
                });
              },
            )),
        Container(
          width: 20,
        )
      ],
    );
  }

  //코멘트 입력란

  Container _buildCommentArea() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: const TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(
            Icons.edit,
            size: 16,
            color: Colors.black,
          )),
        ));
  }
}

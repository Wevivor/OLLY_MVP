import 'package:flutter/material.dart';
import 'package:sorty/components/buttons/tutorial_button.dart';
import 'package:sorty/screens/home/home_screen.dart';
import 'package:sorty/utils/custom_color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum Option { male, female, none }


class _RegisterScreenState extends State<RegisterScreen> {
  Option? _selectedOption = Option.male;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:CustomColor.BACKGROUND_COLOR,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo_2.png', width: 65, height: 65,),
            const SizedBox(height: 82,),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('닉네임', style: TextStyle(
                    fontSize: 16
                  ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '닉네임입력',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: CustomColor.HINT_COLOR,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          )),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(width: 1, color: CustomColor.PRIMARY_COLOR),
                          ),
                          child: const Center(
                            child: Text('중복확인', style: TextStyle(
                              fontSize: 12
                            ),),
                          ),
                        ),

                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 44,),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('생년월일', style: TextStyle(
                      fontSize: 16
                  ),),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '자리 입력 ex)19981002',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: CustomColor.HINT_COLOR,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 44,),
            _buildRadioButtons(context),
            const Flexible(child: SizedBox(height: 100,)),
            TutorialButton(context: context, onPressed: ()=> Navigator.pushReplacementNamed(context, HomeScreen.id), buttonText: '완료')
          ],
        ),
      ),
    ));
  }

  SizedBox _buildRadioButtons(BuildContext context) {
    return SizedBox(
            width: double.infinity,
            child: Theme(
              data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey[300],

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('성별', style: TextStyle(
                      fontSize: 16
                  ),),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Radio<Option>(value: Option.male, groupValue: _selectedOption, onChanged: (value){
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                              activeColor: MaterialStateColor.resolveWith((states) => CustomColor.PRIMARY_COLOR),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          const Text('남성',)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Radio<Option>(value: Option.female, groupValue: _selectedOption, onChanged: (value){
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                              activeColor:  MaterialStateColor.resolveWith((states) => CustomColor.PRIMARY_COLOR),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          const Text('여성',)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Radio<Option>(value: Option.none, groupValue: _selectedOption, onChanged: (value){
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                              activeColor: MaterialStateColor.resolveWith((states) => CustomColor.PRIMARY_COLOR),
                              splashRadius: 20,
                            ),
                          ),
                          const SizedBox(width: 12,),
                          const Text('없음',),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}

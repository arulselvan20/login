import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:login/home.dart';
import 'package:sizer/sizer.dart';

class Login extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = useTextEditingController();
    TextEditingController _passwordController = useTextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 50.sp),
            child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email must not be empty';
                  } else if (EmailValidator.isValidEmail(
                      _emailController.text)) {
                    return null;
                  } else {
                    return 'Please enter a valid mail';
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 20.sp),
            child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password must not be empty';
                  } else if (_passwordController.text.length < 7) {
                    return 'Password must be at least 8 characters.';
                  } else {
                    return null;
                  }
                }),
          ),
          SizedBox(
            height: 4.h,
          ),
          ElevatedButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.length > 7) {
                  Get.to(home());
                }
              },
              child: Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 2.h),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ))
        ],
      ),
    );
  }
}

class EmailValidator {
  EmailValidator._();

  static bool isValidEmail(String text) {
    RegExp _emailExp = new RegExp(r'^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$');
    return _emailExp.hasMatch(text);
  }
}

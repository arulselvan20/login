import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          children: [
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 15.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

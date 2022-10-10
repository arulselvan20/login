import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:login/localization.dart';
import 'package:sizer/sizer.dart';

class home extends StatefulHookWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String dropdownvalue = 'en';

  var items = [
    'en',
    'US',
  ];
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String?> _selectedLanguage = useState('tamil');
    ValueNotifier<List<String>> languageList = useState([
      // "${AppLocale.of(context)?.translate('tamil')}",
      // "${AppLocale.of(context)?.translate('english')}",
      'தமிழ்',
      'English',
    ]);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          children: [
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            SizedBox(
              height: 5.sp,
            ),
            Center(
              child: Text(
                "${AppLocale.of(context)?.translate('welcome')}",
                style: TextStyle(fontSize: 15.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

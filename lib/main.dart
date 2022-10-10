import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login/localization.dart';
import 'package:login/login.dart';
import 'package:sizer/sizer.dart';

ValueNotifier<Locale> currentLocale = ValueNotifier(Locale('en', 'US'));
String currentUserType = 'buyer';
String currentProductType = 'available';
String currentUserMobile = '';
String currentUserName = '';
bool isRegistered = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('ta', 'IN')],
    path: 'assets/lang/',
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, Locale locale, Widget? widget) {
        return Sizer(
            builder: (BuildContext context, Orientation orientation,
                    DeviceType deviceType) =>
                GetMaterialApp(
                  locale: locale,
                  localizationsDelegates: [
                    AppLocale.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale('en', 'US'),
                    Locale('ta', 'IN'),
                  ],
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    // This is the theme of your application.
                    //
                    // Try running your application with "flutter run". You'll see the
                    // application has a blue toolbar. Then, without quitting the app, try
                    // changing the primarySwatch below to Colors.green and then invoke
                    // "hot reload" (press "r" in the console where you ran "flutter run",
                    // or simply save your changes to "hot reload" in a Flutter IDE).
                    // Notice that the counter didn't reset back to zero; the application
                    // is not restarted.
                    primarySwatch: Colors.blue,
                  ),
                  home: Login(),
                ));
      },
      valueListenable: currentLocale,
    );
  }
}

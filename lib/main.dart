import 'package:developer_app/models/router.dart';
import 'package:developer_app/provider/developer_provider.dart';
import 'package:developer_app/view/screens/Profiles.dart';
import 'package:developer_app/view/screens/posts.dart';
import 'package:developer_app/view/screens/profile_details.dart';
import 'package:developer_app/view/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(
      // EasyLocalization(
      //   supportedLocales: [Locale('en'), Locale('ar')],
      //   path: 'assets/langs', // <-- change the path of the translation files
      //   fallbackLocale: Locale('en'),
      (MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DeveloperProvider>(create: (context) {
            return DeveloperProvider();
          }),
        ],
        child: MaterialApp(
          navigatorKey: AppRouter.navKey,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: SplachScreen(),
        ));
  }
}

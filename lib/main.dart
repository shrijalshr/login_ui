import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/responsive/screen_util.dart';
import 'core/routes/route_generator.dart';
import 'core/theme/app_theme.dart';
import 'modules/auth/login/view/login_screen.dart';
import 'widgets/password_field/password_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color

    statusBarColor: Colors.transparent, // status bar color
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(height: 844, width: 390, allowFontScaling: true);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PasswordProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login UI',
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
        onGenerateRoute: (settings) => RouteGenerator.getRoute(settings),
      ),
    );
  }
}

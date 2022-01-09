import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:liquor_mate/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
        ],
        path: 'assets/locales',
        fallbackLocale: Locale('en', 'US'),
        child: LiquorMateApp()),
  );
}

class LiquorMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        UI.initialize(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: UI.ratio),
          child: child ?? Text("UNRESPONSIVE"),
        );
      },
      theme: ThemeData(
        primaryColor: colorGreen,
        scaffoldBackgroundColor: colorBackground,
        backgroundColor: colorBackground,
        fontFamily: "Montserrat",
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: colorWhite,
          iconTheme: IconThemeData(
            color: colorWhite,
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: colorBackground,
        ),
      ),
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        WelcomeScreen.route: (context) => WelcomeScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        RegisterScreen.route: (context) => RegisterScreen(),
        PasswordResetScreen.route: (context) => PasswordResetScreen(),
        DashboardScreen.route: (context) => DashboardScreen(),
        BottleDetailsScreen.route: (context) => BottleDetailsScreen(),
        LiquorBottleDatabaseScreen.route: (context) =>
            LiquorBottleDatabaseScreen(),
        ShopsHomeScreen.route: (context) => ShopsHomeScreen(),
        MeasureHomeScreen.route: (context) => MeasureHomeScreen(),
        SettingsScreen.route: (context) => SettingsScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}

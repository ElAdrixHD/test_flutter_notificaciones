import 'package:flutter/material.dart';
import 'package:notification/src/page/home_page.dart';
import 'package:notification/src/page/mensaje_page.dart';
import 'package:notification/src/providers/push_notification_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route : (BuildContext context) => HomePage(),
        MensajePage.route : (BuildContext context) => MensajePage(),
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final provider = PushNotificationsProvider();
    provider.initNotification();

    provider.mensajeController.listen((event) {
      navigatorKey.currentState.pushNamed(MensajePage.route, arguments: event);
    });
  }
}
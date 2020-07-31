
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider{
  //cTDAqUjJOtY:APA91bGWo7JvrhkPJpKLUSJ3sPI77JIQUNn-h9RxopYu_LlAXYw889TR31NnT1yHZ020kVraznnur8iss10CQ216RO_onCX31fGU1R3TlBlMrA8BwRqCFTwlNmnVKPCTwHns2dgA7vap
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajeStreamCOntroller = StreamController<String>.broadcast();

  Stream<String> get mensajeController=> _mensajeStreamCOntroller.stream;

  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) async{
    if (message.containsKey('data')){
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotification() async{

    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    print("Token: $token");

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onResume: onResume,
      onLaunch: onLaunch
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async{
    print("OnMessage: $message");
    final arg = message["data"]["comida"];
    _mensajeStreamCOntroller.sink.add(arg);
  }
  Future<dynamic> onLaunch(Map<String, dynamic> message) async{
    print("OnLaunch: $message");
    final arg = message["data"]["comida"];
    _mensajeStreamCOntroller.sink.add(arg);
  }
  Future<dynamic> onResume(Map<String, dynamic> message) async{
    print("OnResume: $message");
    final arg = message["data"]["comida"];
    _mensajeStreamCOntroller.sink.add(arg);
  }

  void dispose(){
    _mensajeStreamCOntroller.close();
  }
}
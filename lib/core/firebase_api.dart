import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:loanswift/main.dart';

class FirebaseApi {
  // create Instance

  final _firebaseMessage = FirebaseMessaging.instance;

  // to init notifications

  Future<String?> getToken() async {
    final fcmToken = await _firebaseMessage.getToken();
    return Future.value(fcmToken);
  }

  Future<void> initNotifications() async {
    // request permission from user
    await _firebaseMessage.requestPermission();

    // fetch the FCM TOKEN

    //final fcmToken = await _firebaseMessage.getToken();

    // print token

    //debugPrint(" fcmToken $fcmToken");

    initPushNotifications();
  }

  // received messages

  void onMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      "/index",
      arguments: message,
    );

    // display notification
  }

  // init foreground and background

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(
          onMessage,
        );

    // attach event listeners for when a notification is tapped
    FirebaseMessaging.onMessageOpenedApp.listen(
      onMessage,
    );

  }
}

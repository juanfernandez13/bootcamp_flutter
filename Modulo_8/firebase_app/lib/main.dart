import 'package:firebase_app/pages/app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  final remoteConfig = FirebaseRemoteConfig.instance;
  final fcmToken = await FirebaseMessaging.instance.getToken();
    print("token: $fcmToken");

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    print("novo token: $fcmToken");
  }).onError((err) {
    // Error getting token.
  });

  FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 0),
  ));
  await remoteConfig.setDefaults(const {
    "example_param_4": "Hello, world!",
  });
  remoteConfig.fetchAndActivate();
  runApp(const App());
}

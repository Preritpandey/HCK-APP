import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Handle when a notification is received
  static Future<void> _onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    print("Notification received: ${notificationResponse.payload}");
  }

  // Initialize the notification plugin
  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveNotification,
    );

    // Request permission for notifications (for Android 13 and above)
    await _requestNotificationPermission();
  }

  // Request notification permission for Android 13+
  static Future<void> _requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // Show an instant notification
  static Future<void> showInstantNotification(String title, String body) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'instant_notification_channel_id',
        'Instant Notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
      payload: 'instant_notification', // Optional payload data
    );
  }

  // Schedule a notification at a specific time
  static Future<void> scheduleNotification(
      int id, String title, String body, DateTime scheduledTime) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id, // Unique notification ID
      title,
      body,
      tz.TZDateTime.from(
          scheduledTime, tz.local), // Convert scheduled time to local timezone
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder_channel',
          'Reminder Channel',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
          true, // Ensure the notification is sent even in Doze mode
      matchDateTimeComponents:
          DateTimeComponents.dateAndTime, // Match both date and time
    );
  }

  // Cancel a scheduled notification by ID
  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> _checkAndRequestBatteryOptimizations() async {
    if (Platform.isAndroid) {
      var intent = await const AndroidIntent(
        action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
        data: 'package:com.hck_app', // Replace with your actual package name
      );
      await intent.launch();
    }
  }
}

// // -----------------------------new code -----------------------------

// import 'dart:io';
// import 'package:android_intent_plus/android_intent.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // Handle when a notification is received
//   static Future<void> _onDidReceiveNotification(
//       NotificationResponse notificationResponse) async {
//     print("Notification received: ${notificationResponse.payload}");
//   }

//   // Initialize the notification plugin
//   static Future<void> init() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings("@mipmap/ic_launcher");

//     const DarwinInitializationSettings iOSInitializationSettings =
//         DarwinInitializationSettings();

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iOSInitializationSettings,
//     );

//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: _onDidReceiveNotification,
//       onDidReceiveBackgroundNotificationResponse: _onDidReceiveNotification,
//     );

//     // Request notification permissions
//     await _requestNotificationPermission();

//     // For Android: Request battery optimization exclusion if needed
//     if (Platform.isAndroid) {
//       await _checkAndRequestBatteryOptimizations();
//     }
//   }

//   // Request notification permission for Android 13+ and iOS
//   static Future<void> _requestNotificationPermission() async {
//     if (await Permission.notification.isDenied) {
//       await Permission.notification.request();
//     }
//   }

//   // Show an instant notification with expandable text for Android
//   static Future<void> showInstantNotification(String title, String body) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'instant_notification_channel_id',
//       'Instant Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       styleInformation: BigTextStyleInformation(
//         // Expandable text
//         body,
//         contentTitle: title,
//         htmlFormatBigText: true,
//         htmlFormatContentTitle: true,
//       ),
//     );

//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: const DarwinNotificationDetails(),
//     );

//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//     );
//   }

//   // Schedule a notification for a future time
//   static Future<void> scheduleNotification(
//       int id, String title, String body, DateTime scheduledTime) async {
//     tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tzScheduledTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'scheduled_notification_channel_id',
//           'Scheduled Notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//         iOS: DarwinNotificationDetails(),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.wallClockTime,
//       matchDateTimeComponents: DateTimeComponents
//           .time, // Make sure notifications match the time exactly
//     );
//   }

//   // Check and request battery optimization exclusion for Android (optional)
//   static Future<void> _checkAndRequestBatteryOptimizations() async {
//     const AndroidIntent intent = AndroidIntent(
//       action: 'android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS',
//     );
//     await intent.launch();
//   }

//   // Cancel a notification
//   static Future<void> cancelNotification(int id) async {
//     await _flutterLocalNotificationsPlugin.cancel(id);
//   }
// }

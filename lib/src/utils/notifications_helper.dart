import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

/*
on splash
void listenNotifications() =>
      NotificationsHelper.onNotifications.stream.listen(onClickedNotification);

void onClickedNotification(String? payload) {
  if (payload != null && payload.length > 2)
    Navigator.of(context).pushNamed(payload);
}
*/

class NotificationsHelper {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static _notificationDetails() {
    // final _styleInformation = BigPictureStyleInformation(bigPicture);
    return NotificationDetails(
      android: AndroidNotificationDetails(
        "UniChat", "UniChat",
        channelShowBadge: true,
        playSound: false,
        // importance: Importance.max,
        // styleInformation: _styleInformation,
      ),
      iOS: IOSNotificationDetails(
        presentSound: false,
      ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final androidInitSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    final iosInitSettings = IOSInitializationSettings();

    //When app closed
    final details = await _notifications.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }

    await _notifications.initialize(
        InitializationSettings(
          android: androidInitSettings,
          iOS: iosInitSettings,
        ), onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });

    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, _notificationDetails());

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        _notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
}

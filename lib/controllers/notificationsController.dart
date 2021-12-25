import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dart_example/main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class NotificationsController extends GetxController {
  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'shopping_notifications',
          title: 'Shopping Cart',
          body: 'Product has been added'),
    );

    AwesomeNotifications().actionStream.listen((event) {
      Get.to(MyApp());
    });
  }
}

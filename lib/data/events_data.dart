import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hck_app/data/events_model.dart';

import 'package:intl/intl.dart';

class EventDataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    todayEventCalculator();
  }

  //dummy information data
  RxList<Events> eventInformation = [
    Events.fromJson(
      {
        "title": "Photoshop Session",
        "organizer": "UI Visual Community",
        "dateTime": "2023-01-21 3:00 PM",
        "imageUrl": "assets/images/photoshop_frame.png"
      },
    ),
    Events.fromJson(
      {
        "title": "Herald Idea City",
        "organizer": "Biz Core Community",
        "dateTime": "2022-12-23 3:30 PM",
        "imageUrl": "assets/images/onboard_ill1.png"
      },
    ),
    Events.fromJson(
      {
        "title": "Photoshop Session",
        "organizer": "UI Visual Community",
        "dateTime": "2022-12-27 3:00 PM",
        "imageUrl": "assets/images/photoshop_frame.png"
      },
    ),
    Events.fromJson(
      {
        "title": "Herald Idea City",
        "organizer": "Biz Core Community",
        "dateTime": "2022-12-27 3:30 PM",
        "imageUrl": "assets/images/onboard_ill1.png"
      },
    ),
  ].obs;
  //dummy today events
  RxList<Events> todayEvents = RxList.empty();

  // List<Events> eventInformation = [];
  void todayEventCalculator() {
    todayEvents.clear();
    var todayDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
    for (int i = 0; i < eventInformation.length; i++) {
      String eventDate = eventInformation[i].dateTime.split(" ")[0];
      if (eventDate == todayDate) {
        todayEvents.add(eventInformation[i]);
      }
    }
  }
}

import 'package:flutter/foundation.dart';

class ActivityDetails {
  final String activityId;
  final String date;
  final String wakeUp;
  final String wakeUpImage;
  final String totalSteps;
  final String totalStepsImage;

  ActivityDetails({
    @required this.activityId,
    @required this.date,
    @required this.wakeUp,
    @required this.wakeUpImage,
    @required this.totalSteps,
    @required this.totalStepsImage,
  });
}

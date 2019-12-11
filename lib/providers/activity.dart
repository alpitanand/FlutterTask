import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kisanhub/models/activityDetails.dart';

class Activity with ChangeNotifier {
  List<ActivityDetails> _details = [];
  String _activityUrl = "https://kisanhub.mockable.io/flutter-test/activities";

  Future<void> activity(String token) async {
    print(token);
    return await http.get(_activityUrl, headers: {
      'Authorization': token,
    }).then(
      (response) {
        var details = json.decode(response.body)['activities'];
        for (var i = 0; i < details.length; i++) {
          final newActivity = new ActivityDetails(
            activityId: details[i]['activity_id'],
            date: details[i]['date'],
            wakeUp: details[i]['wakeUp'],
            wakeUpImage: details[i]['wakeUpImage'],
            totalSteps: details[i]['totalSteps'],
            totalStepsImage: details[i]['totalStepsImage'],
          );
          _details.add(newActivity);
        }
        notifyListeners();
      },
    );
  }

  List<ActivityDetails> get listItem {
    return [..._details];
  }

  void clearData(){
    _details=[];
  }
}

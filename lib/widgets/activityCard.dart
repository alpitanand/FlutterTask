import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String activityId;
  final String date;
  final String wakeUp;
  final String wakeUpImage;
  final String totalSteps;
  final String totalStepsImage;
  ActivityCard(
    this.activityId,
    this.date,
    this.wakeUp,
    this.wakeUpImage,
    this.totalSteps,
    this.totalStepsImage,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: new BorderRadius.circular(8.0),
                  child: Image.network(
                    wakeUpImage,
                    height: 40.0,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(wakeUp),
                Spacer(),
                Text(date)
              ],
            ),
            Divider(),
            Image.network(
              totalStepsImage,
              fit: BoxFit.contain,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: <Widget>[
                  Text("Steps:"+ totalSteps),
                  Spacer(),
                  Text(
                    activityId,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kisanhub/providers/login.dart';
import 'package:kisanhub/widgets/activityCard.dart';
import 'package:provider/provider.dart';
import '../providers/activity.dart';
import '../widgets/appDrawer.dart';

class ActivityScreen extends StatefulWidget {
  static const routeName = '/activity';

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final activityDetails = Provider.of<Activity>(context);
      final loginDetails = Provider.of<Login>(context);
      activityDetails.activity(loginDetails.getAuthToken());
      _isInit = false;
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    final activityDetails = Provider.of<Activity>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Activites"),
      ),
      drawer: AppDrawer(),
      body: activityDetails.listItem.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: activityDetails.listItem.length,
                itemBuilder: (_, i) => Column(
                  children: <Widget>[
                    ActivityCard(
                      activityDetails.listItem[i].activityId,
                      activityDetails.listItem[i].date,
                      activityDetails.listItem[i].wakeUp,
                      activityDetails.listItem[i].wakeUpImage,
                      activityDetails.listItem[i].totalSteps,
                      activityDetails.listItem[i].totalStepsImage,
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
    );
  }
}

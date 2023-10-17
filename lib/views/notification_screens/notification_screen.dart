import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/views/notification_screens/widgets/notification_item.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/NotificationModel.dart';
import '../../provider/LocationProvider.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context,locationProvider,child) =>
        Column(
        children: [
          Expanded(
              flex: 1,
              child:Container(
                color: ColorsResource.PRAYMERY_COLOR,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.060,
                  margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Column(
                    children: [
                      //Toolbar
                      Row(
                        children: [
                          InkWell(
                              onHover: (_) {},
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SvgPicture.asset(AppImages.ic_back_blue)),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 65,
                            child: Text(
                              AppConstants.Information_notification,
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_20,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                                  color: ColorsResource.PRAYMARY_TEXT_COLOR),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),




          Expanded(
              flex: 9,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: locationProvider.notificationModel != null ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: locationProvider.notificationData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    NotificationData notificationData = locationProvider.notificationData![index];


                    return  NotificationItem(notificationData);
                  },
                ) : Container(
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          )
        ],
    ),
      ),
    );
  }
}

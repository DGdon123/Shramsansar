import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmiis/utils/Apis.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/dimensions.dart';

import '../../../models/ResponsModels/ViewAllJobsModel.dart';
import '../../../utils/colors_resource.dart';
import '../../Job_description_view_screens/Job_description_view_screen.dart';
import '../../login_screens/logIn_screen.dart';

class EmploymentItem extends StatelessWidget {
  ViewAllJobsData viewAllJobData;
  EmploymentItem(this.viewAllJobData);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onHover: (_) {},
      onTap: () {
        final box = GetStorage();
        String? token = box.read(AppConstants.TOKEN) ?? '';
        token.isEmpty
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // title: const Text("कृपया लगइन गर्नुहोस्"),
                    content: SizedBox(
                      width: screenSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 30,
                                )),
                          ),
                          const Text(
                            "कृपया लगइन गर्नुहोस्",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,

                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                minimumSize: const Size(150, 50), //////// HERE
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                token.isEmpty
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => LogInScreen(
                                                  doCheckLastScreen: true,
                                                  screenType: "job_description",
                                                  //screenType : "training"
                                                  //trainingModelData : trainingModelData
                                                  viewAllJobsData:
                                                      viewAllJobData,
                                                )))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JobDescriptionViewScreen(
                                                    viewAllJobData)));
                              },
                              child: const Text("लग - इन")),
                        ],
                      ),
                    ),
                  );
                })
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        JobDescriptionViewScreen(viewAllJobData)));

        // token == ""
        //     ? Navigator.push(context,
        //         MaterialPageRoute(builder: (ctx) => const LogInScreen()))
        //     : Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) =>
        //                 JobDescriptionViewScreen(viewAllJobData)));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        decoration: myBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.120,
        child: 
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                viewAllJobData.serviceProvider!.logo != null
                    ? CachedNetworkImage(
                      imageUrl: '${Apis.URL}${viewAllJobData.serviceProvider!.logo}' ,
                        width: 80,
                        height: 80,placeholder: (context, url) =>  Image.asset(AppImages.placeHolder), errorWidget: (context, url, error) => Image.asset(AppImages.placeHolder)
                        // padding: const EdgeInsets.all(5),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: CachedNetworkImageProvider(
                        //             '${Apis.URL}${viewAllJobData.serviceProvider!.logo}')))
                        // viewAllJobData.serviceProvider!.logo != null
                        //     ? Image.network(
                        //         '${Apis.URL}${viewAllJobData.serviceProvider!.logo}',
                        //         height: 60,
                        //         width: 60,
                        //         fit: BoxFit.fill,
                        //       )

                        )
                    :   Image.asset(AppImages.placeHolder)
                // Container(
                //     width: 80,
                //     height: 80,
                //     padding: const EdgeInsets.all(5),
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: NetworkImage(
                //                 'https://www.name.edu.np/wp-content/uploads/2020/06/placeholder.png')))
                //     // viewAllJobData.serviceProvider!.logo != null
                //     //     ? Image.network(
                //     //         '${Apis.URL}${viewAllJobData.serviceProvider!.logo}',
                //     //         height: 60,
                //     //         width: 60,
                //     //         fit: BoxFit.fill,
                //     //       )

                //     )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text(
                      '${viewAllJobData.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: Dimensions.BODY_18,
                          color: ColorsResource.PRAYMARY_TEXT_COLOR,
                          fontWeight: Dimensions.FONT_MEDIUM),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text(
                      '${viewAllJobData.serviceProviderName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: Dimensions.BODY_14,
                          color: ColorsResource.TEXT_GRAY_COLOR_LOW,
                          fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                    )),
                Expanded(child: Container()),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.ic_location,
                            color: ColorsResource.TEXT_BLACK_COLOR,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width*0.4,
                            child: Text('${viewAllJobData.address}',maxLines: 2,))
                        ],
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.ic_clock,
                            color: ColorsResource.TEXT_BLACK_COLOR,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('${viewAllJobData.deadline}')
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorsResource.NEW_INFONMATION_ITEM_COLOR,
      border: Border.all(
        color: ColorsResource.NEW_INFONMATION_ITEM_COLOR,
        width: 1,
      ),
    );
  }

  myBoxDecorationTop() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(5.0),
      ),
      color: ColorsResource.PRAYMERY_COLOR,
      border: Border.all(
        color: ColorsResource.PRAYMERY_COLOR,
        width: 1,
      ),
    );
  }
}




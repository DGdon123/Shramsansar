import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/views/employment_support_service_Screens/widgets/employment_service_item.dart';
import 'package:lmiis/views/employment_support_service_Screens/widgets/employment_support_service_item.dart';
import 'package:lmiis/views/employment_support_service_Screens/widgets/training_item.dart';
import 'package:lmiis/views/training_service_provider_screens/TrainingSingleItemDetails.dart';
import 'package:lmiis/views/training_service_provider_screens/widgets/traning_service_item.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/TspModel.dart';
import '../../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../../provider/ESSPProvider.dart';
import '../../utils/Apis.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../widgets/HtmlView.dart';
class TrainingServiceDetailsScreen extends StatefulWidget {
  int id;
  TrainingServiceDetailsScreen(this.id);

  @override
  State<TrainingServiceDetailsScreen> createState() => _TrainingServiceDetailsScreenState();
}

class _TrainingServiceDetailsScreenState extends State<TrainingServiceDetailsScreen> {


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ESSPProvider>(context, listen: false).getTsspDetails(widget.id);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: ColorsResource.PRAYMARY_TEXT_COLOR,
        elevation: 0,
        centerTitle: true,
        title: Text(
          style: const TextStyle(
              fontSize: Dimensions.BODY_20,
              fontWeight: Dimensions.FONT_BOLD,
              color: Colors.white),
      AppConstants.Training_Service_Provider_Details
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ESSPProvider>(
          builder: (context,eSSPProvider,child) =>
          eSSPProvider.tspDetailsModel != null ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 850,
            child: Column(
              children: [
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     color: ColorsResource.PRAYMERY_COLOR,
                //     child: Container(
                //       width: MediaQuery
                //           .of(context)
                //           .size
                //           .width,
                //       height: MediaQuery
                //           .of(context)
                //           .size
                //           .height * 0.050,
                //       margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                //       child: Column(
                //         children: [
                //           //Toolbar
                //           Row(
                //             children: [
                //               InkWell(
                //                   onHover: (_) {},
                //                   onTap: () {
                //                     Navigator.of(context).pop();
                //                   },
                //                   child: SvgPicture.asset(AppImages.ic_back_blue)),
                //               SizedBox(
                //                 width: MediaQuery
                //                     .of(context)
                //                     .size
                //                     .width - 65,
                //                 child: Text(
                //                   AppConstants.Training_Service_Provider_Details,
                //                   style: TextStyle(
                //                       fontSize: Dimensions.BODY_20,
                //                       fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                //                       color: ColorsResource.PRAYMARY_TEXT_COLOR),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                    flex: 9,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      padding: EdgeInsets.all(5),
                                      child: eSSPProvider.tspDetailsModel!.data!.logo != null ? CachedNetworkImage(imageUrl: '${Apis.URL}${eSSPProvider.tspDetailsModel!.data!.logo}',height: 60,width: 60,fit: BoxFit.fill,placeholder: (context, url) =>  Image.asset(AppImages.placeHolder), errorWidget: (context, url, error) => Image.asset(AppImages.placeHolder)):Container(),
                                      //child: Image.network(eSSPProvider.tspDetailsModel!.data!.logo == null ? ,height: 60,width: 60,),
                                    )
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width -122,
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 10,top: 5),
                                          width: MediaQuery.of(context).size.width,
                                          child: Text('${eSSPProvider.tspDetailsModel!.data!.name}',
                                            maxLines: 1,overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),)),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 5),
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                SizedBox(width:5,),
                                                Text(
                                                      '${eSSPProvider.tspDetailsModel!.data!.pradeshName},'
                                                      '${eSSPProvider.tspDetailsModel!.data!.districtName},'
                                                      '${eSSPProvider.tspDetailsModel!.data!.muniName},'
                                                      '${eSSPProvider.tspDetailsModel!.data!.ward}'


                                                  ,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_call,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                const SizedBox(width:10,),
                                                Text('${eSSPProvider.tspDetailsModel!.data!.phone}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_email,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                const SizedBox(width:10,),
                                                Text('${eSSPProvider.tspDetailsModel!.data!.email}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_world,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                const SizedBox(width:10,),
                                                Text('${eSSPProvider.tspDetailsModel!.data!.website}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(AppConstants.description,
                            style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                          ),
                          SizedBox(height: 10,),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 10,top: 10),
                            child: HtmlView('${eSSPProvider.tspDetailsModel!.data!.description}'),
                          ),
                          SizedBox(height: 20,),
                          Text(AppConstants.Training_and_employment_within_this_service_provider,
                            style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: eSSPProvider.tspDetailsTrainings!.length > 0 ?
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: eSSPProvider.tspDetailsTrainings!.length,
                              itemBuilder: (BuildContext context, int index){
                                ViewAllTrainingsData esspServiceDetailsJobs = eSSPProvider.tspDetailsTrainings![index];
                                // Navigator.push(context, MaterialPageRoute(builder:(context) => JobDescriptionViewScreen()));
                                return TrainingServiceItem(esspServiceDetailsJobs,(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingSingleItemDetails(esspServiceDetailsJobs)));
                                },false);
                              },): Container(),),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 1,
                          //   color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                          //    child: TrainingServiceItem(eSSPProvider.esspServiceDetailsjobs![0],(){});
                          // ),

                        ],
                      ),
                    )

                )
              ],
            ),
          )  : Container(child: const Align(
        alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),),
        ),
      ),
    );
  }
}

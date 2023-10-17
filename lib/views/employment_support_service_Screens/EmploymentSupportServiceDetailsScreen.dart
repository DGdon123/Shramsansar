import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/views/employment_support_service_Screens/widgets/employment_service_item.dart';
import 'package:lmiis/views/employment_support_service_Screens/widgets/employment_support_service_item.dart';
import 'package:lmiis/views/employment_support_service_Screens/widgets/training_item.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/ESSPModel.dart';
import '../../models/ResponsModels/EsspServiceDetailsModel.dart';
import '../../models/ResponsModels/ViewAllJobsModel.dart';
import '../../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../../provider/ESSPProvider.dart';
import '../../utils/Apis.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../Job_description_view_screens/Job_description_view_screen.dart';
import '../training_service_provider_screens/TrainingSingleItemDetails.dart';
import '../widgets/HtmlView.dart';
import 'widgets/special_training_detail_page.dart';
import 'widgets/special_training_item.dart';
class EmploymentSupportServiceDetailsScreen extends StatefulWidget {
  EsspModelData esspModelData;
  EmploymentSupportServiceDetailsScreen(this.esspModelData);

  @override
  State<EmploymentSupportServiceDetailsScreen> createState() => _EmploymentSupportServiceDetailsScreenState();
}

class _EmploymentSupportServiceDetailsScreenState extends State<EmploymentSupportServiceDetailsScreen> {




  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      int id = widget.esspModelData.id!;
      print('skjhsdjhfjdsh $id');
      Provider.of<ESSPProvider>(context, listen: false).getEsspServiceProvider(id);
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
          AppConstants.Employment_Support_Services_Provider_Details,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ESSPProvider>(
          builder: (context,eSSPProvider,child) =>
          eSSPProvider.esspServiceDetailsModel != null ? SizedBox(
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
                //       margin: EdgeInsets.only(top: 40, left: 10, right: 10),
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
                //                   AppConstants.Employment_Support_Services_Provider_Details,
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
                                      child: eSSPProvider.esspServiceDetailsModel!.data!.logo != null ? CachedNetworkImage(imageUrl:'${Apis.URL}${eSSPProvider.esspServiceDetailsModel!.data!.logo}',height: 60,width: 60,fit: BoxFit.fill,placeholder: (context, url) =>  Image.asset(AppImages.placeHolder), errorWidget: (context, url, error) => Image.asset(AppImages.placeHolder)):Container(),
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
                                          child: Text('${eSSPProvider.esspServiceDetailsModel!.data!.name!}',
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
                                                  '${eSSPProvider.esspServiceDetailsModel!.data!.pradeshName},'
                                                      '${eSSPProvider.esspServiceDetailsModel!.data!.districtName},'
                                                  '${eSSPProvider.esspServiceDetailsModel!.data!.muniName},'
                                                      '${eSSPProvider.esspServiceDetailsModel!.data!.ward}'


                                                  ,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_call,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                const SizedBox(width:10,),
                                                Text('${eSSPProvider.esspServiceDetailsModel!.data!.mobile}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_email,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                const SizedBox(width:10,),
                                                Text('${eSSPProvider.esspServiceDetailsModel!.data!.email}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                SvgPicture.asset(AppImages.ic_world,color: ColorsResource.TEXT_GRAY_COLOR_LOW,),
                                                const SizedBox(width:10,),
                                                Text('${eSSPProvider.esspServiceDetailsModel!.data!.website}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_GRAY_COLOR_LOW),)
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
                          //  child: HtmlView(eSSPProvider.esspServiceDetailsModel!.data!.description == null ? '' : eSSPProvider.esspServiceDetailsModel!.data!.description!,),
                            child: HtmlView('${eSSPProvider.esspServiceDetailsModel!.data!.description}'),
                          ),
                          SizedBox(height: 20,),
                          Text(AppConstants.Recruitment_and_training_within_this_service_provider,
                            style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: eSSPProvider.esspServiceDetailsjobs!.length > 0 ?ListView.builder(
                            shrinkWrap: true,
                            itemCount: eSSPProvider.esspServiceDetailsjobs!.length,
                            itemBuilder: (BuildContext context, int index){
                              ViewAllJobsData esspServiceDetailsJobs =eSSPProvider.esspServiceDetailsjobs![index];

                              return EmploymentServiceItem(esspServiceDetailsJobs,
                              // (){
                              //   Navigator.push(context, MaterialPageRoute(builder:(context) => JobDescriptionViewScreen(esspServiceDetailsJobs),),);
                              // }
                              );
                          },): Container(),),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: eSSPProvider.esspServiceDetailstrainings!.length > 0 ?
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: eSSPProvider.esspServiceDetailstrainings!.length,
                              itemBuilder: (BuildContext context, int index){
                                ViewAllTrainingsData esspServiceDetailsTraing = eSSPProvider.esspServiceDetailstrainings![index];
                                // Navigator.push(context, MaterialPageRoute(builder:(context) => JobDescriptionViewScreen()));
                                return SpecialTrainingServiceItem(esspServiceDetailsTraing,
                                // (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialTrainingSingleItemDetails(esspServiceDetailsJobs),),);
                                // },
                                true
                                );
                              },): Container(),),


                        ],
                      ),
                    )

                )
              ],
            ),
          )
              : Container(child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/models/ResponsModels/latest_training_model.dart';
import 'package:provider/provider.dart';

import '../../../provider/TrainingsProvider.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';
import '../../home_screens/home_screen.dart';
import '../../news_information_see_more_screens/widgets/custtom_search_button.dart';
import '../../widgets/HtmlView.dart';
import '../../widgets/showCustomSnackBar.dart';

class LatestTrainingDetailScreen extends StatefulWidget {
  LatestTrainingModel latestTrainingModel;
  LatestTrainingDetailScreen(this.latestTrainingModel);

  @override
  State<LatestTrainingDetailScreen> createState() => _LatestTrainingDetailScreenState();
}

class _LatestTrainingDetailScreenState extends State<LatestTrainingDetailScreen> {


  bool applyButton = false;
  bool applyButtonShow = true;
  String engDatelineString = 'आवेदन दिन भौतिकरुप मा उपस्तित हुनुपर्ने छ।';


  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

     var jobProvider = Provider.of<TrainingsProvider>(context,listen: false);


     jobProvider.getVewSingleTraining(widget.latestTrainingModel.id!).then((value) {

       applyButton = jobProvider.singleTraningModel!.isApplied!;

       if(jobProvider.singleTraningModel!.data!.serviceProvider!.type == 4){
         applyButtonShow = false;
         engDatelineString = 'आवेदन दिन भौतिकरुप मा उपस्तित हुनुपर्ने छ।';
       }

       if(jobProvider.singleTraningModel!.data! == 4){
         applyButtonShow = false;
         engDatelineString = 'आवेदन दिन भौतिकरुप मा उपस्तित हुनुपर्ने छ।';
       }


     });
     print("sdfsdf  ${widget.latestTrainingModel.id!}");

   });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
             appBar: AppBar(
                     leading: IconButton(
          onPressed: () => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: ((context) => HomeScreen())),
                (route) => false)
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: ColorsResource.PRAYMARY_TEXT_COLOR,
        elevation: 0,
        centerTitle: true,
        title: Text(
          style: const TextStyle(
              fontSize: Dimensions.BODY_20,
              fontWeight: Dimensions.FONT_BOLD,
              color: Colors.white),
    "प्रशिक्षण  विवरण"
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<TrainingsProvider>(
          builder: (context,trainingsProvider,child) =>
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 850,
            child: Column(
              children: [
                // Expanded(
                //   flex: 1,
                //   child:Container(
                //     color: ColorsResource.PRAYMERY_COLOR,
                //     child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: MediaQuery.of(context).size.height * 0.050,
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
                //                   child:
                //                   SvgPicture.asset(AppImages.ic_back_blue)),
                //               SizedBox(
                //                 width: MediaQuery.of(context).size.width - 65,
                //                 child: Text(
                //                   'प्रशिक्षण  विवरण',
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
                trainingsProvider.singleTraningData!=null? Expanded(
                    flex: 9,
                    child: Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          //company info
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 10,top: 5),
                                          width: MediaQuery.of(context).size.width,
                                          child: Text('${trainingsProvider.singleTraningData?.title}',maxLines: 1,overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),)),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 10,),

                                      applyButtonShow ?   CustomSearchButton( AppConstants.Apply, () {

                                       if(applyButton){
                                         return;
                                       }
                                       showLoaderDialog(context);
                                       trainingsProvider.singleTraningModel?.isApplied == true ? null :  trainingsProvider.applayTraining(trainingsProvider.singleTraningData!.id!).then((value){
                                          if(value.isSuccess){
                                            Navigator.of(context).pop();
                                            showCustomSnackBar(value.message, context,isError: false);
                                            Provider.of<TrainingsProvider>(context,listen: false).getVewSingleTraining(widget.latestTrainingModel.id!);

                                            if(value.message == 'Already Applied'){
                                            }else{
                                              successDialog(AppConstants.You_have_successfully_trained_applied_for);
                                            }
                                            Provider.of<TrainingsProvider>(context,listen: false).getVewSingleTraining(widget.latestTrainingModel.id!);
                                             setState(() {
                                               applyButton = true;
                                             });
                                          }else{
                                            Navigator.of(context).pop();
                                            showCustomSnackBar(value.message, context);
                                          }
                                        });

                                      },height: 25,wight: 100,textSize: Dimensions.BODY_10,padding: 2,
                                         // buttonColor: trainingsProvider.singleTraningData?.serviceProvider?.type == 4 ? false : true
                                          buttonColor: applyButton ? false : true
                                      ) : Container(
                                        child: Text(engDatelineString),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          //Devider
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(AppConstants.Details_of_Training_Institution,
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${trainingsProvider.singleTraningData?.serviceProvider?.name}',
                                      style:TextStyle(color: ColorsResource.TEXT_GRAY_COLOR_LOW,fontSize: Dimensions.BODY_14),),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width:5,),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width -100,
                                            child: Text(

                                                    '${trainingsProvider.singleTraningData?.serviceProvider?.districtName},'
                                                    '${trainingsProvider.singleTraningData?.serviceProvider?.muniName},'
                                                    '${trainingsProvider.singleTraningData?.serviceProvider?.ward}'

                                                ,maxLines: 1,overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL)))
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_call,color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width:5,),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width -100,
                                            child: Text('${trainingsProvider.singleTraningData?.serviceProvider?.mobile}',maxLines: 1,overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL)))
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_email,color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width:5,),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width -100,
                                            child: Text('${trainingsProvider.singleTraningData?.serviceProvider?.email}',maxLines: 1,overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL)))
                                      ],
                                    )
                                  ],
                                ),
                              ),


                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(AppConstants.Details_of_training,
                                    style: TextStyle(
                                        color: ColorsResource.TEXT_BLACK_COLOR,
                                        fontSize: Dimensions.BODY_14,
                                        fontWeight: Dimensions.FONT_BOLD),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                margin: EdgeInsets.only(left: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_location,
                                          color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width: 5,),
                                        SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 100,
                                            child: Text(

                                                    '${trainingsProvider.singleTraningData?.districtName},'
                                                    '${trainingsProvider.singleTraningData?.muniName},'
                                                     '${trainingsProvider.singleTraningData?.ward}'

                                                , maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: Dimensions.BODY_12,
                                                    color: ColorsResource
                                                        .TEXT_BLACK_COLOR,
                                                    fontWeight: Dimensions
                                                        .FONT_MEDIUM_NORMUL)))
                                      ],
                                    ),

                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_group,
                                          color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width: 5,),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width - 100,
                                            child: Text('${trainingsProvider.singleTraningData?.noOfParticipant}', maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: Dimensions.BODY_12,
                                                    color: ColorsResource
                                                        .TEXT_BLACK_COLOR,
                                                    fontWeight: Dimensions
                                                        .FONT_MEDIUM_NORMUL)))
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_calender,
                                          color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width: 5,),
                                        SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 100,
                                            child: Text('${trainingsProvider.singleTraningData?.startDate} to ${trainingsProvider.singleTraningData?.endDate}', maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: Dimensions.BODY_12,
                                                    color: ColorsResource
                                                        .TEXT_BLACK_COLOR,
                                                    fontWeight: Dimensions
                                                        .FONT_MEDIUM_NORMUL)))
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.ic_clock,
                                          color: ColorsResource.TEXT_BLACK_COLOR,),
                                        const SizedBox(width: 5,),
                                        SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width - 100,
                                            child: Text(
                                                '${trainingsProvider.singleTraningData?.startTime} to ${trainingsProvider.singleTraningData?.endTime}', maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: Dimensions.BODY_12,
                                                    color: ColorsResource
                                                        .TEXT_BLACK_COLOR,
                                                    fontWeight: Dimensions
                                                        .FONT_MEDIUM_NORMUL)))
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Text(AppConstants.description,
                                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                                    ),
                                    SizedBox(height: 10,),


                                    Container(
                                      child: HtmlView('${trainingsProvider.singleTraningData?.description}'),
                                    ),


                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    )

                ):Center(child: CircularProgressIndicator.adaptive()),
               
              ],
            ),
          ),
        ),
      ),
    );
  }




  successDialog(String title){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(3),
                          topLeft: Radius.circular(3),
                        ),
                        color: ColorsResource.WHAIT,
                        border: Border.all(
                          color: ColorsResource.WHAIT,
                          width: 1,
                        ),
                      ),
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onHover: (_){},
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.TEXT_BLACK_COLOR,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Text(title,textAlign:TextAlign.center, style: TextStyle(fontSize: Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR),)),
                    SizedBox(height: 20,),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppImages.ic_sucses))
                  ],
                ),
              )
          );
        }
    );
  }


}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/ViewAllJobsModel.dart';
import '../../provider/JobProvider.dart';
import '../../provider/UtilsProvider.dart';
import '../../utils/Apis.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../news_information_see_more_screens/widgets/custtom_search_button.dart';
import '../widgets/HtmlView.dart';
import '../widgets/showCustomSnackBar.dart';

class JobDescriptionViewScreen extends StatefulWidget {
  ViewAllJobsData viewAllJobDataF;
  JobDescriptionViewScreen(this.viewAllJobDataF);

  @override
  State<JobDescriptionViewScreen> createState() =>
      _JobDescriptionViewScreenState();
}

class _JobDescriptionViewScreenState extends State<JobDescriptionViewScreen> {

  String? fileName;
  String? filePath;

  bool applyButton = false;
  bool applyButtonShow = true;
  String engDatelineString = 'आबदेन दिने आन्तिम मिति सकिएको छ';



  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var jobProvider = Provider.of<JobProvider>(context,listen: false);

      jobProvider.getSingVewJob(widget.viewAllJobDataF.id!).then((value) {

        if(jobProvider.viewSingJobsModelMain?.isApplied == true){
          applyButton = true;
        }else{
          applyButton = false;
        }



        String dateLie = jobProvider.viewSingJobsModel!.engDeadline!;
        var now =  DateTime.now();
        var formatter =  DateFormat('yyyy-MM-dd');
        String currentDate = formatter.format(now);
        DateTime dt1 = DateTime.parse(dateLie);
        DateTime dt2 = DateTime.parse(currentDate);

        if(dt1.compareTo(dt2) == 0){
          applyButtonShow = true;
          print("312312    Both date time are at same moment.");
        }
        if(dt1.compareTo(dt2) < 0){
          applyButtonShow = false;
          print("312312 DT1 is before DT2");
        }
        if(dt1.compareTo(dt2) > 0){
          applyButtonShow = true;
          print("312312  DT1 is after DT2");
        }


        if(jobProvider.viewSingJobsModel!.serviceProvider!.type == 4){
          engDatelineString = 'आवेदन दिन भौतिकरुप मा उपस्तित हुनुपर्ने छ।';
          applyButtonShow = true;
        }
      });
    });




    super.initState();
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
           AppConstants.employment,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<JobProvider>(
          builder: (context,jobProvider,child) =>
          Column(
            children: [
              // Container(
              //   color: ColorsResource.PRAYMERY_COLOR,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height * 0.050,
              //     margin: EdgeInsets.only(top: 50, left: 10, right: 10),
              //     child: Column(
              //       children: [
              //         //Toolbar
              //         Row(
              //           children: [
              //             InkWell(
              //                 onHover: (_) {},
              //                 onTap: () {
              //                   Navigator.of(context).pop();
              //                 },
              //                 child:
              //                 SvgPicture.asset(AppImages.ic_back_blue)),
              //             SizedBox(
              //               width: MediaQuery.of(context).size.width - 65,
              //               child: Text(
              //                 AppConstants.employment,
              //                 style: TextStyle(
              //                     fontSize: Dimensions.BODY_20,
              //                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
              //                     color: ColorsResource.PRAYMARY_TEXT_COLOR),
              //                 textAlign: TextAlign.center,
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  padding: EdgeInsets.all(5),
                                  child: jobProvider.viewSingJobsModel?.serviceProvider?.logo != null ? CachedNetworkImage(imageUrl: '${Apis.URL}${jobProvider.viewSingJobsModel?.serviceProvider?.logo}',height: 60,width: 60,fit: BoxFit.fill,placeholder: (context, url) =>  Image.asset(AppImages.placeHolder), errorWidget: (context, url, error) => Image.asset(AppImages.placeHolder)):Container(),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10,top: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('${jobProvider.viewSingJobsModel?.title}',maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),)),
                                SizedBox(height: 3,),
                                Container(
                                  margin: EdgeInsets.only(left: 10,top: 3),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                                      SizedBox(width:5,),
                                      Container(
                                          width: MediaQuery.of(context).size.width - 284,
                                          child: Text(
                                              '${jobProvider.viewSingJobsModel?.districtName},'
                                               '${jobProvider.viewSingJobsModel?.muniName},'
                                              '${jobProvider.viewSingJobsModel?.ward}'
                                              ,maxLines: 2,
                                              style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_GRAY_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),

                                ),
                                SizedBox(height: 3,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 120,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width:10,),
                                          Text(AppConstants.deadline,
                                              style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight: Dimensions.FONT_BOLD)),
                                          SizedBox(width: 5,),
                                          SvgPicture.asset(AppImages.ic_calender,color: ColorsResource.TEXT_GRAY_COLOR,),
                                          const SizedBox(width:5,),
                                          Text('  ${jobProvider.viewSingJobsModel?.deadline}',style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_GRAY_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10,),


                                applyButtonShow ? CustomSearchButton(AppConstants.Apply, () => {
                                   applyButton ? null : showCvDialog()

                                },height: 35,wight: 100,textSize: Dimensions.BODY_12,padding: 2,
                                     buttonColor: applyButton  ? false : true
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

                    ///Organaigation
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(AppConstants.Details_of_the_institution,
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${jobProvider.viewSingJobsModel?.organization?.name}',
                                style:TextStyle(color: ColorsResource.TEXT_GRAY_COLOR_LOW,fontSize: Dimensions.BODY_14),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                                  const SizedBox(width:5,),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width -100,
                                      child: Text(
                                          '${jobProvider.viewSingJobsModel?.organization?.pradeshName},'
                                          '${jobProvider.viewSingJobsModel?.organization?.districtName},'
                                          '${jobProvider.viewSingJobsModel?.organization?.muniName},'
                                          '${jobProvider.viewSingJobsModel?.organization?.ward}'

                                          ,maxLines: 2,
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
                                      child: Text('${jobProvider.viewSingJobsModel?.organization?.contactNumber}',maxLines: 1,overflow: TextOverflow.ellipsis,
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
                                      child: Text('${jobProvider.viewSingJobsModel?.organization?.email}',maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL)))
                                ],
                              )
                            ],
                          ),
                        ),


                      ],
                    ),

                    ///Service

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(AppConstants.Service_Provider_Details,
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${jobProvider.viewSingJobsModel?.serviceProvider?.name}',
                                style:TextStyle(color: ColorsResource.TEXT_GRAY_COLOR_LOW,fontSize: Dimensions.BODY_14),),
                              SizedBox(height: 8,),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                                  const SizedBox(width:5,),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width -100,
                                      child: Text(
                                          '${jobProvider.viewSingJobsModel?.serviceProvider?.pradeshName},'
                                          '${jobProvider.viewSingJobsModel?.serviceProvider?.districtName},'
                                          '${jobProvider.viewSingJobsModel?.serviceProvider?.muniName},'
                                          '${jobProvider.viewSingJobsModel?.serviceProvider?.ward!}'



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
                                      child: Text('${jobProvider.viewSingJobsModel?.serviceProvider?.mobile}',maxLines: 1,overflow: TextOverflow.ellipsis,
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
                                      child: Text('${jobProvider.viewSingJobsModel?.serviceProvider?.email}',maxLines: 1,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL)))
                                ],
                              )
                            ],
                          ),
                        ),


                      ],
                    ),

                    ///Details
                    SizedBox(height: 10,),
                    Text(AppConstants.basic_job_information,
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text( '${AppConstants.Category_of_Employment}',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                              ),
                              Text( '${jobProvider.viewSingJobsModel?.categoryName}',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                            ],
                          ),
                          // SizedBox(height: 8,),
                          // Row(
                          //   children: [
                          //     Text( '${AppConstants.Category_of_employment1} ',
                          //       style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                          //     ),
                          //     Text( 'Entry level',
                          //       style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                          //     ),
                          //   ],
                          // ),


                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text( '${AppConstants.Category_of_employment2} ',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                              ),
                              Text( '${jobProvider.viewSingJobsModel?.openings}',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text( '${AppConstants.Category_of_employment3} ',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                              ),
                              Text( ' ${jobProvider.viewSingJobsModel?.positionType}',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text( '${AppConstants.salary} ',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                              ),
                              Text( ' ${jobProvider.viewSingJobsModel?.salaryMin} - ${jobProvider.viewSingJobsModel?.salaryMax}',
                                style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Text(AppConstants.Job_description,
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                    ),
                    SizedBox(height: 8,),


                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: HtmlView('${jobProvider.viewSingJobsModel?.description}'),
                    ),
                    SizedBox(height: 10,),

                    Text(AppConstants.Work_required,
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                    ),
                    SizedBox(height: 8,),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImages.ic_point),
                                SizedBox(width: 10,),
                                Text( '${AppConstants.education}',
                                  style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text( ' ${jobProvider.viewSingJobsModel?.requiredEducation}',
                                    style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImages.ic_point),
                                SizedBox(width: 10,),
                                Text( '${AppConstants.Experience}',
                                  style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                                ),
                                SizedBox(width: 5,),
                                Text( ' ${jobProvider.viewSingJobsModel?.requiredExperience} ',
                                  style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImages.ic_point),
                                SizedBox(width: 10,),
                                Text( '${AppConstants.ship}',
                                  style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_BOLD),
                                ),
                                SizedBox(width: 5,),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width -80,
                                  child: HtmlView(' ${jobProvider.viewSingJobsModel?.specification} '),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              )
              //company info

            ],
          ),
        ),
      ),
    );
  }

  showCvDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
            child: Container(
              height: 205,
              child: Consumer<UtilProvider>(
                builder: (context,utilProvider,child)=>
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(3),
                          topLeft: Radius.circular(3),
                        ),
                        color: ColorsResource.PRAYMERY_COLOR,
                        border: Border.all(
                          color: ColorsResource.PRAYMERY_COLOR,
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
                                child: SvgPicture.asset(AppImages.ic_close)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),

                              Container(
                                  width: 200,
                                  height: 20,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(AppConstants.Your_CV,style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.PRAYMARY_TEXT_COLOR),))),
                              SizedBox(height: 5,),

                              Visibility(
                                visible: utilProvider.fileName == null ? false : true,
                                child: Container(
                                  decoration: cvBoxDecoration(),
                                  width: 200,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 150,
                                          margin:EdgeInsets.only(left: 10),
                                          child: Text( '${utilProvider.fileName}' ,style: TextStyle(fontSize: 10,color: ColorsResource.TEXT_BLACK_COLOR),)),

                                      Expanded(child: Container()),

                                      InkWell(
                                        onTap: (){
                                          utilProvider.setFileNamePath(null, null);

                                          filePath = utilProvider.filePath;
                                          fileName = utilProvider.fileName;
                                        },
                                        child: Container(
                                            margin:EdgeInsets.only(right: 10),
                                            child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.TEXT_BLACK_COLOR,)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: utilProvider.fileName == null ? 30 : 5,),

                              Container(
                                width: 200,
                                height: 20,
                                child: Container(
                                  width: 50,
                                  margin: EdgeInsets.only(left: 50,right: 50),
                                  child: addCv('Add CV',() async{
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
                                    if (result != null) {
                                      setState(() {
                                        utilProvider.setFileNamePath('${result.names[0]}', '${result.paths[0]}');
                                        fileName = '${result.names[0]}';
                                        filePath = '${result.paths[0]}';
                                        print(fileName);
                                      });
                                    } else {
                                      // User canceled the picker
                                    }
                                  }),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                  width: 200,
                                  height: 30,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(AppConstants.Keep_an_updated_CV,style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.PRAYMARY_TEXT_COLOR),))),
                              SizedBox(height: 5,),

                            ],
                          ),
                          CustomSearchButton( utilProvider.isLoading == true ? '${utilProvider.currentParsent}' : AppConstants.Apply, () async{

                            String? token = "";
                            final box = GetStorage();
                            token = box.read(AppConstants.TOKEN);
                            BaseOptions options = BaseOptions(
                                baseUrl: Apis.BASE_URL,
                                headers: {
                                  'Accept':'application/json',
                                  'Authorization': 'Bearer $token'}
                            );
                            Dio dio = Dio(options);


                            FormData formData;

                            if(fileName == null){
                              formData = FormData.fromMap({
                                "cv": "",
                              });
                            }else{
                              formData = FormData.fromMap({
                                "cv": await MultipartFile.fromFile('${utilProvider.filePath}', filename:'${utilProvider.fileName}'),
                              });
                            }










                            int id = widget.viewAllJobDataF.id!;
                            var response = await dio.post(
                              '${Apis.JOB_APPLAY_F}$id${Apis.JOB_APPLAY_L}',
                              data: formData,
                              onSendProgress: (int sent, int total) {
                                print("ppppp ${(sent / total *100).toStringAsFixed(0)}%  $sent $total");
                                setState(() {
                                  utilProvider.setCurrentPercent("${(sent / total *100).toStringAsFixed(0)}%");
                                  print('${utilProvider.currentParsent}');
                                  utilProvider.setUploading(true);

                                });
                              },
                              options: Options(
                                  followRedirects: false,
                                  validateStatus: (status) {
                                    return status! <= 500;
                                  }),
                            );

                            if(response.statusCode == 200){
                              Map map = response.data;
                              print('ghdsj ${map['message']}');

                              fileName = null;
                              filePath = null;
                              utilProvider.setUploading(false);
                              utilProvider.setFileNamePath(null, null);
                              utilProvider.setCurrentPercent('');
                              Navigator.pop(context);

                              setState(() {
                                applyButton = true;
                              });


                              if({map['message']} == 'Already Applied'){
                                String mm = map['message'];
                                showCustomSnackBar(mm, context,isError: false);
                              }else {
                                String mm = map['message'];
                                showCustomSnackBar(mm, context,isError: false);
                                //successDialog(AppConstants.You_have_successfully_applied_for_a_job);
                              }
                              Provider.of<JobProvider>(context,listen: false).getSingVewJob(widget.viewAllJobDataF.id!);

                            }else if(response.statusCode == 422){
                              Map map = response.data;
                              fileName = null;
                              filePath = null;
                              utilProvider.setUploading(false);
                              utilProvider.setFileNamePath(null, null);
                              utilProvider.setCurrentPercent('');
                            }else if(response.statusCode == 302){
                              Map map = response.data;
                              fileName = null;
                              filePath = null;
                              utilProvider.setUploading(false);
                              utilProvider.setFileNamePath(null, null);
                              utilProvider.setCurrentPercent('');
                              Navigator.pop(context);
                            }else if(response.statusCode == 500){
                              fileName = null;
                              filePath = null;
                              utilProvider.setUploading(false);
                              utilProvider.setFileNamePath(null, null);
                              utilProvider.setCurrentPercent('');
                              Navigator.pop(context);
                              showCustomSnackBar("Server error 1", context);
                            }else {
                              fileName = null;
                              filePath = null;
                              utilProvider.setUploading(false);
                              utilProvider.setFileNamePath(null, null);
                              utilProvider.setCurrentPercent('');
                              showCustomSnackBar("Server error 2", context);
                              Navigator.pop(context);
                            }



                          },height: 35,wight: 100,textSize: Dimensions.BODY_12,padding: 2
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });

  }
  cvBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.TEXT_GRAY_COLOR,
        width: 1,
      ),
    );
  }
  addCv(String name,Function() onTap){
    return InkWell(
      onTap: onTap,
      onHover: (value){
      },
      child: Container(
        height: 25,
        width: 20,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
              ),],
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: ColorsResource.TEXT_GRAY_COLOR_LOW
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(name,style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_10,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
        )
        ,),
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

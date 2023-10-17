import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/views/training_service_provider_screens/TainingServiceDetailsScreen.dart';
import 'package:lmiis/views/training_service_provider_screens/widgets/traning_service_item.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/TspModel.dart';
import '../../provider/ESSPProvider.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';

class TrainingServiceProvider extends StatefulWidget {
  const TrainingServiceProvider({Key? key}) : super(key: key);

  @override
  State<TrainingServiceProvider> createState() => _TrainingServiceProviderState();
}

class _TrainingServiceProviderState extends State<TrainingServiceProvider> {



  int pageCount = 1;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ESSPProvider>(context, listen: false).getVewAllTsp(pageCount);
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
          AppConstants.training_service_provider
        ),
      ),
        body: SingleChildScrollView(
          child: Consumer<ESSPProvider>(
            builder: (context,eSSPProvider,child) =>
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //     child: Container(
                  //       color: ColorsResource.PRAYMERY_COLOR,
                  //       child: Container(
                  //         width: MediaQuery
                  //             .of(context)
                  //             .size
                  //             .width,
                  //         height: MediaQuery
                  //             .of(context)
                  //             .size
                  //             .height * 0.050,
                  //         margin: EdgeInsets.only(top: 60, left: 10, right: 10),
                  //         child: Column(
                  //           children: [
                  //             //Toolbar
                  //             Row(
                  //               children: [
                  //                 InkWell(
                  //                     onHover: (_) {},
                  //                     onTap: () {
                  //                       Navigator.of(context).pop();
                  //                     },
                  //                     child: SvgPicture.asset(AppImages.ic_back_blue)),
                  //                 SizedBox(
                  //                   width: MediaQuery
                  //                       .of(context)
                  //                       .size
                  //                       .width - 65,
                  //                   child: Text(
                  //                     AppConstants.training_service_provider,
                  //                     style: TextStyle(
                  //                         fontSize: Dimensions.BODY_20,
                  //                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                  //                         color: ColorsResource.PRAYMARY_TEXT_COLOR),
                  //                     textAlign: TextAlign.center,
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  // ),

                  Expanded(
                      flex: 9,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: eSSPProvider.tspModel != null ?
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: eSSPProvider.tspData!.length,
                          itemBuilder: (BuildContext context, int index) {
                            TspData tspData =  eSSPProvider.tspData![index];
                            return TrainginServiceItem(tspData,(){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => TrainingServiceDetailsScreen(tspData.id!)));
                            });

                          },
                        ): Container(
                      child: const Align(
                      alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                  ),
                      )

                  )
                ],
              ),
            ),
          ),
        ),
    )


    ;
  }
}

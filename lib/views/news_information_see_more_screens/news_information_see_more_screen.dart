import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:lmiis/views/news_information_see_more_screens/widgets/custtom_search_button.dart';
import 'package:lmiis/views/news_information_see_more_screens/widgets/search_text_field.dart';
import 'package:lmiis/views/widgets/showCustomSnackBar.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/NewsNoticeModel.dart';
import '../../provider/NewNoticePrvide.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/dimensions.dart';
import '../home_screens/widgets/news_infomation_item.dart';

class NewsInformationSeeMoreScreen extends StatefulWidget {
  const NewsInformationSeeMoreScreen({Key? key}) : super(key: key);

  @override
  State<NewsInformationSeeMoreScreen> createState() =>
      _NewsInformationSeeMoreScreenState();
}

class _NewsInformationSeeMoreScreenState
    extends State<NewsInformationSeeMoreScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  var newsNoticeValueWord = AppConstants.Information;
  String newsNoticeHintValue = AppConstants.Information;
  final newsNoticeType = [AppConstants.Information, AppConstants.news];
  int newsNoticeId = 0;


  int pageCount = 1;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Provider.of<NewsNoticeProvider>(context, listen: false).getNewNotice(pageCount);

    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsResource.WHAIT,
      body: Consumer<NewsNoticeProvider>(
        builder: (context,newsNoticeProvider,child) =>
         WillPopScope(
          onWillPop: () {
            print('Backbutton pressed (device or appbar button), do whatever you want.');
            //trigger leaving and use own data
            Provider.of<NewsNoticeProvider>(context, listen: false).getNewNotice(1);
            Navigator.pop(context, false);
            return Future.value(false);
          },
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      color: ColorsResource.PRAYMERY_COLOR,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.063,
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Column(
                          children: [
                            //Toolbar
                            Row(
                              children: [
                                InkWell(
                                    onHover: (_) {},
                                    onTap: () {
                                      Provider.of<NewsNoticeProvider>(context, listen: false).getNewNotice(1);
                                      Navigator.of(context).pop();
                                    },
                                    child: SvgPicture.asset(AppImages.ic_back_blue)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 65,
                                  child: Text(
                                    AppConstants.information_news,
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
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 150,
                              child: CustomSearchTextFieldWithTitle(
                                AppConstants.search_by_title,
                                searchTextEditingController,
                                searchFocusNode,
                                height: 40,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 120,
                            child: selectNewInformationDropdown(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          CustomSearchButton(AppConstants.search_for, (){

                            String title = searchTextEditingController.text;

                            if(title == ''){
                              return showCustomSnackBar('Enter title',context);
                            }
                            showLoaderDialog(context);

                            newsNoticeProvider.searchNewNotice(title, newsNoticeId).then((value) {
                              if(value.isSuccess){
                                showCustomSnackBar(value.message,context,isError: false);
                              }else{
                                showCustomSnackBar(value.message,context);
                              }
                              Navigator.of(context).pop();
                            });
                          }, height: 25,
                              wight: 100,
                              textSize: Dimensions.BODY_10,
                              padding: 2)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                bottom: 50,
                child: newsNoticeProvider.newsNoticeModel != null ?
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: newsNoticeProvider.newsNoticeDataList!.length,
                  itemBuilder: (BuildContext context, int index){
                    NewsNoticeData newsNoticeData = newsNoticeProvider.newsNoticeDataList![index];
                    return NewsInformationItem(newsNoticeData);

                  },
                ): Container(
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,

                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 33,
                  child: Align(
                    alignment: Alignment.center,
                    child: newsNoticeProvider.newsNoticeModel != null ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: newsNoticeProvider.newsNoticeModel?.meta != null ? newsNoticeProvider.newsNoticeModel!.meta!.links!.length : 0,
                      itemBuilder: (BuildContext context, int index){
                        List<LinksMeta>? linkList = newsNoticeProvider.newsNoticeModel!.meta!.links!;
                        LinksMeta linkMeta = newsNoticeProvider.newsNoticeModel!.meta!.links![index];
                        int lastItemIndexNumber = linkList.length - 1;

                        if(index == 0){
                          return InkWell(
                            onTap: (){
                              if(linkMeta.url != null){
                                pageCount = pageCount - 1;
                                print('fshdghdsh${pageCount }');
                                Provider.of<NewsNoticeProvider>(context, listen: false).getNewNotice(pageCount);
                              }else{
                                showCustomSnackBar('No more page', context);

                              }
                            },
                            child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: selectNextButtonBoxDecoration(),
                                  width: 20,
                                  height: 15,
                                  child: Container(
                                      width: 10,
                                      height: 10,
                                      margin: EdgeInsets.all(3),
                                      child: SvgPicture.asset(AppImages.ic_back_forword,width: 10, height: 10,)),
                                ),
                          );
                        }else if (index == lastItemIndexNumber){
                          return InkWell(
                            onTap: (){
                              if(linkMeta.url != null){
                                pageCount = pageCount +1;
                                print('fshdghdsh${pageCount }');
                                Provider.of<NewsNoticeProvider>(context, listen: false).getNewNotice(pageCount);
                              }else{
                                showCustomSnackBar('No more page', context);

                              }
                            },
                            child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: unselectNextButtonBoxDecoration(),
                                  width: 22,
                                  height: 22,
                                  child: Container(
                                      margin: EdgeInsets.all(2),
                                      child: SvgPicture.asset(AppImages.ic_forword,))),
                          );
                        }else {
                         return InkWell(
                           onTap: (){
                             pageCount = int.parse(linkMeta.label!);
                             Provider.of<NewsNoticeProvider>(context, listen: false).getNewNotice(pageCount);
                           },
                           child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: linkMeta.active == true?  selectPossitionButtonBoxDecoration() : unselectPossitionButtonBoxDecoration(),
                                width: 22,
                                height: 22,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text('${linkMeta.label}',textAlign: TextAlign.center, style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR),))),
                              ),
                         );
                        }
                      },
                    ): Container(
                      child: const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectNewInformationDropdown() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: myBoxDecoration(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: DropdownButton<String>(
            elevation: 16,
            isExpanded: true,
            style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            hint: Text(
              newsNoticeHintValue,
              style: TextStyle(
                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                  fontSize: Dimensions.BODY_16,
                  color: ColorsResource.TEXT_GRAY_COLOR),
            ),
            iconSize: 30,
            value: newsNoticeValueWord,
            //add this parameter
            items: newsNoticeType.map((String dropDownStringItem) {
              return DropdownMenuItem(
                value: dropDownStringItem,
                child: Text(
                  dropDownStringItem,
                  style: TextStyle(
                      fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_16,
                      color: dropDownStringItem !=
                              AppConstants.Please_choose_a_password
                          ? ColorsResource.TEXT_BLACK_COLOR
                          : ColorsResource.TEXT_GRAY_COLOR),
                ),
              );
            }).toList(),
            onChanged: (selectedValue) {
              setState(() {
                newsNoticeValueWord = selectedValue!;
                newsNoticeHintValue = selectedValue;

                if( newsNoticeValueWord == AppConstants.Information){
                  newsNoticeId = 0;
                }else if(newsNoticeValueWord == AppConstants.news){
                  newsNoticeId = 1;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.PRAYMARY_TEXT_COLOR,
        width: 1,
      ),
    );
  }

  selectNextButtonBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: ColorsResource.TEXT_GRAY_COLOR_LOW,
      border: Border.all(
        color: ColorsResource.TEXT_GRAY_COLOR_LOW,
        width: 1,
      ),
    );
  }
  unselectNextButtonBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.TEXT_GRAY_COLOR_LOW,
        width: 1,
      ),
    );
  }
  selectPossitionButtonBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.PRAYMARY_TEXT_COLOR,
        width: 2,
      ),
    );
  }
  unselectPossitionButtonBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.TEXT_GRAY_COLOR,
        width: 1,
      ),
    );
  }



}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/NewsNoticeModel.dart';
import '../../provider/NewNoticePrvide.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/dimensions.dart';
import '../news_information_see_more_screens/widgets/search_text_field.dart';
import '../widgets/HtmlView.dart';

class NewsInformationDetailsScreens extends StatefulWidget {
  bool isNews = false;
  NewsNoticeData newsNoticeData;
  NewsInformationDetailsScreens(this.isNews, this.newsNoticeData);

  @override
  State<NewsInformationDetailsScreens> createState() => _NewsInformationDetailsScreensState();
}

class _NewsInformationDetailsScreensState extends State<NewsInformationDetailsScreens> {




  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewsNoticeProvider>(context,listen: false).getNewNoticeSingle(widget.newsNoticeData.id);
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              !widget.isNews ? AppConstants.news: AppConstants.information,
              style: const TextStyle(
                  fontSize: Dimensions.BODY_20,
                  fontWeight: Dimensions.FONT_BOLD,
                  color: Colors.white),
    
            ),SizedBox(width: 10,),  
            SvgPicture.asset( !widget.isNews ? AppImages.ic_news_blue: AppImages.ic_info_notification,color: Colors.white,)
          ],
        ),
      ),
      backgroundColor: ColorsResource.WHAIT,
      body: Consumer<NewsNoticeProvider>(
        builder: (context,newsNoticeProvider,child) =>
            Column(
            children: [
              // Expanded(
              //   flex: 1,
              //   child:  Container(
              //     color: ColorsResource.PRAYMERY_COLOR,
              //     child: Container(
              //       width: MediaQuery.of(context).size.width,
              //       height: MediaQuery.of(context).size.height * 0.055,
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
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       !widget.isNews ? AppConstants.news: AppConstants.information,
              //                       style: TextStyle(
              //                           fontSize: Dimensions.BODY_20,
              //                           fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
              //                           color: ColorsResource.PRAYMARY_TEXT_COLOR),
              //                       textAlign: TextAlign.center,
              //                     ),
              //                     SizedBox(width: 10,),
              //                     SvgPicture.asset( !widget.isNews ? AppImages.ic_news_blue: AppImages.ic_info_notification)

              //                   ],
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
                  flex: 8,
                  child: newsNoticeProvider.newNoticeSingleModel != null ? SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Column(
                        children: [
                          Container(

                            child: Text(
                              '${newsNoticeProvider.newNoticeSingleModel!.title}',
                              style: TextStyle(fontSize: Dimensions.BODY_20,fontWeight: Dimensions.FONT_MEDIUM),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.ic_location),
                                  SizedBox(width:5,),
                                  Text('${newsNoticeProvider.newNoticeSingleModel!.location}',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_GRAY_COLOR),)
                                ],
                              ),
                              Expanded(child: Container()),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.ic_calender),
                                  SizedBox(width:5,),
                                  Text('${newsNoticeProvider.newNoticeSingleModel!.publishedDate}',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_GRAY_COLOR))
                                ],
                              ),
                              SizedBox(width:10,),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 1,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,),
                          SizedBox(height: 10,),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   child: Text('${newsNoticeProvider.newNoticeSingleModel!.description}',
                          //   style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR),
                          //   ),
                          // )
                    SingleChildScrollView(

                      child: HtmlView('${newsNoticeProvider.newNoticeSingleModel!.description}')

                      // Html(
                      //   data: '${newsNoticeProvider.newNoticeSingleModel!.description}',
                      //   tagsList: Html.tags..addAll(["bird", "flutter"]),
                      //   style: {
                      //
                      //     "table": Style(
                      //       backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                      //     ),
                      //     "tr": Style(
                      //       border: Border(bottom: BorderSide(color: Colors.grey)),
                      //     ),
                      //     "th": Style(
                      //       padding: EdgeInsets.all(6),
                      //       backgroundColor: Colors.grey,
                      //     ),
                      //     "td": Style(
                      //       padding: EdgeInsets.all(6),
                      //       alignment: Alignment.topLeft,
                      //     ),
                      //     'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                      //   },
                      //   customRender: {
                      //     "table": (context, child) {
                      //       return SingleChildScrollView(
                      //         scrollDirection: Axis.horizontal,
                      //         child:
                      //         (context.tree as TableLayoutElement).toWidget(context),
                      //       );
                      //     },
                      //
                      //     "bird": (RenderContext context, Widget child) {
                      //       return TextSpan(text: "🐦");
                      //     },
                      //
                      //     "flutter": (RenderContext context, Widget child) {
                      //       return FlutterLogo(
                      //         style: (context.tree.element!.attributes['horizontal'] != null)
                      //             ? FlutterLogoStyle.horizontal
                      //             : FlutterLogoStyle.markOnly,
                      //         textColor: context.style.color!,
                      //         size: context.style.fontSize!.size! * 5,
                      //       );
                      //     },
                      //   },
                      //   customImageRenders: {
                      //     networkSourceMatcher(domains: ["flutter.dev"]):
                      //         (context, attributes, element) {
                      //       return FlutterLogo(size: 36);
                      //     },
                      //     networkSourceMatcher(domains: ["mydomain.com"]):
                      //     networkImageRender(
                      //       headers: {"Custom-Header": "some-value"},
                      //       altWidget: (alt) => Text(alt ?? ""),
                      //       loadingWidget: () => Text("Loading..."),
                      //     ),
                      //     // On relative paths starting with /wiki, prefix with a base url
                      //         (attr, _) =>
                      //     attr["src"] != null && attr["src"]!.startsWith("/wiki"):
                      //     networkImageRender(
                      //         mapUrl: (url) => "https://upload.wikimedia.org" + url!),
                      //     // Custom placeholder image for broken links
                      //     networkSourceMatcher():
                      //     networkImageRender(altWidget: (_) => FlutterLogo()),
                      //   },
                      //   onLinkTap: (url, _, __, ___) {
                      //     print("Opening $url...");
                      //   },
                      //   onImageTap: (src, _, __, ___) {
                      //     print(src);
                      //   },
                      //   onImageError: (exception, stackTrace) {
                      //     print(exception);
                      //   },
                      //   onCssParseError: (css, messages) {
                      //     print("css that errored: $css");
                      //     print("error messages:");
                      //     messages.forEach((element) {
                      //       print(element);
                      //     });
                      //   },
                      // ),
                    ),
                        ],
                      ),
                    ),
                  ) : Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
              )
            ],
          ),
      ),
    );
  }
}

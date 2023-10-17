import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmiis/models/ResponsModels/latest_job..dart';
import 'package:lmiis/provider/AuthProvider.dart';
import 'package:lmiis/utils/Apis.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:lmiis/utils/dimensions.dart';
import 'package:lmiis/views/download_screen/presentation/download_screen.dart';
import 'package:lmiis/views/employment_list_screens/employment_list_screen.dart';
import 'package:lmiis/views/employment_list_screens/widgets/latest_job_card.dart';
import 'package:lmiis/views/home_screens/widgets/news_infomation_item.dart';
import 'package:lmiis/views/login_screens/logIn_screen.dart';
import 'package:lmiis/views/my_profile_screens/EditMyProfileScreen.dart';
import 'package:lmiis/views/news_information_see_more_screens/news_information_see_more_screen.dart';
import 'package:lmiis/views/training_screens/widgets/latest_training_card.dart';
import 'package:lmiis/views/widgets/custtom_button.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/datasource/remote/dio/dio_client.dart';
import '../../models/ResponsModels/NewsNoticeModel.dart';
import '../../models/ResponsModels/latest_training_model.dart';
import '../../provider/MyProfileProvider.dart';
import '../../provider/NewNoticePrvide.dart';
import '../about_us/presentation/about_us_screen.dart';
import '../employment_support_service_Screens/employment_support_service_screen.dart';
import '../my_profile_screens/ChnagePassword.dart';
import '../my_profile_screens/MyProfileScreen.dart';
import '../notification_screens/notification_screen.dart';
import '../training_screens/TrainingScreen.dart';
import '../training_service_provider_screens/TrainingServiceProviderScreen.dart';
import '../widgets/showCustomSnackBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int countpage = 1;
  late Future<List<LatestTrainingModel>> fnewlatestTraining;
  late Future<List<LatestJobModel>> fnewlatestJobs;
  @override
  void initState() {
    fnewlatestTraining = ApiClient().newgetLatestTraining();
    fnewlatestJobs = ApiClient().newgetLatestJobs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsNoticeProvider>(context, listen: false)
          .getNewNotice(countpage);
      Provider.of<MyProfileProvider>(context, listen: false).getMyProfile();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String token = box.read(AppConstants.TOKEN) ?? '';

    return riverpod.ProviderScope(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => {_scaffoldKey.currentState?.openDrawer()},
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Container(
                    margin: const EdgeInsets.all(6),
                    child: SvgPicture.asset(AppImages.ic_menu)),
              ),
            ),
            backgroundColor: ColorsResource.PRAYMARY_TEXT_COLOR,
            elevation: 0,
            centerTitle: true,
            actions: [
              token.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen()));
                      },
                      onHover: (_) {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(
                          AppImages.ic_notificaton,
                          height: 28,
                        ),
                      ))
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12, top: 14),
                        child: Text(
                          "लग - इन",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )
            ],
            title: Text(
              AppConstants.APP_NAME,
              style: TextStyle(
                  color: ColorsResource.WHAIT,
                  fontSize: Dimensions.BODY_30,
                  fontWeight: Dimensions.FONT_BOLD),
            )),
        backgroundColor: ColorsResource.WHAIT,
        drawer: drawerLayout(),
        body: RefreshIndicator(
          onRefresh: () async {
            ApiClient().newgetLatestTraining();
            ApiClient().newgetLatestJobs();
            Provider.of<NewsNoticeProvider>(context, listen: false)
                .getNewNotice(countpage);
            Provider.of<MyProfileProvider>(context, listen: false)
                .getMyProfile();
          },
          child: Consumer<NewsNoticeProvider>(
              builder: (context, newsNoticeProvider, child) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 5, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.92,
                          decoration: myBoxDecorationTop(),
                          height: MediaQuery.of(context).size.height * 0.150,
                          child: InkWell(
                            onHover: (_) {},
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmploymentListScreen()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.ic_employment),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppConstants.employment,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                      fontSize: Dimensions.BODY_14,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.92,
                          decoration: myBoxDecorationTop(),
                          height: MediaQuery.of(context).size.height * 0.150,
                          child: InkWell(
                            onHover: (_) {},
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TrainingScreen()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.ic_training),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppConstants.training,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                      fontSize: Dimensions.BODY_14,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.92,
                          decoration: myBoxDecorationTop(),
                          height: MediaQuery.of(context).size.height * 0.150,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmploymentSupportServiceScreen()));
                            },
                            onHover: (_) {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages
                                    .ic_employment_support_service_provider),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppConstants
                                      .employment_support_service_provider,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                      fontSize: Dimensions.BODY_14,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, right: 10, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.92,
                          decoration: myBoxDecorationTop(),
                          height: MediaQuery.of(context).size.height * 0.150,
                          child: InkWell(
                            onHover: (_) {},
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TrainingServiceProvider()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages
                                    .ic_employment_support_service_provider),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppConstants.training_service_provider,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                      fontSize: Dimensions.BODY_14,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Text(
                                  AppConstants.jobTrainingTitle,
                                  style: TextStyle(
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,
                          ),
                          //Latest Jobs//

                          // FutureBuilder<List<LatestJobModel>>(
                          //     future: fnewlatestJobs,
                          //     builder: (context, snapshot) {
                          //       log(snapshot.stackTrace.toString());
                          //       return Text("data");
                          //     }),
                          FutureBuilder<List<LatestJobModel>>(
                              future: fnewlatestJobs,
                              builder: (context, snapshot) {
                                log("${snapshot.data}ddddd");
                                if (snapshot.hasData) {
                                  return snapshot.data!.isNotEmpty
                                      ? ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length == 1
                                              ? 1
                                              : 2,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            LatestJobModel latestJobModel =
                                                snapshot.data![index];
                                            return LatestJobCard(
                                                latestJobModel);
                                          },
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text(AppConstants
                                              .noLatestTrainingAndJob),
                                        );
                                } else {
                                  return Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 5,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.120,
                                        ),
                                      ));
                                }
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          //Latest Training//
                          FutureBuilder<List<LatestTrainingModel>>(
                              future: fnewlatestTraining,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!.isNotEmpty
                                      ? ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: 2,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            LatestTrainingModel latestTraining =
                                                snapshot.data![index];
                                            return LatestTrainingCard(
                                                latestTraining);
                                          },
                                        )
                                      : const SizedBox.shrink();
                                } else {
                                  return Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 5,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                        ),
                                      ));
                                }
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppConstants.information_news,
                                  style: TextStyle(
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ),
                                CustomButton(
                                    AppConstants.see_more,
                                    () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NewsInformationSeeMoreScreen()))
                                        },
                                    height: 25,
                                    wight: 115,
                                    textSize: Dimensions.BODY_10,
                                    padding: 2)
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,
                          ),
                          newsNoticeProvider.newsNoticeModel != null
                              ? newsNoticeProvider
                                      .newsNoticeModel!.data!.isNotEmpty
                                  ? ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: newsNoticeProvider
                                          .newsNoticeDataList!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        NewsNoticeData newsNoticeData =
                                            newsNoticeProvider
                                                .newsNoticeDataList![index];
                                        return NewsInformationItem(
                                            newsNoticeData);
                                      },
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(AppConstants.noNewsAvailable),
                                    )
                              : Container(
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const Text(""),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  myBoxDecorationTop() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorsResource.PRAYMERY_COLOR,
      border: Border.all(
        color: ColorsResource.PRAYMERY_COLOR,
        width: 1,
      ),
    );
  }

  drawerLayout() {
    return Drawer(
      child: Consumer2<AuthProvider, MyProfileProvider>(
          builder: (context, authProvider, myProfileProvider, child) {
        final box = GetStorage();
        String? token = box.read(AppConstants.TOKEN) ?? '';
        log("sds");
        log('${token.isEmpty}');

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  token.isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: DrawerHeader(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: Container(
                                            margin: const EdgeInsets.all(10),
                                            child: myProfileProvider
                                                        .myProfileModel
                                                        ?.data
                                                        ?.file !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl:
                                                        '${Apis.IMAGE_URL}${myProfileProvider.myProfileModel?.data?.file}',
                                                    placeholder: (context, url) =>
                                                        Image.asset(AppImages
                                                            .ic_demo_person),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Image.asset(AppImages
                                                            .ic_demo_person))
                                                : Image.asset(AppImages.ic_demo_person)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 20, left: 10),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${myProfileProvider.myProfileModel?.data?.name}",
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_16,
                                                  fontWeight:
                                                      Dimensions.FONT_MEDIUM,
                                                  color: ColorsResource
                                                      .PRAYMARY_TEXT_COLOR),
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${myProfileProvider.myProfileModel?.data?.email}",
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  fontWeight:
                                                      Dimensions.FONT_MEDIUM,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR),
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyProfileScreen()));
                                },
                                onHover: (value) {},
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 20,
                                          minHeight: 20,
                                          maxWidth: 20,
                                          maxHeight: 20,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImages.ic_profile_l,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            AppConstants.Profile,
                                            style: TextStyle(
                                                fontSize: Dimensions.BODY_16,
                                                color: ColorsResource
                                                    .PRAYMARY_TEXT_COLOR),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditMyProfileScreen()));
                                },
                                onHover: (value) {},
                                child: ListTile(
                                  title: Container(
                                    child: Row(
                                      children: [
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 20,
                                            minHeight: 20,
                                            maxWidth: 20,
                                            maxHeight: 20,
                                          ),
                                          child: SvgPicture.asset(
                                            AppImages.ic_edite_l,
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              AppConstants.Edit_profile,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_16,
                                                  color: ColorsResource
                                                      .PRAYMARY_TEXT_COLOR),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChnagePassword()));
                              },
                              onHover: (_) {},
                              child: ListTile(
                                title: Container(
                                  child: Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 20,
                                          minHeight: 20,
                                          maxWidth: 20,
                                          maxHeight: 20,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImages.ic_change_key,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            AppConstants.Change_the_password,
                                            style: TextStyle(
                                                fontSize: Dimensions.BODY_16,
                                                color: ColorsResource
                                                    .PRAYMARY_TEXT_COLOR),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox(
                          height: 100,
                        ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EmploymentListScreen()));
                    },
                    onHover: (_) {},
                    child: ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: SvgPicture.asset(
                                AppImages.ic_employment,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  AppConstants.employment,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_16,
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TrainingScreen()));
                    },
                    onHover: (_) {},
                    child: ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: SvgPicture.asset(
                                AppImages.ic_training,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  AppConstants.training,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_16,
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EmploymentSupportServiceScreen()));
                    },
                    onHover: (_) {},
                    child: ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: SvgPicture.asset(
                                AppImages
                                    .ic_employment_support_service_provider,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  AppConstants
                                      .employment_support_service_provider,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_16,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) =>
                  //                 const TrainingServiceProvider()));
                  //   },
                  //   onHover: (_) {},
                  //   child: ListTile(
                  //     title: Container(
                  //       child: Row(
                  //         children: [
                  //           ConstrainedBox(
                  //             constraints: const BoxConstraints(
                  //               minWidth: 20,
                  //               minHeight: 20,
                  //               maxWidth: 20,
                  //               maxHeight: 20,
                  //             ),
                  //             child: SvgPicture.asset(
                  //               AppImages
                  //                   .ic_employment_support_service_provider,
                  //               width: 20,
                  //               height: 20,
                  //             ),
                  //           ),
                  //           Padding(
                  //               padding: const EdgeInsets.only(left: 10),
                  //               child: Text(
                  //                 AppConstants.training_service_provider,
                  //                 style: TextStyle(
                  //                     fontSize: Dimensions.BODY_16,
                  //                     color:
                  //                         ColorsResource.PRAYMARY_TEXT_COLOR),
                  //               ))
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TrainingServiceProvider()));
                    },
                    onHover: (_) {},
                    child: ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: SvgPicture.asset(
                                AppImages
                                    .ic_employment_support_service_provider,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  AppConstants.training_service_provider,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_16,
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUsScreen()));
                    },
                    onHover: (_) {},
                    child: ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: SvgPicture.asset(
                                AppImages
                                    .ic_employment_support_service_provider,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  AppConstants.aboutUs,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_16,
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DownloadScreen()));
                    },
                    onHover: (_) {},
                    child: ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                              child: SvgPicture.asset(
                                AppImages
                                    .ic_employment_support_service_provider,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  AppConstants.download,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_16,
                                      color:
                                          ColorsResource.PRAYMARY_TEXT_COLOR),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  token.isNotEmpty
                      ? Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const HomeScreen()),
                                  (Route<dynamic> route) => false);
                            },
                            onHover: (_) {},
                            child: ListTile(
                              title: InkWell(
                                onTap: () {
                                  authProvider.logOut().then((value) {
                                    if (value.isSuccess) {
                                      Navigator.of(context).pop();
                                      final box = GetStorage();
                                      box.write(AppConstants.USER_EMAIL, '');
                                      box.write(AppConstants.USER_PASSWORD, '');
                                      box.write(AppConstants.TOKEN, '');
                                      showCustomSnackBar(value.message, context,
                                          isError: false);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const HomeScreen()),
                                          (Route<dynamic> route) => false);
                                    } else {
                                      Navigator.of(context).pop();
                                      showCustomSnackBar(
                                          value.message, context);
                                    }
                                  });
                                },
                                onHover: (_) {},
                                child: Row(
                                  children: [
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        minWidth: 34,
                                        minHeight: 34,
                                        maxWidth: 34,
                                        maxHeight: 34,
                                      ),
                                      child: SvgPicture.asset(
                                          AppImages.bx_log_out),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          AppConstants.LogOut,
                                          style: TextStyle(
                                              fontSize: Dimensions.BODY_16,
                                              color: ColorsResource
                                                  .TEXT_READ_COLOR),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

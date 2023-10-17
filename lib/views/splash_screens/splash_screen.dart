import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmiis/provider/LocationProvider.dart';
import 'package:lmiis/views/home_screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../utils/AppConstants.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).getPradesh();
      Provider.of<LocationProvider>(context, listen: false).tGetPradesh();
      Provider.of<LocationProvider>(context, listen: false).getJobCategory();
      Provider.of<LocationProvider>(context, listen: false).getDocumentType();
      Provider.of<LocationProvider>(context, listen: false).getGender();
      Provider.of<LocationProvider>(context, listen: false).getWard();
      Provider.of<LocationProvider>(context, listen: false)
          .getMunicipalitiesAll();
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ColorsResource.PRAYMERY_COLOR,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                    child: SvgPicture.asset(
                  AppImages.ic_logo,
                  width: 227,
                  height: 227,
                )),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        Text(
                          AppConstants.poweredBy,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsResource.TEXT_GRAY_COLOR,
                              fontSize: Dimensions.BODY_10,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        Text(
                          AppConstants.COPY_RIGHT_BOTTOM,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsResource.TEXT_GRAY_COLOR,
                              fontSize: Dimensions.BODY_10,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

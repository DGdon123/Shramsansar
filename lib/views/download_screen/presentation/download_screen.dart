import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmiis/data/datasource/remote/dio/dio_client.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/AppConstants.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';
import '../data/model/download_model.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  late Future<List<DownloadModel>> _future;
  @override
  void initState() {
    // TODO: implement initState
    _future = ApiClient().downloadFile();
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
            AppConstants.download,
          ),
        ),
        body: FutureBuilder<List<DownloadModel>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...data!.map((e) {
                      String description =
                          e.description.replaceAll(RegExp(r'<[^>]*>'), '');
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsResource.PRAYMARY_TEXT_COLOR),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleValue(
                              title: "शीर्षक : ",
                              value: e.title,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            TitleValue(
                              title: "प्रकाशित भएको : ",
                              value: e.published_at,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            // HtmlView(e.description),
                            TitleValue(
                              title: "विवरण : ",
                              value: description,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white),
                                label: Text(
                                  "डाउनलोड फाइल",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsResource
                                              .PRAYMARY_TEXT_COLOR),
                                ),
                                icon: Icon(
                                  Icons.file_download_outlined,
                                  color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                ),
                                onPressed: () {
                                  openFile(
                                    url:
                                        "http://shramsansar.koshi.gov.np${e.download_file}",
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              );
              // return Html(
              //   shrinkWrap: true,
              //   data: snapshot.data!.aboutUs,
              //   style: {
              //     "p": Style(
              //       lineHeight: const LineHeight(1.2),
              //       fontSize: const FontSize(20.0),
              //     ),
              //     "body": Style(
              //       lineHeight: const LineHeight(1),
              //       fontSize: const FontSize(22.0),
              //     )
              //   },
              // );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ));
  }

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split("/").last;
    final file = await downloadFile(url, name);
    if (file == null) return;
    print("paht${file.path}");
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: Duration.zero));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}

class TitleValue extends StatelessWidget {
  const TitleValue({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal),
            )
          ]),
    );
  }
}

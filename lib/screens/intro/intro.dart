import 'dart:async';
import 'package:app_find_job/core/constants/color_constants.dart';
import 'package:app_find_job/core/helpers/asset_helper.dart';
import 'package:app_find_job/core/helpers/image_helper.dart';
import 'package:app_find_job/main_app.dart';
import 'package:app_find_job/main_page.dart';
import 'package:app_find_job/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_find_job/core/constants/textstyle_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const routeName = '/IntroPage';
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add((_pageController.page!.toInt()));
    });
  }

  Widget _buildItemIntroPage(
    String image,
    String title,
    String description,
    AlignmentGeometry alignment,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            // width: 380,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.defaultStyle.fontHeader.bold),
              const SizedBox(height: 30),
              Text(description, style: TextStyles.defaultStyle),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroPage(
                AssetHelper.intro1,
                'Ho??n Thi???n h??? s?? xin vi???c',
                'Chu???n b??? h??? s?? xin vi???c ???n t?????ng v?? chuy??n nghi???p.',
                Alignment.centerLeft,
              ),
              _buildItemIntroPage(
                AssetHelper.intro2,
                'Ch??? ?????ng t??m vi???c',
                'T??m v?? ???ng tuy???n c??ng vi???c nhanh ch??ng v?? nh??? nh??ng.',
                Alignment.center,
              ),
              _buildItemIntroPage(
                AssetHelper.intro3,
                'Nh???n c?? h???i h???p d???n',
                'Nh?? tuy???n d???ng ch??? ?????ng t??m ki???m b???n qua CV ???? c?? tr??n app, nh???n ngay l???i m???i h???p d???n.',
                Alignment.centerRight,
              ),
            ],
          ),
          Positioned(
            left: 25,
            right: 25,
            bottom: 75,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 16,
                      dotHeight: 16,
                      activeDotColor: ColorPalette.primaryColor,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 4,
                        child: ButtonWidget(
                          title: snapshot.data != 2 ? 'Ti???p T???c' : 'B???t ?????u',
                          onTap: () {
                            if (_pageController.page != 2) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 2000),
                                  curve: Curves.easeIn);
                            } else {
                              Navigator.of(context)
                                  .pushNamed(MainPage.routeName);
                            }
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

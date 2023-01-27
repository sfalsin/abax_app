import '../onboarding_screen/widgets/slidergastosmensais_item_widget.dart';
import 'controller/onboarding_controller.dart';
import 'models/slidergastosmensais_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray101,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 52,
                leading: GestureDetector(
                    onTap: () {
                      onTapReturn();
                    },
                    child: Container(
                        margin: getMargin(left: 16, top: 10, bottom: 10),
                        decoration: AppDecoration.outlineBlack90019.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder18),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(all: 8),
                                      child: InkWell(
                                          onTap: () {
                                            onTapImgArrowleft();
                                          },
                                          child: CommonImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowleft,
                                              height: getSize(20.00),
                                              width: getSize(20.00)))))
                            ]))),
                actions: [
                  Padding(
                      padding:
                          getPadding(left: 16, top: 17, right: 16, bottom: 16),
                      child: Text("lbl_pular".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold18
                              .copyWith(height: 1.22)))
                ]),
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: getVerticalSize(275.00),
                              width: size.width,
                              margin: getMargin(top: 9),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: getPadding(bottom: 10),
                                            child: CommonImageView(
                                                imagePath:
                                                    ImageConstant.imgImage7,
                                                height: getVerticalSize(207.00),
                                                width: getHorizontalSize(
                                                    360.00)))),
                                    /*Padding(
                                        padding: getPadding(
                                            left: 44, top: 10, right: 44),
                                        child: Obx(() => CarouselSlider.builder(
                                            options: CarouselOptions(
                                                height: getVerticalSize(173.00),
                                                initialPage: 0,
                                                autoPlay: true,
                                                viewportFraction: 1.0,
                                                enableInfiniteScroll: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                onPageChanged: (index, reason) {
                                                  controller.silderIndex.value =
                                                      index;
                                                }),
                                            itemCount: controller
                                                .onboardingModelObj
                                                .value
                                                .slidergastosmensaisItemList
                                                .length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              SlidergastosmensaisItemModel
                                                  model = controller
                                                          .onboardingModelObj
                                                          .value
                                                          .slidergastosmensaisItemList[
                                                      index];
                                              return SlidergastosmensaisItemWidget(
                                                  model);
                                            }))) */
                                  ]))),
                      Container(
                          height: getVerticalSize(6.00),
                          margin: getMargin(left: 16, top: 27, right: 16),
                          child: SmoothIndicator(
                              offset: 1,
                              count: 2,
                              axisDirection: Axis.horizontal,
                              effect: ScrollingDotsEffect(
                                  spacing: 8,
                                  activeDotColor: ColorConstant.blueA400,
                                  dotColor: ColorConstant.gray400,
                                  dotHeight: getVerticalSize(6.00),
                                  dotWidth: getHorizontalSize(6.00)))),
                      Padding(
                          padding: getPadding(left: 16, top: 38, right: 16),
                          child: Text("msg_consumo_consiente".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold20
                                  .copyWith(height: 1.25))),
                      Container(
                          width: getHorizontalSize(328.00),
                          margin: getMargin(left: 16, top: 26, right: 16),
                          child: Text("msg_veja_como_voc_tem".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterMedium16
                                  .copyWith(height: 1.13))),
                      CustomButton(
                          width: 328,
                          text: "lbl_pr_ximo".tr,
                          margin: getMargin(
                              left: 16, top: 163, right: 16, bottom: 5),
                          onTap: onTapPrximo)
                    ])))));
  }

  onTapPrximo() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.onboardingOneScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }
}

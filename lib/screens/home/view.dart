import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/base/index.dart';
import 'package:ielts/index.dart';
import 'package:ielts/widget/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUi extends BaseView<HomeController> {
  @override
  Widget body(BuildContext context) {
    return Container(
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              // appBarTitleText: "Home",
              showBackScreen: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 20.h),
            infoUser(),
            SizedBox(height: 36.h),
            skill(),
            SizedBox(height: 36.h),
            remindWidget(),
          ],
        ),
      ),
    );
  }

  Widget infoUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hi Mike!",
                      style: StyleApp.headlineNormal(),
                    ),
                    const SizedBox(width: 16),
                    Image(
                      width: 28.w,
                      height: 28.w,
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.wave),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome Ielts Lydia",
                  style: StyleApp.headlineBold(
                    color: Color(0xff153D7B),
                    fontSize: 19.sp,
                  ),
                )
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget skill() {
    double borderRadius = 25;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: extraLargePadding),
      child: Column(
        children: [
          mocktestWidget(),
          SizedBox(height: largePadding),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: skillIelts(
                    nameSkill: "Speaking",
                    imagePath: AppImages.conversation,
                    onPress: () {
                      Get.toNamed(RouterNames.LEVEL_SKILL);
                    },
                  ),
                ),
                SizedBox(width: padding),
                Expanded(
                  child: skillIelts(
                    nameSkill: "Writing",
                    imagePath: AppImages.writing,
                    onPress: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mocktestWidget() {
    double borderRadius = 25;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: largePadding,
        vertical: largePadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColors.colorCardPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Mock tests",
                style: StyleApp.titleBold(
                  color: const Color(0xff153D7B),
                ),
              ),
              SizedBox(height: largePadding),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: halfPadding.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.colorPrimaryApp,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  children: [
                    Text(
                      "JOIN",
                      style: StyleApp.titleButton(),
                    ),
                    SizedBox(width: padding),
                    const Icon(
                      AppIcons.next,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Image(
              width: 120.w,
              fit: BoxFit.fill,
              image: AssetImage(AppImages.computer),
            ),
          ),
        ],
      ),
    );
  }

  Widget skillIelts({required String nameSkill, required String imagePath, required Function onPress}) {
    double borderRadius = 25;
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: Get.width / 3,
        padding: EdgeInsets.only(
          // left: 20,
          // right: 20,
          top: largePadding,
          bottom: padding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: AppColors.colorBoldCardPrimary,
        ),
        child: Column(
          children: [
            Image(
              width: 60.w,
              // height: 40.w,
              fit: BoxFit.fill,
              image: AssetImage(
                imagePath,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 5,
                  child: Text(
                    nameSkill,
                    style: StyleApp.titleNormal(color: Colors.white),
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 19.w,
                      height: 19.w,
                      decoration: const BoxDecoration(
                        color: AppColors.colorCardPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      right: -10,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.colorWhite,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.navigate_next,
                          size: 22,
                          color: Color(0xff396BBD),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget remindWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "You are practicing here",
              style: StyleApp.headlineBold(fontSize: 16.sp),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: padding10),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return itemRemind(index);
            },
          )
        ],
      ),
    );
  }

  Widget itemRemind(int index) {
    double borderRadius = 18;
    return Container(
      margin: EdgeInsets.only(bottom: halfPadding),
      decoration: BoxDecoration(
        color: index == 0 ? Get.theme.cardColor : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: index == 0
            ? [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 20),
                  color: Get.theme.shadowColor.withOpacity(0.08),
                ),
              ]
            : null,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: padding_6,
          vertical: padding_6,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding10, vertical: padding12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: AppColors.colorBoldCardPrimary,
              ),
              child: Container(
                child: Image(
                  width: 36.w,
                  height: 28.w,
                  // fit: BoxFit.fill,
                  image: AssetImage(AppImages.conversation),
                ),
              ),
            ),
            SizedBox(width: padding10),
            Column(
              children: [
                Text(
                  "You have not done level 1.8 video",
                  style: StyleApp.titleExtraSmall(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: padding_6),
                Text(
                  "Pratice now to unlock the next level",
                  style: StyleApp.titleExtraSmall(
                    fontWeight: FontWeight.w400,
                    color: Get.theme.textTheme.bodyText1!.color!.withOpacity(0.8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/splash_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingInformationWidget(),
    );
  }
}

class OnBoardingInformationWidget extends StatefulWidget {
  const OnBoardingInformationWidget({
    super.key,
  });

  @override
  State<OnBoardingInformationWidget> createState() =>
      _OnBoardingInformationWidgetState();
}

class _OnBoardingInformationWidgetState
    extends State<OnBoardingInformationWidget> {
  int currentIndex = 0;
  double initProgressValue = 0.33;
  List<String> titles = [
    AppStrings.shoppingNow,
    AppStrings.offersAndDiscounts,
    AppStrings.secureAndEasyPayment,
  ];
  List<String> images = [
    AppImagesAssets.onBoarding1,
    AppImagesAssets.onBoarding2,
    AppImagesAssets.onBoarding3,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                images[currentIndex],
                width: double.infinity,
                height: context.height / 1.8,
                fit: BoxFit.fill,
              ),
            ),
            const OnBoardingSkipButton(),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            height: context.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(AppDimensions.height45(context)),
                topStart: Radius.circular(AppDimensions.height45(context)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AppSvgAssets.appLogo,
                  height: AppDimensions.height45(context) * 1.5,
                ),
                AnimatedCrossFade(
                  crossFadeState: CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                  firstChild: BigTextWidget(
                    titles[currentIndex],
                    fontWeight: AppFontsWeight.bold,
                    color: Colors.black,
                  ),
                  secondChild: BigTextWidget(
                    titles[currentIndex],
                    fontWeight: AppFontsWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstant.defaultPadding(context) * 2,
                    vertical: AppConstant.defaultPadding(context) / 2,
                  ),
                  child: const SmallTextWidget(
                    AppStrings.loremText,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    color: Colors.black,
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: 3,
                  onDotClicked: (index) {
                    setState(() {
                      currentIndex = index;
                      initProgressValue = (1 / 3) * (index + 1);
                    });
                  },
                  effect: ExpandingDotsEffect(
                    dotHeight: AppDimensions.height10(context),
                    dotWidth: AppDimensions.width30(context),
                    spacing: AppDimensions.width10(context),
                    activeDotColor: Theme.of(context).primaryColor,
                  ),
                ),
                CircularPercentIndicator(
                  radius: AppDimensions.width30(context) * 3,
                  percent: initProgressValue.clamp(0, 1),
                  lineWidth: AppDimensions.width10(context),
                  animation: true,
                  animateFromLastPercent: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: FloatingActionButton(
                    onPressed: () {
                      if (currentIndex < 2) {
                        setState(() {
                          currentIndex++;
                          initProgressValue += (1 / 3);
                        });
                      } else {
                        context
                            .read<SplashBloc>()
                            .add(SkipOnBoardingEvent(context));
                      }
                    },
                    shape: const CircleBorder(),
                    elevation: 0.0,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                  progressColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kFloatingActionButtonMargin / 2),
      child: SafeArea(
        child: Align(
          alignment: AlignmentDirectional.topEnd,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white10,
            ),
            onPressed: () {
              BlocProvider.of<SplashBloc>(context)
                  .add(SkipOnBoardingEvent(context));
            },
            child: SmallTextWidget(
              'Skip',
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
        ),
      ),
    );
  }
}

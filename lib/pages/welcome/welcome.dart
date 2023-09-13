import 'package:bloc_counter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_counter/productsdir/home_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/main.dart';

import '../../common/values/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, PageState>(
            builder: (context, state) {
              return SizedBox(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      onPageChanged: (index) {
                        state.pageCount = index;
                        BlocProvider.of<WelcomeBloc>(context).add(PageChangeEvent());
                      },
                      controller: pageController,
                      children: [
                        _page(
                            index: 0,
                            context: context,
                            imageUrl: "assets/images/reading.png",
                            title: "First See Learning",
                            description:
                            "Forget about a for of paper all knowledge in one learning."),
                        _page(
                            index: 1,
                            context: context,
                            imageUrl: "assets/images/boy.png",
                            title: "Connect With Everyone",
                            description:
                            "Always keep in touch with your tutor & friend. let's get connected!"),
                        _page(
                            index: 2,
                            context: context,
                            imageUrl: "assets/images/man.png",
                            title: "Always Fascinated Learning",
                            description:
                            "Anywhere, anytime. The time is at your discretion so study whenever you want."),
                      ],
                    ),
                    Positioned(
                        bottom: 20.h,
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: state.pageCount,
                          decorator: DotsDecorator(
                              activeColor: AppColors.primaryElement,
                              size: const Size.square(8),
                              activeSize: const Size(20, 8),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              )
                          ),
                          mainAxisAlignment: MainAxisAlignment.center,
                        )),
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _page({required int index,
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String description}) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Center(
            child: Image.asset(imageUrl),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30.h),
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if(index<2){
              pageController.animateToPage(index + 1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
            }else {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen( )));
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
              // Navigator.of(context).pushNamed("HomeScreen");
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                color: AppColors.primaryElement,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 8))
                ]),
            margin: EdgeInsets.only(top: 110.h, left: 25.w, right: 25.w),
            width: 320.w,
            height: 50.h,
            child: Center(
              child: Text(
                (index == 2) ? "Get Started" : "Next",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



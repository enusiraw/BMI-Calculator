import 'package:bmi_calculator/pages/home.dart';
import 'package:bmi_calculator/widget/buttons.dart';
import 'package:bmi_calculator/widget/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BMIInfoPage extends StatelessWidget {
  final double bmi;
  final String category;
  final double? height;
  final String? gender;

  const BMIInfoPage({
    Key? key,
    this.height,
    this.gender,
    required this.bmi,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bmiPercentage = bmi / 40;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Back',
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32.w, top: 23.h),
              child: Text(
                "Your BMI is ",
                style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    color: const Color(0xFF246AFE),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 30.0.r,
                percent: bmiPercentage > 1 ? 1 : bmiPercentage,
                center: Text(
                  bmi.toStringAsFixed(1),
                  style: GoogleFonts.poppins(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: bmiPercentage < 0.5
                    ? Colors.green
                    : (bmiPercentage < 0.75
                        ? const Color(0xFF246AFE)
                        : Colors.red),
                backgroundColor: const Color(0xFFFFFFFF),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              category,
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                color: const Color(0xFF246AFE),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainer(
              height: 150.h,
              width: 320.w,
              color: const Color(0xFFFFFFFF),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your BMI is 20.7, indicating your weight is in the Normal category for adults of your height.",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 12.sp),
                    ),
                    Text(
                      "For your height, a normal weight range would be from 53.5 to 72 kilograms.",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 12.sp),
                    ),
                    Text(
                      "Maintaining a healthy weight may reduce the risk of chronic diseases associated withoverweight and obesity.",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Buttons(
              label: "Find Out More",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              height: 30.h,
              width: 320.w,
            ),
          ],
        ),
      ),
    );
  }
}

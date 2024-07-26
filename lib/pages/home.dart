import 'package:bmi_calculator/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../inicludes/color/bmi_calculate.dart';
import '../widget/buttons.dart';
import '../widget/container.dart';
import 'bmi_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

double _value = 140;
double cur_height = 380.h;
double weight = 60;
int age = 23;
String _gender = "Male";

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Ensure alignment to the start
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 24.h, left: 5.w), // Add left padding if needed
                  child: Center(
                    child: CustomContainer(
                      height: 36.h,
                      width: 101.w,
                      color: Colors.white,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () { themeProvider.toggleTheme();  },
                          icon: const Icon(Icons.light_mode
                          )),
                          IconButton(
                            onPressed: () { themeProvider.toggleTheme();},
                            icon: const Icon(Icons.dark_mode)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 41.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25.w), // Ensure padding here
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome 😊",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        "BMI Calculator",
                        style: GoogleFonts.poppins(
                            fontSize: 24.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25.w), // Ensure padding here
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Ensure alignment to start
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Buttons(
                        height: 35.h,
                        width: 125.w,
                        label: "Male",
                        onPressed: () {
                          setState(() {
                            _gender = "Male";
                          });
                        },
                        color: _gender == "Male"
                            ? const Color(0xFF246AFE)
                            : const Color(0xFFFFFFFF),
                        icon: Icon(
                          Icons.male,
                          color: _gender == "Male"
                              ? Colors.white
                              : const Color(0xFF246AFE),
                        ),
                        textStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: _gender == "Male"
                                ? Colors.white
                                : const Color(0xFF246AFE),
                            fontWeight: FontWeight.w500),
                      ),
                      Buttons(
                        height: 35.h,
                        width: 125.w,
                        label: "Female",
                        onPressed: () {
                          setState(() {
                            _gender = "Female";
                          });
                        },
                        color: _gender == "Female"
                            ? const Color(0xFF246AFE)
                            : const Color(0xFFFFFFFF),
                        icon: Icon(
                          Icons.female,
                          color: _gender == "Female"
                              ? Colors.white
                              : const Color(0xFF246AFE),
                        ),
                        textStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: _gender == "Female"
                                ? Colors.white
                                : const Color(0xFF246AFE),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:10.w,top: 30.h, right:10.w),
                  child: Row(
                    children: [
                      CustomContainer(
                        height: cur_height,
                        width: 150.w,
                        color: Colors.grey[900],
                        child: SfSlider.vertical(
                          value: _value,
                          min: 110,
                          max: 200,
                          interval: 10,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: true,
                          activeColor: const Color(0xFF246AFE),
                          inactiveColor: const Color(0xFFD1D9E6),
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 35.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                              height: (cur_height - 10.h) / 2,
                              width: 160.w,
                              color: const Color(0xFFD1D9E6),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: Text(
                                      "Weight",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          color: const Color(0xFF8C8C8C)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "$weight",
                                    style: GoogleFonts.poppins(
                                        fontSize: 64.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 17.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomContainer(
                                        height: 32.h,
                                        width: 32.w,
                                        color: const Color(0xFF246AFE),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.remove,
                                              size: 24.w,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (weight > 0) weight--;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      CustomContainer(
                                        height: 32.h,
                                        width: 32.w,
                                        color: const Color(0xFF246AFE),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon: Icon(Icons.add,
                                                size: 24.w,
                                                color: Colors.white),
                                            onPressed: () {
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),

                            //Age
                            CustomContainer(
                              height: (cur_height - 12.h) / 2,
                              width: 160.w,
                              color: const Color(0xFFD1D9E6),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: Text(
                                      "Age",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          color: const Color(0xFF8C8C8C)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "$age",
                                    style: GoogleFonts.poppins(
                                        fontSize: 64.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 17.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomContainer(
                                        height: 32.h,
                                        width: 32.w,
                                        color: const Color(0xFF246AFE),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.remove,
                                              size: 24.w,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (age > 0) age--;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      CustomContainer(
                                        height: 32.h,
                                        width: 32.w,
                                        color: const Color(0xFF246AFE),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon: Icon(Icons.add,
                                                size: 24.w,
                                                color: Colors.white),
                                            onPressed: () {
                                              setState(() {
                                                age++;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21.h),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w, right:10.w, ),
                  child: Buttons(
                    label: "Lets Go",
                    onPressed: () {
                      double bmi = BMICalculator.calculateBMI(_value, weight);
                      String category =
                          BMICalculator.getBMICategory(bmi, _gender);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BMIInfoPage(bmi: bmi, category: category),
                        ),
                      );
                    },
                    height: 30.h,
                    width: 320.w,
                    color: const Color(0xFF246AFE),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

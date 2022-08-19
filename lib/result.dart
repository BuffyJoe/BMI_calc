import 'package:bmi_calc/main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:url_launcher/link.dart';

class ResultPage extends StatelessWidget {
  final double BMI;
  final bool overWeight;
  final bool underWeight;
  final bool rightWeight;
  final int age;
  ResultPage(
      {required this.BMI,
      this.overWeight = false,
      this.underWeight = false,
      this.age = 0,
      this.rightWeight = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var supportinText = overWeight
        ? 'which is above the normal BMI range for your age, height, weight and gender, We recommend you try losing some pounds'
        : underWeight
            ? 'which is below the normal BMI range for your age, height, weight and gender, We recommend you try gaining some pounds'
            : rightWeight
                ? 'which is within the normal BMI range for your age, height, weight and gender, We recommend you keep up with your diet, or work our routine'
                : '';

    var workoutText = overWeight
        ? 'Exercises that burn the most calories'
        : underWeight
            ? 'Best weight gain exervices'
            : rightWeight
                ? 'Stay fit routine'
                : '';

    var workoutLink = overWeight
        ? 'https://www.healthline.com/health/what-exercise-burns-the-most-calories'
        : underWeight
            ? 'https://magicpin.in/blog/top-weight-gain-exercises/'
            : rightWeight
                ? 'https://swirlster.ndtv.com/wellness/no-equipment-full-body-workouts-you-can-do-to-stay-fit-2266789'
                : '';

    var dietText = overWeight
        ? 'Weight loss diet plan'
        : underWeight
            ? '18 healthy foods for weight gain'
            : rightWeight
                ? 'Helpful diet and fitness tips'
                : '';

    var dietLink = overWeight
        ? 'https://www.medicalnewstoday.com/articles/weight-loss-meal-plan#7-day-meal-plan-and-grocery-list'
        : underWeight
            ? 'https://www.healthline.com/nutrition/18-foods-to-gain-weight#TOC_TITLE_HDR_4'
            : rightWeight
                ? 'https://www.health.com/weight-loss/30-simple-diet-and-fitness-tips'
                : '';
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        Text(
                          'Result',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          width: 40,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/grid.jpg'),
                      fit: BoxFit.fill,
                    )),
                    child: SfSparkLineChart(
                      axisLineColor: Colors.transparent,
                      width: 5,
                      color: overWeight
                          ? Colors.red
                          : underWeight
                              ? Colors.red
                              : rightWeight
                                  ? Colors.green
                                  : Colors.blue,
                      //Enable the trackball
                      trackball: SparkChartTrackball(
                          activationMode: SparkChartActivationMode.tap),
                      //Enable marker
                      marker: SparkChartMarker(
                          displayMode: SparkChartMarkerDisplayMode.all),
                      //Enable data label
                      labelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                      labelDisplayMode: SparkChartLabelDisplayMode.none,
                      data: age <= 8
                          ? <double>[9.5, 10.5, BMI, 17]
                          : age <= 12 && age > 8
                              ? <double>[11.5, 14.5, BMI, 18.5, 24.5]
                              : age <= 18 && age > 12
                                  ? <double>[13.5, 17.5, BMI, 24.5, 28.5]
                                  : <double>[13.5, 18.5, BMI, 24.5, 28.5],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your BMI is ${BMI.toStringAsFixed(1)}, $supportinText",
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          "The normal BMI range for Adults is 18.5 - 24.9, Teenagers: Male (18.2 - 26.3), Female (17.6 - 26.1), Adolescents : Male (15 - 21.8), Female (14.8 - 22.5); while children of ages 8 below (13.8 - 17)",
                          textAlign: TextAlign.justify,
                        ),
                        Link(
                          uri: Uri.parse(workoutLink),
                          target: LinkTarget.self,
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Text(
                                workoutText,
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          },
                        ),
                        Link(
                          uri: Uri.parse(dietLink),
                          target: LinkTarget.self,
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Text(
                                dietText,
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return MyHomePage();
                          })),
                          child: Container(
                            width: size.width * 0.9,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Recalculate BMI',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

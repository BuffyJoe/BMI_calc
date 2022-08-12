import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calc',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double weight = 60;
  double height = 170;
  bool female = false;

  bool male = true;
  var age = 22;
  double BMI = 0;
  bool overWeight = false;

  bool underWeight = false;

  bool rightWeight = false;

  TextEditingController weightText = TextEditingController(text: '70');

  TextEditingController ageText = TextEditingController(text: '22');

  TextEditingController heightText = TextEditingController(text: '180');

  // List of items in ourdropdown menu
  String dropdownValueHeight = 'cm';
  var itemsHeight = ['cm', 'Inch', 'feet', 'm'];

  // List of items in our dropdown menu
  String dropdownValueWeight = 'kg';
  var itemsWeight = ['kg', 'lb'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Gender'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            male = true;
                            female = false;
                          });
                        },
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: male == true ? Colors.blue : Colors.grey,
                            width: 3,
                          )),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 5,
                                child: Icon(
                                  Icons.verified,
                                  color:
                                      male == true ? Colors.blue : Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 10,
                                child: Icon(
                                  Icons.male_rounded,
                                  color:
                                      male == true ? Colors.blue : Colors.grey,
                                  size: 120,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            male = false;
                            female = true;
                          });
                        },
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: female == true ? Colors.blue : Colors.grey,
                            width: 3,
                          )),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 5,
                                child: Icon(
                                  Icons.verified,
                                  color: female == true
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 10,
                                child: Icon(
                                  Icons.female_rounded,
                                  color: female == true
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 120,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Weight'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.6,
                        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.grey[700],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Container(
                            width: size.width * 0.3,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              textAlign: TextAlign.center,
                              controller: weightText,

                              keyboardType: TextInputType.number,
                              // initialValue: weight.toString(),
                              onChanged: (value) {
                                weight = double.parse(value);
                              },
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        width: size.width * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              // Initial Value
                              value: dropdownValueWeight,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: itemsWeight.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueWeight = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Height'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.6,
                        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.grey[700],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Container(
                            width: size.width * 0.3,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              textAlign: TextAlign.center,
                              controller: heightText,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white),

                              // initialValue: weight.toString(),

                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                height = double.parse(value);
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        // decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Theme.of(context).brightness == Brightness.dark
                        //           ? Colors.white
                        //           : Colors.black,
                        //     ),
                        //     borderRadius: BorderRadius.circular(20)),
                        width: size.width * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   'CM',
                            //   style: TextStyle(),
                            // ),
                            DropdownButton(
                              // Initial Value
                              value: dropdownValueHeight,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: itemsHeight.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueHeight = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Age'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.9,
                    // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Container(
                        width: size.width * 0.3,
                        child: TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                          textAlign: TextAlign.center,
                          controller: ageText,

                          // initialValue: weight.toString(),
                          onChanged: (value) {
                            age = int.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      calcBMI(
                        weight: weight,
                        height: height,
                      );
                    },
                    child: Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Calculate',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
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

  void calcBMI({
    double weight = 0,
    double height = 0,
  }) {
    if (dropdownValueHeight == 'Inch') {
      height = height / 39.37;
    }
    if (dropdownValueWeight == 'lb') {
      weight = weight / 2.205;
    }
    if (dropdownValueHeight == 'cm') {
      height = height / 100;
    }
    if (dropdownValueHeight == 'feet') {
      print(height);
      height = height * 0.305;
      print(height.runtimeType);
    }
    height = height * height;
    BMI = weight / height;
    if (male) {
      if (age <= 5) {
        if (BMI < 13.8) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 17) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      } else if (age > 5 && age <= 12) {
        if (BMI < 15) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 21.8) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      } else if (age > 12 && age <= 18) {
        if (BMI < 18.2) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 26.3) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      } else {
        if (BMI < 18.5) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 24.9) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      }
    } else if (female) {
      if (age <= 5) {
        if (BMI < 13.8) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 17) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      } else if (age > 5 && age <= 12) {
        if (BMI < 14.8) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 22.5) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      } else if (age > 12 && age <= 18) {
        if (BMI < 17.6) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 26.1) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      } else {
        if (BMI < 18.5) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              underWeight: true,
            );
          }));
        } else if (BMI > 24.9) {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              overWeight: true,
            );
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResultPage(
              BMI: BMI,
              rightWeight: true,
            );
          }));
        }
      }
    }
  }
}

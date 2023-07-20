import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/Icon_Content.dart';
import '../Components/Reusable_Bg.dart';
import '../Components/RoundIcon_Button.dart';
import '../constants.dart';
import 'Results_Page.dart';
import '../Components/BottomContainer_Button.dart';
import '../calculator_brain.dart';

// ignore: must_be_immutable
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//ENUMERATION : The action of establishing number of something , implicit way
enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  //by default male will be selected

  late Gender selectedGender = Gender.male;
  int height = 180;
  int lingkarpinggang = 100;
  int weight = 50;
  int age = 20;

  TextEditingController tIntensitas = TextEditingController();
  double? kalori = 12,
      intensitas = 0,
      usia = 0,
      hrfm = 0,
      hbmi = 0,
      tinggi = 0,
      lingkar = 0,
      tinggim = 0;
  int? berat = 0, umur = 0, krfm = 0, kbmi = 0;
  String gender = "Pria", klasifikasi = "";
  double getNumber(double input, {int precision = 2}) => double.parse(
      '$input'.substring(0, '$input'.indexOf('.') + precision + 1));

  prosesPria() {
    setState(() {
      umur = age;
      tinggi = height.toDouble();
      berat = weight;
      if (lingkarpinggang % 10 == 0) {
        lingkar = lingkarpinggang / 100;
      } else {
        lingkar = getNumber(lingkarpinggang / 100, precision: 2);
      }
      if (height % 10 == 0) {
        tinggim = height / 100;
      } else {
        tinggim = getNumber(height / 100, precision: 2);
      }
      intensitas = double.parse(tIntensitas.text);

      kalori = ((88.4 + 13.4 * berat!) + (4.8 * tinggi!) - (5.68 * umur!)) *
          intensitas!;
      hbmi = berat! / (tinggim! * tinggim!);
      hrfm = 64 - (20 * tinggim! / lingkar!);
      if (hrfm! >= 14 && hrfm! <= 20.9) {
        krfm = 1;
      } else if (hrfm! >= 21 && hrfm! <= 24.9) {
        krfm = 2;
      } else if (hrfm! >= 25 && hrfm! <= 31.9) {
        krfm = 3;
      } else if (hrfm! >= 32) {
        krfm = 4;
      }
      if (hbmi! < 18.5) {
        kbmi = 1;
      } else if (hbmi! >= 18.5 && hbmi! <= 22.9) {
        kbmi = 2;
      } else if (hbmi! >= 23 && hbmi! <= 24.9) {
        kbmi = 3;
      } else if (hbmi! > 25) {
        kbmi = 4;
      }

      if (kbmi! == 1 && krfm! == 1) {
        klasifikasi = "Kurus";
      } else if (kbmi! == 1 && krfm! == 2) {
        klasifikasi = "Kurus";
      } else if (kbmi! == 2 && krfm! == 1) {
        klasifikasi = "kurus";
      } else if (kbmi! == 2 && krfm! == 2) {
        klasifikasi = "Normal";
      } else if (kbmi! == 2 && krfm! == 3) {
        klasifikasi = "Normal";
      } else if (kbmi! == 2 && krfm! == 4) {
        klasifikasi = "Overweight";
      } else if (kbmi! == 3 && krfm! == 2) {
        klasifikasi = "Normal";
      } else if (kbmi! == 3 && krfm! == 3) {
        klasifikasi = "Overweight";
      } else if (kbmi! == 3 && krfm! == 4) {
        klasifikasi = "Obesitas";
      } else if (kbmi! == 4 && krfm! == 3) {
        klasifikasi = "Obesitas";
      } else if (kbmi! == 4 && krfm! == 4) {
        klasifikasi = "Obesitas";
      } else if (kbmi! == 3 && krfm! == 1) {
        klasifikasi = "Big Bones / Big Muscle";
      } else if (kbmi! == 4 && krfm! == 1) {
        klasifikasi = "Big Bones / Big Muscle";
      } else if (kbmi! == 4 && krfm! == 1) {
        klasifikasi = "Big Bones / Big Muscle";
      }
    });
  }

  prosesWanita() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height * 0.1),
                  width: (MediaQuery.of(context).size.width * 0.5),
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableBg(
                          colour: selectedGender == Gender.male
                              ? kactiveCardColor
                              : kinactiveCardColor,
                          cardChild: Icon(Icons.male)),
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height * 0.1),
                  width: (MediaQuery.of(context).size.width * 0.5),
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableBg(
                          colour: selectedGender == Gender.female
                              ? kactiveCardColor
                              : kinactiveCardColor,
                          cardChild: Icon(Icons.female)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: kactiveCardColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: ksliderInactiveColor,
                      thumbColor: Color.fromARGB(255, 255, 0, 149),
                      overlayColor: Color.fromARGB(132, 250, 233, 0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: kactiveCardColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Lingkar Pinggang',
                    style: klabelTextStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      lingkarpinggang.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: ksliderInactiveColor,
                      thumbColor: Color.fromARGB(255, 255, 0, 149),
                      overlayColor: Color.fromARGB(132, 250, 233, 0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: lingkarpinggang.toDouble(),
                      min: 80,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          lingkarpinggang = newValue.round();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: kactiveCardColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Intensitas Olahraga',
                  style: klabelTextStyle,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kDigitTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: Color.fromARGB(113, 158, 158, 158),
                              child: IconButton(
                                icon: Icon(Icons.exposure_minus_1),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Card(
                              color: Color.fromARGB(113, 158, 158, 158),
                              child: IconButton(
                                icon: Icon(Icons.plus_one),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kDigitTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: Color.fromARGB(113, 158, 158, 158),
                              child: IconButton(
                                icon: Icon(Icons.exposure_minus_1),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Card(
                              color: Color.fromARGB(113, 158, 158, 158),
                              child: IconButton(
                                icon: Icon(Icons.plus_one),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            text: 'CALCULATE',
            onTap: () {
              Calculate calc = Calculate(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calc.result(),
                    resultText: calc.getText(),
                    advise: calc.getAdvise(),
                    textColor: calc.getTextColor(),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.favorite,
      //     color: Colors.pink,
      //     size: 23.0,
      //   ),
      //   backgroundColor: kactiveCardColor,
      // ),
    );
  }
}

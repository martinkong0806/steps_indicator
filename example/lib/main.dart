import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps Indicator Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Steps Indicator Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const double STEP_SIZE = 20;

class _MyHomePageState extends State<MyHomePage> {
  int selectedStep = 0;
  int nbSteps = 9;

  // late AnimatedController = animationControllerSelectedStep

  // AnimationController(
  //           duration: const Duration(milliseconds: 400), vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StepsIndicator(
            direction: Axis.vertical,
            selectedStep: selectedStep,
            nbSteps: nbSteps,
            doneLineColor: Colors.green,
            doneStepColor: Colors.green,
            undoneLineColor: Colors.grey,
            lineLength: 50,
            doneLineThickness: 5,
            undoneLineThickness: 5,
            doneStepSize: STEP_SIZE,
            unselectedStepSize: STEP_SIZE,
            selectedStepSize: STEP_SIZE,
            // lineLengthCustomStep: [
            //   StepsIndicatorCustomLine(nbStep: 4, length: 105)
            // ],
            doneStepWidget: (int index, double? progress) {
          
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStep = index;
                  });
                },
                child: Container(
                  width: STEP_SIZE,
                  height: STEP_SIZE,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
              );
            },
            unselectedStepWidget: (int index, double? progress) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStep = index;
                  });
                },
                child: Container(
                  width: STEP_SIZE,
                  height: STEP_SIZE,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
              );
            },
            selectedStepWidget: (int index, double? progress) {
              return GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedStep = index;
                  // });
                },
                child: Container(
                  width: STEP_SIZE,
                  height: STEP_SIZE,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 3),
                      color: Colors.white,
                      shape: BoxShape.circle),
                ),
              );
            },
            enableLineAnimation: true,
            enableStepAnimation: true,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     MaterialButton(
          //       color: Colors.red,
          //       onPressed: () {
          //         if (selectedStep > 0) {
          //           setState(() {
          //             selectedStep--;
          //           });
          //         }
          //       },
          //       child: const Text('Prev'),
          //     ),
          //     MaterialButton(
          //       color: Colors.green,
          //       onPressed: () {
          //         if (selectedStep < nbSteps) {
          //           setState(() {
          //             selectedStep++;
          //           });
          //         }
          //       },
          //       child: const Text('Next'),
          //     )
          //   ],
          // )
        ],
      )),
    );
  }
}

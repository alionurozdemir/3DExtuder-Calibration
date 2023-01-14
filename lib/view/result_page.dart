import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result});
  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.deepOrangeAccent,
              Colors.deepOrangeAccent.shade400,
              Colors.deepOrangeAccent.shade100,
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Extruder Calibraton",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "3D Printer Extruder Calibration Calculation",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // radius of 10
                        color: Colors.white // green as background color
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            "New Steps-per-mm (E) Value",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            result.toString(),
                            style: const TextStyle(
                                fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "Don't forget to save the settings :)",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Recalculate",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      )),
                ),
              ],
            )));
  }
}

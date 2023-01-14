import 'package:extuder_calibration/view/result_page.dart';
import 'package:extuder_calibration/view/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController filamentController = TextEditingController();
  TextEditingController stepspermmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Extruder Calibration",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      "3D Printer Extruder Calibration Calculation",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  )
                                ]),
                            child: Column(children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.transparent))),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value.';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: filamentController,
                                  decoration: const InputDecoration(
                                      hintText: "Missing Filament Length",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  )
                                ]),
                            child: Column(children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.transparent))),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value.';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: stepspermmController,
                                  decoration: const InputDecoration(
                                      hintText: "Steps-per-mm (E)",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    var estep = double.parse(stepspermmController.text);
                                    var mfilament = double.parse(filamentController.text);

                                    double result = double.parse(
                                        ((100 * estep) / (100 - mfilament)).toStringAsFixed(2));

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResultView(result: result),
                                        ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25))),
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Calculate",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: (() {
                                      filamentController.clear();
                                      stepspermmController.clear();
                                    }),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        "Reset",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TutorialPage(),
                                          ));
                                    }),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        "Tutorial",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                    "https://forms.gle/zZqLC9LWHKzZDPLn8",
                                  ),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: const Text(
                              "Give feedback on the app.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

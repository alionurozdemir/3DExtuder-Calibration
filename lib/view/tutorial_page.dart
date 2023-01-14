import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Back",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Measure 100.0 mm of filament and mark it with a pencil.",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Type the length of the missing filament sent to the printer in the Missing Filament Length section of the application.",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset("assets/images/100mmfilament.jpg")),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset("assets/images/moveextruder.jpg")),
            SizedBox(
              height: 10,
            ),
            Text(
              "Add the new Steps-per-mm value to the printer, save and print.",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset("assets/images/newvalue.jpg"))
          ]),
        ),
      ),
    );
  }
}

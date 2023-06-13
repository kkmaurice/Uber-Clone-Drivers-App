import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carTypeList = ['uber-x', 'uber-go', 'bike'];
  String? selectedCarType;

  saveCarInfo() {
    Map carInfo = {
      'car_model': carModelTextEditingController.text.trim(),
      'car_color': carColorTextEditingController.text.trim(),
      'car_number': carNumberTextEditingController.text.trim(),
      'car_type': selectedCarType,
    };
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('drivers');
    ref.child(currentFirebaseUser!.uid).child('car_details').set(carInfo);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/logo1.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Car Details',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: carModelTextEditingController,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Car Model',
                    hintText: 'Car Model',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                TextField(
                  controller: carNumberTextEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Car Number',
                    hintText: 'Car Number',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                TextField(
                  controller: carColorTextEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Color',
                    hintText: 'Color',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                    dropdownColor: Colors.black54,
                    iconEnabledColor: Colors.grey,
                    hint: const Text('Select Car Type',
                        style: TextStyle(color: Colors.white)),
                    items: carTypeList.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(color: Colors.grey),
                          ));
                    }).toList(),
                    onChanged: (String? newValueSelected) {
                      setState(() {
                        selectedCarType = newValueSelected;
                      });
                    },
                    value: selectedCarType,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (carColorTextEditingController.text.isNotEmpty &&
                          carModelTextEditingController.text.isNotEmpty &&
                          carNumberTextEditingController.text.isNotEmpty &&
                          selectedCarType != null) {
                        saveCarInfo();

                        Fluttertoast.showToast(
                            msg: 'Information Saved Successfully',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreenAccent,
                            textColor: Colors.black,
                            fontSize: 16.0);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySplashScreen()));
                      } else {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please fill all the details',
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Save Now',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

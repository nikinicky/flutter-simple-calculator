import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  double result = 0.0;

  String _selectedOperator = "";
  String _displayText = "";
  String _displayResult = "465545647647645645";

  void _setOperator(String operator) {
    setState(() {
      _selectedOperator = operator;
    });

    _updateDisplayText();
  }

  void _updateDisplayText() {
    setState(() {
      _displayText = "${firstNumberController.text} $_selectedOperator ${secondNumberController.text}".trim();
    });
  }

  void calculate() {
    double firstNumber = double.tryParse(firstNumberController.text) ?? 0;
    double secondNumber = double.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      // result = BasicArithmetic.calculate(num1, num2, operation);
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(_displayResult),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Simple Calculator",
          style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Color(0xFFF5EFFF),
      ),
      body: Container(
        color: Color(0xFFF5EFFF),
        child: Column(
          children: [
            // Result Box
            Center(
                child: Container(
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 174,
                  decoration: BoxDecoration(
                      color: Color(0xFFCDC1FF),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _displayText.isEmpty ? "" : _displayText,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )
                      ),
                      Text(
                          _displayResult.isEmpty ? "" : _displayResult,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          )
                      ),
                    ],
                  ),
                )
            ),

            // First Input
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 24),
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    controller: firstNumberController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE5D9F2),
                      hintText: "Input Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => _updateDisplayText(),
                  )
              )
            ),

            // Second Input
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: TextField(
                      controller: secondNumberController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE5D9F2),
                        hintText: "Input Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => _updateDisplayText(),
                    )
                )
            ),

            // Arithmetic Buttons
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () => _setOperator("+"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA594F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () => _setOperator("-"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA594F9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () => _setOperator("×"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA594F9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                          "×",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () => _setOperator("÷"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA594F9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                          "÷",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () => calculate(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA594F9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                          "=",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
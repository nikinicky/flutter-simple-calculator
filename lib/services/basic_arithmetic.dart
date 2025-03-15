class BasicArithmetic {
  static double calculate(double firstNumber, double secondNumber, String selectedOperator) {
    switch (selectedOperator) {
      case "+":
        return firstNumber + secondNumber;
      case "-":
        return firstNumber - secondNumber;
      case "×":
        return firstNumber * secondNumber;
      case "÷":
        return secondNumber != 0 ? firstNumber / secondNumber : 0;
      default:
        return 0;
    }
  }
}

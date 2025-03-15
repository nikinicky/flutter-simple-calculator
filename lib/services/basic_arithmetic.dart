class BasicArithmetic {
  static double calculate(double num1, double num2, String operation) {
    switch (operation) {
      case "+":
        return num1 + num2;
      case "-":
        return num1 - num2;
      case "*":
        return num1 * num2;
      case "/":
        return num2 != 0 ? num1 / num2 : 0; // Prevent division by zero
      default:
        return 0;
    }
  }
}

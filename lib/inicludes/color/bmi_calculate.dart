class BMICalculator {
  static double calculateBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  static String getBMICategory(double bmi, String gender) {
    if (gender == "Male") {
      if (bmi < 20) {
        return "Underweight";
      } else if (bmi < 25) {
        return "Normal weight";
      } else if (bmi < 30) {
        return "Overweight";
      } else {
        return "Obesity";
      }
    } else {
      if (bmi < 18) {
        return "Underweight";
      } else if (bmi < 24) {
        return "Normal weight";
      } else if (bmi < 29) {
        return "Overweight";
      } else {
        return "Obesity";
      }
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'calculator.dart';

void main() {
  group("I want to test calculator", () {
    test("I want to test addition", () {
      Calculator calc = Calculator();
      int result = calc.add(3, 4);
      expect(result, 7);
    });
    test("I want to test subtraction", () {
      Calculator calc = Calculator();
      int result = calc.sub(7, 4);
      expect(result, 3);
    });
    test("I want to test multiplication", () {
      Calculator calc = Calculator();
      int result = calc.mul(3, 2);
      expect(result, 6);
    });
    test("I want to test addition", () {
      Calculator calc = Calculator();
      double result = calc.div(8, 4);
      expect(result, 2);
    });
  });

}
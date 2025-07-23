import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/calculator.dart';

void main() {

  ///1
  test('empty string returns 0', () {
    final calc = Calculator();

    expect(calc.add(''), equals(0));
  });

  test('single number returns the number', () {
    final calc = Calculator();
    expect(calc.add('1'), equals(1));
  });

  ///2
  test('multiple numbers return their sum', () {
    final calc = Calculator();
    expect(calc.add('1,2,3,4,5'), equals(15));
  });

  ///3
  test('numbers separated by new lines and commas return their sum', () {
    final calc = Calculator();
    expect(calc.add('1\n2,3'), equals(6));
  });

  ///4
  test('supports different delimiter', () {
    final calc = Calculator();
    expect(calc.add('//;\n1;2'), equals(3));
  });

  ///5
  test('throws exception for negative number', () {
    final calc = Calculator();
    expect(calc.add('1,-2,3'),
      throwsA(isA<Exception>().having(
            (e) => e.toString(),
        'message',
        'Exception: negative numbers not allowed -2',
      )),
    );
  });


}

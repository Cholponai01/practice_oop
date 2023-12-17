import 'package:calculation/history_screen.dart';
import 'package:calculation/operation_detail.dart';
import 'package:calculation/screen.dart';

class CalculateScreen extends Screen {
  HistoryScreen historyScreen = HistoryScreen();

  CalculateScreen() : super();

  double performOperation(double a, double b, String operation) {
    late double result;
    switch (operation) {
      case '+':
        result = add(a, b);
        break;
      case '-':
        result = subtract(a, b);
        break;
      case '*':
        result = multiply(a, b);
        break;
      case '/':
        result = divide(a, b);
        break;
      default:
        print("Error: Invalid operation!");
        return double.nan;
    }

    OperationDetail operationDetail = OperationDetail(
      operand1: a,
      operand2: b,
      operation: operation,
      result: result,
    );
    historyScreen.addOperation(operationDetail);

    return result;
  }

  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      print("Error: Division by zero!");
      return double.nan;
    }
  }
}
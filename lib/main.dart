// import 'dart:io';

// class OperationDetail {
//   final double operand1;
//   final double operand2;
//   final String operation;
//   final double result;

//   OperationDetail({
//     required this.operand1,
//     required this.operand2,
//     required this.operation,
//     required this.result,
//   });

//   @override
//   String toString() {
//     return "$operand1 $operation $operand2 = $result";
//   }
// }

// class HistoryScreen {
//   List<OperationDetail> history = [];

//   void addOperation(OperationDetail operationDetail) {
//     history.add(operationDetail);
//     print("History updated!");
//   }

//   void removeOperation(int index) {
//     if (index >= 0 && index < history.length) {
//       history.removeAt(index);
//       print("Operation removed from history!");
//     } else {
//       print("Invalid index!");
//     }
//   }

//   void showHistory() {
//     print("Operation History:");
//     for (var entry in history) {
//       print(entry.toString());
//     }
//   }
// }

// class Screen {
//   double getNumberInput(String prompt) {
//     stdout.write(prompt);
//     String userInput = stdin.readLineSync()!;
//     return double.parse(userInput);
//   }

//   String getOperationInput() {
//     stdout.write("Choose operation (+, -, *, /): ");
//     String operation = stdin.readLineSync()!.trim();
//     return operation;
//   }

//   void displayResult(double result) {
//     print("Result: $result");
//   }
// }

// class CalculateScreen extends Screen {
//   HistoryScreen historyScreen = HistoryScreen();

//   CalculateScreen() : super();

//   double performOperation(double a, double b, String operation) {
//     late double result;
//     switch (operation) {
//       case '+':
//         result = add(a, b);
//         break;
//       case '-':
//         result = subtract(a, b);
//         break;
//       case '*':
//         result = multiply(a, b);
//         break;
//       case '/':
//         result = divide(a, b);
//         break;
//       default:
//         print("Error: Invalid operation!");
//         return double.nan;
//     }

//     OperationDetail operationDetail = OperationDetail(
//       operand1: a,
//       operand2: b,
//       operation: operation,
//       result: result,
//     );
//     historyScreen.addOperation(operationDetail);

//     return result;
//   }

//   double add(double a, double b) {
//     return a + b;
//   }

//   double subtract(double a, double b) {
//     return a - b;
//   }

//   double multiply(double a, double b) {
//     return a * b;
//   }

//   double divide(double a, double b) {
//     if (b != 0) {
//       return a / b;
//     } else {
//       print("Error: Division by zero!");
//       return double.nan;
//     }
//   }
// }

// void main() {
//   CalculateScreen calculateScreen = CalculateScreen();

//   double num1 = calculateScreen.getNumberInput("Enter the first number: ");
//   double num2 = calculateScreen.getNumberInput("Enter the second number: ");
//   String operation = calculateScreen.getOperationInput();
//   double result = calculateScreen.performOperation(num1, num2, operation);

//   calculateScreen.displayResult(result);
//   calculateScreen.historyScreen.showHistory();
// }

import 'dart:io';

class OperationDetail {
  final double operand1;
  final double operand2;
  final String operation;
  final double result;

  OperationDetail({
    required this.operand1,
    required this.operand2,
    required this.operation,
    required this.result,
  });

  @override
  String toString() {
    return "$operand1 $operation $operand2 = $result";
  }
}

class HistoryScreen {
  List<OperationDetail> history = [];

  void addOperation(OperationDetail operationDetail) {
    history.add(operationDetail);
    print("History updated!");
  }

  void showHistory() {
    if (history.isEmpty) {
      print("History is empty.");
    } else {
      print("Operation History:");
      for (var entry in history) {
        print(entry.toString());
      }
    }
  }
}

class Screen {
  double getNumberInput(String prompt) {
    stdout.write(prompt);
    String userInput = stdin.readLineSync()!;
    return double.parse(userInput);
  }

  String getOperationInput() {
    stdout.write("Choose operation (+, -, *, /): ");
    String operation = stdin.readLineSync()!.trim();
    return operation;
  }

  void displayResult(double result) {
    print("Result: $result");
  }
}

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

void main() {
  CalculateScreen calculateScreen = CalculateScreen();

  while (true) {
    double num1 = calculateScreen.getNumberInput("Enter the first number: ");
    String operation = calculateScreen.getOperationInput();
    double num2 = calculateScreen.getNumberInput("Enter the second number: ");

    double result = calculateScreen.performOperation(num1, num2, operation);

    calculateScreen.displayResult(result);
    calculateScreen.historyScreen.showHistory();

    stdout.write("Do you want to continue? (yes/no): ");
    String continueInput = stdin.readLineSync()!.trim().toLowerCase();
    if (continueInput != 'yes') {
      print("Goodbye!");
      break;
    }
  }
}

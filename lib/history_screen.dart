import 'package:calculation/operation_detail.dart';

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
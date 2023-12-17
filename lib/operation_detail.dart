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
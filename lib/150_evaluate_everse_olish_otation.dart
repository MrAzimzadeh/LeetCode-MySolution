class Solution {
  int evalRPN(List<String> tokens) {
    List<int> stack = [];

    for (String token in tokens) {
      if (isOperator(token)) {
        int operand2 = stack.removeLast();
        int operand1 = stack.removeLast();
        int result = applyOperator(operand1, operand2, token);
        stack.add(result);
      } else {
        // Convert string operand to integer and push it onto the stack
        stack.add(int.parse(token));
      }
    }

    return stack.first;
  }

  bool isOperator(String token) {
    return token == "+" || token == "-" || token == "*" || token == "/";
  }

  int applyOperator(int operand1, int operand2, String operator) {
    switch (operator) {
      case "+":
        return operand1 + operand2;
      case "-":
        return operand1 - operand2;
      case "*":
        return operand1 * operand2;
      case "/":
        return operand1 ~/ operand2; // Truncating division
      default:
        throw ArgumentError("Invalid operator: $operator");
    }
  }
}

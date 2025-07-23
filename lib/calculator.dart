class Calculator {
  int add(String numbers) {

    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ",";
    String numbersToProcess = numbers;

    if (numbers.startsWith("//")) {
      final parts = numbers.split("\n"); ///  //;\n1;2 => [//;, 1;2]
      if (parts.length > 1) {
        delimiter = parts[0].substring(2); /// delimiter = ;
        numbersToProcess = parts[1]; /// numbersToProcess = 1;2
      } else {
        return 0;
      }
    }

    numbersToProcess = numbersToProcess.replaceAll("\n", delimiter);  /// 1\n2,3" => 1,2,3

    final numberList = numbersToProcess.split(delimiter);
    int sum = 0;
    List<int> negativeNumbers = [];

    for (final numStr in numberList) {
      if (numStr.trim().isEmpty)
        continue;
      try {
        final num = int.parse(numStr.trim());
        if (num < 0) {
          negativeNumbers.add(num);
        } else {
          sum += num;
        }
      } catch (e) {
        print('Warning: Could not parse "$numStr" into an integer.');
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw Exception(
        "negative numbers not allowed ${negativeNumbers.join(",")}",
      );
    }

    return sum;
  }
}

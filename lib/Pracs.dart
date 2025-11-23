class Pracs {
  static String reverseString(String revString) {
    var printString = "";
    for (var i = revString.length - 1; i >= 0; i--) {
      printString += revString[i];
    }
    return printString;
  }

  static bool palindrom(String passStr) {
    return passStr == passStr.split('').reversed.join();
  }

  static String getevenOdd(int number) {
    if (number % 2 == 0) {
      return "Even";
    } else {
      return "Odd";
    }
  }

  static List<int> fibonacci(int n) {
    List<int> series = [0, 1];

    for (int i = 2; i < n; i++) {
      series.add(series[i - 1] + series[i - 2]);
    }
    return series;
  }

  static int factorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  static int sumOfDigits(int num) {
    int sum = 0;
    while (num > 0) {
      sum += num % 10;
      num ~/= 10; // integer division
    }
    return sum;
  }

  static int findLargest(List<int> numbers) {
    int largest = numbers[0];

    for (var number in numbers) {
      if (number > largest) {
        largest = number;
      }
    }
    return largest;
  }
}

void main() {
  var getMain = Pracs.reverseString("Prashu");
  var getBool = Pracs.palindrom("level");
  // var getEvenOdd =
  var getFactorial = Pracs.factorial(45);
  print('The getMain ${getFactorial} ${getBool}');
}

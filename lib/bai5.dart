import 'dart:io';

void main() {
  stdout.write('Nhập vào một chuỗi: ');
  String input = stdin.readLineSync() ?? '';

  print('\na. Chuỗi vừa nhập: $input');

  String vowels = 'aăâeêioôơuưyAĂÂEÊIOÔƠUƯY';
  int countVowels = 0;
  for (int i = 0; i < input.length; i++) {
    if (vowels.contains(input[i])) {
      countVowels++;
    }
  }
  print('b. Số ký tự nguyên âm: $countVowels');

  List<String> words = input
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();
  print('c. Số từ trong chuỗi: ${words.length}');

  String cleanStr = input.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  String reversedStr = cleanStr.split('').reversed.join('');
  bool isSymmetric = cleanStr.isNotEmpty && cleanStr == reversedStr;
  print('d. Chuỗi có đối xứng không: ${isSymmetric ? "CÓ" : "KHÔNG"}');

  String reversedWords = words.reversed.join(' ');
  print('e. Đảo ngược từ trong chuỗi: $reversedWords');
}

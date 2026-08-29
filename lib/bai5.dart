import 'dart:io';

void main() {
  // Nhập vào một chuỗi
  stdout.write('Nhập vào một chuỗi: ');
  String input = stdin.readLineSync() ?? '';
  print('\nChuỗi vừa nhập: $input');

  // Chuỗi chứa các nguyên âm
  String vowels = 'aăâeêioôơuưyAĂÂEÊIOÔƠUƯY';

  // Đếm số nguyên âm trong chuỗi
  int countVowels = 0;
  for (int i = 0; i < input.length; i++) {
    if (vowels.contains(input[i])) {
      countVowels++;
    }
  }
  print('Số ký tự nguyên âm: $countVowels');

  // Đếm số từ trong chuối
  List<String> words = input
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();
  print('Số từ trong chuỗi: ${words.length}');

  // Kiểm tra đối xứng
  String cleanStr = input.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  String reversedStr = cleanStr.split('').reversed.join('');
  bool isSymmetric = cleanStr.isNotEmpty && cleanStr == reversedStr;
  print('Chuỗi có đối xứng không: ${isSymmetric ? "CÓ" : "KHÔNG"}');

  // Đảo ngược danh sách
  String reversedWords = words.reversed.join(' ');
  print('Đảo ngược từ trong chuỗi: $reversedWords');
}

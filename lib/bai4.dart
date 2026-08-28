import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Nhập số lượng phần tử cần tạo ngẫu nhiên (> 0): ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Số lượng không hợp lệ.');
    return;
  }

  Random random = Random();
  List<int> list = List.generate(n, (_) => 5 + random.nextInt(96));

  print('\na. Danh sách phần tử: $list');

  List<int> oddNumbers = list.where((item) => item % 2 != 0).toList();
  if (oddNumbers.isEmpty) {
    print('b. Danh sách không có số lẻ.');
  } else {
    double avgOdd = oddNumbers.reduce((a, b) => a + b) / oddNumbers.length;
    print('b. Trung bình cộng các số lẻ: ${avgOdd.toStringAsFixed(2)}');
  }

  bool isSymmetric = true;
  for (int i = 0; i < list.length ~/ 2; i++) {
    if (list[i] != list[list.length - 1 - i]) {
      isSymmetric = false;
      break;
    }
  }
  print('c. Danh sách đối xứng: ${isSymmetric ? "CÓ" : "KHÔNG"}');

  bool isSortedAsc = true;
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      isSortedAsc = false;
      break;
    }
  }
  print('d. Danh sách được sắp xếp tăng dần: ${isSortedAsc ? "CÓ" : "KHÔNG"}');

  int maxVal = list.reduce(max);
  print('e. Phần tử lớn nhất: $maxVal');

  List<int> evenNumbers = list.where((item) => item % 2 == 0).toList();
  if (evenNumbers.isEmpty) {
    print('f. Danh sách không có số chẵn.');
  } else {
    int maxEven = evenNumbers.reduce(max);
    print('f. Số chẵn lớn nhất: $maxEven');
  }

  stdout.write('\nNhập giá trị cần tìm và xóa: ');
  int target = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (!list.contains(target)) {
    print('Không tìm thấy.');
  } else {
    list.removeWhere((item) => item == target);
    print('Đã xóa tất cả phần tử có giá trị $target.');
    print('Danh sách sau khi xóa: $list');
  }
}

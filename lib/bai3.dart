import 'dart:io';

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  stdout.write('Nhập số lượng phần tử của danh sách: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Số lượng không hợp lệ.');
    return;
  }

  List<int> list = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Nhập phần tử thứ ${i + 1}: ');
    int val = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    list.add(val);
  }

  print('\na. Danh sách vừa nhập: $list');

  int tong = list.fold(0, (sum, item) => sum + item);
  print('b. Tổng các phần tử: $tong');

  List<int> primeList = list.where((item) => isPrime(item)).toList();
  print('c. Các số nguyên tố trong danh sách: $primeList');

  stdout.write('\nNhập một giá trị cần tìm: ');
  int x = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  int index = list.indexOf(x);
  if (index != -1) {
    print(
      'Giá trị $x có trong danh sách tại vị trí index: $index (vị trí thứ ${index + 1})',
    );
  } else {
    list.insert(0, x);
    print('Giá trị $x không có trong danh sách. Đã thêm $x vào đầu danh sách.');
    print('Danh sách sau khi thêm: $list');
  }
}

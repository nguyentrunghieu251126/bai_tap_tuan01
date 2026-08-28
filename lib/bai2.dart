import 'dart:io';

void main() {
  int? n;
  while (true) {
    stdout.write('Nhập vào một số nguyên dương (> 10): ');
    n = int.tryParse(stdin.readLineSync() ?? '');

    if (n != null && n > 10) {
      break;
    }
    print('Giá trị không hợp lệ! Vui lòng nhập số nguyên lớn hơn 10.\n');
  }

  String nStr = n.toString();
  int soChuSo = nStr.length;

  int tongChuSo = 0;
  bool coChuSoLe = false;
  int temp = n;

  while (temp > 0) {
    int chuSo = temp % 10;
    tongChuSo += chuSo;

    if (chuSo % 2 != 0) {
      coChuSoLe = true;
    }

    temp ~/= 10;
  }

  print('\n========== KẾT QUẢ ==========');
  print('Số vừa nhập: $n');
  print('a. Số này có $soChuSo chữ số.');
  print('b. Tổng các chữ số: $tongChuSo');
  print('c. Có chứa chữ số lẻ không?: ${coChuSoLe ? "CÓ" : "KHÔNG"}');
}

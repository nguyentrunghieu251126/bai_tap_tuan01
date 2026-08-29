import 'dart:io';
import 'dart:math';

// Kiểm tra số nguyên tố
bool soNguyenTo(int value) {
  if (value < 2) {
    return false;
  }
  for (int i = 2; i <= sqrt(value); i++) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  // Nhập 1 số nguyên dương lớn hơn 10
  int soNguyen;
  do {
    stdout.write("Nhập một số nguyên lớn hơn 10: ");
    soNguyen = int.tryParse(stdin.readLineSync()!) ?? 1;
  } while (soNguyen <= 10);

  int temp = soNguyen;
  int demChuSo = 0;
  int tongChuSo = 0;
  bool coChuSoLe = false;
  int chuSoLonNhat = 0;
  List<int> list = [];

  while (temp > 0) {
    int chuSo = temp % 10;
    demChuSo++;
    tongChuSo += chuSo;
    if (chuSo % 2 != 0) {
      coChuSoLe = true;
    }
    if (chuSo > chuSoLonNhat) {
      chuSoLonNhat = chuSo;
    }
    temp ~/= 10;
  }

  for (int i = 0; i <= soNguyen; i++) {
    if (soNguyenTo(i)) {
      list.add(i);
    }
  }

  print("\nSố $soNguyen có: $demChuSo chữ số");
  print("Tổng các chữ số: $tongChuSo");
  print("Chứa chữ số lẻ: ${coChuSoLe ? "Có" : "Không"}");
  print("Chữ số lớn nhất: $chuSoLonNhat");
  if (list.isNotEmpty) {
    print("Danh sách các số nguyên tố bên trong $soNguyen: $list");
  } else {
    print("Không có chữ số nguyên tố nào bên trong $soNguyen.");
  }
}

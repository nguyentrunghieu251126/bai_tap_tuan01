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
  // Khai báo danh sách các số nguyên
  List<int> list = [];

  // Khai báo số phần tử trong danh sách
  int member;
  do {
    stdout.write("Nhập số lượng phần tử cần khởi tạo: ");
    member = int.tryParse(stdin.readLineSync()!) ?? 1;
  } while (member <= 0);

  // Nhập giá trị cho phần tử
  for (int i = 0; i < member; i++) {
    stdout.write("Nhập phần tử thứ $i: ");
    list.add(int.tryParse(stdin.readLineSync()!) ?? 404);
  }

  // Xuất danh sách
  print("\nDanh sách phần tử: $list");

  // Tổng các phần tử trong danh sách
  // list.fold(giáTrịKhởiTạo, (biếnTíchLũy, phầnTửHiệnTại) => biểuThứcKếtHợp)
  int tong = list.fold(0, (sum, x) => sum + x);
  print("Tổng các phần tử trong danh sách: $tong");

  // Xuất các phần tử là số nguyên tố
  List<int> listSNt = list.where(soNguyenTo).toList();
  print("Danh sách các số là số nguyên tố: $listSNt");

  // Nhập 1 giá trị bất kì để thêm vào danh sách
  stdout.write("Nhập một giá trị bất kì: ");
  int value = int.tryParse(stdin.readLineSync()!) ?? 1;

  if (list.any((x) => x == value)) {
    print("Giá trị $value đã có trong danh sách");
  } else {
    list.add(value);
    print("Đã thêm $value vào danh sách");
  }
}

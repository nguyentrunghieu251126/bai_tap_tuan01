import 'dart:io';
import 'dart:math';

// Kiểm tra đối xứng
bool isDoiXung(List<int> list) {
  for (int i = 0; i < list.length ~/ 2; i++) {
    if (list[i] != list[list.length - 1 - i]) {
      return false;
    }
  }
  return true;
}

// Kiểm tra tăng dần
bool isBySort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
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
  Random random = Random();
  for (int i = 0; i < member; i++) {
    // random.nextInt(max - min + 1) + min
    list.add(random.nextInt(100 - 5 + 1) + 5);
  }

  // Xuất danh sách
  print("\nDanh sách phần tử được random là: $list");

  // Tổng các phần tử trong danh sách
  int tong = list.fold(0, (tong, x) => tong + x);
  print("Tổng các phần tử trong danh sách: $tong");

  // Trung bình cộng các số lẻ
  List<int> listSoLe = list.where((x) => x % 2 != 0).toList();
  if (listSoLe.isNotEmpty) {
    int tongSoLe = listSoLe.fold(0, (sum, x) => sum + x);
    double avgSoLe = tongSoLe / listSoLe.length;
    print("Trung bình cộng các số lẽ là: ${avgSoLe.toStringAsFixed(2)}");
  } else {
    print("Không có số lẽ trong danh sách");
  }

  // Kiểm tra đối xứng
  if (isDoiXung(list)) {
    print("Danh sách đối xứng");
  } else {
    print("Danh sách không đối xứng");
  }

  // Kiểm tra tăng dần
  if (isBySort(list)) {
    print("Danh sách tăng dần");
  } else {
    print("Danh sách không tăng dần");
  }

  // Phần tử lớn nhất trong danh sách
  print("Phần tử lớn nhất trong danh sách là: ${list.reduce(max)}");

  // Phần tử chẵn lớn nhất trong danh sách
  List<int> listChan = list.where((x) => x % 2 == 0).toList();
  if (listChan.isNotEmpty) {
    print("Số chẵn lớn nhất trong danh sách là: ${listChan.reduce(max)}");
  } else {
    print("Danh sách không có số chẵn");
  }

  // Nhập 1 giá trị bất kì để so sánh và xóa khỏi danh sách
  stdout.write("Nhập một giá trị bất kì: ");
  int value = int.tryParse(stdin.readLineSync()!) ?? 1;
  if (list.any((x) => x == value)) {
    list.remove(value);
    print("Danh sách sao khi xóa phần tử $value: $list");
  } else {
    print("Không tìm thấy phần tử trong danh sách");
  }
}

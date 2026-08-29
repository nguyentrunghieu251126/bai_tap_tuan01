import 'dart:io';

void main() {
  // Nhập số que kem
  int soQueKem;
  do {
    stdout.write("Nhập số kem bạn cần mua: ");
    soQueKem = int.parse(stdin.readLineSync()!);
  } while (soQueKem <= 0);

  // Nhập số tiền cho mỗi que kem
  double soTien;
  do {
    stdout.write("Nhập số tiền cho mỗi que kem: ");
    soTien = double.tryParse(stdin.readLineSync()!) ?? 1.0;
  } while (soTien <= 0);

  // Tổng tiền
  double tongTien;
  if (soQueKem > 10) {
    tongTien = soTien * soQueKem * 0.9;
  } else if (soQueKem >= 5) {
    tongTien = soTien * soQueKem * 0.95;
  } else {
    tongTien = soTien * soQueKem;
  }

  // Xuất nội dung
  print("Tổng tiền cho $soQueKem là: $tongTien");
}

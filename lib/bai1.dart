import 'dart:io';

void main() {
  stdout.write('Nhập số que kem cần mua (> 0): ');
  int? soLuong = int.tryParse(stdin.readLineSync() ?? '');

  if (soLuong == null || soLuong <= 0) {
    print('Số lượng không hợp lệ! Vui lòng nhập số nguyên > 0.');
    return;
  }

  stdout.write('Nhập giá tiền 1 que kem: ');
  double? giaTien = double.tryParse(stdin.readLineSync() ?? '');

  if (giaTien == null || giaTien <= 0) {
    print('Giá tiền không hợp lệ! Vui lòng nhập số > 0.');
    return;
  }

  // 3. Tính toán theo mức giảm giá
  double tongTienChuaGiam = soLuong * giaTien;
  double phanTramGiam = 0.0;

  if (soLuong > 10) {
    phanTramGiam = 0.10;
  } else if (soLuong >= 5) {
    phanTramGiam = 0.05;
  } else {
    phanTramGiam = 0.0;
  }

  double tienGiam = tongTienChuaGiam * phanTramGiam;
  double thanhTien = tongTienChuaGiam - tienGiam;

  print('\n--- KẾT QUẢ TÍNH TIỀN ---');
  print('Số lượng que kem: $soLuong');
  print('Đơn giá: ${giaTien.toStringAsFixed(0)} VNĐ');
  print('Tổng tiền ban đầu: ${tongTienChuaGiam.toStringAsFixed(0)} VNĐ');
  print(
    'Mức giảm giá: ${(phanTramGiam * 100).toInt()}% (-${tienGiam.toStringAsFixed(0)} VNĐ)',
  );
  print('Số tiền thực tế phải trả: ${thanhTien.toStringAsFixed(0)} VNĐ');
}

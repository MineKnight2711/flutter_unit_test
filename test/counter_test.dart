import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/counter.dart';

void main() {
  // //Pretest
  // setUp(() => null);
  // setUpAll(() => null);
  // //Postest
  // tearDown(() => null);
  // tearDownAll(() => null);
  //Gom các ca kiểm thử cho counter class thành 1 nhóm
  group("Counter class - ", () {
    //Thiết lập cho ca kiểm thử, tạo đối tượng Counter mới

    test(
        "Truyền vào Counter class khi mà nó khởi tạo thì giá trị biến count phải bằng 0",
        () {
      final Counter counter = Counter();
      final val = counter.count;
      expect(val, 0);
    });
    test(
        "Truyền vào Counter class khi mà biến count của nó tăng lên thì giả trị của biến count phải bằng 1",
        () {
      final Counter counter = Counter();
      //Đây là phần thực thi , tăng giá trị của biến count lên 1 bằng cách gọi phương thức incrementCounter() của đối tượng counter.
      counter.incrementCounter();
      final val = counter.count;
      //Phần kiểm tra , so sánh giá trị của count với giá trị mong đợi là 1 bằng cách sử dụng hàm expect()
      expect(val, 1);
    });
    test(
        "Truyền vào Counter class khi mà biến count của nó giảm xuống thì giả trị của biến count phải bằng -1",
        () {
      final Counter counter = Counter();
      //Đây là phần thực thi , tăng giá trị của biến count lên 1 bằng cách gọi phương thức incrementCounter() của đối tượng counter.
      counter.decrementCounter();
      final val = counter.count;
      //Phần kiểm tra , so sánh giá trị của count với giá trị mong đợi là 1 bằng cách sử dụng hàm expect()
      expect(val, -1);
    });
  });
}

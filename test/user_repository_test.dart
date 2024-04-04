import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/user_model.dart';
import 'package:flutter_unit_test/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockClient;
  late UserRepository userRepository;
  //Arrange
  setUp(() {
    mockClient = MockHttpClient();
    userRepository = UserRepository(mockClient);
  });
  group("User repository test", () {
    group("Get user test", () {
      test(
          "Chạy phương thức getUser nếu status code là 200 thì trả về một User",
          () async {
        when(
          () => mockClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")),
        ).thenAnswer((invocation) async {
          return Response('''
            {
                "id": 1,
                "name": "Leanne Graham",
                "username": "Bret",
                "email": "Sincere@april.biz",
                "phone": "1-770-736-8031 x56442",
                "website": "hildegard.org"
                
            }
          ''', 200);
        });
        //Act
        final response = await userRepository.getUser();
        //Assert
        expect(response, isA<User>());
      });
      test(
          "Chạy phương thức getUser nếu status code khác 200 thì quăng ngoại lệ",
          () async {
        when(
          () => mockClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")),
        ).thenAnswer((invocation) async => Response('{}', 500));
        //Act
        final response = userRepository.getUser();
        //Assert
        expect(response, throwsException);
      });
    });
  });
}

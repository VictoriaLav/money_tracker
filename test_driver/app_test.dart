import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  group('LoginPage test', () {

    final emailField = find.byValueKey('fieldEmail');
    final passwordField = find.byValueKey('fieldPassword');
    final loginButton = find.byValueKey('buttonLogin');
    final snackbar = find.byType('SnackBar');

    late FlutterDriver driver;
    setUpAll(() async {
    driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null) {
        driver.close();
      }
    });

    test("login fails with incorrect email and password, provides snackbar feedback", () async {
      await driver.tap(emailField);
      await driver.enterText('test@test.com');
      await driver.tap(passwordField);
      await driver.enterText('12345');
      await driver.tap(loginButton);
      await driver.waitFor(snackbar);
      assert(snackbar != null);
      await driver.waitUntilNoTransientCallbacks();


    });


  });
  // final _firebase = MockFirebaseAuth();
  // BehaviorSubject<MockUser> _user = BehaviorSubject<MockUser>();
  // LoginRepository _repo = MockUserRepository(firebase: _firebase);
  //
  // var widgetLogin = MultiBlocProvider(
  //   providers: [
  //     BlocProvider<LoginBloc>(
  //       create: (_) =>
  //           LoginBloc(
  //             loginRepository: LoginRepository(firebase: _firebase),
  //           ),
  //     ),
  //     BlocProvider<FormTypeBloc>(
  //       create: (_) => FormTypeBloc(),
  //     ),
  //   ],
  //   child: const MaterialApp(
  //     home: LoginPage(),
  //   ),
  // );



  // var emailField = find.byValueKey('fieldEmail');
  // var passwordField = find.byValueKey('fieldPassword');
  // var loginButton = find.byValueKey('buttonLogin');
  // var snackbar = find.byType('SnackBar');

  // group('LoginPage test', () {
  //
  //   FlutterDriver driver;
  //   // setUpAll(() async {
  //     driver = await FlutterDriver.connect();
  //   // });
  //
  //   // tearDownAll(());
  //
  //   // when(_repo.signIn(email: 'test@test.com', password: '1234756')).thenAnswer((_) async {});
  //   // testWidgets("email, password and button are found", (WidgetTester tester) async {
  //   //   await tester.pumpWidget(widgetLogin);
  //   //
  //   //   expect(emailField, findsOneWidget);
  //   //   expect(passwordField, findsOneWidget);
  //   //   expect(loginButton, findsOneWidget);
  //   //
  //   // });
  //   //
  //   // testWidgets("validates empty email and password", (WidgetTester tester) async {
  //   //   await tester.pumpWidget(widgetLogin);
  //   //
  //   //   await tester.tap(loginButton);
  //   //   await tester.pump();
  //   //   expect(find.text('Введите e-mail'), findsOneWidget);
  //   //   expect(find.text('Введите пароль'), findsOneWidget);
  //   //
  //   // });
  //   //
  //   // testWidgets("validates incorrect email", (WidgetTester tester) async {
  //   //   await tester.pumpWidget(widgetLogin);
  //   //
  //   //   await tester.enterText(emailField, '123');
  //   //   await tester.tap(loginButton);
  //   //   await tester.pump();
  //   //   expect(find.text('Поле e-mail заполнено не корректно'), findsOneWidget);
  //   //
  //   // });
  //   //
  //   // testWidgets("login fails with incorrect email and password, provides snackbar feedback", (WidgetTester tester) async {
  //   //   await tester.pumpWidget(widgetLogin);
  //   //
  //   //   await d
  //   //
  //   //   await tester.enterText(emailField, 'test@test.com');
  //   //   await tester.enterText(passwordField, '123456');
  //   //   await tester.tap(loginButton);
  //   //   await tester.pump();
  //   //   _firebase.currentUser
  //   //
  //   //
  //   // });
  //
  // });


}

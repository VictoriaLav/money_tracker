// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/blocs/login_bloc.dart';

import 'package:money_tracker/repositories/login_repository.dart';
import 'package:money_tracker/widgets/login_page.dart';

void main() {

  group('LoginPage SignIn tests', () {

    testWidgets("test Firebase", (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
    });

    testWidgets("test description", (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(
              loginRepository: LoginRepository(),
            ),
          ),
        ],
        child: MaterialApp(
          home: FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const LoginPage();
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ),
      ));

      // await tester.enterText(find.byKey(const Key('fieldEmail')), 'test@test.com');
      //   expect(find.text('test@test.com'), findsOneWidget);

      // // Нужно проверить, что в поле phone введены только цифры.
      // await tester.enterText(find.byKey(const Key('fieldPhone')), '8008800');
      // expect(find.text('8008800'), findsOneWidget);
      //
      // // При клике на кнопку «Отправить» нужно убедиться,
      // // что на экране появилась надпись «Добро пожаловать».
      // await tester.tap(find.byKey(const Key('button1')));
      // await tester.pump();
      // expect(find.text('Добро пожаловать'), findsOneWidget);

    });

    // testWidgets("test description", (WidgetTester tester) async {
    //   WidgetsFlutterBinding.ensureInitialized();
    //   await Firebase.initializeApp();
    //
    //   await tester.pumpWidget(
    //     //   MultiBlocProvider(
    //     // providers: [
    //     //   BlocProvider<LoginBloc>(
    //     //     create: (_) => LoginBloc(
    //     //       loginRepository: LoginRepository(),
    //     //     ),
    //     //   ),
    //     // ],
    //     // child:
    //     const MaterialApp(
    //       localizationsDelegates: [
    //         GlobalMaterialLocalizations.delegate,
    //         GlobalCupertinoLocalizations.delegate,
    //         GlobalWidgetsLocalizations.delegate,
    //       ],
    //       home: LoginPage(),
    //     // ),
    //   ));
    //
    //   await tester.enterText(find.byKey(const Key('fieldEmail')), 'test@test1.com');
    //   expect(find.text('test@test.com'), findsOneWidget);
    //
    //   await tester.enterText(find.byKey(const Key('fieldPassword')), '12345678');
    //   expect(find.text('12345678'), findsOneWidget);
    //
    //   await tester.tap(find.byKey(const Key('buttonLogin')));
    //   await tester.pump();
    //   // expect(find.text('Добро пожаловать'), findsOneWidget);
    //
    // });
  });

  // group('LoginPage SignUp tests', () {
  //
  //   testWidgets("test description", (WidgetTester tester) async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp();
  //
  //     await tester.pumpWidget(MultiBlocProvider(
  //       providers: [
  //         BlocProvider<LoginBloc>(
  //           create: (_) => LoginBloc(
  //             loginRepository: LoginRepository(),
  //           ),
  //         ),
  //       ],
  //       child: const MaterialApp(
  //         localizationsDelegates: [
  //           GlobalMaterialLocalizations.delegate,
  //           GlobalCupertinoLocalizations.delegate,
  //           GlobalWidgetsLocalizations.delegate,
  //         ],
  //         home: LoginPage(),
  //       ),
  //     ));
  //
  //     await tester.tap(find.byKey(const Key('fieldSignInOrSignUp')));
  //     await tester.pump();
  //
  //     await tester.enterText(find.byKey(const Key('fieldEmail')), 'test@test1.com');
  //     expect(find.text('test@test.com'), findsOneWidget);
  //
  //     await tester.enterText(find.byKey(const Key('fieldPassword')), '12345678');
  //     expect(find.text('12345678'), findsOneWidget);
  //
  //     await tester.tap(find.byKey(const Key('buttonLogin')));
  //     await tester.pump();
  //     // expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
  //
  //   });
  // });
}

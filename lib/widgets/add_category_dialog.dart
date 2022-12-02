import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/costs_bloc.dart';
import '../blocs/events/costs_event.dart';
import '../styles/colors.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({Key? key}) : super(key: key);

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  Color labelColor1 = customColorGrey;
  Color labelColor2 = customColorGrey;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? nameCategory;
  String? colorCategory;

  final styleBorderFocus = UnderlineInputBorder(
    borderSide: BorderSide(
      color: customColorViolet,
    ),
  );

  final styleBorderEnable = UnderlineInputBorder(
    borderSide: BorderSide(
      color: customColorGrey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Focus(
            onFocusChange: (hasFocus) {
              setState(() => labelColor1 = hasFocus ? customColorViolet : customColorGrey);
            },
            child: TextFormField(
              key: const Key('text1'),
              validator: (value) {
                nameCategory = value;
                if (value == '') return 'Введите название';
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Название',
                labelStyle: TextStyle(color: labelColor1),
                focusedBorder: styleBorderFocus,
                enabledBorder: styleBorderEnable,
              ),
            ),
          ),
          Focus(
            onFocusChange: (hasFocus) {
              setState(() => labelColor2 = hasFocus ? customColorViolet : customColorGrey);
            },
            child: TextFormField(
              key: const Key('text2'),
              validator: (value) {
                colorCategory = value;
                if (value == '') {
                  return 'Введите цвет';
                } else if (!checkColor(value!)) {
                  return 'Некорректное значение';
                }
                return null;
              },
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'Цвет',
                labelStyle: TextStyle(color: labelColor2),
                focusedBorder: styleBorderFocus,
                enabledBorder: styleBorderEnable,
              ),
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            key: const Key('buttonWait'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50.0),
              primary: customColorViolet,
              onPrimary: customColorWhite,
              textStyle: const TextStyle(fontSize: 17),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<CostsBloc>(context).add(AddCategoryRequested(nameCategory!, colorCategory!));
                Navigator.of(context).pop();
              }
            },
            child: const Text('Добавить'),
          ),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text(
              'Отмена',
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

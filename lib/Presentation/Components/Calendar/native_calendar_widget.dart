import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.onChange});
  final Function(String value)? onChange;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  String? selectedDate;
  final TextEditingController? conttroller = TextEditingController();
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(10000),
    );

    setState(() {
      if (pickedDate == null) return;
      DateTime dateTime = DateTime.parse(pickedDate.toIso8601String());
      String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
      conttroller!.text = formattedDate;
      widget.onChange!(formattedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        InkWell(
          onTap: _selectDate,
          child: TextInputCustom(
            controller: conttroller,
            hint: selectedDate ?? 'Data',
            enable: false,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class CustomDatePicker extends StatefulWidget {
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        )) ??
        DateTime.now();

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate != null
        ? DateFormat.yMd().format(selectedDate!)
        : 'Seleccionar fecha';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: NbSecondSecondaryColor,
          labelText: 'Fecha de nacimiento',
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).cardColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
        ),
        readOnly: true,
        controller: TextEditingController(text: formattedDate),
        onTap: () => _selectDate(context),
      ),
    );
  }
}

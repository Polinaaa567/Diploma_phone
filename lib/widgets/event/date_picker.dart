import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DatePicker extends ConsumerWidget {
  final String label;
  final String? value;
  final ValueChanged<String?> onChanged;

  const DatePicker({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayValue = value != null ? _formatForDisplay(value!) : null;

    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: displayValue),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
      onTap: () async {
        final selected = await _selectedDateTime(
          context,
          value,
        );
        if (selected != null) {
          onChanged(selected);
        }
      },
    );
  }

  Future<String?> _selectedDateTime(
    BuildContext context,
    String? initialValue,
  ) async {
    DateTime initialDate = initialValue != ''
        ? DateFormat("yyyy-MM-dd'T'HH:mm").parse(initialValue!)
        : DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (date == null) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );

    if (time == null) return null;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    return DateFormat("yyyy-MM-dd'T'HH:mm").format(dateTime);
  }

  String _formatForDisplay(String isoDate) {
    try {
      final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm").parse(isoDate);
      return DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
    } catch (e) {
      return isoDate;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> options = <String>['One', 'Two', 'Three', 'Four'];
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: RsColor.primaryFirst.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: DropdownButton<String>(
          value: dropdownValue,
          isDense: true,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          underline: const SizedBox(),
          isExpanded: true,
          style: Theme.of(context).textTheme.bodyMedium,
          dropdownColor: RsColor.primaryFirst,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          // selectedItemBuilder: (BuildContext context) {
          //   return options.map((String value) {
          //     return Align(
          //       alignment: Alignment.bottomLeft,
          //       child: Text(
          //         dropdownValue,
          //       ),
          //     );
          //   }).toList();
          // },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

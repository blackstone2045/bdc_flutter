import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State {
  String? selectedCountry;
 final  countries = [
    'Bangladesh',
    'India',
    'Pakistan',
    'Sri Lanka',
    'Nepal',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          value: selectedCountry,
          hint: Text('Select Country'),
          isExpanded: true,
          items: countries.map((String country) {
            return DropdownMenuItem(
              value: country,
              child: Text(country),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedCountry = value;
            });
          },
        ),

        // Styled dropdown
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedCountry,
              hint: Text('Choose...'),
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              items: countries.map((String country) {
                return DropdownMenuItem(
                  value: country,
                  child: Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 10),
                      Text(country),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
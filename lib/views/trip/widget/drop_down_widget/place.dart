import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PlacesDropDownButton extends StatelessWidget {
  const PlacesDropDownButton({
    Key? key,
    required this.value,
    required this.items,
  }) : super(key: key);
  final String? value;
  final List<String>? items;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width(13), bottom: height(3)),
            child: const AutoSizeText(
              'Place',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF5B618A),
              ),
            ),
          ),
          Container(
            height: height(39),
            width: width(249),
            decoration: BoxDecoration(
                color: const Color(0xffCFCBDC),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              underline: const SizedBox(height: null),
              iconEnabledColor: const Color(0xFF5B618A),
              iconDisabledColor: const Color(0xFF5B618A),
              dropdownColor: const Color(0xffE9DCEC),
              value: value,
              isExpanded: true,
              iconSize: height(30),
              items: items!
                  .map((country) => DropdownMenuItem<String>(
                        value: country,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: AutoSizeText(
                            country,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5B618A),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}

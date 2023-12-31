import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/const/country_list.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/widget/container_choose.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/widget/horizontal_line.dart';

class ThirdSignUp extends StatelessWidget {
  const ThirdSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();

    bool validateCountryValue() {
      if (cubit.countryValue == null) {
        return false;
      } else {
        return true;
      }
    }

    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Column(
      children: [
        SizedBox(
          height: height(20),
        ),
        HorizontalLinee(
          precent: 70,
        ),
        SizedBox(
          height: height(52),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Country',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff5B618A),
              ),
            ),
            SizedBox(
              height: height(4),
            ),
            Container(
              height: height(38),
              width: width(313),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                border: Border(
                  bottom: BorderSide(
                    width: width(3),
                    color: const Color(0xFF5B618A),
                  ),
                ),
              ),
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xffE9DCEC),
                    value: context.read<RegisterCubit>().countryValue,
                    isExpanded: true,
                    iconSize: height(26),
                    items: countries.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      context.read<RegisterCubit>().changeCountryValue(value!);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(22),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Date of birth',
              style: TextStyle(fontSize: 18.0, color: Color(0xff5B618A)),
            ),
            SizedBox(
              height: height(4),
            ),
            InkWell(
              onTap: () async {
                DateTime? newDateTime = await showDatePicker(
                  context: context,
                  initialDate: cubit.dateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Color(0xFF5B618A), // header background color
                          onPrimary: Color(0xffE9DCEC), // header text color
                          onSurface: Colors.black, // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary:
                                const Color(0xFF5B618A), // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (newDateTime == null) return;
                cubit.chandeDateTime(newDateTime);
              },
              child: Container(
                height: height(38),
                width: width(313),
                margin: EdgeInsets.only(
                  top: height(8),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  border: Border(
                    bottom: BorderSide(
                      width: width(3),
                      color: const Color(0xFF5B618A),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height(8),
                    left: width(8),
                  ),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) => AutoSizeText(
                      '${cubit.dateTime.day}/${cubit.dateTime.month}/${cubit.dateTime.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height(29),
        ),
        Padding(
          padding: EdgeInsets.only(left: width(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                'Gender',
                style: TextStyle(fontSize: 18.0, color: Color(0xff5B618A)),
              ),
              SizedBox(
                height: height(10),
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<RegisterCubit>().changeGenderValue('Male');
                      },
                      child: ContainerChoose(
                          'Male', width(94), height(33), cubit.isMale),
                    ),
                    SizedBox(
                      width: width(40),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<RegisterCubit>()
                            .changeGenderValue('Female');
                      },
                      child: ContainerChoose(
                          'Female', width(94), height(33), cubit.isFemale),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height(61),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String country) => DropdownMenuItem(
        value: country,
        child: AutoSizeText(
          country,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5B618A),
          ),
        ),
      );
}

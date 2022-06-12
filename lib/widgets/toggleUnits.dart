import 'package:bmi_calculator/toggle_cubit/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleUnits extends StatelessWidget {
  final String text1;
  final String text2;

  ToggleUnits({Key? key, required this.text1, required this.text2})
      : super(key: key);

  var toggleDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ToggleCubit>(context);

    print(bloc.state.toString());
    return BlocConsumer<ToggleCubit, ToggleState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
            onTap: () {
              bloc.toggleSwitch();
              print('toggle state ${bloc.state}');
            },
            child: AnimatedContainer(
              height: 40,
              width: 200,
              duration: toggleDuration,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(color: const Color(0xFF5780D3), width: 0.5),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: toggleDuration,
                    alignment: bloc.isEnabled
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFF5780d3),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.6, 0),
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          text1,
                          style: TextStyle(
                              color: !bloc.isEnabled ? Colors.white : Colors.black),
                        )),
                  ),
                  Align(
                    alignment: const Alignment(0.6, 0),
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          text2,
                          style: TextStyle(
                              color: bloc.isEnabled ? Colors.white : Colors.black),
                        )),
                  )
                ],
              ),
            ));
      },
    );
  }
}

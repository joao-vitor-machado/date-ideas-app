import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_state.dart';
import 'package:trabalho_fibal_mob_2022/bloc/slider_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/slider_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/slider_state.dart';

import '../bloc/manage_event.dart';

class SliderBar extends StatelessWidget {
  SliderBar({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return BlocBuilder<SliderBloc, SliderState>(builder: (context, state) {
      return Column(
        children: [
          Slider(
              activeColor: tema.primary,
              min: 10,
              max: 80,
              value: context.read<SliderBloc>().state.sliderValue,
              divisions: 70,
              label: context
                  .read<SliderBloc>()
                  .state
                  .sliderValue
                  .round()
                  .toString(),
              onChanged: (value) {
                context.read<SignupBloc>().add(SignupAgeChanged(age: value));
                context.read<SliderBloc>().add(ChangeNumber(value: value));
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}

import 'package:adviser/application/advicer/advicer_bloc.dart';
import 'package:adviser/presentation/advicer/widgets/advice_field.dart';
import 'package:adviser/presentation/advicer/widgets/custom_button.dart';
import 'package:adviser/presentation/advicer/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adviser",
          style: themeData.textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: BlocBuilder<AdvicerBloc, AdvicerState>(
                    bloc: BlocProvider.of<AdvicerBloc>(context),
                    builder: (context, adviceState) {
                      if (adviceState is AdvicerInitial) {
                        return Text(
                          "Your Advice is waiting for you",
                          style: themeData.textTheme.displayLarge,
                        );
                      } else if (adviceState is AdvicerStateLoading) {
                        return CircularProgressIndicator(
                          color: themeData.colorScheme.secondary,
                        );
                      } else if (adviceState is AdvicerStateLoaded) {
                        return AdviceField(
                          advice: adviceState.advice,
                        );
                      } else if (adviceState is AdvicerStateError) {
                        return ErrorMessage(
                          message: adviceState.message,
                        );
                      } else {
                        return const Placeholder();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

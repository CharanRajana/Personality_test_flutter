import 'package:personality_app/extras/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personality_app/pages/questionPage.dart';
import 'package:personality_app/providers/postResponseProvider.dart';

class TestPage extends ConsumerStatefulWidget {
  const TestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends ConsumerState<TestPage> {
  int currentIndex = 0;
  List<Step> steps() => [
        Step(
          state: currentIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: currentIndex >= 0,
          title: const Text('Q.1'),
          content: Center(
            child: QuestionPage(
              question: questions[0],
            ),
          ),
        ),
        Step(
          state: currentIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: currentIndex >= 1,
          title: const Text('Q.2'),
          content: Center(
            child: QuestionPage(
              question: questions[1],
            ),
          ),
        ),
        Step(
          state: currentIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: currentIndex >= 2,
          title: const Text('Q.3'),
          content: Center(
            child: QuestionPage(
              question: questions[2],
            ),
          ),
        ),
        Step(
          state: currentIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: currentIndex >= 3,
          title: const Text('Q.4'),
          content: Center(
            child: QuestionPage(
              question: questions[3],
            ),
          ),
        ),
        Step(
          state: currentIndex <= 4 ? StepState.editing : StepState.complete,
          isActive: currentIndex >= 4,
          title: const Text('Q.5'),
          content: Center(
            child: QuestionPage(
              question: questions[4],
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          floatingActionButton: currentIndex == 4
              ? FloatingActionButton.extended(
                  onPressed: () {
                    ref.watch(postResponseProvider);
                    Navigator.pop(context);
                  },
                  label: const Text('Submit'),
                )
              : const SizedBox(),
          body: SafeArea(
            child: Stepper(
              currentStep: currentIndex,
              steps: steps(),
              type: StepperType.horizontal,
              onStepTapped: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              onStepContinue: () {
                currentIndex < (steps().length - 1)
                    ? currentIndex++
                    : 'please enter';
                setState(() {});
              },
              onStepCancel: () {
                currentIndex == 0 ? null : currentIndex--;
                setState(() {});
              },
            ),
          ),
        );
      }),
    );
  }
}

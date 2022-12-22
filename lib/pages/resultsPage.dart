import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personality_app/pages/static/output.dart';
import 'package:personality_app/providers/postResponseProvider.dart';

class ResultsPage extends ConsumerWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(postResponseProvider);
    return results.when(
      data: (data) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 8.0,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Overall Results:',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: CircularPercentIndicator(
                              radius: 130.0,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: data.getAvg(),
                              center: Text(
                                "${data.getAvg() * 10}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.purpleAccent,
                              progressColor: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            elevation: 8.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              height: 250,
                              width: 250,
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: data.agreeableness!,
                                center: Text(
                                  "${data.agreeableness! * 100} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                header: const Text(
                                  "Agreeableness",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              height: 250,
                              width: 250,
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: data.conscientiousness!,
                                center: Text(
                                  "${data.conscientiousness! * 100} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                header: const Text(
                                  "Conscientiousness",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              height: 250,
                              width: 250,
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: data.neuroticism!,
                                center: Text(
                                  "${data.neuroticism! * 100} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                header: const Text(
                                  "Neuroticism",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              height: 250,
                              width: 250,
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: data.openness!,
                                center: Text(
                                  "${data.openness! * 100} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                header: const Text(
                                  "Openness",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 8.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              height: 250,
                              width: 250,
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: data.extroversion!,
                                center: Text(
                                  "${data.extroversion! * 100} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                header: const Text(
                                  "Extroversion",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Output();
      },
    );
  }
}

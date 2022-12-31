import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personality_app/extras/widgets.dart';
import 'package:personality_app/models/databaseRepository.dart';
import 'package:personality_app/providers/postResponseProvider.dart';

class ResultsPage extends ConsumerWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future update(double avg) async {
      final data = DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .userCollections
          .doc(FirebaseAuth.instance.currentUser!.uid.toString());

      data.update({'score': avg});
    }

    final results = ref.watch(postResponseProvider);
    return results.when(
      data: (data) {
        update(data.getAvg());
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
                              percent: 1.0,
                              center: Text(
                                (data.getAvg() * 10).toString().substring(0, 3),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              progressColor: Colors.purple,
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
                          resultCard(data.agreeableness, 'Agreeableness'),
                          resultCard(
                              data.conscientiousness, 'Conscientiousness'),
                          resultCard(data.neuroticism, 'Neuroticism'),
                          resultCard(data.openness, 'Openness'),
                          resultCard(data.extroversion, 'Extroversion')
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
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

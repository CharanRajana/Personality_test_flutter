import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personality_app/extras/secret.dart';
import 'package:personality_app/models/traitsModel.dart';
import 'package:personality_app/providers/answerProvider.dart';

final postResponseProvider = FutureProvider<PostResponse>((ref) {
  final answer = ref.read(answerProvider);
  return createPostResponse(
    answer,
  );
});

Future<PostResponse> createPostResponse(String input) async {
  print(input);
  body['text'] = input;
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: headers,
    body: jsonEncode([body]),
  );

  if (response.statusCode == 200) {
    final res = PostResponse.fromMap(
      jsonDecode(response.body)[0],
    );
    print(res);
    return res;
  } else {
    throw Exception('Failed to get a response.');
  }
}

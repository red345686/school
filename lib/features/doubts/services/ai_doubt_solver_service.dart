import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../../core/constants/app_constants.dart';

class AIDoubtSolverService {
  late final GenerativeModel _model;

  AIDoubtSolverService() {
    _model = GenerativeModel(
      model: 'gemini-3-flash-preview',
      apiKey: AppConstants.geminiApiKey,
      systemInstruction: Content.system(
        'You are an expert teacher and tutor who helps students solve their academic doubts. '
        'Provide clear, step-by-step explanations suitable for school students. '
        'Use simple language and examples. Be encouraging and patient. '
        'Focus on helping students understand concepts, not just providing answers.',
      ),
    );
  }

  Future<String> solveDoubt({
    required String question,
    required String subject,
    String? imageBase64,
  }) async {
    try {
      final prompt =
          '''
Subject: $subject

Question: $question

Please provide a detailed, step-by-step solution that helps the student understand the concept.
Include:
1. Brief explanation of the concept
2. Step-by-step solution
3. Final answer
4. Related tips or common mistakes to avoid
''';

      final content = [
        Content.text(prompt),
        if (imageBase64 != null)
          Content.data('image/jpeg', base64Decode(imageBase64)),
      ];

      final response = await _model.generateContent(content);
      return response.text ?? 'Unable to generate solution. Please try again.';
    } catch (e) {
      debugPrint('Error solving doubt: $e');
      return 'Error generating solution: ${e.toString()}';
    }
  }

  Future<String> getSimplifiedExplanation({
    required String question,
    required String subject,
    required String previousAnswer,
  }) async {
    try {
      final prompt =
          '''
Subject: $subject

Original Question: $question

Previous Explanation: $previousAnswer

The student is still confused. Please provide a MUCH SIMPLER explanation with:
1. Break down the concept into the most basic terms (like explaining to a 5th grader)
2. Use real-life examples and analogies the student can relate to
3. Add simple diagrams or visual descriptions
4. Highlight the key points clearly
5. Provide practice tips to master this concept

Make it as simple and clear as possible!
''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ??
          'Unable to generate simplified explanation. Please try again.';
    } catch (e) {
      debugPrint('Error getting simplified explanation: $e');
      return 'Error generating simplified explanation: ${e.toString()}';
    }
  }

  Future<String> getClarification({
    required String originalQuestion,
    required String previousAnswer,
    required String followUpQuestion,
  }) async {
    try {
      final prompt =
          '''
Original Question: $originalQuestion

Previous Answer: $previousAnswer

Follow-up Question: $followUpQuestion

Please provide clarification for the follow-up question while maintaining context from the previous discussion.
''';

      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text ??
          'Unable to generate clarification. Please try again.';
    } catch (e) {
      debugPrint('Error getting clarification: $e');
      return 'Error generating clarification: ${e.toString()}';
    }
  }

  Future<List<String>> getSimilarQuestions({
    required String question,
    required String subject,
  }) async {
    try {
      final prompt =
          '''
Subject: $subject
Question: $question

Generate 3 similar practice questions that test the same concept. 
Return only the questions, one per line, without numbering or additional text.
''';

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return text
          .split('\n')
          .where((line) => line.trim().isNotEmpty)
          .take(3)
          .toList();
    } catch (e) {
      debugPrint('Error generating similar questions: $e');
      return [];
    }
  }
}

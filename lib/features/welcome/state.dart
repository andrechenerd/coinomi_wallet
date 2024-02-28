import 'package:equatable/equatable.dart';

class WelcomeState extends Equatable {
  final List<String> menmonicPhrases;
  final List<String> selectedMenmonicPhrases;
  final bool isLoading;
  final bool isChecked;

  const WelcomeState({
    required this.menmonicPhrases,
    required this.selectedMenmonicPhrases,
    required this.isLoading,
    required this.isChecked,
  });

  WelcomeState copyWith({
    final List<String>? menmonicPhrases,
    final List<String>? selectedMenmonicPhrases,
    final bool? isLoading,
    final bool? isChecked,
  }) {
    return WelcomeState(
      menmonicPhrases: menmonicPhrases ?? this.menmonicPhrases,
      selectedMenmonicPhrases:
          selectedMenmonicPhrases ?? this.selectedMenmonicPhrases,
      isLoading: isLoading ?? this.isLoading,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [
        menmonicPhrases,
        selectedMenmonicPhrases,
        isLoading,
        isChecked,
      ];

  factory WelcomeState.initial() {
    return const WelcomeState(
      menmonicPhrases: [
        'Curiosity',
        'Serendipity',
        'Resilience',
        'Empathy',
        'Gratitude',
        'Perseverance',
        'Authenticity',
        'Vulnerability',
        'Growth',
        'Courage',
        'Innovation',
        'Connection',
        'Mindfulness',
        'Balance',
        'Harmony',
        'Creativity',
        'Imagination',
        'Inspiration',
      ],
      selectedMenmonicPhrases: [],
      isLoading: false,
      isChecked: false,
    );
  }
}

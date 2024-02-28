import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable {
  final int selectedIndex;
  const MainScreenState({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [selectedIndex];

  MainScreenState copyWith({
    int? selectedIndex,
  }) {
    return MainScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  factory MainScreenState.initial() {
    return const MainScreenState(selectedIndex: 0);
  }
}

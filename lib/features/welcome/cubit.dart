// ignore_for_file: avoid_print
import 'package:coinomi/data/repositories/wallet_repo.dart';
import 'package:coinomi/features/welcome/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState.initial());

  final _walletRepo = WalletRepo();

  bool isContains(String word) {
    bool isContains = state.selectedMenmonicPhrases.contains(word);
    return isContains;
  }

  bool _isLoading = false;

  Future<void> createWallet(VoidCallback onSuccess) async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      await _walletRepo.createWallet();
      _isLoading = false;
      if (_walletRepo.lastWallet == null) return;
      emit(state.copyWith(menmonicPhrases: _walletRepo.lastWallet!.menmonicPhrase.split(" ")));
      onSuccess();
    } catch (e) {
      _isLoading = false;
      print(e);
    }
  }

  void addToMenmonicList(String word) {
    List<String> selectedWords = List.of(state.selectedMenmonicPhrases);
    selectedWords.add(word);
    emit(state.copyWith(selectedMenmonicPhrases: selectedWords));
    print(state.selectedMenmonicPhrases);
  }

  void removeFromMenmonicList(String word) {
    List<String> selectedWords = List.of(state.selectedMenmonicPhrases);
    selectedWords.remove(word);
    emit(state.copyWith(selectedMenmonicPhrases: selectedWords));
    print(state.selectedMenmonicPhrases);
  }

  void isChecked() {
    emit(state.copyWith(isChecked: !state.isChecked));
  }
}

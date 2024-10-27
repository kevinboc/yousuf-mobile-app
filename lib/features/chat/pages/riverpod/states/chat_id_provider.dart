import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCID extends StateNotifier<String> {
  GetCID() : super('');

  void updateCID(String newCID) {
    state = newCID;
  }

  void deleteCID() {
    state = '';
  }
}

final chatIDProvider = StateNotifierProvider<GetCID, String>((ref) {
  return GetCID();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: CHANGE/UPDATE THIS ON PAGE CHANGES
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

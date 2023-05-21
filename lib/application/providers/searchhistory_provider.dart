import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'searchhistory_provider.g.dart';

@riverpod
class SearchHistory extends _$SearchHistory {
  List<String> retrieve() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    return sharedPreferences.getStringList('SEARCH_HISTORY') ?? <String>[];
  }

  void add(String itemToAdd) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    final currentList =
        sharedPreferences.getStringList('SEARCH_HISTORY') ?? <String>[];

    currentList.add(itemToAdd);

    sharedPreferences.setStringList('SEARCH_HISTORY', currentList);

    retrieve();
  }

  void remove(String itemToRemove) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    final currentList =
        sharedPreferences.getStringList('SEARCH_HISTORY') ?? <String>[];

    currentList.remove(itemToRemove);

    sharedPreferences.setStringList('SEARCH_HISTORY', currentList);

    retrieve();
  }

  @override
  List<String> build() => retrieve();
}

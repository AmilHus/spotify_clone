import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spotify_clone/view/choose_mode/bloc/choose_theme_mode_cubit.dart';

// Mock HydratedStorage
class MockHydratedStorage extends Mock implements HydratedStorage {}

void main() {
  late ChooseThemeModeCubit cubit;
  late HydratedStorage storage;

  setUpAll(() {
    // Mock the storage
    storage = MockHydratedStorage();
    HydratedBloc.storage = storage;

    // Mock the behavior of read and write methods
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null); // Returning null as if no data is stored initially
    when(() => storage.clear()).thenAnswer((_) async {});
  });

  setUp(() {
    cubit = ChooseThemeModeCubit();
  });

  test('Initial state is light mode', () {
    cubit.updateThemeMode(ThemeMode.light);
    expect(cubit.state, equals(ThemeMode.light));
  });

  test('Switching to dark mode', () {
    cubit.updateThemeMode(ThemeMode.dark);
    expect(cubit.state, equals(ThemeMode.dark));
  });
}

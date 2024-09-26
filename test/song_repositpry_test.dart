import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone/service_locator.dart';
import 'package:spotify_clone/data/repository/songs/song_repository_implement.dart';

// Mock class for SongFirebaseService
class MockSongFirebaseService extends Mock implements SongFirebaseService {}

void main() {
  late SongRepositoryImp repository;
  late MockSongFirebaseService mockSongFirebaseService;

  setUp(() {
    mockSongFirebaseService = MockSongFirebaseService();
    repository = SongRepositoryImp();

    // Register the mock service in the service locator
    sl.registerLazySingleton<SongFirebaseService>(() => mockSongFirebaseService);
  });

  tearDown(() {
    // Clear the service locator after each test
    sl.reset();
  });

  group('SongRepositoryImp', () {
    test('should return Right when getNewSongs is successful', () async {
      // Arrange
      final songsList = ['Song1', 'Song2'];  // Dummy data for songs
      when(() => mockSongFirebaseService.getNewSongs())
          .thenAnswer((_) async => Right(songsList));

      // Act
      final result = await repository.getNewSongs();

      // Assert
      expect(result.isRight(), true);
      expect(result, Right(songsList));
      verify(() => mockSongFirebaseService.getNewSongs()).called(1);
    });

    test('should return Left when getNewSongs fails', () async {
      // Arrange
      final error = Exception('Failed to load songs');
      when(() => mockSongFirebaseService.getNewSongs())
          .thenAnswer((_) async => Left(error));

      // Act
      final result = await repository.getNewSongs();

      // Assert
      expect(result.isLeft(), true);
      expect(result, Left(error));
      verify(() => mockSongFirebaseService.getNewSongs()).called(1);
    });
  });
}

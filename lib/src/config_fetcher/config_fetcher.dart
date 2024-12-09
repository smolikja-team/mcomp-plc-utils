import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logging/logging.dart';

class ConfigFetcher {
  static const String _kConfigFileExtension = '.json';
  static const String _kFirestoreCollection = 'home-plc';
  static const String _kFirestoreKeyUsers = 'users';
  static const String _kFirestoreKeyEmail = 'email';
  static const String _kFirestoreKeyUid = 'uid';

  static final _logging = Logger('ConfigFetcher');

  /// Fetch config from Firebase Storage
  /// Returns list of assigned homes
  /// Each home is represented as [Map<String, dynamic>]
  /// Throws [Exception] if current user is null or email is null
  /// Throws [Exception] if identifiers are null
  static Future<List<Map<String, dynamic>>> fetchConfigsAsMaps() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();

    if (currentUser == null || currentUser.email == null) {
      throw Exception('fetchConfigsAsMaps: current user is null');
    }

    final identifiers = await _fetchHomeIdentifiers(
      userEmail: currentUser.email!,
      userUid: currentUser.uid,
    );
    if (identifiers == null) {
      throw Exception('fetchConfigsAsMaps: identifiers are null');
    }

    final assignedHomesMaps = await _fetchAssignedHomesMaps(identifiers);

    return assignedHomesMaps;
  }

  /// Fetch assigned homes from Firebase Storage
  /// Returns list of assigned homes
  /// Each home is represented as [Map<String, dynamic>]
  static Future<List<Map<String, dynamic>>> _fetchAssignedHomesMaps(
    List<String> identifiers,
  ) async {
    final homePLCs = <Map<String, dynamic>>[];
    final storageRef = FirebaseStorage.instance.ref();

    for (final homeId in identifiers) {
      final pathReference = storageRef.child(homeId + _kConfigFileExtension);

      //TODO: we can use metadafa for config version comparasion
      // final _ = await pathReference.getMetadata();
      try {
        const oneMegabyte = 1024 * 1024;

        // TODO: we can use `writeToFile` for saving to local storage. Is it a good approach?
        final data = await pathReference.getData(
          oneMegabyte,
        );

        final dataString = utf8.decode(data ?? []);

        final homePLCMap = jsonDecode(dataString) as Map<String, dynamic>;
        _logging
            .fine('_fetchAssignedHomesMaps homePLC ID: ${homePLCMap['id']}');

        homePLCs.add(homePLCMap);
      } on FirebaseException catch (e, stackTrace) {
        _logging.severe(
          '_fetchAssignedHomesMaps: ${e.toString()}',
          e,
          stackTrace,
        );
      } catch (e, stackTrace) {
        _logging.severe(
          '_fetchAssignedHomesMaps: ${e.toString()}',
          e,
          stackTrace,
        );
      }
    }

    //TODO: save homes to secure storage or save homes one by one
    _logging.info(
      '_fetchAssignedHomes length: ${homePLCs.length}',
    );
    return homePLCs;
  }

  /// Fetch home identifiers from Firestore
  /// Returns list of home identifiers
  static Future<List<String>?> _fetchHomeIdentifiers({
    required String userEmail,
    required String userUid,
  }) async {
    final documents = await FirebaseFirestore.instance
        .collection(_kFirestoreCollection)
        .where(
      _kFirestoreKeyUsers,
      arrayContains: {
        _kFirestoreKeyEmail: userEmail,
        _kFirestoreKeyUid: userUid,
      },
    ).get();

    _logging.fine(
      '_fetchHomeIdentifiers documents: ${documents.docs.toString()}',
    );

    final homeIds = <String>[];
    for (final doc in documents.docs) {
      _logging.fine('_fetchHomeIdentifiers doc ID: ${doc.id}');
      homeIds.add(doc.id);
    }

    if (homeIds.isEmpty) {
      _logging.warning(
        '_fetchHomeIdentifiers: homeIds is empty',
      );
    }

    return homeIds.isEmpty ? null : homeIds;
  }
}

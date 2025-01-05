import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logging/logging.dart';

class ConfigFetcher {
  static const String _kConfigFileExtension = '.json';
  static const String _kFirestoreCollection = 'plcs';
  static const String _kFirestoreKeyUsers = 'users';
  static const String _kFirestoreKeyEmail = 'email';
  static const String _kFirestoreKeyUid = 'uid';
  static const int _kOneMegabyte = 1024 * 1024;

  static final _logging = Logger('ConfigFetcher');

  /// Fetch user's PLCs from Firebase Storage
  /// Returns list of assigned PLCs
  /// Each PLC is represented as [Map<String, dynamic>]
  /// Throws [Exception] if current user is null or email is null
  /// Returns empty list if identifiers are null
  static Future<List<Map<String, dynamic>>> fetchUsersPlcs() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();

    if (currentUser == null || currentUser.email == null) {
      throw Exception('fetchUsersPlcs: current user is null');
    }

    final identifiers = await _fetchPlcsIdentifiers(
      userEmail: currentUser.email!,
      userUid: currentUser.uid,
    );
    if (identifiers == null) {
      _logging.warning(
        'fetchUsersPlcs: identifiers are null',
      );
      return [];
    }

    final assignedPlcsMaps = await _fetchAssignedPlcsMaps(identifiers);

    return assignedPlcsMaps;
  }

  /// Fetch assigned PLCs from Firebase Storage
  /// Returns list of assigned PLCs
  /// Each PLC is represented as [Map<String, dynamic>]
  static Future<List<Map<String, dynamic>>> _fetchAssignedPlcsMaps(
    List<String> identifiers,
  ) async {
    final plcs = <Map<String, dynamic>>[];
    final storageRef = FirebaseStorage.instance.ref();

    for (final plcId in identifiers) {
      final pathReference = storageRef.child(plcId + _kConfigFileExtension);

      //TODO: we can use metadafa for config version comparasion
      // final _ = await pathReference.getMetadata();
      try {
        // TODO: we can use `writeToFile` for saving to local storage. Is it a good approach?
        final data = await pathReference.getData(
          _kOneMegabyte,
        );

        final dataString = utf8.decode(data ?? []);

        final plcMap = jsonDecode(dataString) as Map<String, dynamic>;
        _logging.fine('_fetchAssignedPlcsMaps plc ID: ${plcMap['id']}');

        plcs.add(plcMap);
      } on FirebaseException catch (e, stackTrace) {
        _logging.severe(
          '_fetchAssignedPlcsMaps: ${e.toString()}',
          e,
          stackTrace,
        );
      } catch (e, stackTrace) {
        _logging.severe(
          '_fetchAssignedPlcsMaps: ${e.toString()}',
          e,
          stackTrace,
        );
      }
    }

    //TODO: save PLCs to secure storage or save PLC one by one
    _logging.info(
      '_fetchAssignedPlcsMaps length: ${plcs.length}',
    );
    return plcs;
  }

  /// Fetch PLCs identifiers from Firestore
  /// Returns list of PLC identifiers
  static Future<List<String>?> _fetchPlcsIdentifiers({
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
      '_fetchPlcsIdentifiers documents: ${documents.docs.toString()}',
    );

    final plcIds = <String>[];
    for (final doc in documents.docs) {
      _logging.fine('_fetchPlcsIdentifiers doc ID: ${doc.id}');
      plcIds.add(doc.id);
    }

    if (plcIds.isEmpty) {
      _logging.warning(
        '_fetchPlcsIdentifiers: plcIds is empty',
      );
    }

    return plcIds.isEmpty ? null : plcIds;
  }
}

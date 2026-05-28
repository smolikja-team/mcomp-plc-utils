import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mcomp_plc_utils/mcomp_plc_utils.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/cache_metadata.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/cached_plc_config.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/user_plc_identifiers.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_get_message_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_payload_bo.dart';

void main() {
  group('PLC value objects', () {
    test('serialize default data type keys for scalar PLC values', () {
      expect(const PlcBoolBO(value: true).toJson(), <String, dynamic>{
        'val': true,
        'dt': 'BOOL',
      });
      expect(const PlcIntBO(value: 12).toJson(), <String, dynamic>{
        'val': 12,
        'dt': 'USINT',
      });
      expect(const PlcRealBO(value: 12.5).toJson(), <String, dynamic>{
        'val': 12.5,
        'dt': 'REAL',
      });
      expect(const PlcStringBO(value: 'open').toJson(), <String, dynamic>{
        'val': 'open',
        'dt': 'STRING',
      });
      expect(const PlcDtBO(value: 1716825600).toJson(), <String, dynamic>{
        'val': 1716825600,
        'dt': 'DT',
      });
      expect(const PlcTodBO(value: 3600).toJson(), <String, dynamic>{
        'val': 3600,
        'dt': 'TOD',
      });
    });

    test('deserialize PLC values from wire format', () {
      expect(
        PlcBoolBO.fromJson(<String, dynamic>{'val': false, 'dt': 'BOOL'}).value,
        isFalse,
      );
      expect(
        PlcIntBO.fromJson(<String, dynamic>{'val': 2, 'dt': 'INT'}).dt,
        'INT',
      );
      expect(
        PlcRealBO.fromJson(<String, dynamic>{'val': 2.5, 'dt': 'REAL'}).value,
        2.5,
      );
      expect(
        PlcStringBO.fromJson(<String, dynamic>{
          'val': 'closed',
          'dt': 'STRING',
        }).value,
        'closed',
      );
    });
  });

  group('WebSocket message models', () {
    test('encode get request payload with default intent', () {
      const message = WsGetMessageBO(payload: <String>['LIGHT_1', 'VENT_1']);

      expect(jsonDecode(jsonEncode(message)), <String, dynamic>{
        'intent': 'get',
        'payload': <dynamic>['LIGHT_1', 'VENT_1'],
      });
    });

    test('encode set request props under expected wire key', () {
      final message = WsSetMessageBO(
        payload: <WsSetMessagePayloadBO>[
          WsSetMessagePayloadBO(
            id: 'LIGHT_1',
            update: <String, dynamic>{
              'enabled': const PlcBoolBO(value: true).toJson(),
              'level': const PlcIntBO(value: 3).toJson(),
            },
          ),
        ],
      );

      expect(jsonDecode(jsonEncode(message)), <String, dynamic>{
        'intent': 'set',
        'payload': <dynamic>[
          <String, dynamic>{
            'id': 'LIGHT_1',
            'props': <String, dynamic>{
              'enabled': <String, dynamic>{'val': true, 'dt': 'BOOL'},
              'level': <String, dynamic>{'val': 3, 'dt': 'USINT'},
            },
          },
        ],
      });
    });

    test('decode list, diff, and get response sections', () {
      final message = WsMessageBO.fromJson(<String, dynamic>{
        'list': <dynamic>[
          <String, dynamic>{
            'id': 'LIGHT_1',
            'props': <String, dynamic>{
              'enabled': <String, dynamic>{'val': true, 'dt': 'BOOL'},
            },
          },
        ],
        'diff': <dynamic>[
          <String, dynamic>{
            'id': 'VENT_1',
            'props': <String, dynamic>{
              'level': <String, dynamic>{'val': 2, 'dt': 'USINT'},
            },
          },
        ],
        'get': <dynamic>[
          <String, dynamic>{
            'id': 'SAIL_1',
            'props': <String, dynamic>{
              'position': <String, dynamic>{'val': 42.5, 'dt': 'REAL'},
            },
          },
        ],
      });

      expect(message.items, hasLength(1));
      expect(message.items!.single.id, 'LIGHT_1');
      expect(message.differences, hasLength(1));
      expect(message.differences!.single.id, 'VENT_1');
      expect(message.requestedItems, hasLength(1));
      expect(message.requestedItems!.single.id, 'SAIL_1');
    });
  });

  group('Config cache models', () {
    test('round-trip cached config metadata through json', () {
      final cachedAt = DateTime.utc(2026, 5, 28, 10, 30);
      final config = CachedPlcConfig(
        plcId: 'PLC_1',
        config: <String, dynamic>{
          'name': 'Stable 1',
          'devices': <dynamic>[
            <String, dynamic>{'id': 'LIGHT_1'},
          ],
        },
        metadata: CacheMetadata(
          md5Hash: 'abc123',
          userId: 'user-1',
          cachedAt: cachedAt,
        ),
      );

      final decoded = CachedPlcConfig.fromJson(config.toJson());

      expect(decoded.plcId, 'PLC_1');
      expect(decoded.metadata.md5Hash, 'abc123');
      expect(decoded.metadata.userId, 'user-1');
      expect(decoded.metadata.cachedAt, cachedAt);
      expect(decoded.config['name'], 'Stable 1');
    });

    test('round-trip cached user PLC identifiers through json', () {
      final cachedAt = DateTime.utc(2026, 5, 28, 11);
      final identifiers = UserPlcIdentifiers(
        userId: 'user-1',
        identifiers: <String>['PLC_1', 'PLC_2'],
        cachedAt: cachedAt,
      );

      final decoded = UserPlcIdentifiers.fromJson(identifiers.toJson());

      expect(decoded.userId, 'user-1');
      expect(decoded.identifiers, <String>['PLC_1', 'PLC_2']);
      expect(decoded.cachedAt, cachedAt);
    });
  });
}

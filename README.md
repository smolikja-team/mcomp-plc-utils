# mcomp plc utils

Set of utilities for client Flutter apps communicationg with mComp's PLC.

## Features

[Config Fetcher](#config-fetcher)

### Config Fetcher

Fetches list of assigned PLCs app is able to communicate with from Firebase as a Dart Map.

#### Dependencies

- Logger (needs to be set in the parent app)
- FirebaseAuth (user needs to be logged in the parent app)
- FirebaseStorage (where the config is fetched from)
- Firestore (database of user's configs)

#### Output

- List of PLC configurations assigned to user
- Each PLC configuratio is represented as Map<String, dynamic>
- Map can be serialized to a coustom PLC object

#### Example

```dart
final usersPlcsAsMap = await ConfigFetcher.fetchUsersPlcs();

final listOfPlcObjects = usersPlcsAsMap.map((userPlc) {
    return PlcObject.fromJson(userPlc);
}).toList();
```

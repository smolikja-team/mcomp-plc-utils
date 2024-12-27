# mcomp plc utils

Set of utilities for client Flutter apps communicating with mComp's PLC.

## Dev

### build runner

`dart run build_runner build --verbose --delete-conflicting-outputs`

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

### Email Reporting

Composes and email with informations about user, device including an error and stack trace.

#### Output

- Composes and email message
- Tries to launch email client with message installed on device

#### Example

```dart
EmailReporting.composeAnErrorEmail(
    error: <Error>,
    stack: <StackTrace>,
    to: ['address@domain.com', 'address1@domain.com'],
    cc: ['address2@domain.com'],
)
```

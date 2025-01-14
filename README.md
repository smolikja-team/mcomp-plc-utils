# mcomp plc utils

Set of utilities for client Flutter apps communicating with mComp's PLC.

## Dev

### build runner

`dart run build_runner build --verbose --delete-conflicting-outputs`

## Features

[Config Fetcher](#config-fetcher)\
[Email Reporting](#email-reporting)\
[Web Socket](#web-socket)\
[Resizable Bottom Sheet](#resizable-bottom-sheet)\
[Extensions](#extensions)

---

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

---

### Email Reporting

Composes and email with informations about user, device including an error and stack trace.

#### Dependencies

- Logger (needs to be set in the parent app)

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

---

### Web Socket

#### Dependencies
- Logger (needs to be set in the parent app)
- PLC ID and PLC address for communication

#### Output

- Opens a Web Sockets
- Lets parent app access an opened channels
- Updates device params on PLC via socket
- Sends message to PLC via socket

#### Business Objects

- `WsMessageBO`
- `WsMessageItemBO`
- `PlcBoolBO`
- `PlcIntBO`
- `PlcDtBO`
- `PlcTodBO`
- `PlcRealBO`

#### Example

```dart
// Connect
WebSocketController().connectAll(,
    (plcId: 'plcId_1', address: 'address_1'),
    (plcId: 'plcId_2', address: 'address_2'),
);

WebSocketController().connect(plcId:'plcId_1', address: 'address_1');

// Disconnect
WebSocketController().disconnectAll();

WebSocketController().disconnect('plcId_1');

// Create a list of streams for each channel
final streams = WebSocketController().channels.map((channel) async* {
  await for (final data in channel.channel.stream) {
    final messageData = jsonDecode(data.toString()) as Map<String, dynamic>;
    final message = WsMessageBO.fromJson(messageData);

    yield* _processMessageItems(
      message.items ?? [],
      cowsheds,
      channel.plcId,
      logger,
    );
    yield* _processMessageItems(
      message.differences ?? [],
      cowsheds,
      channel.plcId,
      logger,
    );
  }
});

// Merge all streams into a single stream
await for (final value in StreamGroup.merge(streams)) {
  yield value;
}
```

---

### Resizable Bottom Sheet

Shows Material design's resizable bottom sheet.

#### Example

```dart
return showResizableBottomSheet(
  context: context,
  child: Column(
    children: [
      <Widget>,
      <Widget>,
      <Widget>,
    ],
  ),
);
```

---

### Extensions

```dart
// Launches the URL in the default browser.
<Uri>.launchInBrowser()
```

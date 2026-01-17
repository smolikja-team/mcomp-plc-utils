# mcomp plc utils

Set of utilities for client Flutter apps communicating with mComp's PLC.

## Dev

### build runner

`dart run build_runner build --verbose --delete-conflicting-outputs`

## Features

[Config Fetcher](#config-fetcher)\
[Email Reporting](#email-reporting)\
[Cloud Messaging Helper](#cloud-messaging-helper)\
[Web Socket](#web-socket)\
[Resizable Bottom Sheet](#resizable-bottom-sheet)\
[Extensions](#extensions)

---

### Config Fetcher

Fetches list of assigned PLCs app is able to communicate with from Firebase as a Dart Map. Supports **offline-first caching** with automatic fallback.

#### Features

- **Offline caching** - configurations are cached locally for offline use
- **MD5 validation** - only downloads when config changes on Firebase
- **Automatic fallback** - returns cached data when network is unavailable
- **Per-user isolation** - each user has separate cache storage

#### Dependencies

- Logger (needs to be set in the parent app)
- FirebaseAuth (user needs to be logged in the parent app)
- FirebaseStorage (where the config is fetched from)
- Firestore (database of user's configs)

#### Output

- List of PLC configurations assigned to user
- Each PLC configuration is represented as `Map<String, dynamic>`
- Map can be serialized to a custom PLC object

#### Example

```dart
// Normal fetch (uses cache if available and valid)
final usersPlcsAsMap = await ConfigFetcher.fetchUsersPlcs();

// Force refresh from Firebase (bypass cache)
final freshConfigs = await ConfigFetcher.fetchUsersPlcs(forceRefresh: true);

// Convert to objects
final listOfPlcObjects = usersPlcsAsMap.map((userPlc) {
    return PlcObject.fromJson(userPlc);
}).toList();
```

#### Cache Management

```dart
// Clear user's cache on logout
final storage = FileConfigCacheStorage();
await storage.clearUserCache(userId);
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

### Cloud Messaging Helper

Helper class for managing Firebase Cloud Messaging (FCM) across different applications. Provides functionality for handling push notifications on both Android and iOS platforms.

#### Dependencies

- Logger (needs to be set in the parent app)
- Firebase Messaging
- Flutter Local Notifications
- Shared Preferences

#### Features

- Initialize FCM with customizable callbacks
- Subscribe/unsubscribe to/from topics
- Handle foreground and background notifications
- Process notification data with Map access
- Handle notification taps with Map access
- Request notification permissions
- Get device FCM token

#### Setup

Before using the Cloud Messaging Helper, you need to set up the notification icon for Android. See the [Notification Icon Setup](docs/notification_icon_setup.md) guide for detailed instructions.

#### Example

```dart
// Initialize the helper with custom handlers
await CloudMessagingHelper.init(
  // Provide topics to subscribe to
  topicProvider: () async {
    final homeIds = await getHomeIds();
    return homeIds.map((id) => 'homeID_$id').toList();
  },

  // Process notification data as Map
  dataProcessor: (data) {
    print('Received notification data: $data');
    // Access payload via data['payload']
    final payload = data['payload'] as String;
    // Store notification or update UI
  },

  // Handle notification taps with data as Map
  tapHandler: (data) {
    // Navigate based on notification data
    final payload = data['payload'] as String;
    if (payload.contains('home')) {
      navigateToHome(payload);
    }
  },
);

// Subscribe to a specific topic
await CloudMessagingHelper.subscribeToTopic('device_123');

// Get list of subscribed topics
final topics = await CloudMessagingHelper.getSubscribedTopics();
print('Currently subscribed to: $topics');

// Unsubscribe from all topics (e.g., at logout)
await CloudMessagingHelper.unsubscribeFromAllTopics();

// Get device FCM token
final token = await CloudMessagingHelper.getToken();
print('Device FCM token: $token');
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

#### Example

```dart
// Create an instance (NOT a Singleton anymore)
final controller = WebSocketController();

// Connect
controller.connectAll([
    (plcId: 'plcId_1', address: 'address_1'),
    (plcId: 'plcId_2', address: 'address_2'),
]);

controller.connect(plcId:'plcId_1', address: 'address_1');

// Listen to unified message stream (all PLCs)
controller.messages.listen((message) {
  print('Message from ${message.plcId}: ${message.data}');
  
  final messageData = jsonDecode(message.data.toString()) as Map<String, dynamic>;
  final wsMessage = WsMessageBO.fromJson(messageData);
  // Process message...
});

// Listen to connection status changes
controller.statusStream.listen((status) {
  print('PLC ${status.plcId} is ${status.status}');
});

// Send a message
controller.requestStateUpdate(
  plcId: 'plcId_1',
  deviceIds: ['device_1', 'device_2'],
);

// Disconnect
controller.disconnectAll();
controller.dispose();
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

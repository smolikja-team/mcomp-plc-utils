# Changelog

## 1.13.3

* `WebSocketController.requestStateUpdate` now queues device IDs when the
  WebSocket channel for the given PLC is not yet connected. Queued requests are
  merged (Set semantics, no duplicates) and flushed automatically once the
  connection is established via `_finalizeConnection`.
* `disconnect` and `disconnectAll` clear the pending queue for the affected PLCs.
* `ConnectionStatus` is now exported from the top-level library.
* Added `pendingStateRequestsFor(plcId)` (`@visibleForTesting`) for verifying
  queue state in tests.

## 0.0.1

* TODO: Describe initial release.

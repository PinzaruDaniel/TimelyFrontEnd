# Homework generator showcase

The new routes below are proposed contracts, NOT existing backend endpoints.
The test suite supplies fake responses; production will make real HTTP requests.
No mock responses are silently returned in production.

| Method | Proposed route | Request | Success |
| --- | --- | --- | --- |
| GET | `/api/Homework/{homeworkId}` | Path ID | Homework JSON |
| PUT | `/api/Homework/{homeworkId}` | Multipart `subject`, `description`, `dueDate` (YYYY-MM-DD) | Updated Homework JSON |
| DELETE | `/api/Homework/{homeworkId}` | Path ID | 204, empty body |
| POST | `/api/Homework/{homeworkId}/complete` | Path ID, no body | Homework JSON, `isDone: true` |
| POST | `/api/Homework/{homeworkId}/reopen` | Path ID, no body | Homework JSON, `isDone: false` |

Homework JSON retains `id`, `subject`, `description`, optional `dueDate` and
`imageUrl`, and adds `isDone` (defaults to false when absent for compatibility).
Completion is represented per homework here; define backend ownership/auth rules
before implementing these routes. Edit leaves image unchanged.

## Why the package helps

Five new operations require just five entries in `homework_repository_impl.dart`:

```dart
#getHomework: RepositoryOperation.remoteOnly(),
#editHomework: RepositoryOperation.mutation(argumentsFrom: #request),
#deleteHomework: RepositoryOperation.mutation(),
#markHomeworkDone: RepositoryOperation.mutation(),
#reopenHomework: RepositoryOperation.mutation(),
```

The generator writes signatures, parameter forwarding, DTO-to-entity mapping,
Either success/failure adaptation, exception handling, and concurrency behavior.
All writes execute independently; equal in-flight reads can share one request.
Domain contracts and edit request stay free of generator annotations.

These are remote-only operations. They do not change cached lists automatically;
callers should reload after successful mutations. `isDone` survives explicit
cache writes and reads. No UI buttons or new use-case wiring are included.

Run from `data`: `dart test test/homework_repository_impl_test.dart`.
All HTTP tests intercept requests locally; no backend is contacted.

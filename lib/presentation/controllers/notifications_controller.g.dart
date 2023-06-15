// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsHash() => r'e5649ccc28ff4355a1322c23b2e629ef107330ea';

/// See also [notifications].
@ProviderFor(notifications)
final notificationsProvider = FutureProvider<NotificationsResponse>.internal(
  notifications,
  name: r'notificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationsRef = FutureProviderRef<NotificationsResponse>;
String _$markAsReadHash() => r'22ab913ceef4dba0687fd87904b19e22028555c6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef MarkAsReadRef = AutoDisposeFutureProviderRef<Notifications>;

/// See also [markAsRead].
@ProviderFor(markAsRead)
const markAsReadProvider = MarkAsReadFamily();

/// See also [markAsRead].
class MarkAsReadFamily extends Family<AsyncValue<Notifications>> {
  /// See also [markAsRead].
  const MarkAsReadFamily();

  /// See also [markAsRead].
  MarkAsReadProvider call({
    required Notifications notification,
  }) {
    return MarkAsReadProvider(
      notification: notification,
    );
  }

  @override
  MarkAsReadProvider getProviderOverride(
    covariant MarkAsReadProvider provider,
  ) {
    return call(
      notification: provider.notification,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'markAsReadProvider';
}

/// See also [markAsRead].
class MarkAsReadProvider extends AutoDisposeFutureProvider<Notifications> {
  /// See also [markAsRead].
  MarkAsReadProvider({
    required this.notification,
  }) : super.internal(
          (ref) => markAsRead(
            ref,
            notification: notification,
          ),
          from: markAsReadProvider,
          name: r'markAsReadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$markAsReadHash,
          dependencies: MarkAsReadFamily._dependencies,
          allTransitiveDependencies:
              MarkAsReadFamily._allTransitiveDependencies,
        );

  final Notifications notification;

  @override
  bool operator ==(Object other) {
    return other is MarkAsReadProvider && other.notification == notification;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notification.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$notificationsRequestControllerHash() =>
    r'f22a29fe2cdc8f02cfe130cabad405b80fd4ebb5';

/// See also [NotificationsRequestController].
@ProviderFor(NotificationsRequestController)
final notificationsRequestControllerProvider = NotifierProvider<
    NotificationsRequestController, NotificationsRequest>.internal(
  NotificationsRequestController.new,
  name: r'notificationsRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsRequestController = Notifier<NotificationsRequest>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

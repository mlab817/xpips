// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRoomsHash() => r'b2830aab7007654c6171be847ea3f2b004372a40';

/// See also [chatRooms].
@ProviderFor(chatRooms)
final chatRoomsProvider = FutureProvider<ChatRoomsResponse>.internal(
  chatRooms,
  name: r'chatRoomsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatRoomsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatRoomsRef = FutureProviderRef<ChatRoomsResponse>;
String _$chatsRequestControllerHash() =>
    r'f334efdf4b09ede4d9e19c8c4f068281646d0629';

/// See also [ChatsRequestController].
@ProviderFor(ChatsRequestController)
final chatsRequestControllerProvider =
    NotifierProvider<ChatsRequestController, ProjectsRequest>.internal(
  ChatsRequestController.new,
  name: r'chatsRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatsRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatsRequestController = Notifier<ProjectsRequest>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

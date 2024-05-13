// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kru_record_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kruRecordContollerHash() =>
    r'eac81b5d44f60495d7b6c57501bda72d65d47e4e';

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

abstract class _$KruRecordContoller
    extends BuildlessAutoDisposeAsyncNotifier<List<KruRecord>> {
  late final int limit;
  late final int offset;

  FutureOr<List<KruRecord>> build({
    int limit = 10,
    int offset = 0,
  });
}

/// See also [KruRecordContoller].
@ProviderFor(KruRecordContoller)
const kruRecordContollerProvider = KruRecordContollerFamily();

/// See also [KruRecordContoller].
class KruRecordContollerFamily extends Family<AsyncValue<List<KruRecord>>> {
  /// See also [KruRecordContoller].
  const KruRecordContollerFamily();

  /// See also [KruRecordContoller].
  KruRecordContollerProvider call({
    int limit = 10,
    int offset = 0,
  }) {
    return KruRecordContollerProvider(
      limit: limit,
      offset: offset,
    );
  }

  @override
  KruRecordContollerProvider getProviderOverride(
    covariant KruRecordContollerProvider provider,
  ) {
    return call(
      limit: provider.limit,
      offset: provider.offset,
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
  String? get name => r'kruRecordContollerProvider';
}

/// See also [KruRecordContoller].
class KruRecordContollerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    KruRecordContoller, List<KruRecord>> {
  /// See also [KruRecordContoller].
  KruRecordContollerProvider({
    int limit = 10,
    int offset = 0,
  }) : this._internal(
          () => KruRecordContoller()
            ..limit = limit
            ..offset = offset,
          from: kruRecordContollerProvider,
          name: r'kruRecordContollerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kruRecordContollerHash,
          dependencies: KruRecordContollerFamily._dependencies,
          allTransitiveDependencies:
              KruRecordContollerFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
        );

  KruRecordContollerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final int limit;
  final int offset;

  @override
  FutureOr<List<KruRecord>> runNotifierBuild(
    covariant KruRecordContoller notifier,
  ) {
    return notifier.build(
      limit: limit,
      offset: offset,
    );
  }

  @override
  Override overrideWith(KruRecordContoller Function() create) {
    return ProviderOverride(
      origin: this,
      override: KruRecordContollerProvider._internal(
        () => create()
          ..limit = limit
          ..offset = offset,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<KruRecordContoller, List<KruRecord>>
      createElement() {
    return _KruRecordContollerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KruRecordContollerProvider &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KruRecordContollerRef
    on AutoDisposeAsyncNotifierProviderRef<List<KruRecord>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _KruRecordContollerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<KruRecordContoller,
        List<KruRecord>> with KruRecordContollerRef {
  _KruRecordContollerProviderElement(super.provider);

  @override
  int get limit => (origin as KruRecordContollerProvider).limit;
  @override
  int get offset => (origin as KruRecordContollerProvider).offset;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

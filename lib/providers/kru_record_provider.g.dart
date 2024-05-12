// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kru_record_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kruRecordsHash() => r'57ac9a11de6b15a66ee5247e96cd25ef1f3be8ce';

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

/// See also [kruRecords].
@ProviderFor(kruRecords)
const kruRecordsProvider = KruRecordsFamily();

/// See also [kruRecords].
class KruRecordsFamily extends Family<AsyncValue<List<KruRecord>>> {
  /// See also [kruRecords].
  const KruRecordsFamily();

  /// See also [kruRecords].
  KruRecordsProvider call({
    int limit = 10,
    int offset = 0,
  }) {
    return KruRecordsProvider(
      limit: limit,
      offset: offset,
    );
  }

  @override
  KruRecordsProvider getProviderOverride(
    covariant KruRecordsProvider provider,
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
  String? get name => r'kruRecordsProvider';
}

/// See also [kruRecords].
class KruRecordsProvider extends AutoDisposeFutureProvider<List<KruRecord>> {
  /// See also [kruRecords].
  KruRecordsProvider({
    int limit = 10,
    int offset = 0,
  }) : this._internal(
          (ref) => kruRecords(
            ref as KruRecordsRef,
            limit: limit,
            offset: offset,
          ),
          from: kruRecordsProvider,
          name: r'kruRecordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kruRecordsHash,
          dependencies: KruRecordsFamily._dependencies,
          allTransitiveDependencies:
              KruRecordsFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
        );

  KruRecordsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<KruRecord>> Function(KruRecordsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KruRecordsProvider._internal(
        (ref) => create(ref as KruRecordsRef),
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
  AutoDisposeFutureProviderElement<List<KruRecord>> createElement() {
    return _KruRecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KruRecordsProvider &&
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

mixin KruRecordsRef on AutoDisposeFutureProviderRef<List<KruRecord>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _KruRecordsProviderElement
    extends AutoDisposeFutureProviderElement<List<KruRecord>>
    with KruRecordsRef {
  _KruRecordsProviderElement(super.provider);

  @override
  int get limit => (origin as KruRecordsProvider).limit;
  @override
  int get offset => (origin as KruRecordsProvider).offset;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

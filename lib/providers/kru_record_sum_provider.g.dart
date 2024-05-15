// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kru_record_sum_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kruRecordSumHash() => r'f536ff12933601ff4bd96a68c587b4cef7bf52ce';

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

/// See also [kruRecordSum].
@ProviderFor(kruRecordSum)
const kruRecordSumProvider = KruRecordSumFamily();

/// See also [kruRecordSum].
class KruRecordSumFamily extends Family<AsyncValue<int>> {
  /// See also [kruRecordSum].
  const KruRecordSumFamily();

  /// See also [kruRecordSum].
  KruRecordSumProvider call(
    DateTimeRange range,
  ) {
    return KruRecordSumProvider(
      range,
    );
  }

  @override
  KruRecordSumProvider getProviderOverride(
    covariant KruRecordSumProvider provider,
  ) {
    return call(
      provider.range,
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
  String? get name => r'kruRecordSumProvider';
}

/// See also [kruRecordSum].
class KruRecordSumProvider extends AutoDisposeFutureProvider<int> {
  /// See also [kruRecordSum].
  KruRecordSumProvider(
    DateTimeRange range,
  ) : this._internal(
          (ref) => kruRecordSum(
            ref as KruRecordSumRef,
            range,
          ),
          from: kruRecordSumProvider,
          name: r'kruRecordSumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kruRecordSumHash,
          dependencies: KruRecordSumFamily._dependencies,
          allTransitiveDependencies:
              KruRecordSumFamily._allTransitiveDependencies,
          range: range,
        );

  KruRecordSumProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.range,
  }) : super.internal();

  final DateTimeRange range;

  @override
  Override overrideWith(
    FutureOr<int> Function(KruRecordSumRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KruRecordSumProvider._internal(
        (ref) => create(ref as KruRecordSumRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        range: range,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _KruRecordSumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KruRecordSumProvider && other.range == range;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, range.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KruRecordSumRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `range` of this provider.
  DateTimeRange get range;
}

class _KruRecordSumProviderElement extends AutoDisposeFutureProviderElement<int>
    with KruRecordSumRef {
  _KruRecordSumProviderElement(super.provider);

  @override
  DateTimeRange get range => (origin as KruRecordSumProvider).range;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

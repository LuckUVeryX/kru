// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kru_record_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kruRecordDateHash() => r'd54783c8c3cac4b6d0975259e194344d7a8eeb32';

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

abstract class _$KruRecordDate
    extends BuildlessAutoDisposeAsyncNotifier<List<KruRecord>> {
  late final DateTime date;

  FutureOr<List<KruRecord>> build({
    required DateTime date,
  });
}

/// See also [KruRecordDate].
@ProviderFor(KruRecordDate)
const kruRecordDateProvider = KruRecordDateFamily();

/// See also [KruRecordDate].
class KruRecordDateFamily extends Family<AsyncValue<List<KruRecord>>> {
  /// See also [KruRecordDate].
  const KruRecordDateFamily();

  /// See also [KruRecordDate].
  KruRecordDateProvider call({
    required DateTime date,
  }) {
    return KruRecordDateProvider(
      date: date,
    );
  }

  @override
  KruRecordDateProvider getProviderOverride(
    covariant KruRecordDateProvider provider,
  ) {
    return call(
      date: provider.date,
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
  String? get name => r'kruRecordDateProvider';
}

/// See also [KruRecordDate].
class KruRecordDateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    KruRecordDate, List<KruRecord>> {
  /// See also [KruRecordDate].
  KruRecordDateProvider({
    required DateTime date,
  }) : this._internal(
          () => KruRecordDate()..date = date,
          from: kruRecordDateProvider,
          name: r'kruRecordDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kruRecordDateHash,
          dependencies: KruRecordDateFamily._dependencies,
          allTransitiveDependencies:
              KruRecordDateFamily._allTransitiveDependencies,
          date: date,
        );

  KruRecordDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  FutureOr<List<KruRecord>> runNotifierBuild(
    covariant KruRecordDate notifier,
  ) {
    return notifier.build(
      date: date,
    );
  }

  @override
  Override overrideWith(KruRecordDate Function() create) {
    return ProviderOverride(
      origin: this,
      override: KruRecordDateProvider._internal(
        () => create()..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<KruRecordDate, List<KruRecord>>
      createElement() {
    return _KruRecordDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KruRecordDateProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KruRecordDateRef on AutoDisposeAsyncNotifierProviderRef<List<KruRecord>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _KruRecordDateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<KruRecordDate,
        List<KruRecord>> with KruRecordDateRef {
  _KruRecordDateProviderElement(super.provider);

  @override
  DateTime get date => (origin as KruRecordDateProvider).date;
}

String _$kruRecordDateRangeHash() =>
    r'a59546f86a6f84961b7472bf51b8b13af9772207';

abstract class _$KruRecordDateRange
    extends BuildlessAutoDisposeAsyncNotifier<List<KruRecord>> {
  late final DateTime start;
  late final DateTime end;

  FutureOr<List<KruRecord>> build({
    required DateTime start,
    required DateTime end,
  });
}

/// See also [KruRecordDateRange].
@ProviderFor(KruRecordDateRange)
const kruRecordDateRangeProvider = KruRecordDateRangeFamily();

/// See also [KruRecordDateRange].
class KruRecordDateRangeFamily extends Family<AsyncValue<List<KruRecord>>> {
  /// See also [KruRecordDateRange].
  const KruRecordDateRangeFamily();

  /// See also [KruRecordDateRange].
  KruRecordDateRangeProvider call({
    required DateTime start,
    required DateTime end,
  }) {
    return KruRecordDateRangeProvider(
      start: start,
      end: end,
    );
  }

  @override
  KruRecordDateRangeProvider getProviderOverride(
    covariant KruRecordDateRangeProvider provider,
  ) {
    return call(
      start: provider.start,
      end: provider.end,
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
  String? get name => r'kruRecordDateRangeProvider';
}

/// See also [KruRecordDateRange].
class KruRecordDateRangeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    KruRecordDateRange, List<KruRecord>> {
  /// See also [KruRecordDateRange].
  KruRecordDateRangeProvider({
    required DateTime start,
    required DateTime end,
  }) : this._internal(
          () => KruRecordDateRange()
            ..start = start
            ..end = end,
          from: kruRecordDateRangeProvider,
          name: r'kruRecordDateRangeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kruRecordDateRangeHash,
          dependencies: KruRecordDateRangeFamily._dependencies,
          allTransitiveDependencies:
              KruRecordDateRangeFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  KruRecordDateRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  FutureOr<List<KruRecord>> runNotifierBuild(
    covariant KruRecordDateRange notifier,
  ) {
    return notifier.build(
      start: start,
      end: end,
    );
  }

  @override
  Override overrideWith(KruRecordDateRange Function() create) {
    return ProviderOverride(
      origin: this,
      override: KruRecordDateRangeProvider._internal(
        () => create()
          ..start = start
          ..end = end,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<KruRecordDateRange, List<KruRecord>>
      createElement() {
    return _KruRecordDateRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KruRecordDateRangeProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KruRecordDateRangeRef
    on AutoDisposeAsyncNotifierProviderRef<List<KruRecord>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _KruRecordDateRangeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<KruRecordDateRange,
        List<KruRecord>> with KruRecordDateRangeRef {
  _KruRecordDateRangeProviderElement(super.provider);

  @override
  DateTime get start => (origin as KruRecordDateRangeProvider).start;
  @override
  DateTime get end => (origin as KruRecordDateRangeProvider).end;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

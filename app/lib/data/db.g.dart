// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $BusinessSettingsTable extends BusinessSettings
    with TableInfo<$BusinessSettingsTable, BusinessSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Namt Oil Mil'),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('en'),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _salePrefixMeta = const VerificationMeta(
    'salePrefix',
  );
  @override
  late final GeneratedColumn<String> salePrefix = GeneratedColumn<String>(
    'sale_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('SALE-'),
  );
  static const VerificationMeta _purchasePrefixMeta = const VerificationMeta(
    'purchasePrefix',
  );
  @override
  late final GeneratedColumn<String> purchasePrefix = GeneratedColumn<String>(
    'purchase_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PUR-'),
  );
  static const VerificationMeta _paymentPrefixMeta = const VerificationMeta(
    'paymentPrefix',
  );
  @override
  late final GeneratedColumn<String> paymentPrefix = GeneratedColumn<String>(
    'payment_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PAY-'),
  );
  static const VerificationMeta _batchPrefixMeta = const VerificationMeta(
    'batchPrefix',
  );
  @override
  late final GeneratedColumn<String> batchPrefix = GeneratedColumn<String>(
    'batch_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('BATCH-'),
  );
  static const VerificationMeta _negativeStockMeta = const VerificationMeta(
    'negativeStock',
  );
  @override
  late final GeneratedColumn<String> negativeStock = GeneratedColumn<String>(
    'negative_stock',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('warn'),
  );
  static const VerificationMeta _onboardedMeta = const VerificationMeta(
    'onboarded',
  );
  @override
  late final GeneratedColumn<bool> onboarded = GeneratedColumn<bool>(
    'onboarded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessName,
    address,
    phone,
    language,
    themeMode,
    salePrefix,
    purchasePrefix,
    paymentPrefix,
    batchPrefix,
    negativeStock,
    onboarded,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('sale_prefix')) {
      context.handle(
        _salePrefixMeta,
        salePrefix.isAcceptableOrUnknown(data['sale_prefix']!, _salePrefixMeta),
      );
    }
    if (data.containsKey('purchase_prefix')) {
      context.handle(
        _purchasePrefixMeta,
        purchasePrefix.isAcceptableOrUnknown(
          data['purchase_prefix']!,
          _purchasePrefixMeta,
        ),
      );
    }
    if (data.containsKey('payment_prefix')) {
      context.handle(
        _paymentPrefixMeta,
        paymentPrefix.isAcceptableOrUnknown(
          data['payment_prefix']!,
          _paymentPrefixMeta,
        ),
      );
    }
    if (data.containsKey('batch_prefix')) {
      context.handle(
        _batchPrefixMeta,
        batchPrefix.isAcceptableOrUnknown(
          data['batch_prefix']!,
          _batchPrefixMeta,
        ),
      );
    }
    if (data.containsKey('negative_stock')) {
      context.handle(
        _negativeStockMeta,
        negativeStock.isAcceptableOrUnknown(
          data['negative_stock']!,
          _negativeStockMeta,
        ),
      );
    }
    if (data.containsKey('onboarded')) {
      context.handle(
        _onboardedMeta,
        onboarded.isAcceptableOrUnknown(data['onboarded']!, _onboardedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      salePrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_prefix'],
      )!,
      purchasePrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_prefix'],
      )!,
      paymentPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_prefix'],
      )!,
      batchPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_prefix'],
      )!,
      negativeStock: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}negative_stock'],
      )!,
      onboarded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarded'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BusinessSettingsTable createAlias(String alias) {
    return $BusinessSettingsTable(attachedDatabase, alias);
  }
}

class BusinessSetting extends DataClass implements Insertable<BusinessSetting> {
  final int id;
  final String businessName;
  final String address;
  final String phone;
  final String language;
  final String themeMode;
  final String salePrefix;
  final String purchasePrefix;
  final String paymentPrefix;
  final String batchPrefix;

  /// warn | block | allow
  final String negativeStock;
  final bool onboarded;
  final int createdAt;
  final int updatedAt;
  const BusinessSetting({
    required this.id,
    required this.businessName,
    required this.address,
    required this.phone,
    required this.language,
    required this.themeMode,
    required this.salePrefix,
    required this.purchasePrefix,
    required this.paymentPrefix,
    required this.batchPrefix,
    required this.negativeStock,
    required this.onboarded,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_name'] = Variable<String>(businessName);
    map['address'] = Variable<String>(address);
    map['phone'] = Variable<String>(phone);
    map['language'] = Variable<String>(language);
    map['theme_mode'] = Variable<String>(themeMode);
    map['sale_prefix'] = Variable<String>(salePrefix);
    map['purchase_prefix'] = Variable<String>(purchasePrefix);
    map['payment_prefix'] = Variable<String>(paymentPrefix);
    map['batch_prefix'] = Variable<String>(batchPrefix);
    map['negative_stock'] = Variable<String>(negativeStock);
    map['onboarded'] = Variable<bool>(onboarded);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  BusinessSettingsCompanion toCompanion(bool nullToAbsent) {
    return BusinessSettingsCompanion(
      id: Value(id),
      businessName: Value(businessName),
      address: Value(address),
      phone: Value(phone),
      language: Value(language),
      themeMode: Value(themeMode),
      salePrefix: Value(salePrefix),
      purchasePrefix: Value(purchasePrefix),
      paymentPrefix: Value(paymentPrefix),
      batchPrefix: Value(batchPrefix),
      negativeStock: Value(negativeStock),
      onboarded: Value(onboarded),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BusinessSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessSetting(
      id: serializer.fromJson<int>(json['id']),
      businessName: serializer.fromJson<String>(json['businessName']),
      address: serializer.fromJson<String>(json['address']),
      phone: serializer.fromJson<String>(json['phone']),
      language: serializer.fromJson<String>(json['language']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      salePrefix: serializer.fromJson<String>(json['salePrefix']),
      purchasePrefix: serializer.fromJson<String>(json['purchasePrefix']),
      paymentPrefix: serializer.fromJson<String>(json['paymentPrefix']),
      batchPrefix: serializer.fromJson<String>(json['batchPrefix']),
      negativeStock: serializer.fromJson<String>(json['negativeStock']),
      onboarded: serializer.fromJson<bool>(json['onboarded']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessName': serializer.toJson<String>(businessName),
      'address': serializer.toJson<String>(address),
      'phone': serializer.toJson<String>(phone),
      'language': serializer.toJson<String>(language),
      'themeMode': serializer.toJson<String>(themeMode),
      'salePrefix': serializer.toJson<String>(salePrefix),
      'purchasePrefix': serializer.toJson<String>(purchasePrefix),
      'paymentPrefix': serializer.toJson<String>(paymentPrefix),
      'batchPrefix': serializer.toJson<String>(batchPrefix),
      'negativeStock': serializer.toJson<String>(negativeStock),
      'onboarded': serializer.toJson<bool>(onboarded),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  BusinessSetting copyWith({
    int? id,
    String? businessName,
    String? address,
    String? phone,
    String? language,
    String? themeMode,
    String? salePrefix,
    String? purchasePrefix,
    String? paymentPrefix,
    String? batchPrefix,
    String? negativeStock,
    bool? onboarded,
    int? createdAt,
    int? updatedAt,
  }) => BusinessSetting(
    id: id ?? this.id,
    businessName: businessName ?? this.businessName,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    language: language ?? this.language,
    themeMode: themeMode ?? this.themeMode,
    salePrefix: salePrefix ?? this.salePrefix,
    purchasePrefix: purchasePrefix ?? this.purchasePrefix,
    paymentPrefix: paymentPrefix ?? this.paymentPrefix,
    batchPrefix: batchPrefix ?? this.batchPrefix,
    negativeStock: negativeStock ?? this.negativeStock,
    onboarded: onboarded ?? this.onboarded,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BusinessSetting copyWithCompanion(BusinessSettingsCompanion data) {
    return BusinessSetting(
      id: data.id.present ? data.id.value : this.id,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      language: data.language.present ? data.language.value : this.language,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      salePrefix: data.salePrefix.present
          ? data.salePrefix.value
          : this.salePrefix,
      purchasePrefix: data.purchasePrefix.present
          ? data.purchasePrefix.value
          : this.purchasePrefix,
      paymentPrefix: data.paymentPrefix.present
          ? data.paymentPrefix.value
          : this.paymentPrefix,
      batchPrefix: data.batchPrefix.present
          ? data.batchPrefix.value
          : this.batchPrefix,
      negativeStock: data.negativeStock.present
          ? data.negativeStock.value
          : this.negativeStock,
      onboarded: data.onboarded.present ? data.onboarded.value : this.onboarded,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessSetting(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('language: $language, ')
          ..write('themeMode: $themeMode, ')
          ..write('salePrefix: $salePrefix, ')
          ..write('purchasePrefix: $purchasePrefix, ')
          ..write('paymentPrefix: $paymentPrefix, ')
          ..write('batchPrefix: $batchPrefix, ')
          ..write('negativeStock: $negativeStock, ')
          ..write('onboarded: $onboarded, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    businessName,
    address,
    phone,
    language,
    themeMode,
    salePrefix,
    purchasePrefix,
    paymentPrefix,
    batchPrefix,
    negativeStock,
    onboarded,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessSetting &&
          other.id == this.id &&
          other.businessName == this.businessName &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.language == this.language &&
          other.themeMode == this.themeMode &&
          other.salePrefix == this.salePrefix &&
          other.purchasePrefix == this.purchasePrefix &&
          other.paymentPrefix == this.paymentPrefix &&
          other.batchPrefix == this.batchPrefix &&
          other.negativeStock == this.negativeStock &&
          other.onboarded == this.onboarded &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BusinessSettingsCompanion extends UpdateCompanion<BusinessSetting> {
  final Value<int> id;
  final Value<String> businessName;
  final Value<String> address;
  final Value<String> phone;
  final Value<String> language;
  final Value<String> themeMode;
  final Value<String> salePrefix;
  final Value<String> purchasePrefix;
  final Value<String> paymentPrefix;
  final Value<String> batchPrefix;
  final Value<String> negativeStock;
  final Value<bool> onboarded;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const BusinessSettingsCompanion({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.language = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.salePrefix = const Value.absent(),
    this.purchasePrefix = const Value.absent(),
    this.paymentPrefix = const Value.absent(),
    this.batchPrefix = const Value.absent(),
    this.negativeStock = const Value.absent(),
    this.onboarded = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BusinessSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.language = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.salePrefix = const Value.absent(),
    this.purchasePrefix = const Value.absent(),
    this.paymentPrefix = const Value.absent(),
    this.batchPrefix = const Value.absent(),
    this.negativeStock = const Value.absent(),
    this.onboarded = const Value.absent(),
    required int createdAt,
    required int updatedAt,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<BusinessSetting> custom({
    Expression<int>? id,
    Expression<String>? businessName,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? language,
    Expression<String>? themeMode,
    Expression<String>? salePrefix,
    Expression<String>? purchasePrefix,
    Expression<String>? paymentPrefix,
    Expression<String>? batchPrefix,
    Expression<String>? negativeStock,
    Expression<bool>? onboarded,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessName != null) 'business_name': businessName,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (language != null) 'language': language,
      if (themeMode != null) 'theme_mode': themeMode,
      if (salePrefix != null) 'sale_prefix': salePrefix,
      if (purchasePrefix != null) 'purchase_prefix': purchasePrefix,
      if (paymentPrefix != null) 'payment_prefix': paymentPrefix,
      if (batchPrefix != null) 'batch_prefix': batchPrefix,
      if (negativeStock != null) 'negative_stock': negativeStock,
      if (onboarded != null) 'onboarded': onboarded,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BusinessSettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? businessName,
    Value<String>? address,
    Value<String>? phone,
    Value<String>? language,
    Value<String>? themeMode,
    Value<String>? salePrefix,
    Value<String>? purchasePrefix,
    Value<String>? paymentPrefix,
    Value<String>? batchPrefix,
    Value<String>? negativeStock,
    Value<bool>? onboarded,
    Value<int>? createdAt,
    Value<int>? updatedAt,
  }) {
    return BusinessSettingsCompanion(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      salePrefix: salePrefix ?? this.salePrefix,
      purchasePrefix: purchasePrefix ?? this.purchasePrefix,
      paymentPrefix: paymentPrefix ?? this.paymentPrefix,
      batchPrefix: batchPrefix ?? this.batchPrefix,
      negativeStock: negativeStock ?? this.negativeStock,
      onboarded: onboarded ?? this.onboarded,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (salePrefix.present) {
      map['sale_prefix'] = Variable<String>(salePrefix.value);
    }
    if (purchasePrefix.present) {
      map['purchase_prefix'] = Variable<String>(purchasePrefix.value);
    }
    if (paymentPrefix.present) {
      map['payment_prefix'] = Variable<String>(paymentPrefix.value);
    }
    if (batchPrefix.present) {
      map['batch_prefix'] = Variable<String>(batchPrefix.value);
    }
    if (negativeStock.present) {
      map['negative_stock'] = Variable<String>(negativeStock.value);
    }
    if (onboarded.present) {
      map['onboarded'] = Variable<bool>(onboarded.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessSettingsCompanion(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('language: $language, ')
          ..write('themeMode: $themeMode, ')
          ..write('salePrefix: $salePrefix, ')
          ..write('purchasePrefix: $purchasePrefix, ')
          ..write('paymentPrefix: $paymentPrefix, ')
          ..write('batchPrefix: $batchPrefix, ')
          ..write('negativeStock: $negativeStock, ')
          ..write('onboarded: $onboarded, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameUrMeta = const VerificationMeta('nameUr');
  @override
  late final GeneratedColumn<String> nameUr = GeneratedColumn<String>(
    'name_ur',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nameEn, nameUr, symbol];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<Unit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('name_ur')) {
      context.handle(
        _nameUrMeta,
        nameUr.isAcceptableOrUnknown(data['name_ur']!, _nameUrMeta),
      );
    } else if (isInserting) {
      context.missing(_nameUrMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      nameUr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ur'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final String id;
  final String nameEn;
  final String nameUr;
  final String symbol;
  const Unit({
    required this.id,
    required this.nameEn,
    required this.nameUr,
    required this.symbol,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name_en'] = Variable<String>(nameEn);
    map['name_ur'] = Variable<String>(nameUr);
    map['symbol'] = Variable<String>(symbol);
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      nameEn: Value(nameEn),
      nameUr: Value(nameUr),
      symbol: Value(symbol),
    );
  }

  factory Unit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Unit(
      id: serializer.fromJson<String>(json['id']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      nameUr: serializer.fromJson<String>(json['nameUr']),
      symbol: serializer.fromJson<String>(json['symbol']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nameEn': serializer.toJson<String>(nameEn),
      'nameUr': serializer.toJson<String>(nameUr),
      'symbol': serializer.toJson<String>(symbol),
    };
  }

  Unit copyWith({String? id, String? nameEn, String? nameUr, String? symbol}) =>
      Unit(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameUr: nameUr ?? this.nameUr,
        symbol: symbol ?? this.symbol,
      );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nameUr: data.nameUr.present ? data.nameUr.value : this.nameUr,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameUr: $nameUr, ')
          ..write('symbol: $symbol')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameEn, nameUr, symbol);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.nameEn == this.nameEn &&
          other.nameUr == this.nameUr &&
          other.symbol == this.symbol);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<String> id;
  final Value<String> nameEn;
  final Value<String> nameUr;
  final Value<String> symbol;
  final Value<int> rowid;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nameUr = const Value.absent(),
    this.symbol = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitsCompanion.insert({
    required String id,
    required String nameEn,
    required String nameUr,
    required String symbol,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nameEn = Value(nameEn),
       nameUr = Value(nameUr),
       symbol = Value(symbol);
  static Insertable<Unit> custom({
    Expression<String>? id,
    Expression<String>? nameEn,
    Expression<String>? nameUr,
    Expression<String>? symbol,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameEn != null) 'name_en': nameEn,
      if (nameUr != null) 'name_ur': nameUr,
      if (symbol != null) 'symbol': symbol,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? nameEn,
    Value<String>? nameUr,
    Value<String>? symbol,
    Value<int>? rowid,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameUr: nameUr ?? this.nameUr,
      symbol: symbol ?? this.symbol,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nameUr.present) {
      map['name_ur'] = Variable<String>(nameUr.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameUr: $nameUr, ')
          ..write('symbol: $symbol, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnitConversionsTable extends UnitConversions
    with TableInfo<$UnitConversionsTable, UnitConversion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitConversionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fromUnitIdMeta = const VerificationMeta(
    'fromUnitId',
  );
  @override
  late final GeneratedColumn<String> fromUnitId = GeneratedColumn<String>(
    'from_unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _toUnitIdMeta = const VerificationMeta(
    'toUnitId',
  );
  @override
  late final GeneratedColumn<String> toUnitId = GeneratedColumn<String>(
    'to_unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _factorNumMeta = const VerificationMeta(
    'factorNum',
  );
  @override
  late final GeneratedColumn<int> factorNum = GeneratedColumn<int>(
    'factor_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _factorDenMeta = const VerificationMeta(
    'factorDen',
  );
  @override
  late final GeneratedColumn<int> factorDen = GeneratedColumn<int>(
    'factor_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fromUnitId,
    toUnitId,
    factorNum,
    factorDen,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_conversions';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitConversion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('from_unit_id')) {
      context.handle(
        _fromUnitIdMeta,
        fromUnitId.isAcceptableOrUnknown(
          data['from_unit_id']!,
          _fromUnitIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fromUnitIdMeta);
    }
    if (data.containsKey('to_unit_id')) {
      context.handle(
        _toUnitIdMeta,
        toUnitId.isAcceptableOrUnknown(data['to_unit_id']!, _toUnitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_toUnitIdMeta);
    }
    if (data.containsKey('factor_num')) {
      context.handle(
        _factorNumMeta,
        factorNum.isAcceptableOrUnknown(data['factor_num']!, _factorNumMeta),
      );
    } else if (isInserting) {
      context.missing(_factorNumMeta);
    }
    if (data.containsKey('factor_den')) {
      context.handle(
        _factorDenMeta,
        factorDen.isAcceptableOrUnknown(data['factor_den']!, _factorDenMeta),
      );
    } else if (isInserting) {
      context.missing(_factorDenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitConversion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitConversion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fromUnitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_unit_id'],
      )!,
      toUnitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_unit_id'],
      )!,
      factorNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}factor_num'],
      )!,
      factorDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}factor_den'],
      )!,
    );
  }

  @override
  $UnitConversionsTable createAlias(String alias) {
    return $UnitConversionsTable(attachedDatabase, alias);
  }
}

class UnitConversion extends DataClass implements Insertable<UnitConversion> {
  final int id;
  final String fromUnitId;
  final String toUnitId;
  final int factorNum;
  final int factorDen;
  const UnitConversion({
    required this.id,
    required this.fromUnitId,
    required this.toUnitId,
    required this.factorNum,
    required this.factorDen,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['from_unit_id'] = Variable<String>(fromUnitId);
    map['to_unit_id'] = Variable<String>(toUnitId);
    map['factor_num'] = Variable<int>(factorNum);
    map['factor_den'] = Variable<int>(factorDen);
    return map;
  }

  UnitConversionsCompanion toCompanion(bool nullToAbsent) {
    return UnitConversionsCompanion(
      id: Value(id),
      fromUnitId: Value(fromUnitId),
      toUnitId: Value(toUnitId),
      factorNum: Value(factorNum),
      factorDen: Value(factorDen),
    );
  }

  factory UnitConversion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitConversion(
      id: serializer.fromJson<int>(json['id']),
      fromUnitId: serializer.fromJson<String>(json['fromUnitId']),
      toUnitId: serializer.fromJson<String>(json['toUnitId']),
      factorNum: serializer.fromJson<int>(json['factorNum']),
      factorDen: serializer.fromJson<int>(json['factorDen']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fromUnitId': serializer.toJson<String>(fromUnitId),
      'toUnitId': serializer.toJson<String>(toUnitId),
      'factorNum': serializer.toJson<int>(factorNum),
      'factorDen': serializer.toJson<int>(factorDen),
    };
  }

  UnitConversion copyWith({
    int? id,
    String? fromUnitId,
    String? toUnitId,
    int? factorNum,
    int? factorDen,
  }) => UnitConversion(
    id: id ?? this.id,
    fromUnitId: fromUnitId ?? this.fromUnitId,
    toUnitId: toUnitId ?? this.toUnitId,
    factorNum: factorNum ?? this.factorNum,
    factorDen: factorDen ?? this.factorDen,
  );
  UnitConversion copyWithCompanion(UnitConversionsCompanion data) {
    return UnitConversion(
      id: data.id.present ? data.id.value : this.id,
      fromUnitId: data.fromUnitId.present
          ? data.fromUnitId.value
          : this.fromUnitId,
      toUnitId: data.toUnitId.present ? data.toUnitId.value : this.toUnitId,
      factorNum: data.factorNum.present ? data.factorNum.value : this.factorNum,
      factorDen: data.factorDen.present ? data.factorDen.value : this.factorDen,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitConversion(')
          ..write('id: $id, ')
          ..write('fromUnitId: $fromUnitId, ')
          ..write('toUnitId: $toUnitId, ')
          ..write('factorNum: $factorNum, ')
          ..write('factorDen: $factorDen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fromUnitId, toUnitId, factorNum, factorDen);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitConversion &&
          other.id == this.id &&
          other.fromUnitId == this.fromUnitId &&
          other.toUnitId == this.toUnitId &&
          other.factorNum == this.factorNum &&
          other.factorDen == this.factorDen);
}

class UnitConversionsCompanion extends UpdateCompanion<UnitConversion> {
  final Value<int> id;
  final Value<String> fromUnitId;
  final Value<String> toUnitId;
  final Value<int> factorNum;
  final Value<int> factorDen;
  const UnitConversionsCompanion({
    this.id = const Value.absent(),
    this.fromUnitId = const Value.absent(),
    this.toUnitId = const Value.absent(),
    this.factorNum = const Value.absent(),
    this.factorDen = const Value.absent(),
  });
  UnitConversionsCompanion.insert({
    this.id = const Value.absent(),
    required String fromUnitId,
    required String toUnitId,
    required int factorNum,
    required int factorDen,
  }) : fromUnitId = Value(fromUnitId),
       toUnitId = Value(toUnitId),
       factorNum = Value(factorNum),
       factorDen = Value(factorDen);
  static Insertable<UnitConversion> custom({
    Expression<int>? id,
    Expression<String>? fromUnitId,
    Expression<String>? toUnitId,
    Expression<int>? factorNum,
    Expression<int>? factorDen,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fromUnitId != null) 'from_unit_id': fromUnitId,
      if (toUnitId != null) 'to_unit_id': toUnitId,
      if (factorNum != null) 'factor_num': factorNum,
      if (factorDen != null) 'factor_den': factorDen,
    });
  }

  UnitConversionsCompanion copyWith({
    Value<int>? id,
    Value<String>? fromUnitId,
    Value<String>? toUnitId,
    Value<int>? factorNum,
    Value<int>? factorDen,
  }) {
    return UnitConversionsCompanion(
      id: id ?? this.id,
      fromUnitId: fromUnitId ?? this.fromUnitId,
      toUnitId: toUnitId ?? this.toUnitId,
      factorNum: factorNum ?? this.factorNum,
      factorDen: factorDen ?? this.factorDen,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fromUnitId.present) {
      map['from_unit_id'] = Variable<String>(fromUnitId.value);
    }
    if (toUnitId.present) {
      map['to_unit_id'] = Variable<String>(toUnitId.value);
    }
    if (factorNum.present) {
      map['factor_num'] = Variable<int>(factorNum.value);
    }
    if (factorDen.present) {
      map['factor_den'] = Variable<int>(factorDen.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitConversionsCompanion(')
          ..write('id: $id, ')
          ..write('fromUnitId: $fromUnitId, ')
          ..write('toUnitId: $toUnitId, ')
          ..write('factorNum: $factorNum, ')
          ..write('factorDen: $factorDen')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseUnitIdMeta = const VerificationMeta(
    'baseUnitId',
  );
  @override
  late final GeneratedColumn<String> baseUnitId = GeneratedColumn<String>(
    'base_unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _salePriceMeta = const VerificationMeta(
    'salePrice',
  );
  @override
  late final GeneratedColumn<int> salePrice = GeneratedColumn<int>(
    'sale_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reorderNumMeta = const VerificationMeta(
    'reorderNum',
  );
  @override
  late final GeneratedColumn<int> reorderNum = GeneratedColumn<int>(
    'reorder_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reorderDenMeta = const VerificationMeta(
    'reorderDen',
  );
  @override
  late final GeneratedColumn<int> reorderDen = GeneratedColumn<int>(
    'reorder_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    baseUnitId,
    purchasePrice,
    salePrice,
    reorderNum,
    reorderDen,
    active,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('base_unit_id')) {
      context.handle(
        _baseUnitIdMeta,
        baseUnitId.isAcceptableOrUnknown(
          data['base_unit_id']!,
          _baseUnitIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseUnitIdMeta);
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    }
    if (data.containsKey('sale_price')) {
      context.handle(
        _salePriceMeta,
        salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta),
      );
    }
    if (data.containsKey('reorder_num')) {
      context.handle(
        _reorderNumMeta,
        reorderNum.isAcceptableOrUnknown(data['reorder_num']!, _reorderNumMeta),
      );
    }
    if (data.containsKey('reorder_den')) {
      context.handle(
        _reorderDenMeta,
        reorderDen.isAcceptableOrUnknown(data['reorder_den']!, _reorderDenMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      baseUnitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_unit_id'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_price'],
      )!,
      salePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sale_price'],
      )!,
      reorderNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reorder_num'],
      )!,
      reorderDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reorder_den'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String name;

  /// raw | finished_oil | cake | packaging | container | spare | consumable | other
  final String category;
  final String baseUnitId;

  /// paisa
  final int purchasePrice;
  final int salePrice;
  final int reorderNum;
  final int reorderDen;
  final bool active;
  final int createdAt;
  final int updatedAt;
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.baseUnitId,
    required this.purchasePrice,
    required this.salePrice,
    required this.reorderNum,
    required this.reorderDen,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['base_unit_id'] = Variable<String>(baseUnitId);
    map['purchase_price'] = Variable<int>(purchasePrice);
    map['sale_price'] = Variable<int>(salePrice);
    map['reorder_num'] = Variable<int>(reorderNum);
    map['reorder_den'] = Variable<int>(reorderDen);
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      baseUnitId: Value(baseUnitId),
      purchasePrice: Value(purchasePrice),
      salePrice: Value(salePrice),
      reorderNum: Value(reorderNum),
      reorderDen: Value(reorderDen),
      active: Value(active),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      baseUnitId: serializer.fromJson<String>(json['baseUnitId']),
      purchasePrice: serializer.fromJson<int>(json['purchasePrice']),
      salePrice: serializer.fromJson<int>(json['salePrice']),
      reorderNum: serializer.fromJson<int>(json['reorderNum']),
      reorderDen: serializer.fromJson<int>(json['reorderDen']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'baseUnitId': serializer.toJson<String>(baseUnitId),
      'purchasePrice': serializer.toJson<int>(purchasePrice),
      'salePrice': serializer.toJson<int>(salePrice),
      'reorderNum': serializer.toJson<int>(reorderNum),
      'reorderDen': serializer.toJson<int>(reorderDen),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? baseUnitId,
    int? purchasePrice,
    int? salePrice,
    int? reorderNum,
    int? reorderDen,
    bool? active,
    int? createdAt,
    int? updatedAt,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    baseUnitId: baseUnitId ?? this.baseUnitId,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    salePrice: salePrice ?? this.salePrice,
    reorderNum: reorderNum ?? this.reorderNum,
    reorderDen: reorderDen ?? this.reorderDen,
    active: active ?? this.active,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      baseUnitId: data.baseUnitId.present
          ? data.baseUnitId.value
          : this.baseUnitId,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      reorderNum: data.reorderNum.present
          ? data.reorderNum.value
          : this.reorderNum,
      reorderDen: data.reorderDen.present
          ? data.reorderDen.value
          : this.reorderDen,
      active: data.active.present ? data.active.value : this.active,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('baseUnitId: $baseUnitId, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('reorderNum: $reorderNum, ')
          ..write('reorderDen: $reorderDen, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    baseUnitId,
    purchasePrice,
    salePrice,
    reorderNum,
    reorderDen,
    active,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.baseUnitId == this.baseUnitId &&
          other.purchasePrice == this.purchasePrice &&
          other.salePrice == this.salePrice &&
          other.reorderNum == this.reorderNum &&
          other.reorderDen == this.reorderDen &&
          other.active == this.active &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> baseUnitId;
  final Value<int> purchasePrice;
  final Value<int> salePrice;
  final Value<int> reorderNum;
  final Value<int> reorderDen;
  final Value<bool> active;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.baseUnitId = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.reorderNum = const Value.absent(),
    this.reorderDen = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String name,
    required String category,
    required String baseUnitId,
    this.purchasePrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.reorderNum = const Value.absent(),
    this.reorderDen = const Value.absent(),
    this.active = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       baseUnitId = Value(baseUnitId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? baseUnitId,
    Expression<int>? purchasePrice,
    Expression<int>? salePrice,
    Expression<int>? reorderNum,
    Expression<int>? reorderDen,
    Expression<bool>? active,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (baseUnitId != null) 'base_unit_id': baseUnitId,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (salePrice != null) 'sale_price': salePrice,
      if (reorderNum != null) 'reorder_num': reorderNum,
      if (reorderDen != null) 'reorder_den': reorderDen,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? baseUnitId,
    Value<int>? purchasePrice,
    Value<int>? salePrice,
    Value<int>? reorderNum,
    Value<int>? reorderDen,
    Value<bool>? active,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      baseUnitId: baseUnitId ?? this.baseUnitId,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      salePrice: salePrice ?? this.salePrice,
      reorderNum: reorderNum ?? this.reorderNum,
      reorderDen: reorderDen ?? this.reorderDen,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (baseUnitId.present) {
      map['base_unit_id'] = Variable<String>(baseUnitId.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<int>(salePrice.value);
    }
    if (reorderNum.present) {
      map['reorder_num'] = Variable<int>(reorderNum.value);
    }
    if (reorderDen.present) {
      map['reorder_den'] = Variable<int>(reorderDen.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('baseUnitId: $baseUnitId, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('reorderNum: $reorderNum, ')
          ..write('reorderDen: $reorderDen, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _whatsappMeta = const VerificationMeta(
    'whatsapp',
  );
  @override
  late final GeneratedColumn<String> whatsapp = GeneratedColumn<String>(
    'whatsapp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    whatsapp,
    address,
    code,
    businessName,
    notes,
    openingBalance,
    balance,
    active,
    isFavorite,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('whatsapp')) {
      context.handle(
        _whatsappMeta,
        whatsapp.isAcceptableOrUnknown(data['whatsapp']!, _whatsappMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      whatsapp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final String id;
  final String name;
  final String phone;

  /// WhatsApp number; empty means "same as phone".
  final String whatsapp;
  final String address;
  final String code;
  final String businessName;
  final String notes;

  /// paisa; >0 means customer owes us
  final int openingBalance;
  final int balance;
  final bool active;

  /// 0/1 favorite (heart) toggle
  final bool isFavorite;
  final int createdAt;
  final int updatedAt;
  const Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.whatsapp,
    required this.address,
    required this.code,
    required this.businessName,
    required this.notes,
    required this.openingBalance,
    required this.balance,
    required this.active,
    required this.isFavorite,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['whatsapp'] = Variable<String>(whatsapp);
    map['address'] = Variable<String>(address);
    map['code'] = Variable<String>(code);
    map['business_name'] = Variable<String>(businessName);
    map['notes'] = Variable<String>(notes);
    map['opening_balance'] = Variable<int>(openingBalance);
    map['balance'] = Variable<int>(balance);
    map['active'] = Variable<bool>(active);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      whatsapp: Value(whatsapp),
      address: Value(address),
      code: Value(code),
      businessName: Value(businessName),
      notes: Value(notes),
      openingBalance: Value(openingBalance),
      balance: Value(balance),
      active: Value(active),
      isFavorite: Value(isFavorite),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      whatsapp: serializer.fromJson<String>(json['whatsapp']),
      address: serializer.fromJson<String>(json['address']),
      code: serializer.fromJson<String>(json['code']),
      businessName: serializer.fromJson<String>(json['businessName']),
      notes: serializer.fromJson<String>(json['notes']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
      balance: serializer.fromJson<int>(json['balance']),
      active: serializer.fromJson<bool>(json['active']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'whatsapp': serializer.toJson<String>(whatsapp),
      'address': serializer.toJson<String>(address),
      'code': serializer.toJson<String>(code),
      'businessName': serializer.toJson<String>(businessName),
      'notes': serializer.toJson<String>(notes),
      'openingBalance': serializer.toJson<int>(openingBalance),
      'balance': serializer.toJson<int>(balance),
      'active': serializer.toJson<bool>(active),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? whatsapp,
    String? address,
    String? code,
    String? businessName,
    String? notes,
    int? openingBalance,
    int? balance,
    bool? active,
    bool? isFavorite,
    int? createdAt,
    int? updatedAt,
  }) => Customer(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    whatsapp: whatsapp ?? this.whatsapp,
    address: address ?? this.address,
    code: code ?? this.code,
    businessName: businessName ?? this.businessName,
    notes: notes ?? this.notes,
    openingBalance: openingBalance ?? this.openingBalance,
    balance: balance ?? this.balance,
    active: active ?? this.active,
    isFavorite: isFavorite ?? this.isFavorite,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      whatsapp: data.whatsapp.present ? data.whatsapp.value : this.whatsapp,
      address: data.address.present ? data.address.value : this.address,
      code: data.code.present ? data.code.value : this.code,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      notes: data.notes.present ? data.notes.value : this.notes,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      balance: data.balance.present ? data.balance.value : this.balance,
      active: data.active.present ? data.active.value : this.active,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('address: $address, ')
          ..write('code: $code, ')
          ..write('businessName: $businessName, ')
          ..write('notes: $notes, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('balance: $balance, ')
          ..write('active: $active, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    phone,
    whatsapp,
    address,
    code,
    businessName,
    notes,
    openingBalance,
    balance,
    active,
    isFavorite,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.whatsapp == this.whatsapp &&
          other.address == this.address &&
          other.code == this.code &&
          other.businessName == this.businessName &&
          other.notes == this.notes &&
          other.openingBalance == this.openingBalance &&
          other.balance == this.balance &&
          other.active == this.active &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> whatsapp;
  final Value<String> address;
  final Value<String> code;
  final Value<String> businessName;
  final Value<String> notes;
  final Value<int> openingBalance;
  final Value<int> balance;
  final Value<bool> active;
  final Value<bool> isFavorite;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.address = const Value.absent(),
    this.code = const Value.absent(),
    this.businessName = const Value.absent(),
    this.notes = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.balance = const Value.absent(),
    this.active = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomersCompanion.insert({
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.address = const Value.absent(),
    this.code = const Value.absent(),
    this.businessName = const Value.absent(),
    this.notes = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.balance = const Value.absent(),
    this.active = const Value.absent(),
    this.isFavorite = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Customer> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? whatsapp,
    Expression<String>? address,
    Expression<String>? code,
    Expression<String>? businessName,
    Expression<String>? notes,
    Expression<int>? openingBalance,
    Expression<int>? balance,
    Expression<bool>? active,
    Expression<bool>? isFavorite,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (address != null) 'address': address,
      if (code != null) 'code': code,
      if (businessName != null) 'business_name': businessName,
      if (notes != null) 'notes': notes,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (balance != null) 'balance': balance,
      if (active != null) 'active': active,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? whatsapp,
    Value<String>? address,
    Value<String>? code,
    Value<String>? businessName,
    Value<String>? notes,
    Value<int>? openingBalance,
    Value<int>? balance,
    Value<bool>? active,
    Value<bool>? isFavorite,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      address: address ?? this.address,
      code: code ?? this.code,
      businessName: businessName ?? this.businessName,
      notes: notes ?? this.notes,
      openingBalance: openingBalance ?? this.openingBalance,
      balance: balance ?? this.balance,
      active: active ?? this.active,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (whatsapp.present) {
      map['whatsapp'] = Variable<String>(whatsapp.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('address: $address, ')
          ..write('code: $code, ')
          ..write('businessName: $businessName, ')
          ..write('notes: $notes, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('balance: $balance, ')
          ..write('active: $active, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, Supplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _whatsappMeta = const VerificationMeta(
    'whatsapp',
  );
  @override
  late final GeneratedColumn<String> whatsapp = GeneratedColumn<String>(
    'whatsapp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    whatsapp,
    address,
    code,
    businessName,
    notes,
    openingBalance,
    balance,
    active,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Supplier> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('whatsapp')) {
      context.handle(
        _whatsappMeta,
        whatsapp.isAcceptableOrUnknown(data['whatsapp']!, _whatsappMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Supplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplier(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      whatsapp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class Supplier extends DataClass implements Insertable<Supplier> {
  final String id;
  final String name;
  final String phone;

  /// WhatsApp number; empty means "same as phone".
  final String whatsapp;
  final String address;
  final String code;
  final String businessName;
  final String notes;

  /// paisa; >0 means we owe supplier
  final int openingBalance;
  final int balance;
  final bool active;
  final int createdAt;
  final int updatedAt;
  const Supplier({
    required this.id,
    required this.name,
    required this.phone,
    required this.whatsapp,
    required this.address,
    required this.code,
    required this.businessName,
    required this.notes,
    required this.openingBalance,
    required this.balance,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['whatsapp'] = Variable<String>(whatsapp);
    map['address'] = Variable<String>(address);
    map['code'] = Variable<String>(code);
    map['business_name'] = Variable<String>(businessName);
    map['notes'] = Variable<String>(notes);
    map['opening_balance'] = Variable<int>(openingBalance);
    map['balance'] = Variable<int>(balance);
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      whatsapp: Value(whatsapp),
      address: Value(address),
      code: Value(code),
      businessName: Value(businessName),
      notes: Value(notes),
      openingBalance: Value(openingBalance),
      balance: Value(balance),
      active: Value(active),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Supplier.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supplier(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      whatsapp: serializer.fromJson<String>(json['whatsapp']),
      address: serializer.fromJson<String>(json['address']),
      code: serializer.fromJson<String>(json['code']),
      businessName: serializer.fromJson<String>(json['businessName']),
      notes: serializer.fromJson<String>(json['notes']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
      balance: serializer.fromJson<int>(json['balance']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'whatsapp': serializer.toJson<String>(whatsapp),
      'address': serializer.toJson<String>(address),
      'code': serializer.toJson<String>(code),
      'businessName': serializer.toJson<String>(businessName),
      'notes': serializer.toJson<String>(notes),
      'openingBalance': serializer.toJson<int>(openingBalance),
      'balance': serializer.toJson<int>(balance),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Supplier copyWith({
    String? id,
    String? name,
    String? phone,
    String? whatsapp,
    String? address,
    String? code,
    String? businessName,
    String? notes,
    int? openingBalance,
    int? balance,
    bool? active,
    int? createdAt,
    int? updatedAt,
  }) => Supplier(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    whatsapp: whatsapp ?? this.whatsapp,
    address: address ?? this.address,
    code: code ?? this.code,
    businessName: businessName ?? this.businessName,
    notes: notes ?? this.notes,
    openingBalance: openingBalance ?? this.openingBalance,
    balance: balance ?? this.balance,
    active: active ?? this.active,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Supplier copyWithCompanion(SuppliersCompanion data) {
    return Supplier(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      whatsapp: data.whatsapp.present ? data.whatsapp.value : this.whatsapp,
      address: data.address.present ? data.address.value : this.address,
      code: data.code.present ? data.code.value : this.code,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      notes: data.notes.present ? data.notes.value : this.notes,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      balance: data.balance.present ? data.balance.value : this.balance,
      active: data.active.present ? data.active.value : this.active,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Supplier(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('address: $address, ')
          ..write('code: $code, ')
          ..write('businessName: $businessName, ')
          ..write('notes: $notes, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('balance: $balance, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    phone,
    whatsapp,
    address,
    code,
    businessName,
    notes,
    openingBalance,
    balance,
    active,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplier &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.whatsapp == this.whatsapp &&
          other.address == this.address &&
          other.code == this.code &&
          other.businessName == this.businessName &&
          other.notes == this.notes &&
          other.openingBalance == this.openingBalance &&
          other.balance == this.balance &&
          other.active == this.active &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SuppliersCompanion extends UpdateCompanion<Supplier> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> whatsapp;
  final Value<String> address;
  final Value<String> code;
  final Value<String> businessName;
  final Value<String> notes;
  final Value<int> openingBalance;
  final Value<int> balance;
  final Value<bool> active;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.address = const Value.absent(),
    this.code = const Value.absent(),
    this.businessName = const Value.absent(),
    this.notes = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.balance = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuppliersCompanion.insert({
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.address = const Value.absent(),
    this.code = const Value.absent(),
    this.businessName = const Value.absent(),
    this.notes = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.balance = const Value.absent(),
    this.active = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Supplier> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? whatsapp,
    Expression<String>? address,
    Expression<String>? code,
    Expression<String>? businessName,
    Expression<String>? notes,
    Expression<int>? openingBalance,
    Expression<int>? balance,
    Expression<bool>? active,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (address != null) 'address': address,
      if (code != null) 'code': code,
      if (businessName != null) 'business_name': businessName,
      if (notes != null) 'notes': notes,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (balance != null) 'balance': balance,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuppliersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? whatsapp,
    Value<String>? address,
    Value<String>? code,
    Value<String>? businessName,
    Value<String>? notes,
    Value<int>? openingBalance,
    Value<int>? balance,
    Value<bool>? active,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return SuppliersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      address: address ?? this.address,
      code: code ?? this.code,
      businessName: businessName ?? this.businessName,
      notes: notes ?? this.notes,
      openingBalance: openingBalance ?? this.openingBalance,
      balance: balance ?? this.balance,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (whatsapp.present) {
      map['whatsapp'] = Variable<String>(whatsapp.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('address: $address, ')
          ..write('code: $code, ')
          ..write('businessName: $businessName, ')
          ..write('notes: $notes, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('balance: $balance, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashAccountsTable extends CashAccounts
    with TableInfo<$CashAccountsTable, CashAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    openingBalance,
    balance,
    active,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cash_accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<CashAccount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashAccount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CashAccountsTable createAlias(String alias) {
    return $CashAccountsTable(attachedDatabase, alias);
  }
}

class CashAccount extends DataClass implements Insertable<CashAccount> {
  final String id;
  final String name;

  /// cash | bank
  final String type;
  final int openingBalance;
  final int balance;
  final bool active;
  final int createdAt;
  const CashAccount({
    required this.id,
    required this.name,
    required this.type,
    required this.openingBalance,
    required this.balance,
    required this.active,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['opening_balance'] = Variable<int>(openingBalance);
    map['balance'] = Variable<int>(balance);
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CashAccountsCompanion toCompanion(bool nullToAbsent) {
    return CashAccountsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      openingBalance: Value(openingBalance),
      balance: Value(balance),
      active: Value(active),
      createdAt: Value(createdAt),
    );
  }

  factory CashAccount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashAccount(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
      balance: serializer.fromJson<int>(json['balance']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'openingBalance': serializer.toJson<int>(openingBalance),
      'balance': serializer.toJson<int>(balance),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  CashAccount copyWith({
    String? id,
    String? name,
    String? type,
    int? openingBalance,
    int? balance,
    bool? active,
    int? createdAt,
  }) => CashAccount(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    openingBalance: openingBalance ?? this.openingBalance,
    balance: balance ?? this.balance,
    active: active ?? this.active,
    createdAt: createdAt ?? this.createdAt,
  );
  CashAccount copyWithCompanion(CashAccountsCompanion data) {
    return CashAccount(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      balance: data.balance.present ? data.balance.value : this.balance,
      active: data.active.present ? data.active.value : this.active,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashAccount(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('balance: $balance, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, openingBalance, balance, active, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashAccount &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.openingBalance == this.openingBalance &&
          other.balance == this.balance &&
          other.active == this.active &&
          other.createdAt == this.createdAt);
}

class CashAccountsCompanion extends UpdateCompanion<CashAccount> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<int> openingBalance;
  final Value<int> balance;
  final Value<bool> active;
  final Value<int> createdAt;
  final Value<int> rowid;
  const CashAccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.balance = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashAccountsCompanion.insert({
    required String id,
    required String name,
    required String type,
    this.openingBalance = const Value.absent(),
    this.balance = const Value.absent(),
    this.active = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<CashAccount> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? openingBalance,
    Expression<int>? balance,
    Expression<bool>? active,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (balance != null) 'balance': balance,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashAccountsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<int>? openingBalance,
    Value<int>? balance,
    Value<bool>? active,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return CashAccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      openingBalance: openingBalance ?? this.openingBalance,
      balance: balance ?? this.balance,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashAccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('balance: $balance, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _txnNumberMeta = const VerificationMeta(
    'txnNumber',
  );
  @override
  late final GeneratedColumn<String> txnNumber = GeneratedColumn<String>(
    'txn_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partyKindMeta = const VerificationMeta(
    'partyKind',
  );
  @override
  late final GeneratedColumn<String> partyKind = GeneratedColumn<String>(
    'party_kind',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _partyIdMeta = const VerificationMeta(
    'partyId',
  );
  @override
  late final GeneratedColumn<String> partyId = GeneratedColumn<String>(
    'party_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('cash'),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('posted'),
  );
  static const VerificationMeta _reversedByMeta = const VerificationMeta(
    'reversedBy',
  );
  @override
  late final GeneratedColumn<String> reversedBy = GeneratedColumn<String>(
    'reversed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathsMeta = const VerificationMeta(
    'imagePaths',
  );
  @override
  late final GeneratedColumn<String> imagePaths = GeneratedColumn<String>(
    'image_paths',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    txnNumber,
    date,
    category,
    amountMinor,
    partyKind,
    partyId,
    paymentMethod,
    reference,
    description,
    status,
    reversedBy,
    imagePaths,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('txn_number')) {
      context.handle(
        _txnNumberMeta,
        txnNumber.isAcceptableOrUnknown(data['txn_number']!, _txnNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_txnNumberMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('party_kind')) {
      context.handle(
        _partyKindMeta,
        partyKind.isAcceptableOrUnknown(data['party_kind']!, _partyKindMeta),
      );
    }
    if (data.containsKey('party_id')) {
      context.handle(
        _partyIdMeta,
        partyId.isAcceptableOrUnknown(data['party_id']!, _partyIdMeta),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('reversed_by')) {
      context.handle(
        _reversedByMeta,
        reversedBy.isAcceptableOrUnknown(data['reversed_by']!, _reversedByMeta),
      );
    }
    if (data.containsKey('image_paths')) {
      context.handle(
        _imagePathsMeta,
        imagePaths.isAcceptableOrUnknown(data['image_paths']!, _imagePathsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      txnNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}txn_number'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      partyKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}party_kind'],
      ),
      partyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}party_id'],
      ),
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      reversedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reversed_by'],
      ),
      imagePaths: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_paths'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String txnNumber;

  /// ms since epoch
  final int date;
  final String category;
  final int amountMinor;
  final String? partyKind;
  final String? partyId;
  final String paymentMethod;
  final String reference;
  final String description;

  /// posted | reversed
  final String status;
  final String? reversedBy;

  /// JSON list of local bill-image file paths, e.g. '["/path/a.jpg"]'
  final String imagePaths;
  final int createdAt;
  const Transaction({
    required this.id,
    required this.txnNumber,
    required this.date,
    required this.category,
    required this.amountMinor,
    this.partyKind,
    this.partyId,
    required this.paymentMethod,
    required this.reference,
    required this.description,
    required this.status,
    this.reversedBy,
    required this.imagePaths,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['txn_number'] = Variable<String>(txnNumber);
    map['date'] = Variable<int>(date);
    map['category'] = Variable<String>(category);
    map['amount_minor'] = Variable<int>(amountMinor);
    if (!nullToAbsent || partyKind != null) {
      map['party_kind'] = Variable<String>(partyKind);
    }
    if (!nullToAbsent || partyId != null) {
      map['party_id'] = Variable<String>(partyId);
    }
    map['payment_method'] = Variable<String>(paymentMethod);
    map['reference'] = Variable<String>(reference);
    map['description'] = Variable<String>(description);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || reversedBy != null) {
      map['reversed_by'] = Variable<String>(reversedBy);
    }
    map['image_paths'] = Variable<String>(imagePaths);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      txnNumber: Value(txnNumber),
      date: Value(date),
      category: Value(category),
      amountMinor: Value(amountMinor),
      partyKind: partyKind == null && nullToAbsent
          ? const Value.absent()
          : Value(partyKind),
      partyId: partyId == null && nullToAbsent
          ? const Value.absent()
          : Value(partyId),
      paymentMethod: Value(paymentMethod),
      reference: Value(reference),
      description: Value(description),
      status: Value(status),
      reversedBy: reversedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(reversedBy),
      imagePaths: Value(imagePaths),
      createdAt: Value(createdAt),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      txnNumber: serializer.fromJson<String>(json['txnNumber']),
      date: serializer.fromJson<int>(json['date']),
      category: serializer.fromJson<String>(json['category']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      partyKind: serializer.fromJson<String?>(json['partyKind']),
      partyId: serializer.fromJson<String?>(json['partyId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      reference: serializer.fromJson<String>(json['reference']),
      description: serializer.fromJson<String>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      reversedBy: serializer.fromJson<String?>(json['reversedBy']),
      imagePaths: serializer.fromJson<String>(json['imagePaths']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'txnNumber': serializer.toJson<String>(txnNumber),
      'date': serializer.toJson<int>(date),
      'category': serializer.toJson<String>(category),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'partyKind': serializer.toJson<String?>(partyKind),
      'partyId': serializer.toJson<String?>(partyId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'reference': serializer.toJson<String>(reference),
      'description': serializer.toJson<String>(description),
      'status': serializer.toJson<String>(status),
      'reversedBy': serializer.toJson<String?>(reversedBy),
      'imagePaths': serializer.toJson<String>(imagePaths),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Transaction copyWith({
    String? id,
    String? txnNumber,
    int? date,
    String? category,
    int? amountMinor,
    Value<String?> partyKind = const Value.absent(),
    Value<String?> partyId = const Value.absent(),
    String? paymentMethod,
    String? reference,
    String? description,
    String? status,
    Value<String?> reversedBy = const Value.absent(),
    String? imagePaths,
    int? createdAt,
  }) => Transaction(
    id: id ?? this.id,
    txnNumber: txnNumber ?? this.txnNumber,
    date: date ?? this.date,
    category: category ?? this.category,
    amountMinor: amountMinor ?? this.amountMinor,
    partyKind: partyKind.present ? partyKind.value : this.partyKind,
    partyId: partyId.present ? partyId.value : this.partyId,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    reference: reference ?? this.reference,
    description: description ?? this.description,
    status: status ?? this.status,
    reversedBy: reversedBy.present ? reversedBy.value : this.reversedBy,
    imagePaths: imagePaths ?? this.imagePaths,
    createdAt: createdAt ?? this.createdAt,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      txnNumber: data.txnNumber.present ? data.txnNumber.value : this.txnNumber,
      date: data.date.present ? data.date.value : this.date,
      category: data.category.present ? data.category.value : this.category,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      partyKind: data.partyKind.present ? data.partyKind.value : this.partyKind,
      partyId: data.partyId.present ? data.partyId.value : this.partyId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      reference: data.reference.present ? data.reference.value : this.reference,
      description: data.description.present
          ? data.description.value
          : this.description,
      status: data.status.present ? data.status.value : this.status,
      reversedBy: data.reversedBy.present
          ? data.reversedBy.value
          : this.reversedBy,
      imagePaths: data.imagePaths.present
          ? data.imagePaths.value
          : this.imagePaths,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('txnNumber: $txnNumber, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('partyKind: $partyKind, ')
          ..write('partyId: $partyId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reference: $reference, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('reversedBy: $reversedBy, ')
          ..write('imagePaths: $imagePaths, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    txnNumber,
    date,
    category,
    amountMinor,
    partyKind,
    partyId,
    paymentMethod,
    reference,
    description,
    status,
    reversedBy,
    imagePaths,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.txnNumber == this.txnNumber &&
          other.date == this.date &&
          other.category == this.category &&
          other.amountMinor == this.amountMinor &&
          other.partyKind == this.partyKind &&
          other.partyId == this.partyId &&
          other.paymentMethod == this.paymentMethod &&
          other.reference == this.reference &&
          other.description == this.description &&
          other.status == this.status &&
          other.reversedBy == this.reversedBy &&
          other.imagePaths == this.imagePaths &&
          other.createdAt == this.createdAt);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> txnNumber;
  final Value<int> date;
  final Value<String> category;
  final Value<int> amountMinor;
  final Value<String?> partyKind;
  final Value<String?> partyId;
  final Value<String> paymentMethod;
  final Value<String> reference;
  final Value<String> description;
  final Value<String> status;
  final Value<String?> reversedBy;
  final Value<String> imagePaths;
  final Value<int> createdAt;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.txnNumber = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.partyKind = const Value.absent(),
    this.partyId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.reference = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.reversedBy = const Value.absent(),
    this.imagePaths = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String txnNumber,
    required int date,
    required String category,
    required int amountMinor,
    this.partyKind = const Value.absent(),
    this.partyId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.reference = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.reversedBy = const Value.absent(),
    this.imagePaths = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       txnNumber = Value(txnNumber),
       date = Value(date),
       category = Value(category),
       amountMinor = Value(amountMinor),
       createdAt = Value(createdAt);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? txnNumber,
    Expression<int>? date,
    Expression<String>? category,
    Expression<int>? amountMinor,
    Expression<String>? partyKind,
    Expression<String>? partyId,
    Expression<String>? paymentMethod,
    Expression<String>? reference,
    Expression<String>? description,
    Expression<String>? status,
    Expression<String>? reversedBy,
    Expression<String>? imagePaths,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (txnNumber != null) 'txn_number': txnNumber,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (partyKind != null) 'party_kind': partyKind,
      if (partyId != null) 'party_id': partyId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (reference != null) 'reference': reference,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (reversedBy != null) 'reversed_by': reversedBy,
      if (imagePaths != null) 'image_paths': imagePaths,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? txnNumber,
    Value<int>? date,
    Value<String>? category,
    Value<int>? amountMinor,
    Value<String?>? partyKind,
    Value<String?>? partyId,
    Value<String>? paymentMethod,
    Value<String>? reference,
    Value<String>? description,
    Value<String>? status,
    Value<String?>? reversedBy,
    Value<String>? imagePaths,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      txnNumber: txnNumber ?? this.txnNumber,
      date: date ?? this.date,
      category: category ?? this.category,
      amountMinor: amountMinor ?? this.amountMinor,
      partyKind: partyKind ?? this.partyKind,
      partyId: partyId ?? this.partyId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      reference: reference ?? this.reference,
      description: description ?? this.description,
      status: status ?? this.status,
      reversedBy: reversedBy ?? this.reversedBy,
      imagePaths: imagePaths ?? this.imagePaths,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (txnNumber.present) {
      map['txn_number'] = Variable<String>(txnNumber.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (partyKind.present) {
      map['party_kind'] = Variable<String>(partyKind.value);
    }
    if (partyId.present) {
      map['party_id'] = Variable<String>(partyId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reversedBy.present) {
      map['reversed_by'] = Variable<String>(reversedBy.value);
    }
    if (imagePaths.present) {
      map['image_paths'] = Variable<String>(imagePaths.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('txnNumber: $txnNumber, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('partyKind: $partyKind, ')
          ..write('partyId: $partyId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reference: $reference, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('reversedBy: $reversedBy, ')
          ..write('imagePaths: $imagePaths, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LedgerEntriesTable extends LedgerEntries
    with TableInfo<$LedgerEntriesTable, LedgerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LedgerEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _txnIdMeta = const VerificationMeta('txnId');
  @override
  late final GeneratedColumn<String> txnId = GeneratedColumn<String>(
    'txn_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (id)',
    ),
  );
  static const VerificationMeta _accountKindMeta = const VerificationMeta(
    'accountKind',
  );
  @override
  late final GeneratedColumn<String> accountKind = GeneratedColumn<String>(
    'account_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _debitMinorMeta = const VerificationMeta(
    'debitMinor',
  );
  @override
  late final GeneratedColumn<int> debitMinor = GeneratedColumn<int>(
    'debit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _creditMinorMeta = const VerificationMeta(
    'creditMinor',
  );
  @override
  late final GeneratedColumn<int> creditMinor = GeneratedColumn<int>(
    'credit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _balanceAfterMinorMeta = const VerificationMeta(
    'balanceAfterMinor',
  );
  @override
  late final GeneratedColumn<int> balanceAfterMinor = GeneratedColumn<int>(
    'balance_after_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    txnId,
    accountKind,
    accountId,
    debitMinor,
    creditMinor,
    balanceAfterMinor,
    date,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledger_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('txn_id')) {
      context.handle(
        _txnIdMeta,
        txnId.isAcceptableOrUnknown(data['txn_id']!, _txnIdMeta),
      );
    } else if (isInserting) {
      context.missing(_txnIdMeta);
    }
    if (data.containsKey('account_kind')) {
      context.handle(
        _accountKindMeta,
        accountKind.isAcceptableOrUnknown(
          data['account_kind']!,
          _accountKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountKindMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('debit_minor')) {
      context.handle(
        _debitMinorMeta,
        debitMinor.isAcceptableOrUnknown(data['debit_minor']!, _debitMinorMeta),
      );
    }
    if (data.containsKey('credit_minor')) {
      context.handle(
        _creditMinorMeta,
        creditMinor.isAcceptableOrUnknown(
          data['credit_minor']!,
          _creditMinorMeta,
        ),
      );
    }
    if (data.containsKey('balance_after_minor')) {
      context.handle(
        _balanceAfterMinorMeta,
        balanceAfterMinor.isAcceptableOrUnknown(
          data['balance_after_minor']!,
          _balanceAfterMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_balanceAfterMinorMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LedgerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      txnId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}txn_id'],
      )!,
      accountKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_kind'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      debitMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}debit_minor'],
      )!,
      creditMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_minor'],
      )!,
      balanceAfterMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance_after_minor'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $LedgerEntriesTable createAlias(String alias) {
    return $LedgerEntriesTable(attachedDatabase, alias);
  }
}

class LedgerEntry extends DataClass implements Insertable<LedgerEntry> {
  final int id;
  final String txnId;

  /// customer | supplier | cash | expense | income
  final String accountKind;
  final String accountId;
  final int debitMinor;
  final int creditMinor;
  final int balanceAfterMinor;
  final int date;
  final String description;
  const LedgerEntry({
    required this.id,
    required this.txnId,
    required this.accountKind,
    required this.accountId,
    required this.debitMinor,
    required this.creditMinor,
    required this.balanceAfterMinor,
    required this.date,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['txn_id'] = Variable<String>(txnId);
    map['account_kind'] = Variable<String>(accountKind);
    map['account_id'] = Variable<String>(accountId);
    map['debit_minor'] = Variable<int>(debitMinor);
    map['credit_minor'] = Variable<int>(creditMinor);
    map['balance_after_minor'] = Variable<int>(balanceAfterMinor);
    map['date'] = Variable<int>(date);
    map['description'] = Variable<String>(description);
    return map;
  }

  LedgerEntriesCompanion toCompanion(bool nullToAbsent) {
    return LedgerEntriesCompanion(
      id: Value(id),
      txnId: Value(txnId),
      accountKind: Value(accountKind),
      accountId: Value(accountId),
      debitMinor: Value(debitMinor),
      creditMinor: Value(creditMinor),
      balanceAfterMinor: Value(balanceAfterMinor),
      date: Value(date),
      description: Value(description),
    );
  }

  factory LedgerEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerEntry(
      id: serializer.fromJson<int>(json['id']),
      txnId: serializer.fromJson<String>(json['txnId']),
      accountKind: serializer.fromJson<String>(json['accountKind']),
      accountId: serializer.fromJson<String>(json['accountId']),
      debitMinor: serializer.fromJson<int>(json['debitMinor']),
      creditMinor: serializer.fromJson<int>(json['creditMinor']),
      balanceAfterMinor: serializer.fromJson<int>(json['balanceAfterMinor']),
      date: serializer.fromJson<int>(json['date']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'txnId': serializer.toJson<String>(txnId),
      'accountKind': serializer.toJson<String>(accountKind),
      'accountId': serializer.toJson<String>(accountId),
      'debitMinor': serializer.toJson<int>(debitMinor),
      'creditMinor': serializer.toJson<int>(creditMinor),
      'balanceAfterMinor': serializer.toJson<int>(balanceAfterMinor),
      'date': serializer.toJson<int>(date),
      'description': serializer.toJson<String>(description),
    };
  }

  LedgerEntry copyWith({
    int? id,
    String? txnId,
    String? accountKind,
    String? accountId,
    int? debitMinor,
    int? creditMinor,
    int? balanceAfterMinor,
    int? date,
    String? description,
  }) => LedgerEntry(
    id: id ?? this.id,
    txnId: txnId ?? this.txnId,
    accountKind: accountKind ?? this.accountKind,
    accountId: accountId ?? this.accountId,
    debitMinor: debitMinor ?? this.debitMinor,
    creditMinor: creditMinor ?? this.creditMinor,
    balanceAfterMinor: balanceAfterMinor ?? this.balanceAfterMinor,
    date: date ?? this.date,
    description: description ?? this.description,
  );
  LedgerEntry copyWithCompanion(LedgerEntriesCompanion data) {
    return LedgerEntry(
      id: data.id.present ? data.id.value : this.id,
      txnId: data.txnId.present ? data.txnId.value : this.txnId,
      accountKind: data.accountKind.present
          ? data.accountKind.value
          : this.accountKind,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      debitMinor: data.debitMinor.present
          ? data.debitMinor.value
          : this.debitMinor,
      creditMinor: data.creditMinor.present
          ? data.creditMinor.value
          : this.creditMinor,
      balanceAfterMinor: data.balanceAfterMinor.present
          ? data.balanceAfterMinor.value
          : this.balanceAfterMinor,
      date: data.date.present ? data.date.value : this.date,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerEntry(')
          ..write('id: $id, ')
          ..write('txnId: $txnId, ')
          ..write('accountKind: $accountKind, ')
          ..write('accountId: $accountId, ')
          ..write('debitMinor: $debitMinor, ')
          ..write('creditMinor: $creditMinor, ')
          ..write('balanceAfterMinor: $balanceAfterMinor, ')
          ..write('date: $date, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    txnId,
    accountKind,
    accountId,
    debitMinor,
    creditMinor,
    balanceAfterMinor,
    date,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerEntry &&
          other.id == this.id &&
          other.txnId == this.txnId &&
          other.accountKind == this.accountKind &&
          other.accountId == this.accountId &&
          other.debitMinor == this.debitMinor &&
          other.creditMinor == this.creditMinor &&
          other.balanceAfterMinor == this.balanceAfterMinor &&
          other.date == this.date &&
          other.description == this.description);
}

class LedgerEntriesCompanion extends UpdateCompanion<LedgerEntry> {
  final Value<int> id;
  final Value<String> txnId;
  final Value<String> accountKind;
  final Value<String> accountId;
  final Value<int> debitMinor;
  final Value<int> creditMinor;
  final Value<int> balanceAfterMinor;
  final Value<int> date;
  final Value<String> description;
  const LedgerEntriesCompanion({
    this.id = const Value.absent(),
    this.txnId = const Value.absent(),
    this.accountKind = const Value.absent(),
    this.accountId = const Value.absent(),
    this.debitMinor = const Value.absent(),
    this.creditMinor = const Value.absent(),
    this.balanceAfterMinor = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
  });
  LedgerEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String txnId,
    required String accountKind,
    required String accountId,
    this.debitMinor = const Value.absent(),
    this.creditMinor = const Value.absent(),
    required int balanceAfterMinor,
    required int date,
    this.description = const Value.absent(),
  }) : txnId = Value(txnId),
       accountKind = Value(accountKind),
       accountId = Value(accountId),
       balanceAfterMinor = Value(balanceAfterMinor),
       date = Value(date);
  static Insertable<LedgerEntry> custom({
    Expression<int>? id,
    Expression<String>? txnId,
    Expression<String>? accountKind,
    Expression<String>? accountId,
    Expression<int>? debitMinor,
    Expression<int>? creditMinor,
    Expression<int>? balanceAfterMinor,
    Expression<int>? date,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (txnId != null) 'txn_id': txnId,
      if (accountKind != null) 'account_kind': accountKind,
      if (accountId != null) 'account_id': accountId,
      if (debitMinor != null) 'debit_minor': debitMinor,
      if (creditMinor != null) 'credit_minor': creditMinor,
      if (balanceAfterMinor != null) 'balance_after_minor': balanceAfterMinor,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
    });
  }

  LedgerEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? txnId,
    Value<String>? accountKind,
    Value<String>? accountId,
    Value<int>? debitMinor,
    Value<int>? creditMinor,
    Value<int>? balanceAfterMinor,
    Value<int>? date,
    Value<String>? description,
  }) {
    return LedgerEntriesCompanion(
      id: id ?? this.id,
      txnId: txnId ?? this.txnId,
      accountKind: accountKind ?? this.accountKind,
      accountId: accountId ?? this.accountId,
      debitMinor: debitMinor ?? this.debitMinor,
      creditMinor: creditMinor ?? this.creditMinor,
      balanceAfterMinor: balanceAfterMinor ?? this.balanceAfterMinor,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (txnId.present) {
      map['txn_id'] = Variable<String>(txnId.value);
    }
    if (accountKind.present) {
      map['account_kind'] = Variable<String>(accountKind.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (debitMinor.present) {
      map['debit_minor'] = Variable<int>(debitMinor.value);
    }
    if (creditMinor.present) {
      map['credit_minor'] = Variable<int>(creditMinor.value);
    }
    if (balanceAfterMinor.present) {
      map['balance_after_minor'] = Variable<int>(balanceAfterMinor.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgerEntriesCompanion(')
          ..write('id: $id, ')
          ..write('txnId: $txnId, ')
          ..write('accountKind: $accountKind, ')
          ..write('accountId: $accountId, ')
          ..write('debitMinor: $debitMinor, ')
          ..write('creditMinor: $creditMinor, ')
          ..write('balanceAfterMinor: $balanceAfterMinor, ')
          ..write('date: $date, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $SalesInvoicesTable extends SalesInvoices
    with TableInfo<$SalesInvoicesTable, SalesInvoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesInvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceNoMeta = const VerificationMeta(
    'invoiceNo',
  );
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
    'invoice_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMinorMeta = const VerificationMeta(
    'subtotalMinor',
  );
  @override
  late final GeneratedColumn<int> subtotalMinor = GeneratedColumn<int>(
    'subtotal_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMinorMeta = const VerificationMeta(
    'discountMinor',
  );
  @override
  late final GeneratedColumn<int> discountMinor = GeneratedColumn<int>(
    'discount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxMinorMeta = const VerificationMeta(
    'taxMinor',
  );
  @override
  late final GeneratedColumn<int> taxMinor = GeneratedColumn<int>(
    'tax_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalMinorMeta = const VerificationMeta(
    'totalMinor',
  );
  @override
  late final GeneratedColumn<int> totalMinor = GeneratedColumn<int>(
    'total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidMinorMeta = const VerificationMeta(
    'paidMinor',
  );
  @override
  late final GeneratedColumn<int> paidMinor = GeneratedColumn<int>(
    'paid_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNo,
    customerId,
    date,
    subtotalMinor,
    discountMinor,
    taxMinor,
    totalMinor,
    paidMinor,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesInvoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invoice_no')) {
      context.handle(
        _invoiceNoMeta,
        invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('subtotal_minor')) {
      context.handle(
        _subtotalMinorMeta,
        subtotalMinor.isAcceptableOrUnknown(
          data['subtotal_minor']!,
          _subtotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subtotalMinorMeta);
    }
    if (data.containsKey('discount_minor')) {
      context.handle(
        _discountMinorMeta,
        discountMinor.isAcceptableOrUnknown(
          data['discount_minor']!,
          _discountMinorMeta,
        ),
      );
    }
    if (data.containsKey('tax_minor')) {
      context.handle(
        _taxMinorMeta,
        taxMinor.isAcceptableOrUnknown(data['tax_minor']!, _taxMinorMeta),
      );
    }
    if (data.containsKey('total_minor')) {
      context.handle(
        _totalMinorMeta,
        totalMinor.isAcceptableOrUnknown(data['total_minor']!, _totalMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMinorMeta);
    }
    if (data.containsKey('paid_minor')) {
      context.handle(
        _paidMinorMeta,
        paidMinor.isAcceptableOrUnknown(data['paid_minor']!, _paidMinorMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesInvoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesInvoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      invoiceNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_no'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      subtotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal_minor'],
      )!,
      discountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_minor'],
      )!,
      taxMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_minor'],
      )!,
      totalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minor'],
      )!,
      paidMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paid_minor'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SalesInvoicesTable createAlias(String alias) {
    return $SalesInvoicesTable(attachedDatabase, alias);
  }
}

class SalesInvoice extends DataClass implements Insertable<SalesInvoice> {
  final String id;
  final String invoiceNo;
  final String customerId;
  final int date;
  final int subtotalMinor;
  final int discountMinor;
  final int taxMinor;
  final int totalMinor;
  final int paidMinor;

  /// draft | unpaid | partially_paid | paid | partially_returned | returned | cancelled
  final String status;
  final String notes;
  final int createdAt;
  const SalesInvoice({
    required this.id,
    required this.invoiceNo,
    required this.customerId,
    required this.date,
    required this.subtotalMinor,
    required this.discountMinor,
    required this.taxMinor,
    required this.totalMinor,
    required this.paidMinor,
    required this.status,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['invoice_no'] = Variable<String>(invoiceNo);
    map['customer_id'] = Variable<String>(customerId);
    map['date'] = Variable<int>(date);
    map['subtotal_minor'] = Variable<int>(subtotalMinor);
    map['discount_minor'] = Variable<int>(discountMinor);
    map['tax_minor'] = Variable<int>(taxMinor);
    map['total_minor'] = Variable<int>(totalMinor);
    map['paid_minor'] = Variable<int>(paidMinor);
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  SalesInvoicesCompanion toCompanion(bool nullToAbsent) {
    return SalesInvoicesCompanion(
      id: Value(id),
      invoiceNo: Value(invoiceNo),
      customerId: Value(customerId),
      date: Value(date),
      subtotalMinor: Value(subtotalMinor),
      discountMinor: Value(discountMinor),
      taxMinor: Value(taxMinor),
      totalMinor: Value(totalMinor),
      paidMinor: Value(paidMinor),
      status: Value(status),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory SalesInvoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesInvoice(
      id: serializer.fromJson<String>(json['id']),
      invoiceNo: serializer.fromJson<String>(json['invoiceNo']),
      customerId: serializer.fromJson<String>(json['customerId']),
      date: serializer.fromJson<int>(json['date']),
      subtotalMinor: serializer.fromJson<int>(json['subtotalMinor']),
      discountMinor: serializer.fromJson<int>(json['discountMinor']),
      taxMinor: serializer.fromJson<int>(json['taxMinor']),
      totalMinor: serializer.fromJson<int>(json['totalMinor']),
      paidMinor: serializer.fromJson<int>(json['paidMinor']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'invoiceNo': serializer.toJson<String>(invoiceNo),
      'customerId': serializer.toJson<String>(customerId),
      'date': serializer.toJson<int>(date),
      'subtotalMinor': serializer.toJson<int>(subtotalMinor),
      'discountMinor': serializer.toJson<int>(discountMinor),
      'taxMinor': serializer.toJson<int>(taxMinor),
      'totalMinor': serializer.toJson<int>(totalMinor),
      'paidMinor': serializer.toJson<int>(paidMinor),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  SalesInvoice copyWith({
    String? id,
    String? invoiceNo,
    String? customerId,
    int? date,
    int? subtotalMinor,
    int? discountMinor,
    int? taxMinor,
    int? totalMinor,
    int? paidMinor,
    String? status,
    String? notes,
    int? createdAt,
  }) => SalesInvoice(
    id: id ?? this.id,
    invoiceNo: invoiceNo ?? this.invoiceNo,
    customerId: customerId ?? this.customerId,
    date: date ?? this.date,
    subtotalMinor: subtotalMinor ?? this.subtotalMinor,
    discountMinor: discountMinor ?? this.discountMinor,
    taxMinor: taxMinor ?? this.taxMinor,
    totalMinor: totalMinor ?? this.totalMinor,
    paidMinor: paidMinor ?? this.paidMinor,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  SalesInvoice copyWithCompanion(SalesInvoicesCompanion data) {
    return SalesInvoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNo: data.invoiceNo.present ? data.invoiceNo.value : this.invoiceNo,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      date: data.date.present ? data.date.value : this.date,
      subtotalMinor: data.subtotalMinor.present
          ? data.subtotalMinor.value
          : this.subtotalMinor,
      discountMinor: data.discountMinor.present
          ? data.discountMinor.value
          : this.discountMinor,
      taxMinor: data.taxMinor.present ? data.taxMinor.value : this.taxMinor,
      totalMinor: data.totalMinor.present
          ? data.totalMinor.value
          : this.totalMinor,
      paidMinor: data.paidMinor.present ? data.paidMinor.value : this.paidMinor,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesInvoice(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('customerId: $customerId, ')
          ..write('date: $date, ')
          ..write('subtotalMinor: $subtotalMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('taxMinor: $taxMinor, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('paidMinor: $paidMinor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceNo,
    customerId,
    date,
    subtotalMinor,
    discountMinor,
    taxMinor,
    totalMinor,
    paidMinor,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesInvoice &&
          other.id == this.id &&
          other.invoiceNo == this.invoiceNo &&
          other.customerId == this.customerId &&
          other.date == this.date &&
          other.subtotalMinor == this.subtotalMinor &&
          other.discountMinor == this.discountMinor &&
          other.taxMinor == this.taxMinor &&
          other.totalMinor == this.totalMinor &&
          other.paidMinor == this.paidMinor &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SalesInvoicesCompanion extends UpdateCompanion<SalesInvoice> {
  final Value<String> id;
  final Value<String> invoiceNo;
  final Value<String> customerId;
  final Value<int> date;
  final Value<int> subtotalMinor;
  final Value<int> discountMinor;
  final Value<int> taxMinor;
  final Value<int> totalMinor;
  final Value<int> paidMinor;
  final Value<String> status;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const SalesInvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.customerId = const Value.absent(),
    this.date = const Value.absent(),
    this.subtotalMinor = const Value.absent(),
    this.discountMinor = const Value.absent(),
    this.taxMinor = const Value.absent(),
    this.totalMinor = const Value.absent(),
    this.paidMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SalesInvoicesCompanion.insert({
    required String id,
    required String invoiceNo,
    required String customerId,
    required int date,
    required int subtotalMinor,
    this.discountMinor = const Value.absent(),
    this.taxMinor = const Value.absent(),
    required int totalMinor,
    this.paidMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       invoiceNo = Value(invoiceNo),
       customerId = Value(customerId),
       date = Value(date),
       subtotalMinor = Value(subtotalMinor),
       totalMinor = Value(totalMinor),
       createdAt = Value(createdAt);
  static Insertable<SalesInvoice> custom({
    Expression<String>? id,
    Expression<String>? invoiceNo,
    Expression<String>? customerId,
    Expression<int>? date,
    Expression<int>? subtotalMinor,
    Expression<int>? discountMinor,
    Expression<int>? taxMinor,
    Expression<int>? totalMinor,
    Expression<int>? paidMinor,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (customerId != null) 'customer_id': customerId,
      if (date != null) 'date': date,
      if (subtotalMinor != null) 'subtotal_minor': subtotalMinor,
      if (discountMinor != null) 'discount_minor': discountMinor,
      if (taxMinor != null) 'tax_minor': taxMinor,
      if (totalMinor != null) 'total_minor': totalMinor,
      if (paidMinor != null) 'paid_minor': paidMinor,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SalesInvoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? invoiceNo,
    Value<String>? customerId,
    Value<int>? date,
    Value<int>? subtotalMinor,
    Value<int>? discountMinor,
    Value<int>? taxMinor,
    Value<int>? totalMinor,
    Value<int>? paidMinor,
    Value<String>? status,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return SalesInvoicesCompanion(
      id: id ?? this.id,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      customerId: customerId ?? this.customerId,
      date: date ?? this.date,
      subtotalMinor: subtotalMinor ?? this.subtotalMinor,
      discountMinor: discountMinor ?? this.discountMinor,
      taxMinor: taxMinor ?? this.taxMinor,
      totalMinor: totalMinor ?? this.totalMinor,
      paidMinor: paidMinor ?? this.paidMinor,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (subtotalMinor.present) {
      map['subtotal_minor'] = Variable<int>(subtotalMinor.value);
    }
    if (discountMinor.present) {
      map['discount_minor'] = Variable<int>(discountMinor.value);
    }
    if (taxMinor.present) {
      map['tax_minor'] = Variable<int>(taxMinor.value);
    }
    if (totalMinor.present) {
      map['total_minor'] = Variable<int>(totalMinor.value);
    }
    if (paidMinor.present) {
      map['paid_minor'] = Variable<int>(paidMinor.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesInvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('customerId: $customerId, ')
          ..write('date: $date, ')
          ..write('subtotalMinor: $subtotalMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('taxMinor: $taxMinor, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('paidMinor: $paidMinor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SalesInvoiceItemsTable extends SalesInvoiceItems
    with TableInfo<$SalesInvoiceItemsTable, SalesInvoiceItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesInvoiceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sales_invoices (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _unitPriceMinorMeta = const VerificationMeta(
    'unitPriceMinor',
  );
  @override
  late final GeneratedColumn<int> unitPriceMinor = GeneratedColumn<int>(
    'unit_price_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMinorMeta = const VerificationMeta(
    'discountMinor',
  );
  @override
  late final GeneratedColumn<int> discountMinor = GeneratedColumn<int>(
    'discount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lineTotalMinorMeta = const VerificationMeta(
    'lineTotalMinor',
  );
  @override
  late final GeneratedColumn<int> lineTotalMinor = GeneratedColumn<int>(
    'line_total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    productId,
    qtyNum,
    qtyDen,
    unitId,
    unitPriceMinor,
    discountMinor,
    lineTotalMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_invoice_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesInvoiceItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('unit_price_minor')) {
      context.handle(
        _unitPriceMinorMeta,
        unitPriceMinor.isAcceptableOrUnknown(
          data['unit_price_minor']!,
          _unitPriceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMinorMeta);
    }
    if (data.containsKey('discount_minor')) {
      context.handle(
        _discountMinorMeta,
        discountMinor.isAcceptableOrUnknown(
          data['discount_minor']!,
          _discountMinorMeta,
        ),
      );
    }
    if (data.containsKey('line_total_minor')) {
      context.handle(
        _lineTotalMinorMeta,
        lineTotalMinor.isAcceptableOrUnknown(
          data['line_total_minor']!,
          _lineTotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesInvoiceItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesInvoiceItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      unitPriceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_minor'],
      )!,
      discountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_minor'],
      )!,
      lineTotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total_minor'],
      )!,
    );
  }

  @override
  $SalesInvoiceItemsTable createAlias(String alias) {
    return $SalesInvoiceItemsTable(attachedDatabase, alias);
  }
}

class SalesInvoiceItem extends DataClass
    implements Insertable<SalesInvoiceItem> {
  final int id;
  final String invoiceId;
  final String productId;
  final int qtyNum;
  final int qtyDen;
  final String unitId;
  final int unitPriceMinor;
  final int discountMinor;
  final int lineTotalMinor;
  const SalesInvoiceItem({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.qtyNum,
    required this.qtyDen,
    required this.unitId,
    required this.unitPriceMinor,
    required this.discountMinor,
    required this.lineTotalMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['product_id'] = Variable<String>(productId);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['unit_id'] = Variable<String>(unitId);
    map['unit_price_minor'] = Variable<int>(unitPriceMinor);
    map['discount_minor'] = Variable<int>(discountMinor);
    map['line_total_minor'] = Variable<int>(lineTotalMinor);
    return map;
  }

  SalesInvoiceItemsCompanion toCompanion(bool nullToAbsent) {
    return SalesInvoiceItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productId: Value(productId),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      unitId: Value(unitId),
      unitPriceMinor: Value(unitPriceMinor),
      discountMinor: Value(discountMinor),
      lineTotalMinor: Value(lineTotalMinor),
    );
  }

  factory SalesInvoiceItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesInvoiceItem(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      productId: serializer.fromJson<String>(json['productId']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      unitId: serializer.fromJson<String>(json['unitId']),
      unitPriceMinor: serializer.fromJson<int>(json['unitPriceMinor']),
      discountMinor: serializer.fromJson<int>(json['discountMinor']),
      lineTotalMinor: serializer.fromJson<int>(json['lineTotalMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'productId': serializer.toJson<String>(productId),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'unitId': serializer.toJson<String>(unitId),
      'unitPriceMinor': serializer.toJson<int>(unitPriceMinor),
      'discountMinor': serializer.toJson<int>(discountMinor),
      'lineTotalMinor': serializer.toJson<int>(lineTotalMinor),
    };
  }

  SalesInvoiceItem copyWith({
    int? id,
    String? invoiceId,
    String? productId,
    int? qtyNum,
    int? qtyDen,
    String? unitId,
    int? unitPriceMinor,
    int? discountMinor,
    int? lineTotalMinor,
  }) => SalesInvoiceItem(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    productId: productId ?? this.productId,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    unitId: unitId ?? this.unitId,
    unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    discountMinor: discountMinor ?? this.discountMinor,
    lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
  );
  SalesInvoiceItem copyWithCompanion(SalesInvoiceItemsCompanion data) {
    return SalesInvoiceItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      unitPriceMinor: data.unitPriceMinor.present
          ? data.unitPriceMinor.value
          : this.unitPriceMinor,
      discountMinor: data.discountMinor.present
          ? data.discountMinor.value
          : this.discountMinor,
      lineTotalMinor: data.lineTotalMinor.present
          ? data.lineTotalMinor.value
          : this.lineTotalMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesInvoiceItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitId: $unitId, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    productId,
    qtyNum,
    qtyDen,
    unitId,
    unitPriceMinor,
    discountMinor,
    lineTotalMinor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesInvoiceItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productId == this.productId &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.unitId == this.unitId &&
          other.unitPriceMinor == this.unitPriceMinor &&
          other.discountMinor == this.discountMinor &&
          other.lineTotalMinor == this.lineTotalMinor);
}

class SalesInvoiceItemsCompanion extends UpdateCompanion<SalesInvoiceItem> {
  final Value<int> id;
  final Value<String> invoiceId;
  final Value<String> productId;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<String> unitId;
  final Value<int> unitPriceMinor;
  final Value<int> discountMinor;
  final Value<int> lineTotalMinor;
  const SalesInvoiceItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.unitId = const Value.absent(),
    this.unitPriceMinor = const Value.absent(),
    this.discountMinor = const Value.absent(),
    this.lineTotalMinor = const Value.absent(),
  });
  SalesInvoiceItemsCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceId,
    required String productId,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    required String unitId,
    required int unitPriceMinor,
    this.discountMinor = const Value.absent(),
    required int lineTotalMinor,
  }) : invoiceId = Value(invoiceId),
       productId = Value(productId),
       qtyNum = Value(qtyNum),
       unitId = Value(unitId),
       unitPriceMinor = Value(unitPriceMinor),
       lineTotalMinor = Value(lineTotalMinor);
  static Insertable<SalesInvoiceItem> custom({
    Expression<int>? id,
    Expression<String>? invoiceId,
    Expression<String>? productId,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<String>? unitId,
    Expression<int>? unitPriceMinor,
    Expression<int>? discountMinor,
    Expression<int>? lineTotalMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productId != null) 'product_id': productId,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (unitId != null) 'unit_id': unitId,
      if (unitPriceMinor != null) 'unit_price_minor': unitPriceMinor,
      if (discountMinor != null) 'discount_minor': discountMinor,
      if (lineTotalMinor != null) 'line_total_minor': lineTotalMinor,
    });
  }

  SalesInvoiceItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? invoiceId,
    Value<String>? productId,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<String>? unitId,
    Value<int>? unitPriceMinor,
    Value<int>? discountMinor,
    Value<int>? lineTotalMinor,
  }) {
    return SalesInvoiceItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productId: productId ?? this.productId,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      unitId: unitId ?? this.unitId,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
      discountMinor: discountMinor ?? this.discountMinor,
      lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (unitPriceMinor.present) {
      map['unit_price_minor'] = Variable<int>(unitPriceMinor.value);
    }
    if (discountMinor.present) {
      map['discount_minor'] = Variable<int>(discountMinor.value);
    }
    if (lineTotalMinor.present) {
      map['line_total_minor'] = Variable<int>(lineTotalMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesInvoiceItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitId: $unitId, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }
}

class $PurchaseInvoicesTable extends PurchaseInvoices
    with TableInfo<$PurchaseInvoicesTable, PurchaseInvoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseInvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceNoMeta = const VerificationMeta(
    'invoiceNo',
  );
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
    'invoice_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES suppliers (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMinorMeta = const VerificationMeta(
    'subtotalMinor',
  );
  @override
  late final GeneratedColumn<int> subtotalMinor = GeneratedColumn<int>(
    'subtotal_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMinorMeta = const VerificationMeta(
    'discountMinor',
  );
  @override
  late final GeneratedColumn<int> discountMinor = GeneratedColumn<int>(
    'discount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxMinorMeta = const VerificationMeta(
    'taxMinor',
  );
  @override
  late final GeneratedColumn<int> taxMinor = GeneratedColumn<int>(
    'tax_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalMinorMeta = const VerificationMeta(
    'totalMinor',
  );
  @override
  late final GeneratedColumn<int> totalMinor = GeneratedColumn<int>(
    'total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidMinorMeta = const VerificationMeta(
    'paidMinor',
  );
  @override
  late final GeneratedColumn<int> paidMinor = GeneratedColumn<int>(
    'paid_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNo,
    supplierId,
    date,
    subtotalMinor,
    discountMinor,
    taxMinor,
    totalMinor,
    paidMinor,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseInvoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invoice_no')) {
      context.handle(
        _invoiceNoMeta,
        invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('subtotal_minor')) {
      context.handle(
        _subtotalMinorMeta,
        subtotalMinor.isAcceptableOrUnknown(
          data['subtotal_minor']!,
          _subtotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subtotalMinorMeta);
    }
    if (data.containsKey('discount_minor')) {
      context.handle(
        _discountMinorMeta,
        discountMinor.isAcceptableOrUnknown(
          data['discount_minor']!,
          _discountMinorMeta,
        ),
      );
    }
    if (data.containsKey('tax_minor')) {
      context.handle(
        _taxMinorMeta,
        taxMinor.isAcceptableOrUnknown(data['tax_minor']!, _taxMinorMeta),
      );
    }
    if (data.containsKey('total_minor')) {
      context.handle(
        _totalMinorMeta,
        totalMinor.isAcceptableOrUnknown(data['total_minor']!, _totalMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMinorMeta);
    }
    if (data.containsKey('paid_minor')) {
      context.handle(
        _paidMinorMeta,
        paidMinor.isAcceptableOrUnknown(data['paid_minor']!, _paidMinorMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseInvoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseInvoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      invoiceNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_no'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      subtotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal_minor'],
      )!,
      discountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_minor'],
      )!,
      taxMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_minor'],
      )!,
      totalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minor'],
      )!,
      paidMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paid_minor'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PurchaseInvoicesTable createAlias(String alias) {
    return $PurchaseInvoicesTable(attachedDatabase, alias);
  }
}

class PurchaseInvoice extends DataClass implements Insertable<PurchaseInvoice> {
  final String id;
  final String invoiceNo;
  final String supplierId;
  final int date;
  final int subtotalMinor;
  final int discountMinor;
  final int taxMinor;
  final int totalMinor;
  final int paidMinor;
  final String status;
  final String notes;
  final int createdAt;
  const PurchaseInvoice({
    required this.id,
    required this.invoiceNo,
    required this.supplierId,
    required this.date,
    required this.subtotalMinor,
    required this.discountMinor,
    required this.taxMinor,
    required this.totalMinor,
    required this.paidMinor,
    required this.status,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['invoice_no'] = Variable<String>(invoiceNo);
    map['supplier_id'] = Variable<String>(supplierId);
    map['date'] = Variable<int>(date);
    map['subtotal_minor'] = Variable<int>(subtotalMinor);
    map['discount_minor'] = Variable<int>(discountMinor);
    map['tax_minor'] = Variable<int>(taxMinor);
    map['total_minor'] = Variable<int>(totalMinor);
    map['paid_minor'] = Variable<int>(paidMinor);
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  PurchaseInvoicesCompanion toCompanion(bool nullToAbsent) {
    return PurchaseInvoicesCompanion(
      id: Value(id),
      invoiceNo: Value(invoiceNo),
      supplierId: Value(supplierId),
      date: Value(date),
      subtotalMinor: Value(subtotalMinor),
      discountMinor: Value(discountMinor),
      taxMinor: Value(taxMinor),
      totalMinor: Value(totalMinor),
      paidMinor: Value(paidMinor),
      status: Value(status),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory PurchaseInvoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseInvoice(
      id: serializer.fromJson<String>(json['id']),
      invoiceNo: serializer.fromJson<String>(json['invoiceNo']),
      supplierId: serializer.fromJson<String>(json['supplierId']),
      date: serializer.fromJson<int>(json['date']),
      subtotalMinor: serializer.fromJson<int>(json['subtotalMinor']),
      discountMinor: serializer.fromJson<int>(json['discountMinor']),
      taxMinor: serializer.fromJson<int>(json['taxMinor']),
      totalMinor: serializer.fromJson<int>(json['totalMinor']),
      paidMinor: serializer.fromJson<int>(json['paidMinor']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'invoiceNo': serializer.toJson<String>(invoiceNo),
      'supplierId': serializer.toJson<String>(supplierId),
      'date': serializer.toJson<int>(date),
      'subtotalMinor': serializer.toJson<int>(subtotalMinor),
      'discountMinor': serializer.toJson<int>(discountMinor),
      'taxMinor': serializer.toJson<int>(taxMinor),
      'totalMinor': serializer.toJson<int>(totalMinor),
      'paidMinor': serializer.toJson<int>(paidMinor),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  PurchaseInvoice copyWith({
    String? id,
    String? invoiceNo,
    String? supplierId,
    int? date,
    int? subtotalMinor,
    int? discountMinor,
    int? taxMinor,
    int? totalMinor,
    int? paidMinor,
    String? status,
    String? notes,
    int? createdAt,
  }) => PurchaseInvoice(
    id: id ?? this.id,
    invoiceNo: invoiceNo ?? this.invoiceNo,
    supplierId: supplierId ?? this.supplierId,
    date: date ?? this.date,
    subtotalMinor: subtotalMinor ?? this.subtotalMinor,
    discountMinor: discountMinor ?? this.discountMinor,
    taxMinor: taxMinor ?? this.taxMinor,
    totalMinor: totalMinor ?? this.totalMinor,
    paidMinor: paidMinor ?? this.paidMinor,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  PurchaseInvoice copyWithCompanion(PurchaseInvoicesCompanion data) {
    return PurchaseInvoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNo: data.invoiceNo.present ? data.invoiceNo.value : this.invoiceNo,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      date: data.date.present ? data.date.value : this.date,
      subtotalMinor: data.subtotalMinor.present
          ? data.subtotalMinor.value
          : this.subtotalMinor,
      discountMinor: data.discountMinor.present
          ? data.discountMinor.value
          : this.discountMinor,
      taxMinor: data.taxMinor.present ? data.taxMinor.value : this.taxMinor,
      totalMinor: data.totalMinor.present
          ? data.totalMinor.value
          : this.totalMinor,
      paidMinor: data.paidMinor.present ? data.paidMinor.value : this.paidMinor,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoice(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('supplierId: $supplierId, ')
          ..write('date: $date, ')
          ..write('subtotalMinor: $subtotalMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('taxMinor: $taxMinor, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('paidMinor: $paidMinor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceNo,
    supplierId,
    date,
    subtotalMinor,
    discountMinor,
    taxMinor,
    totalMinor,
    paidMinor,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseInvoice &&
          other.id == this.id &&
          other.invoiceNo == this.invoiceNo &&
          other.supplierId == this.supplierId &&
          other.date == this.date &&
          other.subtotalMinor == this.subtotalMinor &&
          other.discountMinor == this.discountMinor &&
          other.taxMinor == this.taxMinor &&
          other.totalMinor == this.totalMinor &&
          other.paidMinor == this.paidMinor &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class PurchaseInvoicesCompanion extends UpdateCompanion<PurchaseInvoice> {
  final Value<String> id;
  final Value<String> invoiceNo;
  final Value<String> supplierId;
  final Value<int> date;
  final Value<int> subtotalMinor;
  final Value<int> discountMinor;
  final Value<int> taxMinor;
  final Value<int> totalMinor;
  final Value<int> paidMinor;
  final Value<String> status;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const PurchaseInvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.date = const Value.absent(),
    this.subtotalMinor = const Value.absent(),
    this.discountMinor = const Value.absent(),
    this.taxMinor = const Value.absent(),
    this.totalMinor = const Value.absent(),
    this.paidMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseInvoicesCompanion.insert({
    required String id,
    required String invoiceNo,
    required String supplierId,
    required int date,
    required int subtotalMinor,
    this.discountMinor = const Value.absent(),
    this.taxMinor = const Value.absent(),
    required int totalMinor,
    this.paidMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       invoiceNo = Value(invoiceNo),
       supplierId = Value(supplierId),
       date = Value(date),
       subtotalMinor = Value(subtotalMinor),
       totalMinor = Value(totalMinor),
       createdAt = Value(createdAt);
  static Insertable<PurchaseInvoice> custom({
    Expression<String>? id,
    Expression<String>? invoiceNo,
    Expression<String>? supplierId,
    Expression<int>? date,
    Expression<int>? subtotalMinor,
    Expression<int>? discountMinor,
    Expression<int>? taxMinor,
    Expression<int>? totalMinor,
    Expression<int>? paidMinor,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (supplierId != null) 'supplier_id': supplierId,
      if (date != null) 'date': date,
      if (subtotalMinor != null) 'subtotal_minor': subtotalMinor,
      if (discountMinor != null) 'discount_minor': discountMinor,
      if (taxMinor != null) 'tax_minor': taxMinor,
      if (totalMinor != null) 'total_minor': totalMinor,
      if (paidMinor != null) 'paid_minor': paidMinor,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseInvoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? invoiceNo,
    Value<String>? supplierId,
    Value<int>? date,
    Value<int>? subtotalMinor,
    Value<int>? discountMinor,
    Value<int>? taxMinor,
    Value<int>? totalMinor,
    Value<int>? paidMinor,
    Value<String>? status,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return PurchaseInvoicesCompanion(
      id: id ?? this.id,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      supplierId: supplierId ?? this.supplierId,
      date: date ?? this.date,
      subtotalMinor: subtotalMinor ?? this.subtotalMinor,
      discountMinor: discountMinor ?? this.discountMinor,
      taxMinor: taxMinor ?? this.taxMinor,
      totalMinor: totalMinor ?? this.totalMinor,
      paidMinor: paidMinor ?? this.paidMinor,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (subtotalMinor.present) {
      map['subtotal_minor'] = Variable<int>(subtotalMinor.value);
    }
    if (discountMinor.present) {
      map['discount_minor'] = Variable<int>(discountMinor.value);
    }
    if (taxMinor.present) {
      map['tax_minor'] = Variable<int>(taxMinor.value);
    }
    if (totalMinor.present) {
      map['total_minor'] = Variable<int>(totalMinor.value);
    }
    if (paidMinor.present) {
      map['paid_minor'] = Variable<int>(paidMinor.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('supplierId: $supplierId, ')
          ..write('date: $date, ')
          ..write('subtotalMinor: $subtotalMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('taxMinor: $taxMinor, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('paidMinor: $paidMinor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseInvoiceItemsTable extends PurchaseInvoiceItems
    with TableInfo<$PurchaseInvoiceItemsTable, PurchaseInvoiceItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseInvoiceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_invoices (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _unitPriceMinorMeta = const VerificationMeta(
    'unitPriceMinor',
  );
  @override
  late final GeneratedColumn<int> unitPriceMinor = GeneratedColumn<int>(
    'unit_price_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMinorMeta = const VerificationMeta(
    'discountMinor',
  );
  @override
  late final GeneratedColumn<int> discountMinor = GeneratedColumn<int>(
    'discount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lineTotalMinorMeta = const VerificationMeta(
    'lineTotalMinor',
  );
  @override
  late final GeneratedColumn<int> lineTotalMinor = GeneratedColumn<int>(
    'line_total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    productId,
    qtyNum,
    qtyDen,
    unitId,
    unitPriceMinor,
    discountMinor,
    lineTotalMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_invoice_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseInvoiceItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('unit_price_minor')) {
      context.handle(
        _unitPriceMinorMeta,
        unitPriceMinor.isAcceptableOrUnknown(
          data['unit_price_minor']!,
          _unitPriceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMinorMeta);
    }
    if (data.containsKey('discount_minor')) {
      context.handle(
        _discountMinorMeta,
        discountMinor.isAcceptableOrUnknown(
          data['discount_minor']!,
          _discountMinorMeta,
        ),
      );
    }
    if (data.containsKey('line_total_minor')) {
      context.handle(
        _lineTotalMinorMeta,
        lineTotalMinor.isAcceptableOrUnknown(
          data['line_total_minor']!,
          _lineTotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseInvoiceItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseInvoiceItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      unitPriceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_minor'],
      )!,
      discountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_minor'],
      )!,
      lineTotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total_minor'],
      )!,
    );
  }

  @override
  $PurchaseInvoiceItemsTable createAlias(String alias) {
    return $PurchaseInvoiceItemsTable(attachedDatabase, alias);
  }
}

class PurchaseInvoiceItem extends DataClass
    implements Insertable<PurchaseInvoiceItem> {
  final int id;
  final String invoiceId;
  final String productId;
  final int qtyNum;
  final int qtyDen;
  final String unitId;
  final int unitPriceMinor;
  final int discountMinor;
  final int lineTotalMinor;
  const PurchaseInvoiceItem({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.qtyNum,
    required this.qtyDen,
    required this.unitId,
    required this.unitPriceMinor,
    required this.discountMinor,
    required this.lineTotalMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['product_id'] = Variable<String>(productId);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['unit_id'] = Variable<String>(unitId);
    map['unit_price_minor'] = Variable<int>(unitPriceMinor);
    map['discount_minor'] = Variable<int>(discountMinor);
    map['line_total_minor'] = Variable<int>(lineTotalMinor);
    return map;
  }

  PurchaseInvoiceItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseInvoiceItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productId: Value(productId),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      unitId: Value(unitId),
      unitPriceMinor: Value(unitPriceMinor),
      discountMinor: Value(discountMinor),
      lineTotalMinor: Value(lineTotalMinor),
    );
  }

  factory PurchaseInvoiceItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseInvoiceItem(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      productId: serializer.fromJson<String>(json['productId']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      unitId: serializer.fromJson<String>(json['unitId']),
      unitPriceMinor: serializer.fromJson<int>(json['unitPriceMinor']),
      discountMinor: serializer.fromJson<int>(json['discountMinor']),
      lineTotalMinor: serializer.fromJson<int>(json['lineTotalMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'productId': serializer.toJson<String>(productId),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'unitId': serializer.toJson<String>(unitId),
      'unitPriceMinor': serializer.toJson<int>(unitPriceMinor),
      'discountMinor': serializer.toJson<int>(discountMinor),
      'lineTotalMinor': serializer.toJson<int>(lineTotalMinor),
    };
  }

  PurchaseInvoiceItem copyWith({
    int? id,
    String? invoiceId,
    String? productId,
    int? qtyNum,
    int? qtyDen,
    String? unitId,
    int? unitPriceMinor,
    int? discountMinor,
    int? lineTotalMinor,
  }) => PurchaseInvoiceItem(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    productId: productId ?? this.productId,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    unitId: unitId ?? this.unitId,
    unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    discountMinor: discountMinor ?? this.discountMinor,
    lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
  );
  PurchaseInvoiceItem copyWithCompanion(PurchaseInvoiceItemsCompanion data) {
    return PurchaseInvoiceItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      unitPriceMinor: data.unitPriceMinor.present
          ? data.unitPriceMinor.value
          : this.unitPriceMinor,
      discountMinor: data.discountMinor.present
          ? data.discountMinor.value
          : this.discountMinor,
      lineTotalMinor: data.lineTotalMinor.present
          ? data.lineTotalMinor.value
          : this.lineTotalMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoiceItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitId: $unitId, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    productId,
    qtyNum,
    qtyDen,
    unitId,
    unitPriceMinor,
    discountMinor,
    lineTotalMinor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseInvoiceItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productId == this.productId &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.unitId == this.unitId &&
          other.unitPriceMinor == this.unitPriceMinor &&
          other.discountMinor == this.discountMinor &&
          other.lineTotalMinor == this.lineTotalMinor);
}

class PurchaseInvoiceItemsCompanion
    extends UpdateCompanion<PurchaseInvoiceItem> {
  final Value<int> id;
  final Value<String> invoiceId;
  final Value<String> productId;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<String> unitId;
  final Value<int> unitPriceMinor;
  final Value<int> discountMinor;
  final Value<int> lineTotalMinor;
  const PurchaseInvoiceItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.unitId = const Value.absent(),
    this.unitPriceMinor = const Value.absent(),
    this.discountMinor = const Value.absent(),
    this.lineTotalMinor = const Value.absent(),
  });
  PurchaseInvoiceItemsCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceId,
    required String productId,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    required String unitId,
    required int unitPriceMinor,
    this.discountMinor = const Value.absent(),
    required int lineTotalMinor,
  }) : invoiceId = Value(invoiceId),
       productId = Value(productId),
       qtyNum = Value(qtyNum),
       unitId = Value(unitId),
       unitPriceMinor = Value(unitPriceMinor),
       lineTotalMinor = Value(lineTotalMinor);
  static Insertable<PurchaseInvoiceItem> custom({
    Expression<int>? id,
    Expression<String>? invoiceId,
    Expression<String>? productId,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<String>? unitId,
    Expression<int>? unitPriceMinor,
    Expression<int>? discountMinor,
    Expression<int>? lineTotalMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productId != null) 'product_id': productId,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (unitId != null) 'unit_id': unitId,
      if (unitPriceMinor != null) 'unit_price_minor': unitPriceMinor,
      if (discountMinor != null) 'discount_minor': discountMinor,
      if (lineTotalMinor != null) 'line_total_minor': lineTotalMinor,
    });
  }

  PurchaseInvoiceItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? invoiceId,
    Value<String>? productId,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<String>? unitId,
    Value<int>? unitPriceMinor,
    Value<int>? discountMinor,
    Value<int>? lineTotalMinor,
  }) {
    return PurchaseInvoiceItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productId: productId ?? this.productId,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      unitId: unitId ?? this.unitId,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
      discountMinor: discountMinor ?? this.discountMinor,
      lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (unitPriceMinor.present) {
      map['unit_price_minor'] = Variable<int>(unitPriceMinor.value);
    }
    if (discountMinor.present) {
      map['discount_minor'] = Variable<int>(discountMinor.value);
    }
    if (lineTotalMinor.present) {
      map['line_total_minor'] = Variable<int>(lineTotalMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoiceItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitId: $unitId, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentNoMeta = const VerificationMeta(
    'paymentNo',
  );
  @override
  late final GeneratedColumn<String> paymentNo = GeneratedColumn<String>(
    'payment_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partyKindMeta = const VerificationMeta(
    'partyKind',
  );
  @override
  late final GeneratedColumn<String> partyKind = GeneratedColumn<String>(
    'party_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partyIdMeta = const VerificationMeta(
    'partyId',
  );
  @override
  late final GeneratedColumn<String> partyId = GeneratedColumn<String>(
    'party_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cash_accounts (id)',
    ),
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('cash'),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('posted'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    paymentNo,
    date,
    direction,
    partyKind,
    partyId,
    amountMinor,
    accountId,
    method,
    reference,
    notes,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payment_no')) {
      context.handle(
        _paymentNoMeta,
        paymentNo.isAcceptableOrUnknown(data['payment_no']!, _paymentNoMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentNoMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('party_kind')) {
      context.handle(
        _partyKindMeta,
        partyKind.isAcceptableOrUnknown(data['party_kind']!, _partyKindMeta),
      );
    } else if (isInserting) {
      context.missing(_partyKindMeta);
    }
    if (data.containsKey('party_id')) {
      context.handle(
        _partyIdMeta,
        partyId.isAcceptableOrUnknown(data['party_id']!, _partyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partyIdMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      paymentNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_no'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      partyKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}party_kind'],
      )!,
      partyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}party_id'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final String id;
  final String paymentNo;
  final int date;

  /// receive | pay
  final String direction;
  final String partyKind;
  final String partyId;
  final int amountMinor;
  final String accountId;
  final String method;
  final String reference;
  final String notes;
  final String status;
  final int createdAt;
  const Payment({
    required this.id,
    required this.paymentNo,
    required this.date,
    required this.direction,
    required this.partyKind,
    required this.partyId,
    required this.amountMinor,
    required this.accountId,
    required this.method,
    required this.reference,
    required this.notes,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payment_no'] = Variable<String>(paymentNo);
    map['date'] = Variable<int>(date);
    map['direction'] = Variable<String>(direction);
    map['party_kind'] = Variable<String>(partyKind);
    map['party_id'] = Variable<String>(partyId);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['account_id'] = Variable<String>(accountId);
    map['method'] = Variable<String>(method);
    map['reference'] = Variable<String>(reference);
    map['notes'] = Variable<String>(notes);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      paymentNo: Value(paymentNo),
      date: Value(date),
      direction: Value(direction),
      partyKind: Value(partyKind),
      partyId: Value(partyId),
      amountMinor: Value(amountMinor),
      accountId: Value(accountId),
      method: Value(method),
      reference: Value(reference),
      notes: Value(notes),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<String>(json['id']),
      paymentNo: serializer.fromJson<String>(json['paymentNo']),
      date: serializer.fromJson<int>(json['date']),
      direction: serializer.fromJson<String>(json['direction']),
      partyKind: serializer.fromJson<String>(json['partyKind']),
      partyId: serializer.fromJson<String>(json['partyId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      accountId: serializer.fromJson<String>(json['accountId']),
      method: serializer.fromJson<String>(json['method']),
      reference: serializer.fromJson<String>(json['reference']),
      notes: serializer.fromJson<String>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'paymentNo': serializer.toJson<String>(paymentNo),
      'date': serializer.toJson<int>(date),
      'direction': serializer.toJson<String>(direction),
      'partyKind': serializer.toJson<String>(partyKind),
      'partyId': serializer.toJson<String>(partyId),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'accountId': serializer.toJson<String>(accountId),
      'method': serializer.toJson<String>(method),
      'reference': serializer.toJson<String>(reference),
      'notes': serializer.toJson<String>(notes),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Payment copyWith({
    String? id,
    String? paymentNo,
    int? date,
    String? direction,
    String? partyKind,
    String? partyId,
    int? amountMinor,
    String? accountId,
    String? method,
    String? reference,
    String? notes,
    String? status,
    int? createdAt,
  }) => Payment(
    id: id ?? this.id,
    paymentNo: paymentNo ?? this.paymentNo,
    date: date ?? this.date,
    direction: direction ?? this.direction,
    partyKind: partyKind ?? this.partyKind,
    partyId: partyId ?? this.partyId,
    amountMinor: amountMinor ?? this.amountMinor,
    accountId: accountId ?? this.accountId,
    method: method ?? this.method,
    reference: reference ?? this.reference,
    notes: notes ?? this.notes,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      paymentNo: data.paymentNo.present ? data.paymentNo.value : this.paymentNo,
      date: data.date.present ? data.date.value : this.date,
      direction: data.direction.present ? data.direction.value : this.direction,
      partyKind: data.partyKind.present ? data.partyKind.value : this.partyKind,
      partyId: data.partyId.present ? data.partyId.value : this.partyId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      method: data.method.present ? data.method.value : this.method,
      reference: data.reference.present ? data.reference.value : this.reference,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('paymentNo: $paymentNo, ')
          ..write('date: $date, ')
          ..write('direction: $direction, ')
          ..write('partyKind: $partyKind, ')
          ..write('partyId: $partyId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('accountId: $accountId, ')
          ..write('method: $method, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    paymentNo,
    date,
    direction,
    partyKind,
    partyId,
    amountMinor,
    accountId,
    method,
    reference,
    notes,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.paymentNo == this.paymentNo &&
          other.date == this.date &&
          other.direction == this.direction &&
          other.partyKind == this.partyKind &&
          other.partyId == this.partyId &&
          other.amountMinor == this.amountMinor &&
          other.accountId == this.accountId &&
          other.method == this.method &&
          other.reference == this.reference &&
          other.notes == this.notes &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<String> id;
  final Value<String> paymentNo;
  final Value<int> date;
  final Value<String> direction;
  final Value<String> partyKind;
  final Value<String> partyId;
  final Value<int> amountMinor;
  final Value<String> accountId;
  final Value<String> method;
  final Value<String> reference;
  final Value<String> notes;
  final Value<String> status;
  final Value<int> createdAt;
  final Value<int> rowid;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.paymentNo = const Value.absent(),
    this.date = const Value.absent(),
    this.direction = const Value.absent(),
    this.partyKind = const Value.absent(),
    this.partyId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.accountId = const Value.absent(),
    this.method = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentsCompanion.insert({
    required String id,
    required String paymentNo,
    required int date,
    required String direction,
    required String partyKind,
    required String partyId,
    required int amountMinor,
    required String accountId,
    this.method = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       paymentNo = Value(paymentNo),
       date = Value(date),
       direction = Value(direction),
       partyKind = Value(partyKind),
       partyId = Value(partyId),
       amountMinor = Value(amountMinor),
       accountId = Value(accountId),
       createdAt = Value(createdAt);
  static Insertable<Payment> custom({
    Expression<String>? id,
    Expression<String>? paymentNo,
    Expression<int>? date,
    Expression<String>? direction,
    Expression<String>? partyKind,
    Expression<String>? partyId,
    Expression<int>? amountMinor,
    Expression<String>? accountId,
    Expression<String>? method,
    Expression<String>? reference,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentNo != null) 'payment_no': paymentNo,
      if (date != null) 'date': date,
      if (direction != null) 'direction': direction,
      if (partyKind != null) 'party_kind': partyKind,
      if (partyId != null) 'party_id': partyId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (accountId != null) 'account_id': accountId,
      if (method != null) 'method': method,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentsCompanion copyWith({
    Value<String>? id,
    Value<String>? paymentNo,
    Value<int>? date,
    Value<String>? direction,
    Value<String>? partyKind,
    Value<String>? partyId,
    Value<int>? amountMinor,
    Value<String>? accountId,
    Value<String>? method,
    Value<String>? reference,
    Value<String>? notes,
    Value<String>? status,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      paymentNo: paymentNo ?? this.paymentNo,
      date: date ?? this.date,
      direction: direction ?? this.direction,
      partyKind: partyKind ?? this.partyKind,
      partyId: partyId ?? this.partyId,
      amountMinor: amountMinor ?? this.amountMinor,
      accountId: accountId ?? this.accountId,
      method: method ?? this.method,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (paymentNo.present) {
      map['payment_no'] = Variable<String>(paymentNo.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (partyKind.present) {
      map['party_kind'] = Variable<String>(partyKind.value);
    }
    if (partyId.present) {
      map['party_id'] = Variable<String>(partyId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('paymentNo: $paymentNo, ')
          ..write('date: $date, ')
          ..write('direction: $direction, ')
          ..write('partyKind: $partyKind, ')
          ..write('partyId: $partyId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('accountId: $accountId, ')
          ..write('method: $method, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentAllocationsTable extends PaymentAllocations
    with TableInfo<$PaymentAllocationsTable, PaymentAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentAllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payments (id)',
    ),
  );
  static const VerificationMeta _invoiceKindMeta = const VerificationMeta(
    'invoiceKind',
  );
  @override
  late final GeneratedColumn<String> invoiceKind = GeneratedColumn<String>(
    'invoice_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    paymentId,
    invoiceKind,
    invoiceId,
    amountMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('invoice_kind')) {
      context.handle(
        _invoiceKindMeta,
        invoiceKind.isAcceptableOrUnknown(
          data['invoice_kind']!,
          _invoiceKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceKindMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentAllocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      invoiceKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_kind'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
    );
  }

  @override
  $PaymentAllocationsTable createAlias(String alias) {
    return $PaymentAllocationsTable(attachedDatabase, alias);
  }
}

class PaymentAllocation extends DataClass
    implements Insertable<PaymentAllocation> {
  final int id;
  final String paymentId;

  /// sale | purchase
  final String invoiceKind;
  final String invoiceId;
  final int amountMinor;
  const PaymentAllocation({
    required this.id,
    required this.paymentId,
    required this.invoiceKind,
    required this.invoiceId,
    required this.amountMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['payment_id'] = Variable<String>(paymentId);
    map['invoice_kind'] = Variable<String>(invoiceKind);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['amount_minor'] = Variable<int>(amountMinor);
    return map;
  }

  PaymentAllocationsCompanion toCompanion(bool nullToAbsent) {
    return PaymentAllocationsCompanion(
      id: Value(id),
      paymentId: Value(paymentId),
      invoiceKind: Value(invoiceKind),
      invoiceId: Value(invoiceId),
      amountMinor: Value(amountMinor),
    );
  }

  factory PaymentAllocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentAllocation(
      id: serializer.fromJson<int>(json['id']),
      paymentId: serializer.fromJson<String>(json['paymentId']),
      invoiceKind: serializer.fromJson<String>(json['invoiceKind']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'paymentId': serializer.toJson<String>(paymentId),
      'invoiceKind': serializer.toJson<String>(invoiceKind),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'amountMinor': serializer.toJson<int>(amountMinor),
    };
  }

  PaymentAllocation copyWith({
    int? id,
    String? paymentId,
    String? invoiceKind,
    String? invoiceId,
    int? amountMinor,
  }) => PaymentAllocation(
    id: id ?? this.id,
    paymentId: paymentId ?? this.paymentId,
    invoiceKind: invoiceKind ?? this.invoiceKind,
    invoiceId: invoiceId ?? this.invoiceId,
    amountMinor: amountMinor ?? this.amountMinor,
  );
  PaymentAllocation copyWithCompanion(PaymentAllocationsCompanion data) {
    return PaymentAllocation(
      id: data.id.present ? data.id.value : this.id,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      invoiceKind: data.invoiceKind.present
          ? data.invoiceKind.value
          : this.invoiceKind,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocation(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('invoiceKind: $invoiceKind, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amountMinor: $amountMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, paymentId, invoiceKind, invoiceId, amountMinor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentAllocation &&
          other.id == this.id &&
          other.paymentId == this.paymentId &&
          other.invoiceKind == this.invoiceKind &&
          other.invoiceId == this.invoiceId &&
          other.amountMinor == this.amountMinor);
}

class PaymentAllocationsCompanion extends UpdateCompanion<PaymentAllocation> {
  final Value<int> id;
  final Value<String> paymentId;
  final Value<String> invoiceKind;
  final Value<String> invoiceId;
  final Value<int> amountMinor;
  const PaymentAllocationsCompanion({
    this.id = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.invoiceKind = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.amountMinor = const Value.absent(),
  });
  PaymentAllocationsCompanion.insert({
    this.id = const Value.absent(),
    required String paymentId,
    required String invoiceKind,
    required String invoiceId,
    required int amountMinor,
  }) : paymentId = Value(paymentId),
       invoiceKind = Value(invoiceKind),
       invoiceId = Value(invoiceId),
       amountMinor = Value(amountMinor);
  static Insertable<PaymentAllocation> custom({
    Expression<int>? id,
    Expression<String>? paymentId,
    Expression<String>? invoiceKind,
    Expression<String>? invoiceId,
    Expression<int>? amountMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentId != null) 'payment_id': paymentId,
      if (invoiceKind != null) 'invoice_kind': invoiceKind,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (amountMinor != null) 'amount_minor': amountMinor,
    });
  }

  PaymentAllocationsCompanion copyWith({
    Value<int>? id,
    Value<String>? paymentId,
    Value<String>? invoiceKind,
    Value<String>? invoiceId,
    Value<int>? amountMinor,
  }) {
    return PaymentAllocationsCompanion(
      id: id ?? this.id,
      paymentId: paymentId ?? this.paymentId,
      invoiceKind: invoiceKind ?? this.invoiceKind,
      invoiceId: invoiceId ?? this.invoiceId,
      amountMinor: amountMinor ?? this.amountMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (invoiceKind.present) {
      map['invoice_kind'] = Variable<String>(invoiceKind.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('invoiceKind: $invoiceKind, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amountMinor: $amountMinor')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cash_accounts (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    category,
    amountMinor,
    accountId,
    description,
    reference,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final int date;
  final String category;
  final int amountMinor;
  final String accountId;
  final String description;
  final String reference;
  final int createdAt;
  const Expense({
    required this.id,
    required this.date,
    required this.category,
    required this.amountMinor,
    required this.accountId,
    required this.description,
    required this.reference,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<int>(date);
    map['category'] = Variable<String>(category);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['account_id'] = Variable<String>(accountId);
    map['description'] = Variable<String>(description);
    map['reference'] = Variable<String>(reference);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      date: Value(date),
      category: Value(category),
      amountMinor: Value(amountMinor),
      accountId: Value(accountId),
      description: Value(description),
      reference: Value(reference),
      createdAt: Value(createdAt),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<int>(json['date']),
      category: serializer.fromJson<String>(json['category']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      accountId: serializer.fromJson<String>(json['accountId']),
      description: serializer.fromJson<String>(json['description']),
      reference: serializer.fromJson<String>(json['reference']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<int>(date),
      'category': serializer.toJson<String>(category),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'accountId': serializer.toJson<String>(accountId),
      'description': serializer.toJson<String>(description),
      'reference': serializer.toJson<String>(reference),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Expense copyWith({
    int? id,
    int? date,
    String? category,
    int? amountMinor,
    String? accountId,
    String? description,
    String? reference,
    int? createdAt,
  }) => Expense(
    id: id ?? this.id,
    date: date ?? this.date,
    category: category ?? this.category,
    amountMinor: amountMinor ?? this.amountMinor,
    accountId: accountId ?? this.accountId,
    description: description ?? this.description,
    reference: reference ?? this.reference,
    createdAt: createdAt ?? this.createdAt,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      category: data.category.present ? data.category.value : this.category,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      description: data.description.present
          ? data.description.value
          : this.description,
      reference: data.reference.present ? data.reference.value : this.reference,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('accountId: $accountId, ')
          ..write('description: $description, ')
          ..write('reference: $reference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    category,
    amountMinor,
    accountId,
    description,
    reference,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.amountMinor == this.amountMinor &&
          other.accountId == this.accountId &&
          other.description == this.description &&
          other.reference == this.reference &&
          other.createdAt == this.createdAt);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<int> date;
  final Value<String> category;
  final Value<int> amountMinor;
  final Value<String> accountId;
  final Value<String> description;
  final Value<String> reference;
  final Value<int> createdAt;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.accountId = const Value.absent(),
    this.description = const Value.absent(),
    this.reference = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required int date,
    required String category,
    required int amountMinor,
    required String accountId,
    this.description = const Value.absent(),
    this.reference = const Value.absent(),
    required int createdAt,
  }) : date = Value(date),
       category = Value(category),
       amountMinor = Value(amountMinor),
       accountId = Value(accountId),
       createdAt = Value(createdAt);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<int>? date,
    Expression<String>? category,
    Expression<int>? amountMinor,
    Expression<String>? accountId,
    Expression<String>? description,
    Expression<String>? reference,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (accountId != null) 'account_id': accountId,
      if (description != null) 'description': description,
      if (reference != null) 'reference': reference,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExpensesCompanion copyWith({
    Value<int>? id,
    Value<int>? date,
    Value<String>? category,
    Value<int>? amountMinor,
    Value<String>? accountId,
    Value<String>? description,
    Value<String>? reference,
    Value<int>? createdAt,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      amountMinor: amountMinor ?? this.amountMinor,
      accountId: accountId ?? this.accountId,
      description: description ?? this.description,
      reference: reference ?? this.reference,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('accountId: $accountId, ')
          ..write('description: $description, ')
          ..write('reference: $reference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $IncomeRecordsTable extends IncomeRecords
    with TableInfo<$IncomeRecordsTable, IncomeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cash_accounts (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    category,
    amountMinor,
    accountId,
    description,
    reference,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncomeRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $IncomeRecordsTable createAlias(String alias) {
    return $IncomeRecordsTable(attachedDatabase, alias);
  }
}

class IncomeRecord extends DataClass implements Insertable<IncomeRecord> {
  final int id;
  final int date;
  final String category;
  final int amountMinor;
  final String accountId;
  final String description;
  final String reference;
  final int createdAt;
  const IncomeRecord({
    required this.id,
    required this.date,
    required this.category,
    required this.amountMinor,
    required this.accountId,
    required this.description,
    required this.reference,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<int>(date);
    map['category'] = Variable<String>(category);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['account_id'] = Variable<String>(accountId);
    map['description'] = Variable<String>(description);
    map['reference'] = Variable<String>(reference);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  IncomeRecordsCompanion toCompanion(bool nullToAbsent) {
    return IncomeRecordsCompanion(
      id: Value(id),
      date: Value(date),
      category: Value(category),
      amountMinor: Value(amountMinor),
      accountId: Value(accountId),
      description: Value(description),
      reference: Value(reference),
      createdAt: Value(createdAt),
    );
  }

  factory IncomeRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeRecord(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<int>(json['date']),
      category: serializer.fromJson<String>(json['category']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      accountId: serializer.fromJson<String>(json['accountId']),
      description: serializer.fromJson<String>(json['description']),
      reference: serializer.fromJson<String>(json['reference']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<int>(date),
      'category': serializer.toJson<String>(category),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'accountId': serializer.toJson<String>(accountId),
      'description': serializer.toJson<String>(description),
      'reference': serializer.toJson<String>(reference),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  IncomeRecord copyWith({
    int? id,
    int? date,
    String? category,
    int? amountMinor,
    String? accountId,
    String? description,
    String? reference,
    int? createdAt,
  }) => IncomeRecord(
    id: id ?? this.id,
    date: date ?? this.date,
    category: category ?? this.category,
    amountMinor: amountMinor ?? this.amountMinor,
    accountId: accountId ?? this.accountId,
    description: description ?? this.description,
    reference: reference ?? this.reference,
    createdAt: createdAt ?? this.createdAt,
  );
  IncomeRecord copyWithCompanion(IncomeRecordsCompanion data) {
    return IncomeRecord(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      category: data.category.present ? data.category.value : this.category,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      description: data.description.present
          ? data.description.value
          : this.description,
      reference: data.reference.present ? data.reference.value : this.reference,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeRecord(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('accountId: $accountId, ')
          ..write('description: $description, ')
          ..write('reference: $reference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    category,
    amountMinor,
    accountId,
    description,
    reference,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeRecord &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.amountMinor == this.amountMinor &&
          other.accountId == this.accountId &&
          other.description == this.description &&
          other.reference == this.reference &&
          other.createdAt == this.createdAt);
}

class IncomeRecordsCompanion extends UpdateCompanion<IncomeRecord> {
  final Value<int> id;
  final Value<int> date;
  final Value<String> category;
  final Value<int> amountMinor;
  final Value<String> accountId;
  final Value<String> description;
  final Value<String> reference;
  final Value<int> createdAt;
  const IncomeRecordsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.accountId = const Value.absent(),
    this.description = const Value.absent(),
    this.reference = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  IncomeRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int date,
    required String category,
    required int amountMinor,
    required String accountId,
    this.description = const Value.absent(),
    this.reference = const Value.absent(),
    required int createdAt,
  }) : date = Value(date),
       category = Value(category),
       amountMinor = Value(amountMinor),
       accountId = Value(accountId),
       createdAt = Value(createdAt);
  static Insertable<IncomeRecord> custom({
    Expression<int>? id,
    Expression<int>? date,
    Expression<String>? category,
    Expression<int>? amountMinor,
    Expression<String>? accountId,
    Expression<String>? description,
    Expression<String>? reference,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (accountId != null) 'account_id': accountId,
      if (description != null) 'description': description,
      if (reference != null) 'reference': reference,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  IncomeRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? date,
    Value<String>? category,
    Value<int>? amountMinor,
    Value<String>? accountId,
    Value<String>? description,
    Value<String>? reference,
    Value<int>? createdAt,
  }) {
    return IncomeRecordsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      amountMinor: amountMinor ?? this.amountMinor,
      accountId: accountId ?? this.accountId,
      description: description ?? this.description,
      reference: reference ?? this.reference,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeRecordsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('accountId: $accountId, ')
          ..write('description: $description, ')
          ..write('reference: $reference, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AccountTransfersTable extends AccountTransfers
    with TableInfo<$AccountTransfersTable, AccountTransfer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTransfersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromAccountIdMeta = const VerificationMeta(
    'fromAccountId',
  );
  @override
  late final GeneratedColumn<String> fromAccountId = GeneratedColumn<String>(
    'from_account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cash_accounts (id)',
    ),
  );
  static const VerificationMeta _toAccountIdMeta = const VerificationMeta(
    'toAccountId',
  );
  @override
  late final GeneratedColumn<String> toAccountId = GeneratedColumn<String>(
    'to_account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cash_accounts (id)',
    ),
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    fromAccountId,
    toAccountId,
    amountMinor,
    reference,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_transfers';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountTransfer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('from_account_id')) {
      context.handle(
        _fromAccountIdMeta,
        fromAccountId.isAcceptableOrUnknown(
          data['from_account_id']!,
          _fromAccountIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fromAccountIdMeta);
    }
    if (data.containsKey('to_account_id')) {
      context.handle(
        _toAccountIdMeta,
        toAccountId.isAcceptableOrUnknown(
          data['to_account_id']!,
          _toAccountIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toAccountIdMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountTransfer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountTransfer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      fromAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_account_id'],
      )!,
      toAccountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_account_id'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AccountTransfersTable createAlias(String alias) {
    return $AccountTransfersTable(attachedDatabase, alias);
  }
}

class AccountTransfer extends DataClass implements Insertable<AccountTransfer> {
  final int id;
  final int date;
  final String fromAccountId;
  final String toAccountId;
  final int amountMinor;
  final String reference;
  final String notes;
  final int createdAt;
  const AccountTransfer({
    required this.id,
    required this.date,
    required this.fromAccountId,
    required this.toAccountId,
    required this.amountMinor,
    required this.reference,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<int>(date);
    map['from_account_id'] = Variable<String>(fromAccountId);
    map['to_account_id'] = Variable<String>(toAccountId);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['reference'] = Variable<String>(reference);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  AccountTransfersCompanion toCompanion(bool nullToAbsent) {
    return AccountTransfersCompanion(
      id: Value(id),
      date: Value(date),
      fromAccountId: Value(fromAccountId),
      toAccountId: Value(toAccountId),
      amountMinor: Value(amountMinor),
      reference: Value(reference),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory AccountTransfer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTransfer(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<int>(json['date']),
      fromAccountId: serializer.fromJson<String>(json['fromAccountId']),
      toAccountId: serializer.fromJson<String>(json['toAccountId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      reference: serializer.fromJson<String>(json['reference']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<int>(date),
      'fromAccountId': serializer.toJson<String>(fromAccountId),
      'toAccountId': serializer.toJson<String>(toAccountId),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'reference': serializer.toJson<String>(reference),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  AccountTransfer copyWith({
    int? id,
    int? date,
    String? fromAccountId,
    String? toAccountId,
    int? amountMinor,
    String? reference,
    String? notes,
    int? createdAt,
  }) => AccountTransfer(
    id: id ?? this.id,
    date: date ?? this.date,
    fromAccountId: fromAccountId ?? this.fromAccountId,
    toAccountId: toAccountId ?? this.toAccountId,
    amountMinor: amountMinor ?? this.amountMinor,
    reference: reference ?? this.reference,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  AccountTransfer copyWithCompanion(AccountTransfersCompanion data) {
    return AccountTransfer(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      fromAccountId: data.fromAccountId.present
          ? data.fromAccountId.value
          : this.fromAccountId,
      toAccountId: data.toAccountId.present
          ? data.toAccountId.value
          : this.toAccountId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      reference: data.reference.present ? data.reference.value : this.reference,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountTransfer(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('fromAccountId: $fromAccountId, ')
          ..write('toAccountId: $toAccountId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    fromAccountId,
    toAccountId,
    amountMinor,
    reference,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTransfer &&
          other.id == this.id &&
          other.date == this.date &&
          other.fromAccountId == this.fromAccountId &&
          other.toAccountId == this.toAccountId &&
          other.amountMinor == this.amountMinor &&
          other.reference == this.reference &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class AccountTransfersCompanion extends UpdateCompanion<AccountTransfer> {
  final Value<int> id;
  final Value<int> date;
  final Value<String> fromAccountId;
  final Value<String> toAccountId;
  final Value<int> amountMinor;
  final Value<String> reference;
  final Value<String> notes;
  final Value<int> createdAt;
  const AccountTransfersCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.fromAccountId = const Value.absent(),
    this.toAccountId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AccountTransfersCompanion.insert({
    this.id = const Value.absent(),
    required int date,
    required String fromAccountId,
    required String toAccountId,
    required int amountMinor,
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
  }) : date = Value(date),
       fromAccountId = Value(fromAccountId),
       toAccountId = Value(toAccountId),
       amountMinor = Value(amountMinor),
       createdAt = Value(createdAt);
  static Insertable<AccountTransfer> custom({
    Expression<int>? id,
    Expression<int>? date,
    Expression<String>? fromAccountId,
    Expression<String>? toAccountId,
    Expression<int>? amountMinor,
    Expression<String>? reference,
    Expression<String>? notes,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (fromAccountId != null) 'from_account_id': fromAccountId,
      if (toAccountId != null) 'to_account_id': toAccountId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AccountTransfersCompanion copyWith({
    Value<int>? id,
    Value<int>? date,
    Value<String>? fromAccountId,
    Value<String>? toAccountId,
    Value<int>? amountMinor,
    Value<String>? reference,
    Value<String>? notes,
    Value<int>? createdAt,
  }) {
    return AccountTransfersCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      amountMinor: amountMinor ?? this.amountMinor,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (fromAccountId.present) {
      map['from_account_id'] = Variable<String>(fromAccountId.value);
    }
    if (toAccountId.present) {
      map['to_account_id'] = Variable<String>(toAccountId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTransfersCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('fromAccountId: $fromAccountId, ')
          ..write('toAccountId: $toAccountId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $InventoryMovementsTable extends InventoryMovements
    with TableInfo<$InventoryMovementsTable, InventoryMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _movementTypeMeta = const VerificationMeta(
    'movementType',
  );
  @override
  late final GeneratedColumn<String> movementType = GeneratedColumn<String>(
    'movement_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refKindMeta = const VerificationMeta(
    'refKind',
  );
  @override
  late final GeneratedColumn<String> refKind = GeneratedColumn<String>(
    'ref_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<String> refId = GeneratedColumn<String>(
    'ref_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostMinorMeta = const VerificationMeta(
    'unitCostMinor',
  );
  @override
  late final GeneratedColumn<int> unitCostMinor = GeneratedColumn<int>(
    'unit_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    date,
    qtyNum,
    qtyDen,
    movementType,
    refKind,
    refId,
    unitCostMinor,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_movements';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryMovement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('movement_type')) {
      context.handle(
        _movementTypeMeta,
        movementType.isAcceptableOrUnknown(
          data['movement_type']!,
          _movementTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_movementTypeMeta);
    }
    if (data.containsKey('ref_kind')) {
      context.handle(
        _refKindMeta,
        refKind.isAcceptableOrUnknown(data['ref_kind']!, _refKindMeta),
      );
    } else if (isInserting) {
      context.missing(_refKindMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('unit_cost_minor')) {
      context.handle(
        _unitCostMinorMeta,
        unitCostMinor.isAcceptableOrUnknown(
          data['unit_cost_minor']!,
          _unitCostMinorMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryMovement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      movementType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}movement_type'],
      )!,
      refKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_kind'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_id'],
      )!,
      unitCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost_minor'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $InventoryMovementsTable createAlias(String alias) {
    return $InventoryMovementsTable(attachedDatabase, alias);
  }
}

class InventoryMovement extends DataClass
    implements Insertable<InventoryMovement> {
  final int id;
  final String productId;
  final int date;
  final int qtyNum;
  final int qtyDen;
  final String movementType;
  final String refKind;
  final String refId;
  final int unitCostMinor;
  final String notes;
  const InventoryMovement({
    required this.id,
    required this.productId,
    required this.date,
    required this.qtyNum,
    required this.qtyDen,
    required this.movementType,
    required this.refKind,
    required this.refId,
    required this.unitCostMinor,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['date'] = Variable<int>(date);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['movement_type'] = Variable<String>(movementType);
    map['ref_kind'] = Variable<String>(refKind);
    map['ref_id'] = Variable<String>(refId);
    map['unit_cost_minor'] = Variable<int>(unitCostMinor);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  InventoryMovementsCompanion toCompanion(bool nullToAbsent) {
    return InventoryMovementsCompanion(
      id: Value(id),
      productId: Value(productId),
      date: Value(date),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      movementType: Value(movementType),
      refKind: Value(refKind),
      refId: Value(refId),
      unitCostMinor: Value(unitCostMinor),
      notes: Value(notes),
    );
  }

  factory InventoryMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryMovement(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      date: serializer.fromJson<int>(json['date']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      movementType: serializer.fromJson<String>(json['movementType']),
      refKind: serializer.fromJson<String>(json['refKind']),
      refId: serializer.fromJson<String>(json['refId']),
      unitCostMinor: serializer.fromJson<int>(json['unitCostMinor']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'date': serializer.toJson<int>(date),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'movementType': serializer.toJson<String>(movementType),
      'refKind': serializer.toJson<String>(refKind),
      'refId': serializer.toJson<String>(refId),
      'unitCostMinor': serializer.toJson<int>(unitCostMinor),
      'notes': serializer.toJson<String>(notes),
    };
  }

  InventoryMovement copyWith({
    int? id,
    String? productId,
    int? date,
    int? qtyNum,
    int? qtyDen,
    String? movementType,
    String? refKind,
    String? refId,
    int? unitCostMinor,
    String? notes,
  }) => InventoryMovement(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    date: date ?? this.date,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    movementType: movementType ?? this.movementType,
    refKind: refKind ?? this.refKind,
    refId: refId ?? this.refId,
    unitCostMinor: unitCostMinor ?? this.unitCostMinor,
    notes: notes ?? this.notes,
  );
  InventoryMovement copyWithCompanion(InventoryMovementsCompanion data) {
    return InventoryMovement(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      date: data.date.present ? data.date.value : this.date,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      movementType: data.movementType.present
          ? data.movementType.value
          : this.movementType,
      refKind: data.refKind.present ? data.refKind.value : this.refKind,
      refId: data.refId.present ? data.refId.value : this.refId,
      unitCostMinor: data.unitCostMinor.present
          ? data.unitCostMinor.value
          : this.unitCostMinor,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovement(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('date: $date, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('movementType: $movementType, ')
          ..write('refKind: $refKind, ')
          ..write('refId: $refId, ')
          ..write('unitCostMinor: $unitCostMinor, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    date,
    qtyNum,
    qtyDen,
    movementType,
    refKind,
    refId,
    unitCostMinor,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryMovement &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.date == this.date &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.movementType == this.movementType &&
          other.refKind == this.refKind &&
          other.refId == this.refId &&
          other.unitCostMinor == this.unitCostMinor &&
          other.notes == this.notes);
}

class InventoryMovementsCompanion extends UpdateCompanion<InventoryMovement> {
  final Value<int> id;
  final Value<String> productId;
  final Value<int> date;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<String> movementType;
  final Value<String> refKind;
  final Value<String> refId;
  final Value<int> unitCostMinor;
  final Value<String> notes;
  const InventoryMovementsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.date = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.movementType = const Value.absent(),
    this.refKind = const Value.absent(),
    this.refId = const Value.absent(),
    this.unitCostMinor = const Value.absent(),
    this.notes = const Value.absent(),
  });
  InventoryMovementsCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required int date,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    required String movementType,
    required String refKind,
    required String refId,
    this.unitCostMinor = const Value.absent(),
    this.notes = const Value.absent(),
  }) : productId = Value(productId),
       date = Value(date),
       qtyNum = Value(qtyNum),
       movementType = Value(movementType),
       refKind = Value(refKind),
       refId = Value(refId);
  static Insertable<InventoryMovement> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<int>? date,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<String>? movementType,
    Expression<String>? refKind,
    Expression<String>? refId,
    Expression<int>? unitCostMinor,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (date != null) 'date': date,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (movementType != null) 'movement_type': movementType,
      if (refKind != null) 'ref_kind': refKind,
      if (refId != null) 'ref_id': refId,
      if (unitCostMinor != null) 'unit_cost_minor': unitCostMinor,
      if (notes != null) 'notes': notes,
    });
  }

  InventoryMovementsCompanion copyWith({
    Value<int>? id,
    Value<String>? productId,
    Value<int>? date,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<String>? movementType,
    Value<String>? refKind,
    Value<String>? refId,
    Value<int>? unitCostMinor,
    Value<String>? notes,
  }) {
    return InventoryMovementsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      date: date ?? this.date,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      movementType: movementType ?? this.movementType,
      refKind: refKind ?? this.refKind,
      refId: refId ?? this.refId,
      unitCostMinor: unitCostMinor ?? this.unitCostMinor,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (movementType.present) {
      map['movement_type'] = Variable<String>(movementType.value);
    }
    if (refKind.present) {
      map['ref_kind'] = Variable<String>(refKind.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<String>(refId.value);
    }
    if (unitCostMinor.present) {
      map['unit_cost_minor'] = Variable<int>(unitCostMinor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovementsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('date: $date, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('movementType: $movementType, ')
          ..write('refKind: $refKind, ')
          ..write('refId: $refId, ')
          ..write('unitCostMinor: $unitCostMinor, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $ProductionBatchesTable extends ProductionBatches
    with TableInfo<$ProductionBatchesTable, ProductionBatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductionBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchNoMeta = const VerificationMeta(
    'batchNo',
  );
  @override
  late final GeneratedColumn<String> batchNo = GeneratedColumn<String>(
    'batch_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _labourCostMinorMeta = const VerificationMeta(
    'labourCostMinor',
  );
  @override
  late final GeneratedColumn<int> labourCostMinor = GeneratedColumn<int>(
    'labour_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _electricityCostMinorMeta =
      const VerificationMeta('electricityCostMinor');
  @override
  late final GeneratedColumn<int> electricityCostMinor = GeneratedColumn<int>(
    'electricity_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _otherCostMinorMeta = const VerificationMeta(
    'otherCostMinor',
  );
  @override
  late final GeneratedColumn<int> otherCostMinor = GeneratedColumn<int>(
    'other_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    batchNo,
    date,
    notes,
    labourCostMinor,
    electricityCostMinor,
    otherCostMinor,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'production_batches';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductionBatche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('batch_no')) {
      context.handle(
        _batchNoMeta,
        batchNo.isAcceptableOrUnknown(data['batch_no']!, _batchNoMeta),
      );
    } else if (isInserting) {
      context.missing(_batchNoMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('labour_cost_minor')) {
      context.handle(
        _labourCostMinorMeta,
        labourCostMinor.isAcceptableOrUnknown(
          data['labour_cost_minor']!,
          _labourCostMinorMeta,
        ),
      );
    }
    if (data.containsKey('electricity_cost_minor')) {
      context.handle(
        _electricityCostMinorMeta,
        electricityCostMinor.isAcceptableOrUnknown(
          data['electricity_cost_minor']!,
          _electricityCostMinorMeta,
        ),
      );
    }
    if (data.containsKey('other_cost_minor')) {
      context.handle(
        _otherCostMinorMeta,
        otherCostMinor.isAcceptableOrUnknown(
          data['other_cost_minor']!,
          _otherCostMinorMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionBatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductionBatche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      batchNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_no'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      labourCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}labour_cost_minor'],
      )!,
      electricityCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}electricity_cost_minor'],
      )!,
      otherCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}other_cost_minor'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductionBatchesTable createAlias(String alias) {
    return $ProductionBatchesTable(attachedDatabase, alias);
  }
}

class ProductionBatche extends DataClass
    implements Insertable<ProductionBatche> {
  final String id;
  final String batchNo;
  final int date;
  final String notes;
  final int labourCostMinor;
  final int electricityCostMinor;
  final int otherCostMinor;

  /// completed | draft
  final String status;
  final int createdAt;
  const ProductionBatche({
    required this.id,
    required this.batchNo,
    required this.date,
    required this.notes,
    required this.labourCostMinor,
    required this.electricityCostMinor,
    required this.otherCostMinor,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['batch_no'] = Variable<String>(batchNo);
    map['date'] = Variable<int>(date);
    map['notes'] = Variable<String>(notes);
    map['labour_cost_minor'] = Variable<int>(labourCostMinor);
    map['electricity_cost_minor'] = Variable<int>(electricityCostMinor);
    map['other_cost_minor'] = Variable<int>(otherCostMinor);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ProductionBatchesCompanion toCompanion(bool nullToAbsent) {
    return ProductionBatchesCompanion(
      id: Value(id),
      batchNo: Value(batchNo),
      date: Value(date),
      notes: Value(notes),
      labourCostMinor: Value(labourCostMinor),
      electricityCostMinor: Value(electricityCostMinor),
      otherCostMinor: Value(otherCostMinor),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory ProductionBatche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductionBatche(
      id: serializer.fromJson<String>(json['id']),
      batchNo: serializer.fromJson<String>(json['batchNo']),
      date: serializer.fromJson<int>(json['date']),
      notes: serializer.fromJson<String>(json['notes']),
      labourCostMinor: serializer.fromJson<int>(json['labourCostMinor']),
      electricityCostMinor: serializer.fromJson<int>(
        json['electricityCostMinor'],
      ),
      otherCostMinor: serializer.fromJson<int>(json['otherCostMinor']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'batchNo': serializer.toJson<String>(batchNo),
      'date': serializer.toJson<int>(date),
      'notes': serializer.toJson<String>(notes),
      'labourCostMinor': serializer.toJson<int>(labourCostMinor),
      'electricityCostMinor': serializer.toJson<int>(electricityCostMinor),
      'otherCostMinor': serializer.toJson<int>(otherCostMinor),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  ProductionBatche copyWith({
    String? id,
    String? batchNo,
    int? date,
    String? notes,
    int? labourCostMinor,
    int? electricityCostMinor,
    int? otherCostMinor,
    String? status,
    int? createdAt,
  }) => ProductionBatche(
    id: id ?? this.id,
    batchNo: batchNo ?? this.batchNo,
    date: date ?? this.date,
    notes: notes ?? this.notes,
    labourCostMinor: labourCostMinor ?? this.labourCostMinor,
    electricityCostMinor: electricityCostMinor ?? this.electricityCostMinor,
    otherCostMinor: otherCostMinor ?? this.otherCostMinor,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  ProductionBatche copyWithCompanion(ProductionBatchesCompanion data) {
    return ProductionBatche(
      id: data.id.present ? data.id.value : this.id,
      batchNo: data.batchNo.present ? data.batchNo.value : this.batchNo,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
      labourCostMinor: data.labourCostMinor.present
          ? data.labourCostMinor.value
          : this.labourCostMinor,
      electricityCostMinor: data.electricityCostMinor.present
          ? data.electricityCostMinor.value
          : this.electricityCostMinor,
      otherCostMinor: data.otherCostMinor.present
          ? data.otherCostMinor.value
          : this.otherCostMinor,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductionBatche(')
          ..write('id: $id, ')
          ..write('batchNo: $batchNo, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('labourCostMinor: $labourCostMinor, ')
          ..write('electricityCostMinor: $electricityCostMinor, ')
          ..write('otherCostMinor: $otherCostMinor, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    batchNo,
    date,
    notes,
    labourCostMinor,
    electricityCostMinor,
    otherCostMinor,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductionBatche &&
          other.id == this.id &&
          other.batchNo == this.batchNo &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.labourCostMinor == this.labourCostMinor &&
          other.electricityCostMinor == this.electricityCostMinor &&
          other.otherCostMinor == this.otherCostMinor &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ProductionBatchesCompanion extends UpdateCompanion<ProductionBatche> {
  final Value<String> id;
  final Value<String> batchNo;
  final Value<int> date;
  final Value<String> notes;
  final Value<int> labourCostMinor;
  final Value<int> electricityCostMinor;
  final Value<int> otherCostMinor;
  final Value<String> status;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ProductionBatchesCompanion({
    this.id = const Value.absent(),
    this.batchNo = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.labourCostMinor = const Value.absent(),
    this.electricityCostMinor = const Value.absent(),
    this.otherCostMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductionBatchesCompanion.insert({
    required String id,
    required String batchNo,
    required int date,
    this.notes = const Value.absent(),
    this.labourCostMinor = const Value.absent(),
    this.electricityCostMinor = const Value.absent(),
    this.otherCostMinor = const Value.absent(),
    this.status = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       batchNo = Value(batchNo),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<ProductionBatche> custom({
    Expression<String>? id,
    Expression<String>? batchNo,
    Expression<int>? date,
    Expression<String>? notes,
    Expression<int>? labourCostMinor,
    Expression<int>? electricityCostMinor,
    Expression<int>? otherCostMinor,
    Expression<String>? status,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchNo != null) 'batch_no': batchNo,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (labourCostMinor != null) 'labour_cost_minor': labourCostMinor,
      if (electricityCostMinor != null)
        'electricity_cost_minor': electricityCostMinor,
      if (otherCostMinor != null) 'other_cost_minor': otherCostMinor,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductionBatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? batchNo,
    Value<int>? date,
    Value<String>? notes,
    Value<int>? labourCostMinor,
    Value<int>? electricityCostMinor,
    Value<int>? otherCostMinor,
    Value<String>? status,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ProductionBatchesCompanion(
      id: id ?? this.id,
      batchNo: batchNo ?? this.batchNo,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      labourCostMinor: labourCostMinor ?? this.labourCostMinor,
      electricityCostMinor: electricityCostMinor ?? this.electricityCostMinor,
      otherCostMinor: otherCostMinor ?? this.otherCostMinor,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (batchNo.present) {
      map['batch_no'] = Variable<String>(batchNo.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (labourCostMinor.present) {
      map['labour_cost_minor'] = Variable<int>(labourCostMinor.value);
    }
    if (electricityCostMinor.present) {
      map['electricity_cost_minor'] = Variable<int>(electricityCostMinor.value);
    }
    if (otherCostMinor.present) {
      map['other_cost_minor'] = Variable<int>(otherCostMinor.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionBatchesCompanion(')
          ..write('id: $id, ')
          ..write('batchNo: $batchNo, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('labourCostMinor: $labourCostMinor, ')
          ..write('electricityCostMinor: $electricityCostMinor, ')
          ..write('otherCostMinor: $otherCostMinor, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductionInputsTable extends ProductionInputs
    with TableInfo<$ProductionInputsTable, ProductionInput> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductionInputsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES production_batches (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitCostMinorMeta = const VerificationMeta(
    'unitCostMinor',
  );
  @override
  late final GeneratedColumn<int> unitCostMinor = GeneratedColumn<int>(
    'unit_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    batchId,
    productId,
    qtyNum,
    qtyDen,
    unitCostMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'production_inputs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductionInput> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('unit_cost_minor')) {
      context.handle(
        _unitCostMinorMeta,
        unitCostMinor.isAcceptableOrUnknown(
          data['unit_cost_minor']!,
          _unitCostMinorMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionInput map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductionInput(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      unitCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost_minor'],
      )!,
    );
  }

  @override
  $ProductionInputsTable createAlias(String alias) {
    return $ProductionInputsTable(attachedDatabase, alias);
  }
}

class ProductionInput extends DataClass implements Insertable<ProductionInput> {
  final int id;
  final String batchId;
  final String productId;
  final int qtyNum;
  final int qtyDen;
  final int unitCostMinor;
  const ProductionInput({
    required this.id,
    required this.batchId,
    required this.productId,
    required this.qtyNum,
    required this.qtyDen,
    required this.unitCostMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['product_id'] = Variable<String>(productId);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['unit_cost_minor'] = Variable<int>(unitCostMinor);
    return map;
  }

  ProductionInputsCompanion toCompanion(bool nullToAbsent) {
    return ProductionInputsCompanion(
      id: Value(id),
      batchId: Value(batchId),
      productId: Value(productId),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      unitCostMinor: Value(unitCostMinor),
    );
  }

  factory ProductionInput.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductionInput(
      id: serializer.fromJson<int>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      productId: serializer.fromJson<String>(json['productId']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      unitCostMinor: serializer.fromJson<int>(json['unitCostMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'batchId': serializer.toJson<String>(batchId),
      'productId': serializer.toJson<String>(productId),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'unitCostMinor': serializer.toJson<int>(unitCostMinor),
    };
  }

  ProductionInput copyWith({
    int? id,
    String? batchId,
    String? productId,
    int? qtyNum,
    int? qtyDen,
    int? unitCostMinor,
  }) => ProductionInput(
    id: id ?? this.id,
    batchId: batchId ?? this.batchId,
    productId: productId ?? this.productId,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    unitCostMinor: unitCostMinor ?? this.unitCostMinor,
  );
  ProductionInput copyWithCompanion(ProductionInputsCompanion data) {
    return ProductionInput(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      unitCostMinor: data.unitCostMinor.present
          ? data.unitCostMinor.value
          : this.unitCostMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductionInput(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitCostMinor: $unitCostMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, batchId, productId, qtyNum, qtyDen, unitCostMinor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductionInput &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.productId == this.productId &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.unitCostMinor == this.unitCostMinor);
}

class ProductionInputsCompanion extends UpdateCompanion<ProductionInput> {
  final Value<int> id;
  final Value<String> batchId;
  final Value<String> productId;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<int> unitCostMinor;
  const ProductionInputsCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.unitCostMinor = const Value.absent(),
  });
  ProductionInputsCompanion.insert({
    this.id = const Value.absent(),
    required String batchId,
    required String productId,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    this.unitCostMinor = const Value.absent(),
  }) : batchId = Value(batchId),
       productId = Value(productId),
       qtyNum = Value(qtyNum);
  static Insertable<ProductionInput> custom({
    Expression<int>? id,
    Expression<String>? batchId,
    Expression<String>? productId,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<int>? unitCostMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (productId != null) 'product_id': productId,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (unitCostMinor != null) 'unit_cost_minor': unitCostMinor,
    });
  }

  ProductionInputsCompanion copyWith({
    Value<int>? id,
    Value<String>? batchId,
    Value<String>? productId,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<int>? unitCostMinor,
  }) {
    return ProductionInputsCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      productId: productId ?? this.productId,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      unitCostMinor: unitCostMinor ?? this.unitCostMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (unitCostMinor.present) {
      map['unit_cost_minor'] = Variable<int>(unitCostMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionInputsCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitCostMinor: $unitCostMinor')
          ..write(')'))
        .toString();
  }
}

class $ProductionOutputsTable extends ProductionOutputs
    with TableInfo<$ProductionOutputsTable, ProductionOutput> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductionOutputsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES production_batches (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitCostMinorMeta = const VerificationMeta(
    'unitCostMinor',
  );
  @override
  late final GeneratedColumn<int> unitCostMinor = GeneratedColumn<int>(
    'unit_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    batchId,
    productId,
    qtyNum,
    qtyDen,
    unitCostMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'production_outputs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductionOutput> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_batchIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('unit_cost_minor')) {
      context.handle(
        _unitCostMinorMeta,
        unitCostMinor.isAcceptableOrUnknown(
          data['unit_cost_minor']!,
          _unitCostMinorMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductionOutput map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductionOutput(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      unitCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost_minor'],
      )!,
    );
  }

  @override
  $ProductionOutputsTable createAlias(String alias) {
    return $ProductionOutputsTable(attachedDatabase, alias);
  }
}

class ProductionOutput extends DataClass
    implements Insertable<ProductionOutput> {
  final int id;
  final String batchId;
  final String productId;
  final int qtyNum;
  final int qtyDen;
  final int unitCostMinor;
  const ProductionOutput({
    required this.id,
    required this.batchId,
    required this.productId,
    required this.qtyNum,
    required this.qtyDen,
    required this.unitCostMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['batch_id'] = Variable<String>(batchId);
    map['product_id'] = Variable<String>(productId);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['unit_cost_minor'] = Variable<int>(unitCostMinor);
    return map;
  }

  ProductionOutputsCompanion toCompanion(bool nullToAbsent) {
    return ProductionOutputsCompanion(
      id: Value(id),
      batchId: Value(batchId),
      productId: Value(productId),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      unitCostMinor: Value(unitCostMinor),
    );
  }

  factory ProductionOutput.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductionOutput(
      id: serializer.fromJson<int>(json['id']),
      batchId: serializer.fromJson<String>(json['batchId']),
      productId: serializer.fromJson<String>(json['productId']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      unitCostMinor: serializer.fromJson<int>(json['unitCostMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'batchId': serializer.toJson<String>(batchId),
      'productId': serializer.toJson<String>(productId),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'unitCostMinor': serializer.toJson<int>(unitCostMinor),
    };
  }

  ProductionOutput copyWith({
    int? id,
    String? batchId,
    String? productId,
    int? qtyNum,
    int? qtyDen,
    int? unitCostMinor,
  }) => ProductionOutput(
    id: id ?? this.id,
    batchId: batchId ?? this.batchId,
    productId: productId ?? this.productId,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    unitCostMinor: unitCostMinor ?? this.unitCostMinor,
  );
  ProductionOutput copyWithCompanion(ProductionOutputsCompanion data) {
    return ProductionOutput(
      id: data.id.present ? data.id.value : this.id,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      unitCostMinor: data.unitCostMinor.present
          ? data.unitCostMinor.value
          : this.unitCostMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductionOutput(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitCostMinor: $unitCostMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, batchId, productId, qtyNum, qtyDen, unitCostMinor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductionOutput &&
          other.id == this.id &&
          other.batchId == this.batchId &&
          other.productId == this.productId &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.unitCostMinor == this.unitCostMinor);
}

class ProductionOutputsCompanion extends UpdateCompanion<ProductionOutput> {
  final Value<int> id;
  final Value<String> batchId;
  final Value<String> productId;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<int> unitCostMinor;
  const ProductionOutputsCompanion({
    this.id = const Value.absent(),
    this.batchId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.unitCostMinor = const Value.absent(),
  });
  ProductionOutputsCompanion.insert({
    this.id = const Value.absent(),
    required String batchId,
    required String productId,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    this.unitCostMinor = const Value.absent(),
  }) : batchId = Value(batchId),
       productId = Value(productId),
       qtyNum = Value(qtyNum);
  static Insertable<ProductionOutput> custom({
    Expression<int>? id,
    Expression<String>? batchId,
    Expression<String>? productId,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<int>? unitCostMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (batchId != null) 'batch_id': batchId,
      if (productId != null) 'product_id': productId,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (unitCostMinor != null) 'unit_cost_minor': unitCostMinor,
    });
  }

  ProductionOutputsCompanion copyWith({
    Value<int>? id,
    Value<String>? batchId,
    Value<String>? productId,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<int>? unitCostMinor,
  }) {
    return ProductionOutputsCompanion(
      id: id ?? this.id,
      batchId: batchId ?? this.batchId,
      productId: productId ?? this.productId,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      unitCostMinor: unitCostMinor ?? this.unitCostMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (unitCostMinor.present) {
      map['unit_cost_minor'] = Variable<int>(unitCostMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductionOutputsCompanion(')
          ..write('id: $id, ')
          ..write('batchId: $batchId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitCostMinor: $unitCostMinor')
          ..write(')'))
        .toString();
  }
}

class $SalesReturnsTable extends SalesReturns
    with TableInfo<$SalesReturnsTable, SalesReturn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesReturnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _returnNoMeta = const VerificationMeta(
    'returnNo',
  );
  @override
  late final GeneratedColumn<String> returnNo = GeneratedColumn<String>(
    'return_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sales_invoices (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMinorMeta = const VerificationMeta(
    'totalMinor',
  );
  @override
  late final GeneratedColumn<int> totalMinor = GeneratedColumn<int>(
    'total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    returnNo,
    invoiceId,
    date,
    totalMinor,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_returns';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesReturn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('return_no')) {
      context.handle(
        _returnNoMeta,
        returnNo.isAcceptableOrUnknown(data['return_no']!, _returnNoMeta),
      );
    } else if (isInserting) {
      context.missing(_returnNoMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total_minor')) {
      context.handle(
        _totalMinorMeta,
        totalMinor.isAcceptableOrUnknown(data['total_minor']!, _totalMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMinorMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesReturn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesReturn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      returnNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_no'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      totalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minor'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SalesReturnsTable createAlias(String alias) {
    return $SalesReturnsTable(attachedDatabase, alias);
  }
}

class SalesReturn extends DataClass implements Insertable<SalesReturn> {
  final String id;
  final String returnNo;
  final String invoiceId;
  final int date;
  final int totalMinor;
  final String notes;
  final int createdAt;
  const SalesReturn({
    required this.id,
    required this.returnNo,
    required this.invoiceId,
    required this.date,
    required this.totalMinor,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['return_no'] = Variable<String>(returnNo);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['date'] = Variable<int>(date);
    map['total_minor'] = Variable<int>(totalMinor);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  SalesReturnsCompanion toCompanion(bool nullToAbsent) {
    return SalesReturnsCompanion(
      id: Value(id),
      returnNo: Value(returnNo),
      invoiceId: Value(invoiceId),
      date: Value(date),
      totalMinor: Value(totalMinor),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory SalesReturn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesReturn(
      id: serializer.fromJson<String>(json['id']),
      returnNo: serializer.fromJson<String>(json['returnNo']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      date: serializer.fromJson<int>(json['date']),
      totalMinor: serializer.fromJson<int>(json['totalMinor']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'returnNo': serializer.toJson<String>(returnNo),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'date': serializer.toJson<int>(date),
      'totalMinor': serializer.toJson<int>(totalMinor),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  SalesReturn copyWith({
    String? id,
    String? returnNo,
    String? invoiceId,
    int? date,
    int? totalMinor,
    String? notes,
    int? createdAt,
  }) => SalesReturn(
    id: id ?? this.id,
    returnNo: returnNo ?? this.returnNo,
    invoiceId: invoiceId ?? this.invoiceId,
    date: date ?? this.date,
    totalMinor: totalMinor ?? this.totalMinor,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  SalesReturn copyWithCompanion(SalesReturnsCompanion data) {
    return SalesReturn(
      id: data.id.present ? data.id.value : this.id,
      returnNo: data.returnNo.present ? data.returnNo.value : this.returnNo,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      date: data.date.present ? data.date.value : this.date,
      totalMinor: data.totalMinor.present
          ? data.totalMinor.value
          : this.totalMinor,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesReturn(')
          ..write('id: $id, ')
          ..write('returnNo: $returnNo, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('date: $date, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, returnNo, invoiceId, date, totalMinor, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesReturn &&
          other.id == this.id &&
          other.returnNo == this.returnNo &&
          other.invoiceId == this.invoiceId &&
          other.date == this.date &&
          other.totalMinor == this.totalMinor &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SalesReturnsCompanion extends UpdateCompanion<SalesReturn> {
  final Value<String> id;
  final Value<String> returnNo;
  final Value<String> invoiceId;
  final Value<int> date;
  final Value<int> totalMinor;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const SalesReturnsCompanion({
    this.id = const Value.absent(),
    this.returnNo = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.date = const Value.absent(),
    this.totalMinor = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SalesReturnsCompanion.insert({
    required String id,
    required String returnNo,
    required String invoiceId,
    required int date,
    required int totalMinor,
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       returnNo = Value(returnNo),
       invoiceId = Value(invoiceId),
       date = Value(date),
       totalMinor = Value(totalMinor),
       createdAt = Value(createdAt);
  static Insertable<SalesReturn> custom({
    Expression<String>? id,
    Expression<String>? returnNo,
    Expression<String>? invoiceId,
    Expression<int>? date,
    Expression<int>? totalMinor,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnNo != null) 'return_no': returnNo,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (date != null) 'date': date,
      if (totalMinor != null) 'total_minor': totalMinor,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SalesReturnsCompanion copyWith({
    Value<String>? id,
    Value<String>? returnNo,
    Value<String>? invoiceId,
    Value<int>? date,
    Value<int>? totalMinor,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return SalesReturnsCompanion(
      id: id ?? this.id,
      returnNo: returnNo ?? this.returnNo,
      invoiceId: invoiceId ?? this.invoiceId,
      date: date ?? this.date,
      totalMinor: totalMinor ?? this.totalMinor,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (returnNo.present) {
      map['return_no'] = Variable<String>(returnNo.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (totalMinor.present) {
      map['total_minor'] = Variable<int>(totalMinor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesReturnsCompanion(')
          ..write('id: $id, ')
          ..write('returnNo: $returnNo, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('date: $date, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SalesReturnItemsTable extends SalesReturnItems
    with TableInfo<$SalesReturnItemsTable, SalesReturnItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesReturnItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _returnIdMeta = const VerificationMeta(
    'returnId',
  );
  @override
  late final GeneratedColumn<String> returnId = GeneratedColumn<String>(
    'return_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sales_returns (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitPriceMinorMeta = const VerificationMeta(
    'unitPriceMinor',
  );
  @override
  late final GeneratedColumn<int> unitPriceMinor = GeneratedColumn<int>(
    'unit_price_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTotalMinorMeta = const VerificationMeta(
    'lineTotalMinor',
  );
  @override
  late final GeneratedColumn<int> lineTotalMinor = GeneratedColumn<int>(
    'line_total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    returnId,
    productId,
    qtyNum,
    qtyDen,
    unitPriceMinor,
    lineTotalMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_return_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesReturnItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('return_id')) {
      context.handle(
        _returnIdMeta,
        returnId.isAcceptableOrUnknown(data['return_id']!, _returnIdMeta),
      );
    } else if (isInserting) {
      context.missing(_returnIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('unit_price_minor')) {
      context.handle(
        _unitPriceMinorMeta,
        unitPriceMinor.isAcceptableOrUnknown(
          data['unit_price_minor']!,
          _unitPriceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMinorMeta);
    }
    if (data.containsKey('line_total_minor')) {
      context.handle(
        _lineTotalMinorMeta,
        lineTotalMinor.isAcceptableOrUnknown(
          data['line_total_minor']!,
          _lineTotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesReturnItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesReturnItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      returnId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      unitPriceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_minor'],
      )!,
      lineTotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total_minor'],
      )!,
    );
  }

  @override
  $SalesReturnItemsTable createAlias(String alias) {
    return $SalesReturnItemsTable(attachedDatabase, alias);
  }
}

class SalesReturnItem extends DataClass implements Insertable<SalesReturnItem> {
  final int id;
  final String returnId;
  final String productId;
  final int qtyNum;
  final int qtyDen;
  final int unitPriceMinor;
  final int lineTotalMinor;
  const SalesReturnItem({
    required this.id,
    required this.returnId,
    required this.productId,
    required this.qtyNum,
    required this.qtyDen,
    required this.unitPriceMinor,
    required this.lineTotalMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['return_id'] = Variable<String>(returnId);
    map['product_id'] = Variable<String>(productId);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['unit_price_minor'] = Variable<int>(unitPriceMinor);
    map['line_total_minor'] = Variable<int>(lineTotalMinor);
    return map;
  }

  SalesReturnItemsCompanion toCompanion(bool nullToAbsent) {
    return SalesReturnItemsCompanion(
      id: Value(id),
      returnId: Value(returnId),
      productId: Value(productId),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      unitPriceMinor: Value(unitPriceMinor),
      lineTotalMinor: Value(lineTotalMinor),
    );
  }

  factory SalesReturnItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesReturnItem(
      id: serializer.fromJson<int>(json['id']),
      returnId: serializer.fromJson<String>(json['returnId']),
      productId: serializer.fromJson<String>(json['productId']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      unitPriceMinor: serializer.fromJson<int>(json['unitPriceMinor']),
      lineTotalMinor: serializer.fromJson<int>(json['lineTotalMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'returnId': serializer.toJson<String>(returnId),
      'productId': serializer.toJson<String>(productId),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'unitPriceMinor': serializer.toJson<int>(unitPriceMinor),
      'lineTotalMinor': serializer.toJson<int>(lineTotalMinor),
    };
  }

  SalesReturnItem copyWith({
    int? id,
    String? returnId,
    String? productId,
    int? qtyNum,
    int? qtyDen,
    int? unitPriceMinor,
    int? lineTotalMinor,
  }) => SalesReturnItem(
    id: id ?? this.id,
    returnId: returnId ?? this.returnId,
    productId: productId ?? this.productId,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
  );
  SalesReturnItem copyWithCompanion(SalesReturnItemsCompanion data) {
    return SalesReturnItem(
      id: data.id.present ? data.id.value : this.id,
      returnId: data.returnId.present ? data.returnId.value : this.returnId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      unitPriceMinor: data.unitPriceMinor.present
          ? data.unitPriceMinor.value
          : this.unitPriceMinor,
      lineTotalMinor: data.lineTotalMinor.present
          ? data.lineTotalMinor.value
          : this.lineTotalMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesReturnItem(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    returnId,
    productId,
    qtyNum,
    qtyDen,
    unitPriceMinor,
    lineTotalMinor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesReturnItem &&
          other.id == this.id &&
          other.returnId == this.returnId &&
          other.productId == this.productId &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.unitPriceMinor == this.unitPriceMinor &&
          other.lineTotalMinor == this.lineTotalMinor);
}

class SalesReturnItemsCompanion extends UpdateCompanion<SalesReturnItem> {
  final Value<int> id;
  final Value<String> returnId;
  final Value<String> productId;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<int> unitPriceMinor;
  final Value<int> lineTotalMinor;
  const SalesReturnItemsCompanion({
    this.id = const Value.absent(),
    this.returnId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.unitPriceMinor = const Value.absent(),
    this.lineTotalMinor = const Value.absent(),
  });
  SalesReturnItemsCompanion.insert({
    this.id = const Value.absent(),
    required String returnId,
    required String productId,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    required int unitPriceMinor,
    required int lineTotalMinor,
  }) : returnId = Value(returnId),
       productId = Value(productId),
       qtyNum = Value(qtyNum),
       unitPriceMinor = Value(unitPriceMinor),
       lineTotalMinor = Value(lineTotalMinor);
  static Insertable<SalesReturnItem> custom({
    Expression<int>? id,
    Expression<String>? returnId,
    Expression<String>? productId,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<int>? unitPriceMinor,
    Expression<int>? lineTotalMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnId != null) 'return_id': returnId,
      if (productId != null) 'product_id': productId,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (unitPriceMinor != null) 'unit_price_minor': unitPriceMinor,
      if (lineTotalMinor != null) 'line_total_minor': lineTotalMinor,
    });
  }

  SalesReturnItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? returnId,
    Value<String>? productId,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<int>? unitPriceMinor,
    Value<int>? lineTotalMinor,
  }) {
    return SalesReturnItemsCompanion(
      id: id ?? this.id,
      returnId: returnId ?? this.returnId,
      productId: productId ?? this.productId,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
      lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (returnId.present) {
      map['return_id'] = Variable<String>(returnId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (unitPriceMinor.present) {
      map['unit_price_minor'] = Variable<int>(unitPriceMinor.value);
    }
    if (lineTotalMinor.present) {
      map['line_total_minor'] = Variable<int>(lineTotalMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesReturnItemsCompanion(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }
}

class $PurchaseReturnsTable extends PurchaseReturns
    with TableInfo<$PurchaseReturnsTable, PurchaseReturn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseReturnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _returnNoMeta = const VerificationMeta(
    'returnNo',
  );
  @override
  late final GeneratedColumn<String> returnNo = GeneratedColumn<String>(
    'return_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_invoices (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMinorMeta = const VerificationMeta(
    'totalMinor',
  );
  @override
  late final GeneratedColumn<int> totalMinor = GeneratedColumn<int>(
    'total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    returnNo,
    invoiceId,
    date,
    totalMinor,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_returns';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseReturn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('return_no')) {
      context.handle(
        _returnNoMeta,
        returnNo.isAcceptableOrUnknown(data['return_no']!, _returnNoMeta),
      );
    } else if (isInserting) {
      context.missing(_returnNoMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total_minor')) {
      context.handle(
        _totalMinorMeta,
        totalMinor.isAcceptableOrUnknown(data['total_minor']!, _totalMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMinorMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseReturn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseReturn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      returnNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_no'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      totalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minor'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PurchaseReturnsTable createAlias(String alias) {
    return $PurchaseReturnsTable(attachedDatabase, alias);
  }
}

class PurchaseReturn extends DataClass implements Insertable<PurchaseReturn> {
  final String id;
  final String returnNo;
  final String invoiceId;
  final int date;
  final int totalMinor;
  final String notes;
  final int createdAt;
  const PurchaseReturn({
    required this.id,
    required this.returnNo,
    required this.invoiceId,
    required this.date,
    required this.totalMinor,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['return_no'] = Variable<String>(returnNo);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['date'] = Variable<int>(date);
    map['total_minor'] = Variable<int>(totalMinor);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  PurchaseReturnsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseReturnsCompanion(
      id: Value(id),
      returnNo: Value(returnNo),
      invoiceId: Value(invoiceId),
      date: Value(date),
      totalMinor: Value(totalMinor),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory PurchaseReturn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseReturn(
      id: serializer.fromJson<String>(json['id']),
      returnNo: serializer.fromJson<String>(json['returnNo']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      date: serializer.fromJson<int>(json['date']),
      totalMinor: serializer.fromJson<int>(json['totalMinor']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'returnNo': serializer.toJson<String>(returnNo),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'date': serializer.toJson<int>(date),
      'totalMinor': serializer.toJson<int>(totalMinor),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  PurchaseReturn copyWith({
    String? id,
    String? returnNo,
    String? invoiceId,
    int? date,
    int? totalMinor,
    String? notes,
    int? createdAt,
  }) => PurchaseReturn(
    id: id ?? this.id,
    returnNo: returnNo ?? this.returnNo,
    invoiceId: invoiceId ?? this.invoiceId,
    date: date ?? this.date,
    totalMinor: totalMinor ?? this.totalMinor,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  PurchaseReturn copyWithCompanion(PurchaseReturnsCompanion data) {
    return PurchaseReturn(
      id: data.id.present ? data.id.value : this.id,
      returnNo: data.returnNo.present ? data.returnNo.value : this.returnNo,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      date: data.date.present ? data.date.value : this.date,
      totalMinor: data.totalMinor.present
          ? data.totalMinor.value
          : this.totalMinor,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReturn(')
          ..write('id: $id, ')
          ..write('returnNo: $returnNo, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('date: $date, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, returnNo, invoiceId, date, totalMinor, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseReturn &&
          other.id == this.id &&
          other.returnNo == this.returnNo &&
          other.invoiceId == this.invoiceId &&
          other.date == this.date &&
          other.totalMinor == this.totalMinor &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class PurchaseReturnsCompanion extends UpdateCompanion<PurchaseReturn> {
  final Value<String> id;
  final Value<String> returnNo;
  final Value<String> invoiceId;
  final Value<int> date;
  final Value<int> totalMinor;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const PurchaseReturnsCompanion({
    this.id = const Value.absent(),
    this.returnNo = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.date = const Value.absent(),
    this.totalMinor = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseReturnsCompanion.insert({
    required String id,
    required String returnNo,
    required String invoiceId,
    required int date,
    required int totalMinor,
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       returnNo = Value(returnNo),
       invoiceId = Value(invoiceId),
       date = Value(date),
       totalMinor = Value(totalMinor),
       createdAt = Value(createdAt);
  static Insertable<PurchaseReturn> custom({
    Expression<String>? id,
    Expression<String>? returnNo,
    Expression<String>? invoiceId,
    Expression<int>? date,
    Expression<int>? totalMinor,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnNo != null) 'return_no': returnNo,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (date != null) 'date': date,
      if (totalMinor != null) 'total_minor': totalMinor,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseReturnsCompanion copyWith({
    Value<String>? id,
    Value<String>? returnNo,
    Value<String>? invoiceId,
    Value<int>? date,
    Value<int>? totalMinor,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return PurchaseReturnsCompanion(
      id: id ?? this.id,
      returnNo: returnNo ?? this.returnNo,
      invoiceId: invoiceId ?? this.invoiceId,
      date: date ?? this.date,
      totalMinor: totalMinor ?? this.totalMinor,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (returnNo.present) {
      map['return_no'] = Variable<String>(returnNo.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (totalMinor.present) {
      map['total_minor'] = Variable<int>(totalMinor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReturnsCompanion(')
          ..write('id: $id, ')
          ..write('returnNo: $returnNo, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('date: $date, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseReturnItemsTable extends PurchaseReturnItems
    with TableInfo<$PurchaseReturnItemsTable, PurchaseReturnItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseReturnItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _returnIdMeta = const VerificationMeta(
    'returnId',
  );
  @override
  late final GeneratedColumn<String> returnId = GeneratedColumn<String>(
    'return_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES purchase_returns (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _qtyNumMeta = const VerificationMeta('qtyNum');
  @override
  late final GeneratedColumn<int> qtyNum = GeneratedColumn<int>(
    'qty_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyDenMeta = const VerificationMeta('qtyDen');
  @override
  late final GeneratedColumn<int> qtyDen = GeneratedColumn<int>(
    'qty_den',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitPriceMinorMeta = const VerificationMeta(
    'unitPriceMinor',
  );
  @override
  late final GeneratedColumn<int> unitPriceMinor = GeneratedColumn<int>(
    'unit_price_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTotalMinorMeta = const VerificationMeta(
    'lineTotalMinor',
  );
  @override
  late final GeneratedColumn<int> lineTotalMinor = GeneratedColumn<int>(
    'line_total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    returnId,
    productId,
    qtyNum,
    qtyDen,
    unitPriceMinor,
    lineTotalMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_return_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseReturnItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('return_id')) {
      context.handle(
        _returnIdMeta,
        returnId.isAcceptableOrUnknown(data['return_id']!, _returnIdMeta),
      );
    } else if (isInserting) {
      context.missing(_returnIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('qty_num')) {
      context.handle(
        _qtyNumMeta,
        qtyNum.isAcceptableOrUnknown(data['qty_num']!, _qtyNumMeta),
      );
    } else if (isInserting) {
      context.missing(_qtyNumMeta);
    }
    if (data.containsKey('qty_den')) {
      context.handle(
        _qtyDenMeta,
        qtyDen.isAcceptableOrUnknown(data['qty_den']!, _qtyDenMeta),
      );
    }
    if (data.containsKey('unit_price_minor')) {
      context.handle(
        _unitPriceMinorMeta,
        unitPriceMinor.isAcceptableOrUnknown(
          data['unit_price_minor']!,
          _unitPriceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMinorMeta);
    }
    if (data.containsKey('line_total_minor')) {
      context.handle(
        _lineTotalMinorMeta,
        lineTotalMinor.isAcceptableOrUnknown(
          data['line_total_minor']!,
          _lineTotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseReturnItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseReturnItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      returnId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      qtyNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_num'],
      )!,
      qtyDen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty_den'],
      )!,
      unitPriceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_minor'],
      )!,
      lineTotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total_minor'],
      )!,
    );
  }

  @override
  $PurchaseReturnItemsTable createAlias(String alias) {
    return $PurchaseReturnItemsTable(attachedDatabase, alias);
  }
}

class PurchaseReturnItem extends DataClass
    implements Insertable<PurchaseReturnItem> {
  final int id;
  final String returnId;
  final String productId;
  final int qtyNum;
  final int qtyDen;
  final int unitPriceMinor;
  final int lineTotalMinor;
  const PurchaseReturnItem({
    required this.id,
    required this.returnId,
    required this.productId,
    required this.qtyNum,
    required this.qtyDen,
    required this.unitPriceMinor,
    required this.lineTotalMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['return_id'] = Variable<String>(returnId);
    map['product_id'] = Variable<String>(productId);
    map['qty_num'] = Variable<int>(qtyNum);
    map['qty_den'] = Variable<int>(qtyDen);
    map['unit_price_minor'] = Variable<int>(unitPriceMinor);
    map['line_total_minor'] = Variable<int>(lineTotalMinor);
    return map;
  }

  PurchaseReturnItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseReturnItemsCompanion(
      id: Value(id),
      returnId: Value(returnId),
      productId: Value(productId),
      qtyNum: Value(qtyNum),
      qtyDen: Value(qtyDen),
      unitPriceMinor: Value(unitPriceMinor),
      lineTotalMinor: Value(lineTotalMinor),
    );
  }

  factory PurchaseReturnItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseReturnItem(
      id: serializer.fromJson<int>(json['id']),
      returnId: serializer.fromJson<String>(json['returnId']),
      productId: serializer.fromJson<String>(json['productId']),
      qtyNum: serializer.fromJson<int>(json['qtyNum']),
      qtyDen: serializer.fromJson<int>(json['qtyDen']),
      unitPriceMinor: serializer.fromJson<int>(json['unitPriceMinor']),
      lineTotalMinor: serializer.fromJson<int>(json['lineTotalMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'returnId': serializer.toJson<String>(returnId),
      'productId': serializer.toJson<String>(productId),
      'qtyNum': serializer.toJson<int>(qtyNum),
      'qtyDen': serializer.toJson<int>(qtyDen),
      'unitPriceMinor': serializer.toJson<int>(unitPriceMinor),
      'lineTotalMinor': serializer.toJson<int>(lineTotalMinor),
    };
  }

  PurchaseReturnItem copyWith({
    int? id,
    String? returnId,
    String? productId,
    int? qtyNum,
    int? qtyDen,
    int? unitPriceMinor,
    int? lineTotalMinor,
  }) => PurchaseReturnItem(
    id: id ?? this.id,
    returnId: returnId ?? this.returnId,
    productId: productId ?? this.productId,
    qtyNum: qtyNum ?? this.qtyNum,
    qtyDen: qtyDen ?? this.qtyDen,
    unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
  );
  PurchaseReturnItem copyWithCompanion(PurchaseReturnItemsCompanion data) {
    return PurchaseReturnItem(
      id: data.id.present ? data.id.value : this.id,
      returnId: data.returnId.present ? data.returnId.value : this.returnId,
      productId: data.productId.present ? data.productId.value : this.productId,
      qtyNum: data.qtyNum.present ? data.qtyNum.value : this.qtyNum,
      qtyDen: data.qtyDen.present ? data.qtyDen.value : this.qtyDen,
      unitPriceMinor: data.unitPriceMinor.present
          ? data.unitPriceMinor.value
          : this.unitPriceMinor,
      lineTotalMinor: data.lineTotalMinor.present
          ? data.lineTotalMinor.value
          : this.lineTotalMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReturnItem(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    returnId,
    productId,
    qtyNum,
    qtyDen,
    unitPriceMinor,
    lineTotalMinor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseReturnItem &&
          other.id == this.id &&
          other.returnId == this.returnId &&
          other.productId == this.productId &&
          other.qtyNum == this.qtyNum &&
          other.qtyDen == this.qtyDen &&
          other.unitPriceMinor == this.unitPriceMinor &&
          other.lineTotalMinor == this.lineTotalMinor);
}

class PurchaseReturnItemsCompanion extends UpdateCompanion<PurchaseReturnItem> {
  final Value<int> id;
  final Value<String> returnId;
  final Value<String> productId;
  final Value<int> qtyNum;
  final Value<int> qtyDen;
  final Value<int> unitPriceMinor;
  final Value<int> lineTotalMinor;
  const PurchaseReturnItemsCompanion({
    this.id = const Value.absent(),
    this.returnId = const Value.absent(),
    this.productId = const Value.absent(),
    this.qtyNum = const Value.absent(),
    this.qtyDen = const Value.absent(),
    this.unitPriceMinor = const Value.absent(),
    this.lineTotalMinor = const Value.absent(),
  });
  PurchaseReturnItemsCompanion.insert({
    this.id = const Value.absent(),
    required String returnId,
    required String productId,
    required int qtyNum,
    this.qtyDen = const Value.absent(),
    required int unitPriceMinor,
    required int lineTotalMinor,
  }) : returnId = Value(returnId),
       productId = Value(productId),
       qtyNum = Value(qtyNum),
       unitPriceMinor = Value(unitPriceMinor),
       lineTotalMinor = Value(lineTotalMinor);
  static Insertable<PurchaseReturnItem> custom({
    Expression<int>? id,
    Expression<String>? returnId,
    Expression<String>? productId,
    Expression<int>? qtyNum,
    Expression<int>? qtyDen,
    Expression<int>? unitPriceMinor,
    Expression<int>? lineTotalMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnId != null) 'return_id': returnId,
      if (productId != null) 'product_id': productId,
      if (qtyNum != null) 'qty_num': qtyNum,
      if (qtyDen != null) 'qty_den': qtyDen,
      if (unitPriceMinor != null) 'unit_price_minor': unitPriceMinor,
      if (lineTotalMinor != null) 'line_total_minor': lineTotalMinor,
    });
  }

  PurchaseReturnItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? returnId,
    Value<String>? productId,
    Value<int>? qtyNum,
    Value<int>? qtyDen,
    Value<int>? unitPriceMinor,
    Value<int>? lineTotalMinor,
  }) {
    return PurchaseReturnItemsCompanion(
      id: id ?? this.id,
      returnId: returnId ?? this.returnId,
      productId: productId ?? this.productId,
      qtyNum: qtyNum ?? this.qtyNum,
      qtyDen: qtyDen ?? this.qtyDen,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
      lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (returnId.present) {
      map['return_id'] = Variable<String>(returnId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (qtyNum.present) {
      map['qty_num'] = Variable<int>(qtyNum.value);
    }
    if (qtyDen.present) {
      map['qty_den'] = Variable<int>(qtyDen.value);
    }
    if (unitPriceMinor.present) {
      map['unit_price_minor'] = Variable<int>(unitPriceMinor.value);
    }
    if (lineTotalMinor.present) {
      map['line_total_minor'] = Variable<int>(lineTotalMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseReturnItemsCompanion(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('productId: $productId, ')
          ..write('qtyNum: $qtyNum, ')
          ..write('qtyDen: $qtyDen, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }
}

class $DocumentSequencesTable extends DocumentSequences
    with TableInfo<$DocumentSequencesTable, DocumentSequence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentSequencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _docTypeMeta = const VerificationMeta(
    'docType',
  );
  @override
  late final GeneratedColumn<String> docType = GeneratedColumn<String>(
    'doc_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prefixMeta = const VerificationMeta('prefix');
  @override
  late final GeneratedColumn<String> prefix = GeneratedColumn<String>(
    'prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextNoMeta = const VerificationMeta('nextNo');
  @override
  late final GeneratedColumn<int> nextNo = GeneratedColumn<int>(
    'next_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [docType, prefix, nextNo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_sequences';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentSequence> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('doc_type')) {
      context.handle(
        _docTypeMeta,
        docType.isAcceptableOrUnknown(data['doc_type']!, _docTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_docTypeMeta);
    }
    if (data.containsKey('prefix')) {
      context.handle(
        _prefixMeta,
        prefix.isAcceptableOrUnknown(data['prefix']!, _prefixMeta),
      );
    } else if (isInserting) {
      context.missing(_prefixMeta);
    }
    if (data.containsKey('next_no')) {
      context.handle(
        _nextNoMeta,
        nextNo.isAcceptableOrUnknown(data['next_no']!, _nextNoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {docType};
  @override
  DocumentSequence map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentSequence(
      docType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doc_type'],
      )!,
      prefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prefix'],
      )!,
      nextNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_no'],
      )!,
    );
  }

  @override
  $DocumentSequencesTable createAlias(String alias) {
    return $DocumentSequencesTable(attachedDatabase, alias);
  }
}

class DocumentSequence extends DataClass
    implements Insertable<DocumentSequence> {
  final String docType;
  final String prefix;
  final int nextNo;
  const DocumentSequence({
    required this.docType,
    required this.prefix,
    required this.nextNo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['doc_type'] = Variable<String>(docType);
    map['prefix'] = Variable<String>(prefix);
    map['next_no'] = Variable<int>(nextNo);
    return map;
  }

  DocumentSequencesCompanion toCompanion(bool nullToAbsent) {
    return DocumentSequencesCompanion(
      docType: Value(docType),
      prefix: Value(prefix),
      nextNo: Value(nextNo),
    );
  }

  factory DocumentSequence.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentSequence(
      docType: serializer.fromJson<String>(json['docType']),
      prefix: serializer.fromJson<String>(json['prefix']),
      nextNo: serializer.fromJson<int>(json['nextNo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'docType': serializer.toJson<String>(docType),
      'prefix': serializer.toJson<String>(prefix),
      'nextNo': serializer.toJson<int>(nextNo),
    };
  }

  DocumentSequence copyWith({String? docType, String? prefix, int? nextNo}) =>
      DocumentSequence(
        docType: docType ?? this.docType,
        prefix: prefix ?? this.prefix,
        nextNo: nextNo ?? this.nextNo,
      );
  DocumentSequence copyWithCompanion(DocumentSequencesCompanion data) {
    return DocumentSequence(
      docType: data.docType.present ? data.docType.value : this.docType,
      prefix: data.prefix.present ? data.prefix.value : this.prefix,
      nextNo: data.nextNo.present ? data.nextNo.value : this.nextNo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentSequence(')
          ..write('docType: $docType, ')
          ..write('prefix: $prefix, ')
          ..write('nextNo: $nextNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(docType, prefix, nextNo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentSequence &&
          other.docType == this.docType &&
          other.prefix == this.prefix &&
          other.nextNo == this.nextNo);
}

class DocumentSequencesCompanion extends UpdateCompanion<DocumentSequence> {
  final Value<String> docType;
  final Value<String> prefix;
  final Value<int> nextNo;
  final Value<int> rowid;
  const DocumentSequencesCompanion({
    this.docType = const Value.absent(),
    this.prefix = const Value.absent(),
    this.nextNo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DocumentSequencesCompanion.insert({
    required String docType,
    required String prefix,
    this.nextNo = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : docType = Value(docType),
       prefix = Value(prefix);
  static Insertable<DocumentSequence> custom({
    Expression<String>? docType,
    Expression<String>? prefix,
    Expression<int>? nextNo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (docType != null) 'doc_type': docType,
      if (prefix != null) 'prefix': prefix,
      if (nextNo != null) 'next_no': nextNo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DocumentSequencesCompanion copyWith({
    Value<String>? docType,
    Value<String>? prefix,
    Value<int>? nextNo,
    Value<int>? rowid,
  }) {
    return DocumentSequencesCompanion(
      docType: docType ?? this.docType,
      prefix: prefix ?? this.prefix,
      nextNo: nextNo ?? this.nextNo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (docType.present) {
      map['doc_type'] = Variable<String>(docType.value);
    }
    if (prefix.present) {
      map['prefix'] = Variable<String>(prefix.value);
    }
    if (nextNo.present) {
      map['next_no'] = Variable<int>(nextNo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentSequencesCompanion(')
          ..write('docType: $docType, ')
          ..write('prefix: $prefix, ')
          ..write('nextNo: $nextNo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupMetaTable extends BackupMeta
    with TableInfo<$BackupMetaTable, BackupMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatVersionMeta = const VerificationMeta(
    'formatVersion',
  );
  @override
  late final GeneratedColumn<int> formatVersion = GeneratedColumn<int>(
    'format_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checksumMeta = const VerificationMeta(
    'checksum',
  );
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
    'checksum',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    formatVersion,
    fileName,
    checksum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('format_version')) {
      context.handle(
        _formatVersionMeta,
        formatVersion.isAcceptableOrUnknown(
          data['format_version']!,
          _formatVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_formatVersionMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('checksum')) {
      context.handle(
        _checksumMeta,
        checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupMetaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      formatVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}format_version'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      checksum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum'],
      )!,
    );
  }

  @override
  $BackupMetaTable createAlias(String alias) {
    return $BackupMetaTable(attachedDatabase, alias);
  }
}

class BackupMetaData extends DataClass implements Insertable<BackupMetaData> {
  final int id;
  final int createdAt;
  final int formatVersion;
  final String fileName;
  final String checksum;
  const BackupMetaData({
    required this.id,
    required this.createdAt,
    required this.formatVersion,
    required this.fileName,
    required this.checksum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<int>(createdAt);
    map['format_version'] = Variable<int>(formatVersion);
    map['file_name'] = Variable<String>(fileName);
    map['checksum'] = Variable<String>(checksum);
    return map;
  }

  BackupMetaCompanion toCompanion(bool nullToAbsent) {
    return BackupMetaCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      formatVersion: Value(formatVersion),
      fileName: Value(fileName),
      checksum: Value(checksum),
    );
  }

  factory BackupMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupMetaData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      formatVersion: serializer.fromJson<int>(json['formatVersion']),
      fileName: serializer.fromJson<String>(json['fileName']),
      checksum: serializer.fromJson<String>(json['checksum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<int>(createdAt),
      'formatVersion': serializer.toJson<int>(formatVersion),
      'fileName': serializer.toJson<String>(fileName),
      'checksum': serializer.toJson<String>(checksum),
    };
  }

  BackupMetaData copyWith({
    int? id,
    int? createdAt,
    int? formatVersion,
    String? fileName,
    String? checksum,
  }) => BackupMetaData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    formatVersion: formatVersion ?? this.formatVersion,
    fileName: fileName ?? this.fileName,
    checksum: checksum ?? this.checksum,
  );
  BackupMetaData copyWithCompanion(BackupMetaCompanion data) {
    return BackupMetaData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      formatVersion: data.formatVersion.present
          ? data.formatVersion.value
          : this.formatVersion,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupMetaData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('formatVersion: $formatVersion, ')
          ..write('fileName: $fileName, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, formatVersion, fileName, checksum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupMetaData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.formatVersion == this.formatVersion &&
          other.fileName == this.fileName &&
          other.checksum == this.checksum);
}

class BackupMetaCompanion extends UpdateCompanion<BackupMetaData> {
  final Value<int> id;
  final Value<int> createdAt;
  final Value<int> formatVersion;
  final Value<String> fileName;
  final Value<String> checksum;
  const BackupMetaCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.formatVersion = const Value.absent(),
    this.fileName = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  BackupMetaCompanion.insert({
    this.id = const Value.absent(),
    required int createdAt,
    required int formatVersion,
    required String fileName,
    this.checksum = const Value.absent(),
  }) : createdAt = Value(createdAt),
       formatVersion = Value(formatVersion),
       fileName = Value(fileName);
  static Insertable<BackupMetaData> custom({
    Expression<int>? id,
    Expression<int>? createdAt,
    Expression<int>? formatVersion,
    Expression<String>? fileName,
    Expression<String>? checksum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (formatVersion != null) 'format_version': formatVersion,
      if (fileName != null) 'file_name': fileName,
      if (checksum != null) 'checksum': checksum,
    });
  }

  BackupMetaCompanion copyWith({
    Value<int>? id,
    Value<int>? createdAt,
    Value<int>? formatVersion,
    Value<String>? fileName,
    Value<String>? checksum,
  }) {
    return BackupMetaCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      formatVersion: formatVersion ?? this.formatVersion,
      fileName: fileName ?? this.fileName,
      checksum: checksum ?? this.checksum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (formatVersion.present) {
      map['format_version'] = Variable<int>(formatVersion.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupMetaCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('formatVersion: $formatVersion, ')
          ..write('fileName: $fileName, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }
}

class $CustomerRemindersTable extends CustomerReminders
    with TableInfo<$CustomerRemindersTable, CustomerReminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerRemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remindAtMeta = const VerificationMeta(
    'remindAt',
  );
  @override
  late final GeneratedColumn<int> remindAt = GeneratedColumn<int>(
    'remind_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<int> done = GeneratedColumn<int>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    remindAt,
    note,
    done,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerReminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('remind_at')) {
      context.handle(
        _remindAtMeta,
        remindAt.isAcceptableOrUnknown(data['remind_at']!, _remindAtMeta),
      );
    } else if (isInserting) {
      context.missing(_remindAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerReminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerReminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      remindAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remind_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      done: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}done'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomerRemindersTable createAlias(String alias) {
    return $CustomerRemindersTable(attachedDatabase, alias);
  }
}

class CustomerReminder extends DataClass
    implements Insertable<CustomerReminder> {
  final int id;

  /// references Customers.id (kept as text; no FK cascade so history survives)
  final String customerId;

  /// ms since epoch
  final int remindAt;
  final String note;

  /// 0 = pending, 1 = done
  final int done;
  final int createdAt;
  const CustomerReminder({
    required this.id,
    required this.customerId,
    required this.remindAt,
    required this.note,
    required this.done,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<String>(customerId);
    map['remind_at'] = Variable<int>(remindAt);
    map['note'] = Variable<String>(note);
    map['done'] = Variable<int>(done);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CustomerRemindersCompanion toCompanion(bool nullToAbsent) {
    return CustomerRemindersCompanion(
      id: Value(id),
      customerId: Value(customerId),
      remindAt: Value(remindAt),
      note: Value(note),
      done: Value(done),
      createdAt: Value(createdAt),
    );
  }

  factory CustomerReminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerReminder(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<String>(json['customerId']),
      remindAt: serializer.fromJson<int>(json['remindAt']),
      note: serializer.fromJson<String>(json['note']),
      done: serializer.fromJson<int>(json['done']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<String>(customerId),
      'remindAt': serializer.toJson<int>(remindAt),
      'note': serializer.toJson<String>(note),
      'done': serializer.toJson<int>(done),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  CustomerReminder copyWith({
    int? id,
    String? customerId,
    int? remindAt,
    String? note,
    int? done,
    int? createdAt,
  }) => CustomerReminder(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    remindAt: remindAt ?? this.remindAt,
    note: note ?? this.note,
    done: done ?? this.done,
    createdAt: createdAt ?? this.createdAt,
  );
  CustomerReminder copyWithCompanion(CustomerRemindersCompanion data) {
    return CustomerReminder(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      remindAt: data.remindAt.present ? data.remindAt.value : this.remindAt,
      note: data.note.present ? data.note.value : this.note,
      done: data.done.present ? data.done.value : this.done,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerReminder(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('remindAt: $remindAt, ')
          ..write('note: $note, ')
          ..write('done: $done, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, customerId, remindAt, note, done, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerReminder &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.remindAt == this.remindAt &&
          other.note == this.note &&
          other.done == this.done &&
          other.createdAt == this.createdAt);
}

class CustomerRemindersCompanion extends UpdateCompanion<CustomerReminder> {
  final Value<int> id;
  final Value<String> customerId;
  final Value<int> remindAt;
  final Value<String> note;
  final Value<int> done;
  final Value<int> createdAt;
  const CustomerRemindersCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.remindAt = const Value.absent(),
    this.note = const Value.absent(),
    this.done = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomerRemindersCompanion.insert({
    this.id = const Value.absent(),
    required String customerId,
    required int remindAt,
    this.note = const Value.absent(),
    this.done = const Value.absent(),
    required int createdAt,
  }) : customerId = Value(customerId),
       remindAt = Value(remindAt),
       createdAt = Value(createdAt);
  static Insertable<CustomerReminder> custom({
    Expression<int>? id,
    Expression<String>? customerId,
    Expression<int>? remindAt,
    Expression<String>? note,
    Expression<int>? done,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (remindAt != null) 'remind_at': remindAt,
      if (note != null) 'note': note,
      if (done != null) 'done': done,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomerRemindersCompanion copyWith({
    Value<int>? id,
    Value<String>? customerId,
    Value<int>? remindAt,
    Value<String>? note,
    Value<int>? done,
    Value<int>? createdAt,
  }) {
    return CustomerRemindersCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      remindAt: remindAt ?? this.remindAt,
      note: note ?? this.note,
      done: done ?? this.done,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (remindAt.present) {
      map['remind_at'] = Variable<int>(remindAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (done.present) {
      map['done'] = Variable<int>(done.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerRemindersCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('remindAt: $remindAt, ')
          ..write('note: $note, ')
          ..write('done: $done, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BackupSettingsTable extends BackupSettings
    with TableInfo<$BackupSettingsTable, BackupSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _googleAccountEmailMeta =
      const VerificationMeta('googleAccountEmail');
  @override
  late final GeneratedColumn<String> googleAccountEmail =
      GeneratedColumn<String>(
        'google_account_email',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _autoBackupEnabledMeta = const VerificationMeta(
    'autoBackupEnabled',
  );
  @override
  late final GeneratedColumn<int> autoBackupEnabled = GeneratedColumn<int>(
    'auto_backup_enabled',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAutoBackupAtMeta = const VerificationMeta(
    'lastAutoBackupAt',
  );
  @override
  late final GeneratedColumn<int> lastAutoBackupAt = GeneratedColumn<int>(
    'last_auto_backup_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _driveFolderIdMeta = const VerificationMeta(
    'driveFolderId',
  );
  @override
  late final GeneratedColumn<String> driveFolderId = GeneratedColumn<String>(
    'drive_folder_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    googleAccountEmail,
    autoBackupEnabled,
    lastAutoBackupAt,
    driveFolderId,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('google_account_email')) {
      context.handle(
        _googleAccountEmailMeta,
        googleAccountEmail.isAcceptableOrUnknown(
          data['google_account_email']!,
          _googleAccountEmailMeta,
        ),
      );
    }
    if (data.containsKey('auto_backup_enabled')) {
      context.handle(
        _autoBackupEnabledMeta,
        autoBackupEnabled.isAcceptableOrUnknown(
          data['auto_backup_enabled']!,
          _autoBackupEnabledMeta,
        ),
      );
    }
    if (data.containsKey('last_auto_backup_at')) {
      context.handle(
        _lastAutoBackupAtMeta,
        lastAutoBackupAt.isAcceptableOrUnknown(
          data['last_auto_backup_at']!,
          _lastAutoBackupAtMeta,
        ),
      );
    }
    if (data.containsKey('drive_folder_id')) {
      context.handle(
        _driveFolderIdMeta,
        driveFolderId.isAcceptableOrUnknown(
          data['drive_folder_id']!,
          _driveFolderIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      googleAccountEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_account_email'],
      )!,
      autoBackupEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}auto_backup_enabled'],
      )!,
      lastAutoBackupAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_auto_backup_at'],
      )!,
      driveFolderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drive_folder_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BackupSettingsTable createAlias(String alias) {
    return $BackupSettingsTable(attachedDatabase, alias);
  }
}

class BackupSetting extends DataClass implements Insertable<BackupSetting> {
  final int id;
  final String googleAccountEmail;

  /// 0/1 — 24h auto-backup enabled
  final int autoBackupEnabled;

  /// ms since epoch of last successful auto-backup; 0 = never
  final int lastAutoBackupAt;
  final String driveFolderId;
  final int updatedAt;
  const BackupSetting({
    required this.id,
    required this.googleAccountEmail,
    required this.autoBackupEnabled,
    required this.lastAutoBackupAt,
    required this.driveFolderId,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['google_account_email'] = Variable<String>(googleAccountEmail);
    map['auto_backup_enabled'] = Variable<int>(autoBackupEnabled);
    map['last_auto_backup_at'] = Variable<int>(lastAutoBackupAt);
    map['drive_folder_id'] = Variable<String>(driveFolderId);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  BackupSettingsCompanion toCompanion(bool nullToAbsent) {
    return BackupSettingsCompanion(
      id: Value(id),
      googleAccountEmail: Value(googleAccountEmail),
      autoBackupEnabled: Value(autoBackupEnabled),
      lastAutoBackupAt: Value(lastAutoBackupAt),
      driveFolderId: Value(driveFolderId),
      updatedAt: Value(updatedAt),
    );
  }

  factory BackupSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupSetting(
      id: serializer.fromJson<int>(json['id']),
      googleAccountEmail: serializer.fromJson<String>(
        json['googleAccountEmail'],
      ),
      autoBackupEnabled: serializer.fromJson<int>(json['autoBackupEnabled']),
      lastAutoBackupAt: serializer.fromJson<int>(json['lastAutoBackupAt']),
      driveFolderId: serializer.fromJson<String>(json['driveFolderId']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'googleAccountEmail': serializer.toJson<String>(googleAccountEmail),
      'autoBackupEnabled': serializer.toJson<int>(autoBackupEnabled),
      'lastAutoBackupAt': serializer.toJson<int>(lastAutoBackupAt),
      'driveFolderId': serializer.toJson<String>(driveFolderId),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  BackupSetting copyWith({
    int? id,
    String? googleAccountEmail,
    int? autoBackupEnabled,
    int? lastAutoBackupAt,
    String? driveFolderId,
    int? updatedAt,
  }) => BackupSetting(
    id: id ?? this.id,
    googleAccountEmail: googleAccountEmail ?? this.googleAccountEmail,
    autoBackupEnabled: autoBackupEnabled ?? this.autoBackupEnabled,
    lastAutoBackupAt: lastAutoBackupAt ?? this.lastAutoBackupAt,
    driveFolderId: driveFolderId ?? this.driveFolderId,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BackupSetting copyWithCompanion(BackupSettingsCompanion data) {
    return BackupSetting(
      id: data.id.present ? data.id.value : this.id,
      googleAccountEmail: data.googleAccountEmail.present
          ? data.googleAccountEmail.value
          : this.googleAccountEmail,
      autoBackupEnabled: data.autoBackupEnabled.present
          ? data.autoBackupEnabled.value
          : this.autoBackupEnabled,
      lastAutoBackupAt: data.lastAutoBackupAt.present
          ? data.lastAutoBackupAt.value
          : this.lastAutoBackupAt,
      driveFolderId: data.driveFolderId.present
          ? data.driveFolderId.value
          : this.driveFolderId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupSetting(')
          ..write('id: $id, ')
          ..write('googleAccountEmail: $googleAccountEmail, ')
          ..write('autoBackupEnabled: $autoBackupEnabled, ')
          ..write('lastAutoBackupAt: $lastAutoBackupAt, ')
          ..write('driveFolderId: $driveFolderId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    googleAccountEmail,
    autoBackupEnabled,
    lastAutoBackupAt,
    driveFolderId,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupSetting &&
          other.id == this.id &&
          other.googleAccountEmail == this.googleAccountEmail &&
          other.autoBackupEnabled == this.autoBackupEnabled &&
          other.lastAutoBackupAt == this.lastAutoBackupAt &&
          other.driveFolderId == this.driveFolderId &&
          other.updatedAt == this.updatedAt);
}

class BackupSettingsCompanion extends UpdateCompanion<BackupSetting> {
  final Value<int> id;
  final Value<String> googleAccountEmail;
  final Value<int> autoBackupEnabled;
  final Value<int> lastAutoBackupAt;
  final Value<String> driveFolderId;
  final Value<int> updatedAt;
  const BackupSettingsCompanion({
    this.id = const Value.absent(),
    this.googleAccountEmail = const Value.absent(),
    this.autoBackupEnabled = const Value.absent(),
    this.lastAutoBackupAt = const Value.absent(),
    this.driveFolderId = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BackupSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.googleAccountEmail = const Value.absent(),
    this.autoBackupEnabled = const Value.absent(),
    this.lastAutoBackupAt = const Value.absent(),
    this.driveFolderId = const Value.absent(),
    required int updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<BackupSetting> custom({
    Expression<int>? id,
    Expression<String>? googleAccountEmail,
    Expression<int>? autoBackupEnabled,
    Expression<int>? lastAutoBackupAt,
    Expression<String>? driveFolderId,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (googleAccountEmail != null)
        'google_account_email': googleAccountEmail,
      if (autoBackupEnabled != null) 'auto_backup_enabled': autoBackupEnabled,
      if (lastAutoBackupAt != null) 'last_auto_backup_at': lastAutoBackupAt,
      if (driveFolderId != null) 'drive_folder_id': driveFolderId,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BackupSettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? googleAccountEmail,
    Value<int>? autoBackupEnabled,
    Value<int>? lastAutoBackupAt,
    Value<String>? driveFolderId,
    Value<int>? updatedAt,
  }) {
    return BackupSettingsCompanion(
      id: id ?? this.id,
      googleAccountEmail: googleAccountEmail ?? this.googleAccountEmail,
      autoBackupEnabled: autoBackupEnabled ?? this.autoBackupEnabled,
      lastAutoBackupAt: lastAutoBackupAt ?? this.lastAutoBackupAt,
      driveFolderId: driveFolderId ?? this.driveFolderId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (googleAccountEmail.present) {
      map['google_account_email'] = Variable<String>(googleAccountEmail.value);
    }
    if (autoBackupEnabled.present) {
      map['auto_backup_enabled'] = Variable<int>(autoBackupEnabled.value);
    }
    if (lastAutoBackupAt.present) {
      map['last_auto_backup_at'] = Variable<int>(lastAutoBackupAt.value);
    }
    if (driveFolderId.present) {
      map['drive_folder_id'] = Variable<String>(driveFolderId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupSettingsCompanion(')
          ..write('id: $id, ')
          ..write('googleAccountEmail: $googleAccountEmail, ')
          ..write('autoBackupEnabled: $autoBackupEnabled, ')
          ..write('lastAutoBackupAt: $lastAutoBackupAt, ')
          ..write('driveFolderId: $driveFolderId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BusinessSettingsTable businessSettings = $BusinessSettingsTable(
    this,
  );
  late final $UnitsTable units = $UnitsTable(this);
  late final $UnitConversionsTable unitConversions = $UnitConversionsTable(
    this,
  );
  late final $ProductsTable products = $ProductsTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $CashAccountsTable cashAccounts = $CashAccountsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $LedgerEntriesTable ledgerEntries = $LedgerEntriesTable(this);
  late final $SalesInvoicesTable salesInvoices = $SalesInvoicesTable(this);
  late final $SalesInvoiceItemsTable salesInvoiceItems =
      $SalesInvoiceItemsTable(this);
  late final $PurchaseInvoicesTable purchaseInvoices = $PurchaseInvoicesTable(
    this,
  );
  late final $PurchaseInvoiceItemsTable purchaseInvoiceItems =
      $PurchaseInvoiceItemsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $PaymentAllocationsTable paymentAllocations =
      $PaymentAllocationsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $IncomeRecordsTable incomeRecords = $IncomeRecordsTable(this);
  late final $AccountTransfersTable accountTransfers = $AccountTransfersTable(
    this,
  );
  late final $InventoryMovementsTable inventoryMovements =
      $InventoryMovementsTable(this);
  late final $ProductionBatchesTable productionBatches =
      $ProductionBatchesTable(this);
  late final $ProductionInputsTable productionInputs = $ProductionInputsTable(
    this,
  );
  late final $ProductionOutputsTable productionOutputs =
      $ProductionOutputsTable(this);
  late final $SalesReturnsTable salesReturns = $SalesReturnsTable(this);
  late final $SalesReturnItemsTable salesReturnItems = $SalesReturnItemsTable(
    this,
  );
  late final $PurchaseReturnsTable purchaseReturns = $PurchaseReturnsTable(
    this,
  );
  late final $PurchaseReturnItemsTable purchaseReturnItems =
      $PurchaseReturnItemsTable(this);
  late final $DocumentSequencesTable documentSequences =
      $DocumentSequencesTable(this);
  late final $BackupMetaTable backupMeta = $BackupMetaTable(this);
  late final $CustomerRemindersTable customerReminders =
      $CustomerRemindersTable(this);
  late final $BackupSettingsTable backupSettings = $BackupSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    businessSettings,
    units,
    unitConversions,
    products,
    customers,
    suppliers,
    cashAccounts,
    transactions,
    ledgerEntries,
    salesInvoices,
    salesInvoiceItems,
    purchaseInvoices,
    purchaseInvoiceItems,
    payments,
    paymentAllocations,
    expenses,
    incomeRecords,
    accountTransfers,
    inventoryMovements,
    productionBatches,
    productionInputs,
    productionOutputs,
    salesReturns,
    salesReturnItems,
    purchaseReturns,
    purchaseReturnItems,
    documentSequences,
    backupMeta,
    customerReminders,
    backupSettings,
  ];
}

typedef $$BusinessSettingsTableCreateCompanionBuilder =
    BusinessSettingsCompanion Function({
      Value<int> id,
      Value<String> businessName,
      Value<String> address,
      Value<String> phone,
      Value<String> language,
      Value<String> themeMode,
      Value<String> salePrefix,
      Value<String> purchasePrefix,
      Value<String> paymentPrefix,
      Value<String> batchPrefix,
      Value<String> negativeStock,
      Value<bool> onboarded,
      required int createdAt,
      required int updatedAt,
    });
typedef $$BusinessSettingsTableUpdateCompanionBuilder =
    BusinessSettingsCompanion Function({
      Value<int> id,
      Value<String> businessName,
      Value<String> address,
      Value<String> phone,
      Value<String> language,
      Value<String> themeMode,
      Value<String> salePrefix,
      Value<String> purchasePrefix,
      Value<String> paymentPrefix,
      Value<String> batchPrefix,
      Value<String> negativeStock,
      Value<bool> onboarded,
      Value<int> createdAt,
      Value<int> updatedAt,
    });

class $$BusinessSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessSettingsTable> {
  $$BusinessSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get salePrefix => $composableBuilder(
    column: $table.salePrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchasePrefix => $composableBuilder(
    column: $table.purchasePrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentPrefix => $composableBuilder(
    column: $table.paymentPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchPrefix => $composableBuilder(
    column: $table.batchPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get negativeStock => $composableBuilder(
    column: $table.negativeStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboarded => $composableBuilder(
    column: $table.onboarded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessSettingsTable> {
  $$BusinessSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get salePrefix => $composableBuilder(
    column: $table.salePrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchasePrefix => $composableBuilder(
    column: $table.purchasePrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentPrefix => $composableBuilder(
    column: $table.paymentPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchPrefix => $composableBuilder(
    column: $table.batchPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get negativeStock => $composableBuilder(
    column: $table.negativeStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboarded => $composableBuilder(
    column: $table.onboarded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessSettingsTable> {
  $$BusinessSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get salePrefix => $composableBuilder(
    column: $table.salePrefix,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchasePrefix => $composableBuilder(
    column: $table.purchasePrefix,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentPrefix => $composableBuilder(
    column: $table.paymentPrefix,
    builder: (column) => column,
  );

  GeneratedColumn<String> get batchPrefix => $composableBuilder(
    column: $table.batchPrefix,
    builder: (column) => column,
  );

  GeneratedColumn<String> get negativeStock => $composableBuilder(
    column: $table.negativeStock,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboarded =>
      $composableBuilder(column: $table.onboarded, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BusinessSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessSettingsTable,
          BusinessSetting,
          $$BusinessSettingsTableFilterComposer,
          $$BusinessSettingsTableOrderingComposer,
          $$BusinessSettingsTableAnnotationComposer,
          $$BusinessSettingsTableCreateCompanionBuilder,
          $$BusinessSettingsTableUpdateCompanionBuilder,
          (
            BusinessSetting,
            BaseReferences<
              _$AppDatabase,
              $BusinessSettingsTable,
              BusinessSetting
            >,
          ),
          BusinessSetting,
          PrefetchHooks Function()
        > {
  $$BusinessSettingsTableTableManager(
    _$AppDatabase db,
    $BusinessSettingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> salePrefix = const Value.absent(),
                Value<String> purchasePrefix = const Value.absent(),
                Value<String> paymentPrefix = const Value.absent(),
                Value<String> batchPrefix = const Value.absent(),
                Value<String> negativeStock = const Value.absent(),
                Value<bool> onboarded = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => BusinessSettingsCompanion(
                id: id,
                businessName: businessName,
                address: address,
                phone: phone,
                language: language,
                themeMode: themeMode,
                salePrefix: salePrefix,
                purchasePrefix: purchasePrefix,
                paymentPrefix: paymentPrefix,
                batchPrefix: batchPrefix,
                negativeStock: negativeStock,
                onboarded: onboarded,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> salePrefix = const Value.absent(),
                Value<String> purchasePrefix = const Value.absent(),
                Value<String> paymentPrefix = const Value.absent(),
                Value<String> batchPrefix = const Value.absent(),
                Value<String> negativeStock = const Value.absent(),
                Value<bool> onboarded = const Value.absent(),
                required int createdAt,
                required int updatedAt,
              }) => BusinessSettingsCompanion.insert(
                id: id,
                businessName: businessName,
                address: address,
                phone: phone,
                language: language,
                themeMode: themeMode,
                salePrefix: salePrefix,
                purchasePrefix: purchasePrefix,
                paymentPrefix: paymentPrefix,
                batchPrefix: batchPrefix,
                negativeStock: negativeStock,
                onboarded: onboarded,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BusinessSettingsTable, BusinessSetting>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $BusinessSettingsTable,
                    BusinessSetting
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BusinessSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessSettingsTable,
      BusinessSetting,
      $$BusinessSettingsTableFilterComposer,
      $$BusinessSettingsTableOrderingComposer,
      $$BusinessSettingsTableAnnotationComposer,
      $$BusinessSettingsTableCreateCompanionBuilder,
      $$BusinessSettingsTableUpdateCompanionBuilder,
      (
        BusinessSetting,
        BaseReferences<_$AppDatabase, $BusinessSettingsTable, BusinessSetting>,
      ),
      BusinessSetting,
      PrefetchHooks Function()
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      required String id,
      required String nameEn,
      required String nameUr,
      required String symbol,
      Value<int> rowid,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<String> id,
      Value<String> nameEn,
      Value<String> nameUr,
      Value<String> symbol,
      Value<int> rowid,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, Unit> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: 'units__id__products__base_unit_id',
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.baseUnitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SalesInvoiceItemsTable, List<SalesInvoiceItem>>
  _salesInvoiceItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.salesInvoiceItems,
        aliasName: 'units__id__sales_invoice_items__unit_id',
      );

  $$SalesInvoiceItemsTableProcessedTableManager get salesInvoiceItemsRefs {
    final manager = $$SalesInvoiceItemsTableTableManager(
      $_db,
      $_db.salesInvoiceItems,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _salesInvoiceItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PurchaseInvoiceItemsTable,
    List<PurchaseInvoiceItem>
  >
  _purchaseInvoiceItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseInvoiceItems,
        aliasName: 'units__id__purchase_invoice_items__unit_id',
      );

  $$PurchaseInvoiceItemsTableProcessedTableManager
  get purchaseInvoiceItemsRefs {
    final manager = $$PurchaseInvoiceItemsTableTableManager(
      $_db,
      $_db.purchaseInvoiceItems,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseInvoiceItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameUr => $composableBuilder(
    column: $table.nameUr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.baseUnitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> salesInvoiceItemsRefs(
    Expression<bool> Function($$SalesInvoiceItemsTableFilterComposer f) f,
  ) {
    final $$SalesInvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesInvoiceItems,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.salesInvoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> purchaseInvoiceItemsRefs(
    Expression<bool> Function($$PurchaseInvoiceItemsTableFilterComposer f) f,
  ) {
    final $$PurchaseInvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseInvoiceItems,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseInvoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameUr => $composableBuilder(
    column: $table.nameUr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nameUr =>
      $composableBuilder(column: $table.nameUr, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.baseUnitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> salesInvoiceItemsRefs<T extends Object>(
    Expression<T> Function($$SalesInvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$SalesInvoiceItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.salesInvoiceItems,
          getReferencedColumn: (t) => t.unitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SalesInvoiceItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.salesInvoiceItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> purchaseInvoiceItemsRefs<T extends Object>(
    Expression<T> Function($$PurchaseInvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$PurchaseInvoiceItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseInvoiceItems,
          getReferencedColumn: (t) => t.unitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseInvoiceItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseInvoiceItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          Unit,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (Unit, $$UnitsTableReferences),
          Unit,
          PrefetchHooks Function({
            bool productsRefs,
            bool salesInvoiceItemsRefs,
            bool purchaseInvoiceItemsRefs,
          })
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> nameUr = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                nameEn: nameEn,
                nameUr: nameUr,
                symbol: symbol,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nameEn,
                required String nameUr,
                required String symbol,
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion.insert(
                id: id,
                nameEn: nameEn,
                nameUr: nameUr,
                symbol: symbol,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UnitsTable, Unit>(table),
                  $$UnitsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                productsRefs = false,
                salesInvoiceItemsRefs = false,
                purchaseInvoiceItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productsRefs) db.products,
                    if (salesInvoiceItemsRefs) db.salesInvoiceItems,
                    if (purchaseInvoiceItemsRefs) db.purchaseInvoiceItems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productsRefs)
                        await $_getPrefetchedData<Unit, $UnitsTable, Product>(
                          currentTable: table,
                          referencedTable: $$UnitsTableReferences
                              ._productsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnitsTableReferences(
                                db,
                                table,
                                p0,
                              ).productsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.baseUnitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (salesInvoiceItemsRefs)
                        await $_getPrefetchedData<
                          Unit,
                          $UnitsTable,
                          SalesInvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$UnitsTableReferences
                              ._salesInvoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnitsTableReferences(
                                db,
                                table,
                                p0,
                              ).salesInvoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (purchaseInvoiceItemsRefs)
                        await $_getPrefetchedData<
                          Unit,
                          $UnitsTable,
                          PurchaseInvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$UnitsTableReferences
                              ._purchaseInvoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnitsTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseInvoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unitId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      Unit,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (Unit, $$UnitsTableReferences),
      Unit,
      PrefetchHooks Function({
        bool productsRefs,
        bool salesInvoiceItemsRefs,
        bool purchaseInvoiceItemsRefs,
      })
    >;
typedef $$UnitConversionsTableCreateCompanionBuilder =
    UnitConversionsCompanion Function({
      Value<int> id,
      required String fromUnitId,
      required String toUnitId,
      required int factorNum,
      required int factorDen,
    });
typedef $$UnitConversionsTableUpdateCompanionBuilder =
    UnitConversionsCompanion Function({
      Value<int> id,
      Value<String> fromUnitId,
      Value<String> toUnitId,
      Value<int> factorNum,
      Value<int> factorDen,
    });

final class $$UnitConversionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $UnitConversionsTable, UnitConversion> {
  $$UnitConversionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UnitsTable _fromUnitIdTable(_$AppDatabase db) =>
      db.units.createAlias('unit_conversions__from_unit_id__units__id');

  $$UnitsTableProcessedTableManager get fromUnitId {
    final $_column = $_itemColumn<String>('from_unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromUnitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UnitsTable _toUnitIdTable(_$AppDatabase db) =>
      db.units.createAlias('unit_conversions__to_unit_id__units__id');

  $$UnitsTableProcessedTableManager get toUnitId {
    final $_column = $_itemColumn<String>('to_unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toUnitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnitConversionsTableFilterComposer
    extends Composer<_$AppDatabase, $UnitConversionsTable> {
  $$UnitConversionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get factorNum => $composableBuilder(
    column: $table.factorNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get factorDen => $composableBuilder(
    column: $table.factorDen,
    builder: (column) => ColumnFilters(column),
  );

  $$UnitsTableFilterComposer get fromUnitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableFilterComposer get toUnitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitConversionsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitConversionsTable> {
  $$UnitConversionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get factorNum => $composableBuilder(
    column: $table.factorNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get factorDen => $composableBuilder(
    column: $table.factorDen,
    builder: (column) => ColumnOrderings(column),
  );

  $$UnitsTableOrderingComposer get fromUnitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableOrderingComposer get toUnitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitConversionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitConversionsTable> {
  $$UnitConversionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get factorNum =>
      $composableBuilder(column: $table.factorNum, builder: (column) => column);

  GeneratedColumn<int> get factorDen =>
      $composableBuilder(column: $table.factorDen, builder: (column) => column);

  $$UnitsTableAnnotationComposer get fromUnitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableAnnotationComposer get toUnitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitConversionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitConversionsTable,
          UnitConversion,
          $$UnitConversionsTableFilterComposer,
          $$UnitConversionsTableOrderingComposer,
          $$UnitConversionsTableAnnotationComposer,
          $$UnitConversionsTableCreateCompanionBuilder,
          $$UnitConversionsTableUpdateCompanionBuilder,
          (UnitConversion, $$UnitConversionsTableReferences),
          UnitConversion,
          PrefetchHooks Function({bool fromUnitId, bool toUnitId})
        > {
  $$UnitConversionsTableTableManager(
    _$AppDatabase db,
    $UnitConversionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitConversionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitConversionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitConversionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fromUnitId = const Value.absent(),
                Value<String> toUnitId = const Value.absent(),
                Value<int> factorNum = const Value.absent(),
                Value<int> factorDen = const Value.absent(),
              }) => UnitConversionsCompanion(
                id: id,
                fromUnitId: fromUnitId,
                toUnitId: toUnitId,
                factorNum: factorNum,
                factorDen: factorDen,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fromUnitId,
                required String toUnitId,
                required int factorNum,
                required int factorDen,
              }) => UnitConversionsCompanion.insert(
                id: id,
                fromUnitId: fromUnitId,
                toUnitId: toUnitId,
                factorNum: factorNum,
                factorDen: factorDen,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UnitConversionsTable, UnitConversion>(table),
                  $$UnitConversionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({fromUnitId = false, toUnitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (fromUnitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.fromUnitId,
                                referencedTable:
                                    $$UnitConversionsTableReferences
                                        ._fromUnitIdTable(db),
                                referencedColumn:
                                    $$UnitConversionsTableReferences
                                        ._fromUnitIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (toUnitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.toUnitId,
                                referencedTable:
                                    $$UnitConversionsTableReferences
                                        ._toUnitIdTable(db),
                                referencedColumn:
                                    $$UnitConversionsTableReferences
                                        ._toUnitIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UnitConversionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitConversionsTable,
      UnitConversion,
      $$UnitConversionsTableFilterComposer,
      $$UnitConversionsTableOrderingComposer,
      $$UnitConversionsTableAnnotationComposer,
      $$UnitConversionsTableCreateCompanionBuilder,
      $$UnitConversionsTableUpdateCompanionBuilder,
      (UnitConversion, $$UnitConversionsTableReferences),
      UnitConversion,
      PrefetchHooks Function({bool fromUnitId, bool toUnitId})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required String name,
      required String category,
      required String baseUnitId,
      Value<int> purchasePrice,
      Value<int> salePrice,
      Value<int> reorderNum,
      Value<int> reorderDen,
      Value<bool> active,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<String> baseUnitId,
      Value<int> purchasePrice,
      Value<int> salePrice,
      Value<int> reorderNum,
      Value<int> reorderDen,
      Value<bool> active,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UnitsTable _baseUnitIdTable(_$AppDatabase db) =>
      db.units.createAlias('products__base_unit_id__units__id');

  $$UnitsTableProcessedTableManager get baseUnitId {
    final $_column = $_itemColumn<String>('base_unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_baseUnitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SalesInvoiceItemsTable, List<SalesInvoiceItem>>
  _salesInvoiceItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.salesInvoiceItems,
        aliasName: 'products__id__sales_invoice_items__product_id',
      );

  $$SalesInvoiceItemsTableProcessedTableManager get salesInvoiceItemsRefs {
    final manager = $$SalesInvoiceItemsTableTableManager(
      $_db,
      $_db.salesInvoiceItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _salesInvoiceItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PurchaseInvoiceItemsTable,
    List<PurchaseInvoiceItem>
  >
  _purchaseInvoiceItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseInvoiceItems,
        aliasName: 'products__id__purchase_invoice_items__product_id',
      );

  $$PurchaseInvoiceItemsTableProcessedTableManager
  get purchaseInvoiceItemsRefs {
    final manager = $$PurchaseInvoiceItemsTableTableManager(
      $_db,
      $_db.purchaseInvoiceItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseInvoiceItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InventoryMovementsTable, List<InventoryMovement>>
  _inventoryMovementsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.inventoryMovements,
        aliasName: 'products__id__inventory_movements__product_id',
      );

  $$InventoryMovementsTableProcessedTableManager get inventoryMovementsRefs {
    final manager = $$InventoryMovementsTableTableManager(
      $_db,
      $_db.inventoryMovements,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _inventoryMovementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductionInputsTable, List<ProductionInput>>
  _productionInputsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productionInputs,
    aliasName: 'products__id__production_inputs__product_id',
  );

  $$ProductionInputsTableProcessedTableManager get productionInputsRefs {
    final manager = $$ProductionInputsTableTableManager(
      $_db,
      $_db.productionInputs,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productionInputsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductionOutputsTable, List<ProductionOutput>>
  _productionOutputsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productionOutputs,
        aliasName: 'products__id__production_outputs__product_id',
      );

  $$ProductionOutputsTableProcessedTableManager get productionOutputsRefs {
    final manager = $$ProductionOutputsTableTableManager(
      $_db,
      $_db.productionOutputs,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productionOutputsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SalesReturnItemsTable, List<SalesReturnItem>>
  _salesReturnItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.salesReturnItems,
    aliasName: 'products__id__sales_return_items__product_id',
  );

  $$SalesReturnItemsTableProcessedTableManager get salesReturnItemsRefs {
    final manager = $$SalesReturnItemsTableTableManager(
      $_db,
      $_db.salesReturnItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _salesReturnItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PurchaseReturnItemsTable,
    List<PurchaseReturnItem>
  >
  _purchaseReturnItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseReturnItems,
        aliasName: 'products__id__purchase_return_items__product_id',
      );

  $$PurchaseReturnItemsTableProcessedTableManager get purchaseReturnItemsRefs {
    final manager = $$PurchaseReturnItemsTableTableManager(
      $_db,
      $_db.purchaseReturnItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseReturnItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reorderNum => $composableBuilder(
    column: $table.reorderNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reorderDen => $composableBuilder(
    column: $table.reorderDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UnitsTableFilterComposer get baseUnitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baseUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> salesInvoiceItemsRefs(
    Expression<bool> Function($$SalesInvoiceItemsTableFilterComposer f) f,
  ) {
    final $$SalesInvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesInvoiceItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.salesInvoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> purchaseInvoiceItemsRefs(
    Expression<bool> Function($$PurchaseInvoiceItemsTableFilterComposer f) f,
  ) {
    final $$PurchaseInvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseInvoiceItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseInvoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> inventoryMovementsRefs(
    Expression<bool> Function($$InventoryMovementsTableFilterComposer f) f,
  ) {
    final $$InventoryMovementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryMovements,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryMovementsTableFilterComposer(
            $db: $db,
            $table: $db.inventoryMovements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productionInputsRefs(
    Expression<bool> Function($$ProductionInputsTableFilterComposer f) f,
  ) {
    final $$ProductionInputsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productionInputs,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionInputsTableFilterComposer(
            $db: $db,
            $table: $db.productionInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productionOutputsRefs(
    Expression<bool> Function($$ProductionOutputsTableFilterComposer f) f,
  ) {
    final $$ProductionOutputsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productionOutputs,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionOutputsTableFilterComposer(
            $db: $db,
            $table: $db.productionOutputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> salesReturnItemsRefs(
    Expression<bool> Function($$SalesReturnItemsTableFilterComposer f) f,
  ) {
    final $$SalesReturnItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesReturnItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnItemsTableFilterComposer(
            $db: $db,
            $table: $db.salesReturnItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> purchaseReturnItemsRefs(
    Expression<bool> Function($$PurchaseReturnItemsTableFilterComposer f) f,
  ) {
    final $$PurchaseReturnItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseReturnItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnItemsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseReturnItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reorderNum => $composableBuilder(
    column: $table.reorderNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reorderDen => $composableBuilder(
    column: $table.reorderDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UnitsTableOrderingComposer get baseUnitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baseUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<int> get reorderNum => $composableBuilder(
    column: $table.reorderNum,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reorderDen => $composableBuilder(
    column: $table.reorderDen,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UnitsTableAnnotationComposer get baseUnitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baseUnitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> salesInvoiceItemsRefs<T extends Object>(
    Expression<T> Function($$SalesInvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$SalesInvoiceItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.salesInvoiceItems,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SalesInvoiceItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.salesInvoiceItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> purchaseInvoiceItemsRefs<T extends Object>(
    Expression<T> Function($$PurchaseInvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$PurchaseInvoiceItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseInvoiceItems,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseInvoiceItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseInvoiceItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> inventoryMovementsRefs<T extends Object>(
    Expression<T> Function($$InventoryMovementsTableAnnotationComposer a) f,
  ) {
    final $$InventoryMovementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.inventoryMovements,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InventoryMovementsTableAnnotationComposer(
                $db: $db,
                $table: $db.inventoryMovements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> productionInputsRefs<T extends Object>(
    Expression<T> Function($$ProductionInputsTableAnnotationComposer a) f,
  ) {
    final $$ProductionInputsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productionInputs,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionInputsTableAnnotationComposer(
            $db: $db,
            $table: $db.productionInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productionOutputsRefs<T extends Object>(
    Expression<T> Function($$ProductionOutputsTableAnnotationComposer a) f,
  ) {
    final $$ProductionOutputsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productionOutputs,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductionOutputsTableAnnotationComposer(
                $db: $db,
                $table: $db.productionOutputs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> salesReturnItemsRefs<T extends Object>(
    Expression<T> Function($$SalesReturnItemsTableAnnotationComposer a) f,
  ) {
    final $$SalesReturnItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesReturnItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.salesReturnItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> purchaseReturnItemsRefs<T extends Object>(
    Expression<T> Function($$PurchaseReturnItemsTableAnnotationComposer a) f,
  ) {
    final $$PurchaseReturnItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseReturnItems,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseReturnItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseReturnItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({
            bool baseUnitId,
            bool salesInvoiceItemsRefs,
            bool purchaseInvoiceItemsRefs,
            bool inventoryMovementsRefs,
            bool productionInputsRefs,
            bool productionOutputsRefs,
            bool salesReturnItemsRefs,
            bool purchaseReturnItemsRefs,
          })
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> baseUnitId = const Value.absent(),
                Value<int> purchasePrice = const Value.absent(),
                Value<int> salePrice = const Value.absent(),
                Value<int> reorderNum = const Value.absent(),
                Value<int> reorderDen = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                name: name,
                category: category,
                baseUnitId: baseUnitId,
                purchasePrice: purchasePrice,
                salePrice: salePrice,
                reorderNum: reorderNum,
                reorderDen: reorderDen,
                active: active,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                required String baseUnitId,
                Value<int> purchasePrice = const Value.absent(),
                Value<int> salePrice = const Value.absent(),
                Value<int> reorderNum = const Value.absent(),
                Value<int> reorderDen = const Value.absent(),
                Value<bool> active = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                name: name,
                category: category,
                baseUnitId: baseUnitId,
                purchasePrice: purchasePrice,
                salePrice: salePrice,
                reorderNum: reorderNum,
                reorderDen: reorderDen,
                active: active,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductsTable, Product>(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                baseUnitId = false,
                salesInvoiceItemsRefs = false,
                purchaseInvoiceItemsRefs = false,
                inventoryMovementsRefs = false,
                productionInputsRefs = false,
                productionOutputsRefs = false,
                salesReturnItemsRefs = false,
                purchaseReturnItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (salesInvoiceItemsRefs) db.salesInvoiceItems,
                    if (purchaseInvoiceItemsRefs) db.purchaseInvoiceItems,
                    if (inventoryMovementsRefs) db.inventoryMovements,
                    if (productionInputsRefs) db.productionInputs,
                    if (productionOutputsRefs) db.productionOutputs,
                    if (salesReturnItemsRefs) db.salesReturnItems,
                    if (purchaseReturnItemsRefs) db.purchaseReturnItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (baseUnitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.baseUnitId,
                                    referencedTable: $$ProductsTableReferences
                                        ._baseUnitIdTable(db),
                                    referencedColumn: $$ProductsTableReferences
                                        ._baseUnitIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (salesInvoiceItemsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          SalesInvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._salesInvoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).salesInvoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (purchaseInvoiceItemsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          PurchaseInvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._purchaseInvoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseInvoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (inventoryMovementsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          InventoryMovement
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._inventoryMovementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).inventoryMovementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productionInputsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          ProductionInput
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productionInputsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productionInputsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productionOutputsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          ProductionOutput
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productionOutputsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productionOutputsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (salesReturnItemsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          SalesReturnItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._salesReturnItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).salesReturnItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (purchaseReturnItemsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          PurchaseReturnItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._purchaseReturnItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseReturnItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({
        bool baseUnitId,
        bool salesInvoiceItemsRefs,
        bool purchaseInvoiceItemsRefs,
        bool inventoryMovementsRefs,
        bool productionInputsRefs,
        bool productionOutputsRefs,
        bool salesReturnItemsRefs,
        bool purchaseReturnItemsRefs,
      })
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      required String id,
      required String name,
      Value<String> phone,
      Value<String> whatsapp,
      Value<String> address,
      Value<String> code,
      Value<String> businessName,
      Value<String> notes,
      Value<int> openingBalance,
      Value<int> balance,
      Value<bool> active,
      Value<bool> isFavorite,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<String> whatsapp,
      Value<String> address,
      Value<String> code,
      Value<String> businessName,
      Value<String> notes,
      Value<int> openingBalance,
      Value<int> balance,
      Value<bool> active,
      Value<bool> isFavorite,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$CustomersTableReferences
    extends BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SalesInvoicesTable, List<SalesInvoice>>
  _salesInvoicesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.salesInvoices,
    aliasName: 'customers__id__sales_invoices__customer_id',
  );

  $$SalesInvoicesTableProcessedTableManager get salesInvoicesRefs {
    final manager = $$SalesInvoicesTableTableManager(
      $_db,
      $_db.salesInvoices,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesInvoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> salesInvoicesRefs(
    Expression<bool> Function($$SalesInvoicesTableFilterComposer f) f,
  ) {
    final $$SalesInvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableFilterComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get whatsapp =>
      $composableBuilder(column: $table.whatsapp, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> salesInvoicesRefs<T extends Object>(
    Expression<T> Function($$SalesInvoicesTableAnnotationComposer a) f,
  ) {
    final $$SalesInvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, $$CustomersTableReferences),
          Customer,
          PrefetchHooks Function({bool salesInvoicesRefs})
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> whatsapp = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                name: name,
                phone: phone,
                whatsapp: whatsapp,
                address: address,
                code: code,
                businessName: businessName,
                notes: notes,
                openingBalance: openingBalance,
                balance: balance,
                active: active,
                isFavorite: isFavorite,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> phone = const Value.absent(),
                Value<String> whatsapp = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                whatsapp: whatsapp,
                address: address,
                code: code,
                businessName: businessName,
                notes: notes,
                openingBalance: openingBalance,
                balance: balance,
                active: active,
                isFavorite: isFavorite,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CustomersTable, Customer>(table),
                  $$CustomersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({salesInvoicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (salesInvoicesRefs) db.salesInvoices,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (salesInvoicesRefs)
                    await $_getPrefetchedData<
                      Customer,
                      $CustomersTable,
                      SalesInvoice
                    >(
                      currentTable: table,
                      referencedTable: $$CustomersTableReferences
                          ._salesInvoicesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CustomersTableReferences(
                            db,
                            table,
                            p0,
                          ).salesInvoicesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.customerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, $$CustomersTableReferences),
      Customer,
      PrefetchHooks Function({bool salesInvoicesRefs})
    >;
typedef $$SuppliersTableCreateCompanionBuilder =
    SuppliersCompanion Function({
      required String id,
      required String name,
      Value<String> phone,
      Value<String> whatsapp,
      Value<String> address,
      Value<String> code,
      Value<String> businessName,
      Value<String> notes,
      Value<int> openingBalance,
      Value<int> balance,
      Value<bool> active,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$SuppliersTableUpdateCompanionBuilder =
    SuppliersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<String> whatsapp,
      Value<String> address,
      Value<String> code,
      Value<String> businessName,
      Value<String> notes,
      Value<int> openingBalance,
      Value<int> balance,
      Value<bool> active,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$SuppliersTableReferences
    extends BaseReferences<_$AppDatabase, $SuppliersTable, Supplier> {
  $$SuppliersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PurchaseInvoicesTable, List<PurchaseInvoice>>
  _purchaseInvoicesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.purchaseInvoices,
    aliasName: 'suppliers__id__purchase_invoices__supplier_id',
  );

  $$PurchaseInvoicesTableProcessedTableManager get purchaseInvoicesRefs {
    final manager = $$PurchaseInvoicesTableTableManager(
      $_db,
      $_db.purchaseInvoices,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseInvoicesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> purchaseInvoicesRefs(
    Expression<bool> Function($$PurchaseInvoicesTableFilterComposer f) f,
  ) {
    final $$PurchaseInvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableFilterComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get whatsapp =>
      $composableBuilder(column: $table.whatsapp, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> purchaseInvoicesRefs<T extends Object>(
    Expression<T> Function($$PurchaseInvoicesTableAnnotationComposer a) f,
  ) {
    final $$PurchaseInvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SuppliersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SuppliersTable,
          Supplier,
          $$SuppliersTableFilterComposer,
          $$SuppliersTableOrderingComposer,
          $$SuppliersTableAnnotationComposer,
          $$SuppliersTableCreateCompanionBuilder,
          $$SuppliersTableUpdateCompanionBuilder,
          (Supplier, $$SuppliersTableReferences),
          Supplier,
          PrefetchHooks Function({bool purchaseInvoicesRefs})
        > {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> whatsapp = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SuppliersCompanion(
                id: id,
                name: name,
                phone: phone,
                whatsapp: whatsapp,
                address: address,
                code: code,
                businessName: businessName,
                notes: notes,
                openingBalance: openingBalance,
                balance: balance,
                active: active,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> phone = const Value.absent(),
                Value<String> whatsapp = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<bool> active = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SuppliersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                whatsapp: whatsapp,
                address: address,
                code: code,
                businessName: businessName,
                notes: notes,
                openingBalance: openingBalance,
                balance: balance,
                active: active,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SuppliersTable, Supplier>(table),
                  $$SuppliersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({purchaseInvoicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (purchaseInvoicesRefs) db.purchaseInvoices,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (purchaseInvoicesRefs)
                    await $_getPrefetchedData<
                      Supplier,
                      $SuppliersTable,
                      PurchaseInvoice
                    >(
                      currentTable: table,
                      referencedTable: $$SuppliersTableReferences
                          ._purchaseInvoicesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SuppliersTableReferences(
                            db,
                            table,
                            p0,
                          ).purchaseInvoicesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.supplierId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SuppliersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SuppliersTable,
      Supplier,
      $$SuppliersTableFilterComposer,
      $$SuppliersTableOrderingComposer,
      $$SuppliersTableAnnotationComposer,
      $$SuppliersTableCreateCompanionBuilder,
      $$SuppliersTableUpdateCompanionBuilder,
      (Supplier, $$SuppliersTableReferences),
      Supplier,
      PrefetchHooks Function({bool purchaseInvoicesRefs})
    >;
typedef $$CashAccountsTableCreateCompanionBuilder =
    CashAccountsCompanion Function({
      required String id,
      required String name,
      required String type,
      Value<int> openingBalance,
      Value<int> balance,
      Value<bool> active,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$CashAccountsTableUpdateCompanionBuilder =
    CashAccountsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<int> openingBalance,
      Value<int> balance,
      Value<bool> active,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$CashAccountsTableReferences
    extends BaseReferences<_$AppDatabase, $CashAccountsTable, CashAccount> {
  $$CashAccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: 'cash_accounts__id__payments__account_id',
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.expenses,
    aliasName: 'cash_accounts__id__expenses__account_id',
  );

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager(
      $_db,
      $_db.expenses,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$IncomeRecordsTable, List<IncomeRecord>>
  _incomeRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.incomeRecords,
    aliasName: 'cash_accounts__id__income_records__account_id',
  );

  $$IncomeRecordsTableProcessedTableManager get incomeRecordsRefs {
    final manager = $$IncomeRecordsTableTableManager(
      $_db,
      $_db.incomeRecords,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomeRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CashAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $CashAccountsTable> {
  $$CashAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expensesRefs(
    Expression<bool> Function($$ExpensesTableFilterComposer f) f,
  ) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableFilterComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> incomeRecordsRefs(
    Expression<bool> Function($$IncomeRecordsTableFilterComposer f) f,
  ) {
    final $$IncomeRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.incomeRecords,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeRecordsTableFilterComposer(
            $db: $db,
            $table: $db.incomeRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CashAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $CashAccountsTable> {
  $$CashAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CashAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CashAccountsTable> {
  $$CashAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
    Expression<T> Function($$ExpensesTableAnnotationComposer a) f,
  ) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> incomeRecordsRefs<T extends Object>(
    Expression<T> Function($$IncomeRecordsTableAnnotationComposer a) f,
  ) {
    final $$IncomeRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.incomeRecords,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.incomeRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CashAccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CashAccountsTable,
          CashAccount,
          $$CashAccountsTableFilterComposer,
          $$CashAccountsTableOrderingComposer,
          $$CashAccountsTableAnnotationComposer,
          $$CashAccountsTableCreateCompanionBuilder,
          $$CashAccountsTableUpdateCompanionBuilder,
          (CashAccount, $$CashAccountsTableReferences),
          CashAccount,
          PrefetchHooks Function({
            bool paymentsRefs,
            bool expensesRefs,
            bool incomeRecordsRefs,
          })
        > {
  $$CashAccountsTableTableManager(_$AppDatabase db, $CashAccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CashAccountsCompanion(
                id: id,
                name: name,
                type: type,
                openingBalance: openingBalance,
                balance: balance,
                active: active,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String type,
                Value<int> openingBalance = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<bool> active = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CashAccountsCompanion.insert(
                id: id,
                name: name,
                type: type,
                openingBalance: openingBalance,
                balance: balance,
                active: active,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CashAccountsTable, CashAccount>(table),
                  $$CashAccountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                paymentsRefs = false,
                expensesRefs = false,
                incomeRecordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paymentsRefs) db.payments,
                    if (expensesRefs) db.expenses,
                    if (incomeRecordsRefs) db.incomeRecords,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          CashAccount,
                          $CashAccountsTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$CashAccountsTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CashAccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expensesRefs)
                        await $_getPrefetchedData<
                          CashAccount,
                          $CashAccountsTable,
                          Expense
                        >(
                          currentTable: table,
                          referencedTable: $$CashAccountsTableReferences
                              ._expensesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CashAccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).expensesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (incomeRecordsRefs)
                        await $_getPrefetchedData<
                          CashAccount,
                          $CashAccountsTable,
                          IncomeRecord
                        >(
                          currentTable: table,
                          referencedTable: $$CashAccountsTableReferences
                              ._incomeRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CashAccountsTableReferences(
                                db,
                                table,
                                p0,
                              ).incomeRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CashAccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CashAccountsTable,
      CashAccount,
      $$CashAccountsTableFilterComposer,
      $$CashAccountsTableOrderingComposer,
      $$CashAccountsTableAnnotationComposer,
      $$CashAccountsTableCreateCompanionBuilder,
      $$CashAccountsTableUpdateCompanionBuilder,
      (CashAccount, $$CashAccountsTableReferences),
      CashAccount,
      PrefetchHooks Function({
        bool paymentsRefs,
        bool expensesRefs,
        bool incomeRecordsRefs,
      })
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required String txnNumber,
      required int date,
      required String category,
      required int amountMinor,
      Value<String?> partyKind,
      Value<String?> partyId,
      Value<String> paymentMethod,
      Value<String> reference,
      Value<String> description,
      Value<String> status,
      Value<String?> reversedBy,
      Value<String> imagePaths,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> txnNumber,
      Value<int> date,
      Value<String> category,
      Value<int> amountMinor,
      Value<String?> partyKind,
      Value<String?> partyId,
      Value<String> paymentMethod,
      Value<String> reference,
      Value<String> description,
      Value<String> status,
      Value<String?> reversedBy,
      Value<String> imagePaths,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LedgerEntriesTable, List<LedgerEntry>>
  _ledgerEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ledgerEntries,
    aliasName: 'transactions__id__ledger_entries__txn_id',
  );

  $$LedgerEntriesTableProcessedTableManager get ledgerEntriesRefs {
    final manager = $$LedgerEntriesTableTableManager(
      $_db,
      $_db.ledgerEntries,
    ).filter((f) => f.txnId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_ledgerEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get txnNumber => $composableBuilder(
    column: $table.txnNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partyKind => $composableBuilder(
    column: $table.partyKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reversedBy => $composableBuilder(
    column: $table.reversedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ledgerEntriesRefs(
    Expression<bool> Function($$LedgerEntriesTableFilterComposer f) f,
  ) {
    final $$LedgerEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledgerEntries,
      getReferencedColumn: (t) => t.txnId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerEntriesTableFilterComposer(
            $db: $db,
            $table: $db.ledgerEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get txnNumber => $composableBuilder(
    column: $table.txnNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyKind => $composableBuilder(
    column: $table.partyKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reversedBy => $composableBuilder(
    column: $table.reversedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get txnNumber =>
      $composableBuilder(column: $table.txnNumber, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partyKind =>
      $composableBuilder(column: $table.partyKind, builder: (column) => column);

  GeneratedColumn<String> get partyId =>
      $composableBuilder(column: $table.partyId, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get reversedBy => $composableBuilder(
    column: $table.reversedBy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> ledgerEntriesRefs<T extends Object>(
    Expression<T> Function($$LedgerEntriesTableAnnotationComposer a) f,
  ) {
    final $$LedgerEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledgerEntries,
      getReferencedColumn: (t) => t.txnId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.ledgerEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          Transaction,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (Transaction, $$TransactionsTableReferences),
          Transaction,
          PrefetchHooks Function({bool ledgerEntriesRefs})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> txnNumber = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String?> partyKind = const Value.absent(),
                Value<String?> partyId = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> reversedBy = const Value.absent(),
                Value<String> imagePaths = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                txnNumber: txnNumber,
                date: date,
                category: category,
                amountMinor: amountMinor,
                partyKind: partyKind,
                partyId: partyId,
                paymentMethod: paymentMethod,
                reference: reference,
                description: description,
                status: status,
                reversedBy: reversedBy,
                imagePaths: imagePaths,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String txnNumber,
                required int date,
                required String category,
                required int amountMinor,
                Value<String?> partyKind = const Value.absent(),
                Value<String?> partyId = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> reversedBy = const Value.absent(),
                Value<String> imagePaths = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                txnNumber: txnNumber,
                date: date,
                category: category,
                amountMinor: amountMinor,
                partyKind: partyKind,
                partyId: partyId,
                paymentMethod: paymentMethod,
                reference: reference,
                description: description,
                status: status,
                reversedBy: reversedBy,
                imagePaths: imagePaths,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionsTable, Transaction>(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ledgerEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (ledgerEntriesRefs) db.ledgerEntries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ledgerEntriesRefs)
                    await $_getPrefetchedData<
                      Transaction,
                      $TransactionsTable,
                      LedgerEntry
                    >(
                      currentTable: table,
                      referencedTable: $$TransactionsTableReferences
                          ._ledgerEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TransactionsTableReferences(
                            db,
                            table,
                            p0,
                          ).ledgerEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.txnId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      Transaction,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (Transaction, $$TransactionsTableReferences),
      Transaction,
      PrefetchHooks Function({bool ledgerEntriesRefs})
    >;
typedef $$LedgerEntriesTableCreateCompanionBuilder =
    LedgerEntriesCompanion Function({
      Value<int> id,
      required String txnId,
      required String accountKind,
      required String accountId,
      Value<int> debitMinor,
      Value<int> creditMinor,
      required int balanceAfterMinor,
      required int date,
      Value<String> description,
    });
typedef $$LedgerEntriesTableUpdateCompanionBuilder =
    LedgerEntriesCompanion Function({
      Value<int> id,
      Value<String> txnId,
      Value<String> accountKind,
      Value<String> accountId,
      Value<int> debitMinor,
      Value<int> creditMinor,
      Value<int> balanceAfterMinor,
      Value<int> date,
      Value<String> description,
    });

final class $$LedgerEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $LedgerEntriesTable, LedgerEntry> {
  $$LedgerEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransactionsTable _txnIdTable(_$AppDatabase db) =>
      db.transactions.createAlias('ledger_entries__txn_id__transactions__id');

  $$TransactionsTableProcessedTableManager get txnId {
    final $_column = $_itemColumn<String>('txn_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_txnIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LedgerEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LedgerEntriesTable> {
  $$LedgerEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountKind => $composableBuilder(
    column: $table.accountKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get debitMinor => $composableBuilder(
    column: $table.debitMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditMinor => $composableBuilder(
    column: $table.creditMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balanceAfterMinor => $composableBuilder(
    column: $table.balanceAfterMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$TransactionsTableFilterComposer get txnId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.txnId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LedgerEntriesTable> {
  $$LedgerEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountKind => $composableBuilder(
    column: $table.accountKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get debitMinor => $composableBuilder(
    column: $table.debitMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditMinor => $composableBuilder(
    column: $table.creditMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balanceAfterMinor => $composableBuilder(
    column: $table.balanceAfterMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransactionsTableOrderingComposer get txnId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.txnId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LedgerEntriesTable> {
  $$LedgerEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountKind => $composableBuilder(
    column: $table.accountKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get debitMinor => $composableBuilder(
    column: $table.debitMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get creditMinor => $composableBuilder(
    column: $table.creditMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get balanceAfterMinor => $composableBuilder(
    column: $table.balanceAfterMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$TransactionsTableAnnotationComposer get txnId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.txnId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LedgerEntriesTable,
          LedgerEntry,
          $$LedgerEntriesTableFilterComposer,
          $$LedgerEntriesTableOrderingComposer,
          $$LedgerEntriesTableAnnotationComposer,
          $$LedgerEntriesTableCreateCompanionBuilder,
          $$LedgerEntriesTableUpdateCompanionBuilder,
          (LedgerEntry, $$LedgerEntriesTableReferences),
          LedgerEntry,
          PrefetchHooks Function({bool txnId})
        > {
  $$LedgerEntriesTableTableManager(_$AppDatabase db, $LedgerEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LedgerEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LedgerEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LedgerEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> txnId = const Value.absent(),
                Value<String> accountKind = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<int> debitMinor = const Value.absent(),
                Value<int> creditMinor = const Value.absent(),
                Value<int> balanceAfterMinor = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => LedgerEntriesCompanion(
                id: id,
                txnId: txnId,
                accountKind: accountKind,
                accountId: accountId,
                debitMinor: debitMinor,
                creditMinor: creditMinor,
                balanceAfterMinor: balanceAfterMinor,
                date: date,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String txnId,
                required String accountKind,
                required String accountId,
                Value<int> debitMinor = const Value.absent(),
                Value<int> creditMinor = const Value.absent(),
                required int balanceAfterMinor,
                required int date,
                Value<String> description = const Value.absent(),
              }) => LedgerEntriesCompanion.insert(
                id: id,
                txnId: txnId,
                accountKind: accountKind,
                accountId: accountId,
                debitMinor: debitMinor,
                creditMinor: creditMinor,
                balanceAfterMinor: balanceAfterMinor,
                date: date,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LedgerEntriesTable, LedgerEntry>(table),
                  $$LedgerEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({txnId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (txnId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.txnId,
                                referencedTable: $$LedgerEntriesTableReferences
                                    ._txnIdTable(db),
                                referencedColumn: $$LedgerEntriesTableReferences
                                    ._txnIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LedgerEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LedgerEntriesTable,
      LedgerEntry,
      $$LedgerEntriesTableFilterComposer,
      $$LedgerEntriesTableOrderingComposer,
      $$LedgerEntriesTableAnnotationComposer,
      $$LedgerEntriesTableCreateCompanionBuilder,
      $$LedgerEntriesTableUpdateCompanionBuilder,
      (LedgerEntry, $$LedgerEntriesTableReferences),
      LedgerEntry,
      PrefetchHooks Function({bool txnId})
    >;
typedef $$SalesInvoicesTableCreateCompanionBuilder =
    SalesInvoicesCompanion Function({
      required String id,
      required String invoiceNo,
      required String customerId,
      required int date,
      required int subtotalMinor,
      Value<int> discountMinor,
      Value<int> taxMinor,
      required int totalMinor,
      Value<int> paidMinor,
      Value<String> status,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$SalesInvoicesTableUpdateCompanionBuilder =
    SalesInvoicesCompanion Function({
      Value<String> id,
      Value<String> invoiceNo,
      Value<String> customerId,
      Value<int> date,
      Value<int> subtotalMinor,
      Value<int> discountMinor,
      Value<int> taxMinor,
      Value<int> totalMinor,
      Value<int> paidMinor,
      Value<String> status,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$SalesInvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $SalesInvoicesTable, SalesInvoice> {
  $$SalesInvoicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias('sales_invoices__customer_id__customers__id');

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<String>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SalesInvoiceItemsTable, List<SalesInvoiceItem>>
  _salesInvoiceItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.salesInvoiceItems,
        aliasName: 'sales_invoices__id__sales_invoice_items__invoice_id',
      );

  $$SalesInvoiceItemsTableProcessedTableManager get salesInvoiceItemsRefs {
    final manager = $$SalesInvoiceItemsTableTableManager(
      $_db,
      $_db.salesInvoiceItems,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _salesInvoiceItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SalesReturnsTable, List<SalesReturn>>
  _salesReturnsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.salesReturns,
    aliasName: 'sales_invoices__id__sales_returns__invoice_id',
  );

  $$SalesReturnsTableProcessedTableManager get salesReturnsRefs {
    final manager = $$SalesReturnsTableTableManager(
      $_db,
      $_db.salesReturns,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesReturnsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SalesInvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $SalesInvoicesTable> {
  $$SalesInvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxMinor => $composableBuilder(
    column: $table.taxMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paidMinor => $composableBuilder(
    column: $table.paidMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> salesInvoiceItemsRefs(
    Expression<bool> Function($$SalesInvoiceItemsTableFilterComposer f) f,
  ) {
    final $$SalesInvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesInvoiceItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.salesInvoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> salesReturnsRefs(
    Expression<bool> Function($$SalesReturnsTableFilterComposer f) f,
  ) {
    final $$SalesReturnsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesReturns,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnsTableFilterComposer(
            $db: $db,
            $table: $db.salesReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalesInvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesInvoicesTable> {
  $$SalesInvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxMinor => $composableBuilder(
    column: $table.taxMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paidMinor => $composableBuilder(
    column: $table.paidMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesInvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesInvoicesTable> {
  $$SalesInvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNo =>
      $composableBuilder(column: $table.invoiceNo, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxMinor =>
      $composableBuilder(column: $table.taxMinor, builder: (column) => column);

  GeneratedColumn<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paidMinor =>
      $composableBuilder(column: $table.paidMinor, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> salesInvoiceItemsRefs<T extends Object>(
    Expression<T> Function($$SalesInvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$SalesInvoiceItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.salesInvoiceItems,
          getReferencedColumn: (t) => t.invoiceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SalesInvoiceItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.salesInvoiceItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> salesReturnsRefs<T extends Object>(
    Expression<T> Function($$SalesReturnsTableAnnotationComposer a) f,
  ) {
    final $$SalesReturnsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesReturns,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnsTableAnnotationComposer(
            $db: $db,
            $table: $db.salesReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalesInvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesInvoicesTable,
          SalesInvoice,
          $$SalesInvoicesTableFilterComposer,
          $$SalesInvoicesTableOrderingComposer,
          $$SalesInvoicesTableAnnotationComposer,
          $$SalesInvoicesTableCreateCompanionBuilder,
          $$SalesInvoicesTableUpdateCompanionBuilder,
          (SalesInvoice, $$SalesInvoicesTableReferences),
          SalesInvoice,
          PrefetchHooks Function({
            bool customerId,
            bool salesInvoiceItemsRefs,
            bool salesReturnsRefs,
          })
        > {
  $$SalesInvoicesTableTableManager(_$AppDatabase db, $SalesInvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesInvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesInvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesInvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> invoiceNo = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> subtotalMinor = const Value.absent(),
                Value<int> discountMinor = const Value.absent(),
                Value<int> taxMinor = const Value.absent(),
                Value<int> totalMinor = const Value.absent(),
                Value<int> paidMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SalesInvoicesCompanion(
                id: id,
                invoiceNo: invoiceNo,
                customerId: customerId,
                date: date,
                subtotalMinor: subtotalMinor,
                discountMinor: discountMinor,
                taxMinor: taxMinor,
                totalMinor: totalMinor,
                paidMinor: paidMinor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String invoiceNo,
                required String customerId,
                required int date,
                required int subtotalMinor,
                Value<int> discountMinor = const Value.absent(),
                Value<int> taxMinor = const Value.absent(),
                required int totalMinor,
                Value<int> paidMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SalesInvoicesCompanion.insert(
                id: id,
                invoiceNo: invoiceNo,
                customerId: customerId,
                date: date,
                subtotalMinor: subtotalMinor,
                discountMinor: discountMinor,
                taxMinor: taxMinor,
                totalMinor: totalMinor,
                paidMinor: paidMinor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SalesInvoicesTable, SalesInvoice>(table),
                  $$SalesInvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                customerId = false,
                salesInvoiceItemsRefs = false,
                salesReturnsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (salesInvoiceItemsRefs) db.salesInvoiceItems,
                    if (salesReturnsRefs) db.salesReturns,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (customerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customerId,
                                    referencedTable:
                                        $$SalesInvoicesTableReferences
                                            ._customerIdTable(db),
                                    referencedColumn:
                                        $$SalesInvoicesTableReferences
                                            ._customerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (salesInvoiceItemsRefs)
                        await $_getPrefetchedData<
                          SalesInvoice,
                          $SalesInvoicesTable,
                          SalesInvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$SalesInvoicesTableReferences
                              ._salesInvoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SalesInvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).salesInvoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (salesReturnsRefs)
                        await $_getPrefetchedData<
                          SalesInvoice,
                          $SalesInvoicesTable,
                          SalesReturn
                        >(
                          currentTable: table,
                          referencedTable: $$SalesInvoicesTableReferences
                              ._salesReturnsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SalesInvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).salesReturnsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SalesInvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesInvoicesTable,
      SalesInvoice,
      $$SalesInvoicesTableFilterComposer,
      $$SalesInvoicesTableOrderingComposer,
      $$SalesInvoicesTableAnnotationComposer,
      $$SalesInvoicesTableCreateCompanionBuilder,
      $$SalesInvoicesTableUpdateCompanionBuilder,
      (SalesInvoice, $$SalesInvoicesTableReferences),
      SalesInvoice,
      PrefetchHooks Function({
        bool customerId,
        bool salesInvoiceItemsRefs,
        bool salesReturnsRefs,
      })
    >;
typedef $$SalesInvoiceItemsTableCreateCompanionBuilder =
    SalesInvoiceItemsCompanion Function({
      Value<int> id,
      required String invoiceId,
      required String productId,
      required int qtyNum,
      Value<int> qtyDen,
      required String unitId,
      required int unitPriceMinor,
      Value<int> discountMinor,
      required int lineTotalMinor,
    });
typedef $$SalesInvoiceItemsTableUpdateCompanionBuilder =
    SalesInvoiceItemsCompanion Function({
      Value<int> id,
      Value<String> invoiceId,
      Value<String> productId,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<String> unitId,
      Value<int> unitPriceMinor,
      Value<int> discountMinor,
      Value<int> lineTotalMinor,
    });

final class $$SalesInvoiceItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SalesInvoiceItemsTable,
          SalesInvoiceItem
        > {
  $$SalesInvoiceItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SalesInvoicesTable _invoiceIdTable(_$AppDatabase db) => db
      .salesInvoices
      .createAlias('sales_invoice_items__invoice_id__sales_invoices__id');

  $$SalesInvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<String>('invoice_id')!;

    final manager = $$SalesInvoicesTableTableManager(
      $_db,
      $_db.salesInvoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('sales_invoice_items__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UnitsTable _unitIdTable(_$AppDatabase db) =>
      db.units.createAlias('sales_invoice_items__unit_id__units__id');

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<String>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SalesInvoiceItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SalesInvoiceItemsTable> {
  $$SalesInvoiceItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$SalesInvoicesTableFilterComposer get invoiceId {
    final $$SalesInvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableFilterComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesInvoiceItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesInvoiceItemsTable> {
  $$SalesInvoiceItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$SalesInvoicesTableOrderingComposer get invoiceId {
    final $$SalesInvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesInvoiceItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesInvoiceItemsTable> {
  $$SalesInvoiceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => column,
  );

  $$SalesInvoicesTableAnnotationComposer get invoiceId {
    final $$SalesInvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesInvoiceItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesInvoiceItemsTable,
          SalesInvoiceItem,
          $$SalesInvoiceItemsTableFilterComposer,
          $$SalesInvoiceItemsTableOrderingComposer,
          $$SalesInvoiceItemsTableAnnotationComposer,
          $$SalesInvoiceItemsTableCreateCompanionBuilder,
          $$SalesInvoiceItemsTableUpdateCompanionBuilder,
          (SalesInvoiceItem, $$SalesInvoiceItemsTableReferences),
          SalesInvoiceItem,
          PrefetchHooks Function({bool invoiceId, bool productId, bool unitId})
        > {
  $$SalesInvoiceItemsTableTableManager(
    _$AppDatabase db,
    $SalesInvoiceItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesInvoiceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesInvoiceItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesInvoiceItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<int> unitPriceMinor = const Value.absent(),
                Value<int> discountMinor = const Value.absent(),
                Value<int> lineTotalMinor = const Value.absent(),
              }) => SalesInvoiceItemsCompanion(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitId: unitId,
                unitPriceMinor: unitPriceMinor,
                discountMinor: discountMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String invoiceId,
                required String productId,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                required String unitId,
                required int unitPriceMinor,
                Value<int> discountMinor = const Value.absent(),
                required int lineTotalMinor,
              }) => SalesInvoiceItemsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitId: unitId,
                unitPriceMinor: unitPriceMinor,
                discountMinor: discountMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SalesInvoiceItemsTable, SalesInvoiceItem>(table),
                  $$SalesInvoiceItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoiceId = false, productId = false, unitId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (invoiceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.invoiceId,
                                    referencedTable:
                                        $$SalesInvoiceItemsTableReferences
                                            ._invoiceIdTable(db),
                                    referencedColumn:
                                        $$SalesInvoiceItemsTableReferences
                                            ._invoiceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$SalesInvoiceItemsTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$SalesInvoiceItemsTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (unitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.unitId,
                                    referencedTable:
                                        $$SalesInvoiceItemsTableReferences
                                            ._unitIdTable(db),
                                    referencedColumn:
                                        $$SalesInvoiceItemsTableReferences
                                            ._unitIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$SalesInvoiceItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesInvoiceItemsTable,
      SalesInvoiceItem,
      $$SalesInvoiceItemsTableFilterComposer,
      $$SalesInvoiceItemsTableOrderingComposer,
      $$SalesInvoiceItemsTableAnnotationComposer,
      $$SalesInvoiceItemsTableCreateCompanionBuilder,
      $$SalesInvoiceItemsTableUpdateCompanionBuilder,
      (SalesInvoiceItem, $$SalesInvoiceItemsTableReferences),
      SalesInvoiceItem,
      PrefetchHooks Function({bool invoiceId, bool productId, bool unitId})
    >;
typedef $$PurchaseInvoicesTableCreateCompanionBuilder =
    PurchaseInvoicesCompanion Function({
      required String id,
      required String invoiceNo,
      required String supplierId,
      required int date,
      required int subtotalMinor,
      Value<int> discountMinor,
      Value<int> taxMinor,
      required int totalMinor,
      Value<int> paidMinor,
      Value<String> status,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$PurchaseInvoicesTableUpdateCompanionBuilder =
    PurchaseInvoicesCompanion Function({
      Value<String> id,
      Value<String> invoiceNo,
      Value<String> supplierId,
      Value<int> date,
      Value<int> subtotalMinor,
      Value<int> discountMinor,
      Value<int> taxMinor,
      Value<int> totalMinor,
      Value<int> paidMinor,
      Value<String> status,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$PurchaseInvoicesTableReferences
    extends
        BaseReferences<_$AppDatabase, $PurchaseInvoicesTable, PurchaseInvoice> {
  $$PurchaseInvoicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SuppliersTable _supplierIdTable(_$AppDatabase db) =>
      db.suppliers.createAlias('purchase_invoices__supplier_id__suppliers__id');

  $$SuppliersTableProcessedTableManager get supplierId {
    final $_column = $_itemColumn<String>('supplier_id')!;

    final manager = $$SuppliersTableTableManager(
      $_db,
      $_db.suppliers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $PurchaseInvoiceItemsTable,
    List<PurchaseInvoiceItem>
  >
  _purchaseInvoiceItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseInvoiceItems,
        aliasName: 'purchase_invoices__id__purchase_invoice_items__invoice_id',
      );

  $$PurchaseInvoiceItemsTableProcessedTableManager
  get purchaseInvoiceItemsRefs {
    final manager = $$PurchaseInvoiceItemsTableTableManager(
      $_db,
      $_db.purchaseInvoiceItems,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseInvoiceItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PurchaseReturnsTable, List<PurchaseReturn>>
  _purchaseReturnsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.purchaseReturns,
    aliasName: 'purchase_invoices__id__purchase_returns__invoice_id',
  );

  $$PurchaseReturnsTableProcessedTableManager get purchaseReturnsRefs {
    final manager = $$PurchaseReturnsTableTableManager(
      $_db,
      $_db.purchaseReturns,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseReturnsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PurchaseInvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxMinor => $composableBuilder(
    column: $table.taxMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paidMinor => $composableBuilder(
    column: $table.paidMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SuppliersTableFilterComposer get supplierId {
    final $$SuppliersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableFilterComposer(
            $db: $db,
            $table: $db.suppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> purchaseInvoiceItemsRefs(
    Expression<bool> Function($$PurchaseInvoiceItemsTableFilterComposer f) f,
  ) {
    final $$PurchaseInvoiceItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseInvoiceItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoiceItemsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseInvoiceItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> purchaseReturnsRefs(
    Expression<bool> Function($$PurchaseReturnsTableFilterComposer f) f,
  ) {
    final $$PurchaseReturnsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseReturns,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PurchaseInvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxMinor => $composableBuilder(
    column: $table.taxMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paidMinor => $composableBuilder(
    column: $table.paidMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SuppliersTableOrderingComposer get supplierId {
    final $$SuppliersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableOrderingComposer(
            $db: $db,
            $table: $db.suppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNo =>
      $composableBuilder(column: $table.invoiceNo, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxMinor =>
      $composableBuilder(column: $table.taxMinor, builder: (column) => column);

  GeneratedColumn<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paidMinor =>
      $composableBuilder(column: $table.paidMinor, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SuppliersTableAnnotationComposer get supplierId {
    final $$SuppliersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.suppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SuppliersTableAnnotationComposer(
            $db: $db,
            $table: $db.suppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> purchaseInvoiceItemsRefs<T extends Object>(
    Expression<T> Function($$PurchaseInvoiceItemsTableAnnotationComposer a) f,
  ) {
    final $$PurchaseInvoiceItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseInvoiceItems,
          getReferencedColumn: (t) => t.invoiceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseInvoiceItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseInvoiceItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> purchaseReturnsRefs<T extends Object>(
    Expression<T> Function($$PurchaseReturnsTableAnnotationComposer a) f,
  ) {
    final $$PurchaseReturnsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseReturns,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnsTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PurchaseInvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseInvoicesTable,
          PurchaseInvoice,
          $$PurchaseInvoicesTableFilterComposer,
          $$PurchaseInvoicesTableOrderingComposer,
          $$PurchaseInvoicesTableAnnotationComposer,
          $$PurchaseInvoicesTableCreateCompanionBuilder,
          $$PurchaseInvoicesTableUpdateCompanionBuilder,
          (PurchaseInvoice, $$PurchaseInvoicesTableReferences),
          PurchaseInvoice,
          PrefetchHooks Function({
            bool supplierId,
            bool purchaseInvoiceItemsRefs,
            bool purchaseReturnsRefs,
          })
        > {
  $$PurchaseInvoicesTableTableManager(
    _$AppDatabase db,
    $PurchaseInvoicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseInvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseInvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseInvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> invoiceNo = const Value.absent(),
                Value<String> supplierId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> subtotalMinor = const Value.absent(),
                Value<int> discountMinor = const Value.absent(),
                Value<int> taxMinor = const Value.absent(),
                Value<int> totalMinor = const Value.absent(),
                Value<int> paidMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseInvoicesCompanion(
                id: id,
                invoiceNo: invoiceNo,
                supplierId: supplierId,
                date: date,
                subtotalMinor: subtotalMinor,
                discountMinor: discountMinor,
                taxMinor: taxMinor,
                totalMinor: totalMinor,
                paidMinor: paidMinor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String invoiceNo,
                required String supplierId,
                required int date,
                required int subtotalMinor,
                Value<int> discountMinor = const Value.absent(),
                Value<int> taxMinor = const Value.absent(),
                required int totalMinor,
                Value<int> paidMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PurchaseInvoicesCompanion.insert(
                id: id,
                invoiceNo: invoiceNo,
                supplierId: supplierId,
                date: date,
                subtotalMinor: subtotalMinor,
                discountMinor: discountMinor,
                taxMinor: taxMinor,
                totalMinor: totalMinor,
                paidMinor: paidMinor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PurchaseInvoicesTable, PurchaseInvoice>(table),
                  $$PurchaseInvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                supplierId = false,
                purchaseInvoiceItemsRefs = false,
                purchaseReturnsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (purchaseInvoiceItemsRefs) db.purchaseInvoiceItems,
                    if (purchaseReturnsRefs) db.purchaseReturns,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (supplierId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.supplierId,
                                    referencedTable:
                                        $$PurchaseInvoicesTableReferences
                                            ._supplierIdTable(db),
                                    referencedColumn:
                                        $$PurchaseInvoicesTableReferences
                                            ._supplierIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (purchaseInvoiceItemsRefs)
                        await $_getPrefetchedData<
                          PurchaseInvoice,
                          $PurchaseInvoicesTable,
                          PurchaseInvoiceItem
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseInvoicesTableReferences
                              ._purchaseInvoiceItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseInvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseInvoiceItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (purchaseReturnsRefs)
                        await $_getPrefetchedData<
                          PurchaseInvoice,
                          $PurchaseInvoicesTable,
                          PurchaseReturn
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseInvoicesTableReferences
                              ._purchaseReturnsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseInvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseReturnsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PurchaseInvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseInvoicesTable,
      PurchaseInvoice,
      $$PurchaseInvoicesTableFilterComposer,
      $$PurchaseInvoicesTableOrderingComposer,
      $$PurchaseInvoicesTableAnnotationComposer,
      $$PurchaseInvoicesTableCreateCompanionBuilder,
      $$PurchaseInvoicesTableUpdateCompanionBuilder,
      (PurchaseInvoice, $$PurchaseInvoicesTableReferences),
      PurchaseInvoice,
      PrefetchHooks Function({
        bool supplierId,
        bool purchaseInvoiceItemsRefs,
        bool purchaseReturnsRefs,
      })
    >;
typedef $$PurchaseInvoiceItemsTableCreateCompanionBuilder =
    PurchaseInvoiceItemsCompanion Function({
      Value<int> id,
      required String invoiceId,
      required String productId,
      required int qtyNum,
      Value<int> qtyDen,
      required String unitId,
      required int unitPriceMinor,
      Value<int> discountMinor,
      required int lineTotalMinor,
    });
typedef $$PurchaseInvoiceItemsTableUpdateCompanionBuilder =
    PurchaseInvoiceItemsCompanion Function({
      Value<int> id,
      Value<String> invoiceId,
      Value<String> productId,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<String> unitId,
      Value<int> unitPriceMinor,
      Value<int> discountMinor,
      Value<int> lineTotalMinor,
    });

final class $$PurchaseInvoiceItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseInvoiceItemsTable,
          PurchaseInvoiceItem
        > {
  $$PurchaseInvoiceItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PurchaseInvoicesTable _invoiceIdTable(_$AppDatabase db) => db
      .purchaseInvoices
      .createAlias('purchase_invoice_items__invoice_id__purchase_invoices__id');

  $$PurchaseInvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<String>('invoice_id')!;

    final manager = $$PurchaseInvoicesTableTableManager(
      $_db,
      $_db.purchaseInvoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) => db.products
      .createAlias('purchase_invoice_items__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UnitsTable _unitIdTable(_$AppDatabase db) =>
      db.units.createAlias('purchase_invoice_items__unit_id__units__id');

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<String>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PurchaseInvoiceItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseInvoiceItemsTable> {
  $$PurchaseInvoiceItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$PurchaseInvoicesTableFilterComposer get invoiceId {
    final $$PurchaseInvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableFilterComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoiceItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseInvoiceItemsTable> {
  $$PurchaseInvoiceItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$PurchaseInvoicesTableOrderingComposer get invoiceId {
    final $$PurchaseInvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoiceItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseInvoiceItemsTable> {
  $$PurchaseInvoiceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => column,
  );

  $$PurchaseInvoicesTableAnnotationComposer get invoiceId {
    final $$PurchaseInvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseInvoiceItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseInvoiceItemsTable,
          PurchaseInvoiceItem,
          $$PurchaseInvoiceItemsTableFilterComposer,
          $$PurchaseInvoiceItemsTableOrderingComposer,
          $$PurchaseInvoiceItemsTableAnnotationComposer,
          $$PurchaseInvoiceItemsTableCreateCompanionBuilder,
          $$PurchaseInvoiceItemsTableUpdateCompanionBuilder,
          (PurchaseInvoiceItem, $$PurchaseInvoiceItemsTableReferences),
          PurchaseInvoiceItem,
          PrefetchHooks Function({bool invoiceId, bool productId, bool unitId})
        > {
  $$PurchaseInvoiceItemsTableTableManager(
    _$AppDatabase db,
    $PurchaseInvoiceItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseInvoiceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseInvoiceItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PurchaseInvoiceItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<int> unitPriceMinor = const Value.absent(),
                Value<int> discountMinor = const Value.absent(),
                Value<int> lineTotalMinor = const Value.absent(),
              }) => PurchaseInvoiceItemsCompanion(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitId: unitId,
                unitPriceMinor: unitPriceMinor,
                discountMinor: discountMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String invoiceId,
                required String productId,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                required String unitId,
                required int unitPriceMinor,
                Value<int> discountMinor = const Value.absent(),
                required int lineTotalMinor,
              }) => PurchaseInvoiceItemsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitId: unitId,
                unitPriceMinor: unitPriceMinor,
                discountMinor: discountMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PurchaseInvoiceItemsTable, PurchaseInvoiceItem>(
                    table,
                  ),
                  $$PurchaseInvoiceItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoiceId = false, productId = false, unitId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (invoiceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.invoiceId,
                                    referencedTable:
                                        $$PurchaseInvoiceItemsTableReferences
                                            ._invoiceIdTable(db),
                                    referencedColumn:
                                        $$PurchaseInvoiceItemsTableReferences
                                            ._invoiceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$PurchaseInvoiceItemsTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$PurchaseInvoiceItemsTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (unitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.unitId,
                                    referencedTable:
                                        $$PurchaseInvoiceItemsTableReferences
                                            ._unitIdTable(db),
                                    referencedColumn:
                                        $$PurchaseInvoiceItemsTableReferences
                                            ._unitIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$PurchaseInvoiceItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseInvoiceItemsTable,
      PurchaseInvoiceItem,
      $$PurchaseInvoiceItemsTableFilterComposer,
      $$PurchaseInvoiceItemsTableOrderingComposer,
      $$PurchaseInvoiceItemsTableAnnotationComposer,
      $$PurchaseInvoiceItemsTableCreateCompanionBuilder,
      $$PurchaseInvoiceItemsTableUpdateCompanionBuilder,
      (PurchaseInvoiceItem, $$PurchaseInvoiceItemsTableReferences),
      PurchaseInvoiceItem,
      PrefetchHooks Function({bool invoiceId, bool productId, bool unitId})
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      required String id,
      required String paymentNo,
      required int date,
      required String direction,
      required String partyKind,
      required String partyId,
      required int amountMinor,
      required String accountId,
      Value<String> method,
      Value<String> reference,
      Value<String> notes,
      Value<String> status,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<String> id,
      Value<String> paymentNo,
      Value<int> date,
      Value<String> direction,
      Value<String> partyKind,
      Value<String> partyId,
      Value<int> amountMinor,
      Value<String> accountId,
      Value<String> method,
      Value<String> reference,
      Value<String> notes,
      Value<String> status,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, Payment> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CashAccountsTable _accountIdTable(_$AppDatabase db) =>
      db.cashAccounts.createAlias('payments__account_id__cash_accounts__id');

  $$CashAccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<String>('account_id')!;

    final manager = $$CashAccountsTableTableManager(
      $_db,
      $_db.cashAccounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PaymentAllocationsTable, List<PaymentAllocation>>
  _paymentAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.paymentAllocations,
        aliasName: 'payments__id__payment_allocations__payment_id',
      );

  $$PaymentAllocationsTableProcessedTableManager get paymentAllocationsRefs {
    final manager = $$PaymentAllocationsTableTableManager(
      $_db,
      $_db.paymentAllocations,
    ).filter((f) => f.paymentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _paymentAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentNo => $composableBuilder(
    column: $table.paymentNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partyKind => $composableBuilder(
    column: $table.partyKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CashAccountsTableFilterComposer get accountId {
    final $$CashAccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableFilterComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> paymentAllocationsRefs(
    Expression<bool> Function($$PaymentAllocationsTableFilterComposer f) f,
  ) {
    final $$PaymentAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentAllocations,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.paymentAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentNo => $composableBuilder(
    column: $table.paymentNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyKind => $composableBuilder(
    column: $table.partyKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partyId => $composableBuilder(
    column: $table.partyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CashAccountsTableOrderingComposer get accountId {
    final $$CashAccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableOrderingComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get paymentNo =>
      $composableBuilder(column: $table.paymentNo, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get partyKind =>
      $composableBuilder(column: $table.partyKind, builder: (column) => column);

  GeneratedColumn<String> get partyId =>
      $composableBuilder(column: $table.partyId, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CashAccountsTableAnnotationComposer get accountId {
    final $$CashAccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> paymentAllocationsRefs<T extends Object>(
    Expression<T> Function($$PaymentAllocationsTableAnnotationComposer a) f,
  ) {
    final $$PaymentAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.paymentAllocations,
          getReferencedColumn: (t) => t.paymentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PaymentAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.paymentAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, $$PaymentsTableReferences),
          Payment,
          PrefetchHooks Function({bool accountId, bool paymentAllocationsRefs})
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> paymentNo = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<String> partyKind = const Value.absent(),
                Value<String> partyId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                paymentNo: paymentNo,
                date: date,
                direction: direction,
                partyKind: partyKind,
                partyId: partyId,
                amountMinor: amountMinor,
                accountId: accountId,
                method: method,
                reference: reference,
                notes: notes,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String paymentNo,
                required int date,
                required String direction,
                required String partyKind,
                required String partyId,
                required int amountMinor,
                required String accountId,
                Value<String> method = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                paymentNo: paymentNo,
                date: date,
                direction: direction,
                partyKind: partyKind,
                partyId: partyId,
                amountMinor: amountMinor,
                accountId: accountId,
                method: method,
                reference: reference,
                notes: notes,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentsTable, Payment>(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({accountId = false, paymentAllocationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paymentAllocationsRefs) db.paymentAllocations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (accountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.accountId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._accountIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._accountIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paymentAllocationsRefs)
                        await $_getPrefetchedData<
                          Payment,
                          $PaymentsTable,
                          PaymentAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentsTableReferences
                              ._paymentAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paymentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, $$PaymentsTableReferences),
      Payment,
      PrefetchHooks Function({bool accountId, bool paymentAllocationsRefs})
    >;
typedef $$PaymentAllocationsTableCreateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<int> id,
      required String paymentId,
      required String invoiceKind,
      required String invoiceId,
      required int amountMinor,
    });
typedef $$PaymentAllocationsTableUpdateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<int> id,
      Value<String> paymentId,
      Value<String> invoiceKind,
      Value<String> invoiceId,
      Value<int> amountMinor,
    });

final class $$PaymentAllocationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation
        > {
  $$PaymentAllocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PaymentsTable _paymentIdTable(_$AppDatabase db) =>
      db.payments.createAlias('payment_allocations__payment_id__payments__id');

  $$PaymentsTableProcessedTableManager get paymentId {
    final $_column = $_itemColumn<String>('payment_id')!;

    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PaymentAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceKind => $composableBuilder(
    column: $table.invoiceKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$PaymentsTableFilterComposer get paymentId {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceKind => $composableBuilder(
    column: $table.invoiceKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$PaymentsTableOrderingComposer get paymentId {
    final $$PaymentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableOrderingComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceKind => $composableBuilder(
    column: $table.invoiceKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  $$PaymentsTableAnnotationComposer get paymentId {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation,
          $$PaymentAllocationsTableFilterComposer,
          $$PaymentAllocationsTableOrderingComposer,
          $$PaymentAllocationsTableAnnotationComposer,
          $$PaymentAllocationsTableCreateCompanionBuilder,
          $$PaymentAllocationsTableUpdateCompanionBuilder,
          (PaymentAllocation, $$PaymentAllocationsTableReferences),
          PaymentAllocation,
          PrefetchHooks Function({bool paymentId})
        > {
  $$PaymentAllocationsTableTableManager(
    _$AppDatabase db,
    $PaymentAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentAllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> paymentId = const Value.absent(),
                Value<String> invoiceKind = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
              }) => PaymentAllocationsCompanion(
                id: id,
                paymentId: paymentId,
                invoiceKind: invoiceKind,
                invoiceId: invoiceId,
                amountMinor: amountMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String paymentId,
                required String invoiceKind,
                required String invoiceId,
                required int amountMinor,
              }) => PaymentAllocationsCompanion.insert(
                id: id,
                paymentId: paymentId,
                invoiceKind: invoiceKind,
                invoiceId: invoiceId,
                amountMinor: amountMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PaymentAllocationsTable, PaymentAllocation>(
                    table,
                  ),
                  $$PaymentAllocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({paymentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (paymentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.paymentId,
                                referencedTable:
                                    $$PaymentAllocationsTableReferences
                                        ._paymentIdTable(db),
                                referencedColumn:
                                    $$PaymentAllocationsTableReferences
                                        ._paymentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PaymentAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentAllocationsTable,
      PaymentAllocation,
      $$PaymentAllocationsTableFilterComposer,
      $$PaymentAllocationsTableOrderingComposer,
      $$PaymentAllocationsTableAnnotationComposer,
      $$PaymentAllocationsTableCreateCompanionBuilder,
      $$PaymentAllocationsTableUpdateCompanionBuilder,
      (PaymentAllocation, $$PaymentAllocationsTableReferences),
      PaymentAllocation,
      PrefetchHooks Function({bool paymentId})
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      Value<int> id,
      required int date,
      required String category,
      required int amountMinor,
      required String accountId,
      Value<String> description,
      Value<String> reference,
      required int createdAt,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<int> id,
      Value<int> date,
      Value<String> category,
      Value<int> amountMinor,
      Value<String> accountId,
      Value<String> description,
      Value<String> reference,
      Value<int> createdAt,
    });

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, Expense> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CashAccountsTable _accountIdTable(_$AppDatabase db) =>
      db.cashAccounts.createAlias('expenses__account_id__cash_accounts__id');

  $$CashAccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<String>('account_id')!;

    final manager = $$CashAccountsTableTableManager(
      $_db,
      $_db.cashAccounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CashAccountsTableFilterComposer get accountId {
    final $$CashAccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableFilterComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CashAccountsTableOrderingComposer get accountId {
    final $$CashAccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableOrderingComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CashAccountsTableAnnotationComposer get accountId {
    final $$CashAccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, $$ExpensesTableReferences),
          Expense,
          PrefetchHooks Function({bool accountId})
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                date: date,
                category: category,
                amountMinor: amountMinor,
                accountId: accountId,
                description: description,
                reference: reference,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int date,
                required String category,
                required int amountMinor,
                required String accountId,
                Value<String> description = const Value.absent(),
                Value<String> reference = const Value.absent(),
                required int createdAt,
              }) => ExpensesCompanion.insert(
                id: id,
                date: date,
                category: category,
                amountMinor: amountMinor,
                accountId: accountId,
                description: description,
                reference: reference,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExpensesTable, Expense>(table),
                  $$ExpensesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$ExpensesTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$ExpensesTableReferences
                                    ._accountIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, $$ExpensesTableReferences),
      Expense,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$IncomeRecordsTableCreateCompanionBuilder =
    IncomeRecordsCompanion Function({
      Value<int> id,
      required int date,
      required String category,
      required int amountMinor,
      required String accountId,
      Value<String> description,
      Value<String> reference,
      required int createdAt,
    });
typedef $$IncomeRecordsTableUpdateCompanionBuilder =
    IncomeRecordsCompanion Function({
      Value<int> id,
      Value<int> date,
      Value<String> category,
      Value<int> amountMinor,
      Value<String> accountId,
      Value<String> description,
      Value<String> reference,
      Value<int> createdAt,
    });

final class $$IncomeRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $IncomeRecordsTable, IncomeRecord> {
  $$IncomeRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CashAccountsTable _accountIdTable(_$AppDatabase db) => db.cashAccounts
      .createAlias('income_records__account_id__cash_accounts__id');

  $$CashAccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<String>('account_id')!;

    final manager = $$CashAccountsTableTableManager(
      $_db,
      $_db.cashAccounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IncomeRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeRecordsTable> {
  $$IncomeRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CashAccountsTableFilterComposer get accountId {
    final $$CashAccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableFilterComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeRecordsTable> {
  $$IncomeRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CashAccountsTableOrderingComposer get accountId {
    final $$CashAccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableOrderingComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeRecordsTable> {
  $$IncomeRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CashAccountsTableAnnotationComposer get accountId {
    final $$CashAccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncomeRecordsTable,
          IncomeRecord,
          $$IncomeRecordsTableFilterComposer,
          $$IncomeRecordsTableOrderingComposer,
          $$IncomeRecordsTableAnnotationComposer,
          $$IncomeRecordsTableCreateCompanionBuilder,
          $$IncomeRecordsTableUpdateCompanionBuilder,
          (IncomeRecord, $$IncomeRecordsTableReferences),
          IncomeRecord,
          PrefetchHooks Function({bool accountId})
        > {
  $$IncomeRecordsTableTableManager(_$AppDatabase db, $IncomeRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => IncomeRecordsCompanion(
                id: id,
                date: date,
                category: category,
                amountMinor: amountMinor,
                accountId: accountId,
                description: description,
                reference: reference,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int date,
                required String category,
                required int amountMinor,
                required String accountId,
                Value<String> description = const Value.absent(),
                Value<String> reference = const Value.absent(),
                required int createdAt,
              }) => IncomeRecordsCompanion.insert(
                id: id,
                date: date,
                category: category,
                amountMinor: amountMinor,
                accountId: accountId,
                description: description,
                reference: reference,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IncomeRecordsTable, IncomeRecord>(table),
                  $$IncomeRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$IncomeRecordsTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$IncomeRecordsTableReferences
                                    ._accountIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IncomeRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncomeRecordsTable,
      IncomeRecord,
      $$IncomeRecordsTableFilterComposer,
      $$IncomeRecordsTableOrderingComposer,
      $$IncomeRecordsTableAnnotationComposer,
      $$IncomeRecordsTableCreateCompanionBuilder,
      $$IncomeRecordsTableUpdateCompanionBuilder,
      (IncomeRecord, $$IncomeRecordsTableReferences),
      IncomeRecord,
      PrefetchHooks Function({bool accountId})
    >;
typedef $$AccountTransfersTableCreateCompanionBuilder =
    AccountTransfersCompanion Function({
      Value<int> id,
      required int date,
      required String fromAccountId,
      required String toAccountId,
      required int amountMinor,
      Value<String> reference,
      Value<String> notes,
      required int createdAt,
    });
typedef $$AccountTransfersTableUpdateCompanionBuilder =
    AccountTransfersCompanion Function({
      Value<int> id,
      Value<int> date,
      Value<String> fromAccountId,
      Value<String> toAccountId,
      Value<int> amountMinor,
      Value<String> reference,
      Value<String> notes,
      Value<int> createdAt,
    });

final class $$AccountTransfersTableReferences
    extends
        BaseReferences<_$AppDatabase, $AccountTransfersTable, AccountTransfer> {
  $$AccountTransfersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CashAccountsTable _fromAccountIdTable(_$AppDatabase db) => db
      .cashAccounts
      .createAlias('account_transfers__from_account_id__cash_accounts__id');

  $$CashAccountsTableProcessedTableManager get fromAccountId {
    final $_column = $_itemColumn<String>('from_account_id')!;

    final manager = $$CashAccountsTableTableManager(
      $_db,
      $_db.cashAccounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CashAccountsTable _toAccountIdTable(_$AppDatabase db) => db
      .cashAccounts
      .createAlias('account_transfers__to_account_id__cash_accounts__id');

  $$CashAccountsTableProcessedTableManager get toAccountId {
    final $_column = $_itemColumn<String>('to_account_id')!;

    final manager = $$CashAccountsTableTableManager(
      $_db,
      $_db.cashAccounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toAccountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountTransfersTableFilterComposer
    extends Composer<_$AppDatabase, $AccountTransfersTable> {
  $$AccountTransfersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CashAccountsTableFilterComposer get fromAccountId {
    final $$CashAccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromAccountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableFilterComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CashAccountsTableFilterComposer get toAccountId {
    final $$CashAccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toAccountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableFilterComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountTransfersTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountTransfersTable> {
  $$AccountTransfersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CashAccountsTableOrderingComposer get fromAccountId {
    final $$CashAccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromAccountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableOrderingComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CashAccountsTableOrderingComposer get toAccountId {
    final $$CashAccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toAccountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableOrderingComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountTransfersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountTransfersTable> {
  $$AccountTransfersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CashAccountsTableAnnotationComposer get fromAccountId {
    final $$CashAccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromAccountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CashAccountsTableAnnotationComposer get toAccountId {
    final $$CashAccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toAccountId,
      referencedTable: $db.cashAccounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CashAccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.cashAccounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountTransfersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountTransfersTable,
          AccountTransfer,
          $$AccountTransfersTableFilterComposer,
          $$AccountTransfersTableOrderingComposer,
          $$AccountTransfersTableAnnotationComposer,
          $$AccountTransfersTableCreateCompanionBuilder,
          $$AccountTransfersTableUpdateCompanionBuilder,
          (AccountTransfer, $$AccountTransfersTableReferences),
          AccountTransfer,
          PrefetchHooks Function({bool fromAccountId, bool toAccountId})
        > {
  $$AccountTransfersTableTableManager(
    _$AppDatabase db,
    $AccountTransfersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountTransfersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountTransfersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountTransfersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> fromAccountId = const Value.absent(),
                Value<String> toAccountId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => AccountTransfersCompanion(
                id: id,
                date: date,
                fromAccountId: fromAccountId,
                toAccountId: toAccountId,
                amountMinor: amountMinor,
                reference: reference,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int date,
                required String fromAccountId,
                required String toAccountId,
                required int amountMinor,
                Value<String> reference = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
              }) => AccountTransfersCompanion.insert(
                id: id,
                date: date,
                fromAccountId: fromAccountId,
                toAccountId: toAccountId,
                amountMinor: amountMinor,
                reference: reference,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AccountTransfersTable, AccountTransfer>(table),
                  $$AccountTransfersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({fromAccountId = false, toAccountId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (fromAccountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.fromAccountId,
                                    referencedTable:
                                        $$AccountTransfersTableReferences
                                            ._fromAccountIdTable(db),
                                    referencedColumn:
                                        $$AccountTransfersTableReferences
                                            ._fromAccountIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (toAccountId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.toAccountId,
                                    referencedTable:
                                        $$AccountTransfersTableReferences
                                            ._toAccountIdTable(db),
                                    referencedColumn:
                                        $$AccountTransfersTableReferences
                                            ._toAccountIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AccountTransfersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountTransfersTable,
      AccountTransfer,
      $$AccountTransfersTableFilterComposer,
      $$AccountTransfersTableOrderingComposer,
      $$AccountTransfersTableAnnotationComposer,
      $$AccountTransfersTableCreateCompanionBuilder,
      $$AccountTransfersTableUpdateCompanionBuilder,
      (AccountTransfer, $$AccountTransfersTableReferences),
      AccountTransfer,
      PrefetchHooks Function({bool fromAccountId, bool toAccountId})
    >;
typedef $$InventoryMovementsTableCreateCompanionBuilder =
    InventoryMovementsCompanion Function({
      Value<int> id,
      required String productId,
      required int date,
      required int qtyNum,
      Value<int> qtyDen,
      required String movementType,
      required String refKind,
      required String refId,
      Value<int> unitCostMinor,
      Value<String> notes,
    });
typedef $$InventoryMovementsTableUpdateCompanionBuilder =
    InventoryMovementsCompanion Function({
      Value<int> id,
      Value<String> productId,
      Value<int> date,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<String> movementType,
      Value<String> refKind,
      Value<String> refId,
      Value<int> unitCostMinor,
      Value<String> notes,
    });

final class $$InventoryMovementsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InventoryMovementsTable,
          InventoryMovement
        > {
  $$InventoryMovementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('inventory_movements__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InventoryMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refKind => $composableBuilder(
    column: $table.refKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refKind => $composableBuilder(
    column: $table.refKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get refKind =>
      $composableBuilder(column: $table.refKind, builder: (column) => column);

  GeneratedColumn<String> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryMovementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryMovementsTable,
          InventoryMovement,
          $$InventoryMovementsTableFilterComposer,
          $$InventoryMovementsTableOrderingComposer,
          $$InventoryMovementsTableAnnotationComposer,
          $$InventoryMovementsTableCreateCompanionBuilder,
          $$InventoryMovementsTableUpdateCompanionBuilder,
          (InventoryMovement, $$InventoryMovementsTableReferences),
          InventoryMovement,
          PrefetchHooks Function({bool productId})
        > {
  $$InventoryMovementsTableTableManager(
    _$AppDatabase db,
    $InventoryMovementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryMovementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<String> movementType = const Value.absent(),
                Value<String> refKind = const Value.absent(),
                Value<String> refId = const Value.absent(),
                Value<int> unitCostMinor = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => InventoryMovementsCompanion(
                id: id,
                productId: productId,
                date: date,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                movementType: movementType,
                refKind: refKind,
                refId: refId,
                unitCostMinor: unitCostMinor,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String productId,
                required int date,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                required String movementType,
                required String refKind,
                required String refId,
                Value<int> unitCostMinor = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => InventoryMovementsCompanion.insert(
                id: id,
                productId: productId,
                date: date,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                movementType: movementType,
                refKind: refKind,
                refId: refId,
                unitCostMinor: unitCostMinor,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InventoryMovementsTable, InventoryMovement>(
                    table,
                  ),
                  $$InventoryMovementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$InventoryMovementsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$InventoryMovementsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InventoryMovementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryMovementsTable,
      InventoryMovement,
      $$InventoryMovementsTableFilterComposer,
      $$InventoryMovementsTableOrderingComposer,
      $$InventoryMovementsTableAnnotationComposer,
      $$InventoryMovementsTableCreateCompanionBuilder,
      $$InventoryMovementsTableUpdateCompanionBuilder,
      (InventoryMovement, $$InventoryMovementsTableReferences),
      InventoryMovement,
      PrefetchHooks Function({bool productId})
    >;
typedef $$ProductionBatchesTableCreateCompanionBuilder =
    ProductionBatchesCompanion Function({
      required String id,
      required String batchNo,
      required int date,
      Value<String> notes,
      Value<int> labourCostMinor,
      Value<int> electricityCostMinor,
      Value<int> otherCostMinor,
      Value<String> status,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ProductionBatchesTableUpdateCompanionBuilder =
    ProductionBatchesCompanion Function({
      Value<String> id,
      Value<String> batchNo,
      Value<int> date,
      Value<String> notes,
      Value<int> labourCostMinor,
      Value<int> electricityCostMinor,
      Value<int> otherCostMinor,
      Value<String> status,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$ProductionBatchesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductionBatchesTable,
          ProductionBatche
        > {
  $$ProductionBatchesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ProductionInputsTable, List<ProductionInput>>
  _productionInputsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productionInputs,
    aliasName: 'production_batches__id__production_inputs__batch_id',
  );

  $$ProductionInputsTableProcessedTableManager get productionInputsRefs {
    final manager = $$ProductionInputsTableTableManager(
      $_db,
      $_db.productionInputs,
    ).filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productionInputsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductionOutputsTable, List<ProductionOutput>>
  _productionOutputsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productionOutputs,
        aliasName: 'production_batches__id__production_outputs__batch_id',
      );

  $$ProductionOutputsTableProcessedTableManager get productionOutputsRefs {
    final manager = $$ProductionOutputsTableTableManager(
      $_db,
      $_db.productionOutputs,
    ).filter((f) => f.batchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productionOutputsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductionBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductionBatchesTable> {
  $$ProductionBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchNo => $composableBuilder(
    column: $table.batchNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get labourCostMinor => $composableBuilder(
    column: $table.labourCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get electricityCostMinor => $composableBuilder(
    column: $table.electricityCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get otherCostMinor => $composableBuilder(
    column: $table.otherCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productionInputsRefs(
    Expression<bool> Function($$ProductionInputsTableFilterComposer f) f,
  ) {
    final $$ProductionInputsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productionInputs,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionInputsTableFilterComposer(
            $db: $db,
            $table: $db.productionInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productionOutputsRefs(
    Expression<bool> Function($$ProductionOutputsTableFilterComposer f) f,
  ) {
    final $$ProductionOutputsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productionOutputs,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionOutputsTableFilterComposer(
            $db: $db,
            $table: $db.productionOutputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductionBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductionBatchesTable> {
  $$ProductionBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchNo => $composableBuilder(
    column: $table.batchNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get labourCostMinor => $composableBuilder(
    column: $table.labourCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get electricityCostMinor => $composableBuilder(
    column: $table.electricityCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get otherCostMinor => $composableBuilder(
    column: $table.otherCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductionBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductionBatchesTable> {
  $$ProductionBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get batchNo =>
      $composableBuilder(column: $table.batchNo, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get labourCostMinor => $composableBuilder(
    column: $table.labourCostMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get electricityCostMinor => $composableBuilder(
    column: $table.electricityCostMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get otherCostMinor => $composableBuilder(
    column: $table.otherCostMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> productionInputsRefs<T extends Object>(
    Expression<T> Function($$ProductionInputsTableAnnotationComposer a) f,
  ) {
    final $$ProductionInputsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productionInputs,
      getReferencedColumn: (t) => t.batchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionInputsTableAnnotationComposer(
            $db: $db,
            $table: $db.productionInputs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productionOutputsRefs<T extends Object>(
    Expression<T> Function($$ProductionOutputsTableAnnotationComposer a) f,
  ) {
    final $$ProductionOutputsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productionOutputs,
          getReferencedColumn: (t) => t.batchId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductionOutputsTableAnnotationComposer(
                $db: $db,
                $table: $db.productionOutputs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductionBatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductionBatchesTable,
          ProductionBatche,
          $$ProductionBatchesTableFilterComposer,
          $$ProductionBatchesTableOrderingComposer,
          $$ProductionBatchesTableAnnotationComposer,
          $$ProductionBatchesTableCreateCompanionBuilder,
          $$ProductionBatchesTableUpdateCompanionBuilder,
          (ProductionBatche, $$ProductionBatchesTableReferences),
          ProductionBatche,
          PrefetchHooks Function({
            bool productionInputsRefs,
            bool productionOutputsRefs,
          })
        > {
  $$ProductionBatchesTableTableManager(
    _$AppDatabase db,
    $ProductionBatchesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductionBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductionBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductionBatchesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> batchNo = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> labourCostMinor = const Value.absent(),
                Value<int> electricityCostMinor = const Value.absent(),
                Value<int> otherCostMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductionBatchesCompanion(
                id: id,
                batchNo: batchNo,
                date: date,
                notes: notes,
                labourCostMinor: labourCostMinor,
                electricityCostMinor: electricityCostMinor,
                otherCostMinor: otherCostMinor,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String batchNo,
                required int date,
                Value<String> notes = const Value.absent(),
                Value<int> labourCostMinor = const Value.absent(),
                Value<int> electricityCostMinor = const Value.absent(),
                Value<int> otherCostMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductionBatchesCompanion.insert(
                id: id,
                batchNo: batchNo,
                date: date,
                notes: notes,
                labourCostMinor: labourCostMinor,
                electricityCostMinor: electricityCostMinor,
                otherCostMinor: otherCostMinor,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductionBatchesTable, ProductionBatche>(table),
                  $$ProductionBatchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productionInputsRefs = false, productionOutputsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productionInputsRefs) db.productionInputs,
                    if (productionOutputsRefs) db.productionOutputs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productionInputsRefs)
                        await $_getPrefetchedData<
                          ProductionBatche,
                          $ProductionBatchesTable,
                          ProductionInput
                        >(
                          currentTable: table,
                          referencedTable: $$ProductionBatchesTableReferences
                              ._productionInputsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductionBatchesTableReferences(
                                db,
                                table,
                                p0,
                              ).productionInputsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.batchId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productionOutputsRefs)
                        await $_getPrefetchedData<
                          ProductionBatche,
                          $ProductionBatchesTable,
                          ProductionOutput
                        >(
                          currentTable: table,
                          referencedTable: $$ProductionBatchesTableReferences
                              ._productionOutputsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductionBatchesTableReferences(
                                db,
                                table,
                                p0,
                              ).productionOutputsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.batchId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductionBatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductionBatchesTable,
      ProductionBatche,
      $$ProductionBatchesTableFilterComposer,
      $$ProductionBatchesTableOrderingComposer,
      $$ProductionBatchesTableAnnotationComposer,
      $$ProductionBatchesTableCreateCompanionBuilder,
      $$ProductionBatchesTableUpdateCompanionBuilder,
      (ProductionBatche, $$ProductionBatchesTableReferences),
      ProductionBatche,
      PrefetchHooks Function({
        bool productionInputsRefs,
        bool productionOutputsRefs,
      })
    >;
typedef $$ProductionInputsTableCreateCompanionBuilder =
    ProductionInputsCompanion Function({
      Value<int> id,
      required String batchId,
      required String productId,
      required int qtyNum,
      Value<int> qtyDen,
      Value<int> unitCostMinor,
    });
typedef $$ProductionInputsTableUpdateCompanionBuilder =
    ProductionInputsCompanion Function({
      Value<int> id,
      Value<String> batchId,
      Value<String> productId,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<int> unitCostMinor,
    });

final class $$ProductionInputsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProductionInputsTable, ProductionInput> {
  $$ProductionInputsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductionBatchesTable _batchIdTable(_$AppDatabase db) => db
      .productionBatches
      .createAlias('production_inputs__batch_id__production_batches__id');

  $$ProductionBatchesTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$ProductionBatchesTableTableManager(
      $_db,
      $_db.productionBatches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('production_inputs__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductionInputsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductionInputsTable> {
  $$ProductionInputsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductionBatchesTableFilterComposer get batchId {
    final $$ProductionBatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.productionBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionBatchesTableFilterComposer(
            $db: $db,
            $table: $db.productionBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductionInputsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductionInputsTable> {
  $$ProductionInputsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductionBatchesTableOrderingComposer get batchId {
    final $$ProductionBatchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.productionBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionBatchesTableOrderingComposer(
            $db: $db,
            $table: $db.productionBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductionInputsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductionInputsTable> {
  $$ProductionInputsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => column,
  );

  $$ProductionBatchesTableAnnotationComposer get batchId {
    final $$ProductionBatchesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.productionBatches,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductionBatchesTableAnnotationComposer(
                $db: $db,
                $table: $db.productionBatches,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductionInputsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductionInputsTable,
          ProductionInput,
          $$ProductionInputsTableFilterComposer,
          $$ProductionInputsTableOrderingComposer,
          $$ProductionInputsTableAnnotationComposer,
          $$ProductionInputsTableCreateCompanionBuilder,
          $$ProductionInputsTableUpdateCompanionBuilder,
          (ProductionInput, $$ProductionInputsTableReferences),
          ProductionInput,
          PrefetchHooks Function({bool batchId, bool productId})
        > {
  $$ProductionInputsTableTableManager(
    _$AppDatabase db,
    $ProductionInputsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductionInputsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductionInputsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductionInputsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> batchId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<int> unitCostMinor = const Value.absent(),
              }) => ProductionInputsCompanion(
                id: id,
                batchId: batchId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitCostMinor: unitCostMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String batchId,
                required String productId,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                Value<int> unitCostMinor = const Value.absent(),
              }) => ProductionInputsCompanion.insert(
                id: id,
                batchId: batchId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitCostMinor: unitCostMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductionInputsTable, ProductionInput>(table),
                  $$ProductionInputsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({batchId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (batchId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.batchId,
                                referencedTable:
                                    $$ProductionInputsTableReferences
                                        ._batchIdTable(db),
                                referencedColumn:
                                    $$ProductionInputsTableReferences
                                        ._batchIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$ProductionInputsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$ProductionInputsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductionInputsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductionInputsTable,
      ProductionInput,
      $$ProductionInputsTableFilterComposer,
      $$ProductionInputsTableOrderingComposer,
      $$ProductionInputsTableAnnotationComposer,
      $$ProductionInputsTableCreateCompanionBuilder,
      $$ProductionInputsTableUpdateCompanionBuilder,
      (ProductionInput, $$ProductionInputsTableReferences),
      ProductionInput,
      PrefetchHooks Function({bool batchId, bool productId})
    >;
typedef $$ProductionOutputsTableCreateCompanionBuilder =
    ProductionOutputsCompanion Function({
      Value<int> id,
      required String batchId,
      required String productId,
      required int qtyNum,
      Value<int> qtyDen,
      Value<int> unitCostMinor,
    });
typedef $$ProductionOutputsTableUpdateCompanionBuilder =
    ProductionOutputsCompanion Function({
      Value<int> id,
      Value<String> batchId,
      Value<String> productId,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<int> unitCostMinor,
    });

final class $$ProductionOutputsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductionOutputsTable,
          ProductionOutput
        > {
  $$ProductionOutputsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductionBatchesTable _batchIdTable(_$AppDatabase db) => db
      .productionBatches
      .createAlias('production_outputs__batch_id__production_batches__id');

  $$ProductionBatchesTableProcessedTableManager get batchId {
    final $_column = $_itemColumn<String>('batch_id')!;

    final manager = $$ProductionBatchesTableTableManager(
      $_db,
      $_db.productionBatches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_batchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('production_outputs__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductionOutputsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductionOutputsTable> {
  $$ProductionOutputsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductionBatchesTableFilterComposer get batchId {
    final $$ProductionBatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.productionBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionBatchesTableFilterComposer(
            $db: $db,
            $table: $db.productionBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductionOutputsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductionOutputsTable> {
  $$ProductionOutputsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductionBatchesTableOrderingComposer get batchId {
    final $$ProductionBatchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.batchId,
      referencedTable: $db.productionBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductionBatchesTableOrderingComposer(
            $db: $db,
            $table: $db.productionBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductionOutputsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductionOutputsTable> {
  $$ProductionOutputsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<int> get unitCostMinor => $composableBuilder(
    column: $table.unitCostMinor,
    builder: (column) => column,
  );

  $$ProductionBatchesTableAnnotationComposer get batchId {
    final $$ProductionBatchesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.batchId,
          referencedTable: $db.productionBatches,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductionBatchesTableAnnotationComposer(
                $db: $db,
                $table: $db.productionBatches,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductionOutputsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductionOutputsTable,
          ProductionOutput,
          $$ProductionOutputsTableFilterComposer,
          $$ProductionOutputsTableOrderingComposer,
          $$ProductionOutputsTableAnnotationComposer,
          $$ProductionOutputsTableCreateCompanionBuilder,
          $$ProductionOutputsTableUpdateCompanionBuilder,
          (ProductionOutput, $$ProductionOutputsTableReferences),
          ProductionOutput,
          PrefetchHooks Function({bool batchId, bool productId})
        > {
  $$ProductionOutputsTableTableManager(
    _$AppDatabase db,
    $ProductionOutputsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductionOutputsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductionOutputsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductionOutputsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> batchId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<int> unitCostMinor = const Value.absent(),
              }) => ProductionOutputsCompanion(
                id: id,
                batchId: batchId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitCostMinor: unitCostMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String batchId,
                required String productId,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                Value<int> unitCostMinor = const Value.absent(),
              }) => ProductionOutputsCompanion.insert(
                id: id,
                batchId: batchId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitCostMinor: unitCostMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductionOutputsTable, ProductionOutput>(table),
                  $$ProductionOutputsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({batchId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (batchId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.batchId,
                                referencedTable:
                                    $$ProductionOutputsTableReferences
                                        ._batchIdTable(db),
                                referencedColumn:
                                    $$ProductionOutputsTableReferences
                                        ._batchIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$ProductionOutputsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$ProductionOutputsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductionOutputsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductionOutputsTable,
      ProductionOutput,
      $$ProductionOutputsTableFilterComposer,
      $$ProductionOutputsTableOrderingComposer,
      $$ProductionOutputsTableAnnotationComposer,
      $$ProductionOutputsTableCreateCompanionBuilder,
      $$ProductionOutputsTableUpdateCompanionBuilder,
      (ProductionOutput, $$ProductionOutputsTableReferences),
      ProductionOutput,
      PrefetchHooks Function({bool batchId, bool productId})
    >;
typedef $$SalesReturnsTableCreateCompanionBuilder =
    SalesReturnsCompanion Function({
      required String id,
      required String returnNo,
      required String invoiceId,
      required int date,
      required int totalMinor,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$SalesReturnsTableUpdateCompanionBuilder =
    SalesReturnsCompanion Function({
      Value<String> id,
      Value<String> returnNo,
      Value<String> invoiceId,
      Value<int> date,
      Value<int> totalMinor,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$SalesReturnsTableReferences
    extends BaseReferences<_$AppDatabase, $SalesReturnsTable, SalesReturn> {
  $$SalesReturnsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SalesInvoicesTable _invoiceIdTable(_$AppDatabase db) => db
      .salesInvoices
      .createAlias('sales_returns__invoice_id__sales_invoices__id');

  $$SalesInvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<String>('invoice_id')!;

    final manager = $$SalesInvoicesTableTableManager(
      $_db,
      $_db.salesInvoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SalesReturnItemsTable, List<SalesReturnItem>>
  _salesReturnItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.salesReturnItems,
    aliasName: 'sales_returns__id__sales_return_items__return_id',
  );

  $$SalesReturnItemsTableProcessedTableManager get salesReturnItemsRefs {
    final manager = $$SalesReturnItemsTableTableManager(
      $_db,
      $_db.salesReturnItems,
    ).filter((f) => f.returnId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _salesReturnItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SalesReturnsTableFilterComposer
    extends Composer<_$AppDatabase, $SalesReturnsTable> {
  $$SalesReturnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get returnNo => $composableBuilder(
    column: $table.returnNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SalesInvoicesTableFilterComposer get invoiceId {
    final $$SalesInvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableFilterComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> salesReturnItemsRefs(
    Expression<bool> Function($$SalesReturnItemsTableFilterComposer f) f,
  ) {
    final $$SalesReturnItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesReturnItems,
      getReferencedColumn: (t) => t.returnId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnItemsTableFilterComposer(
            $db: $db,
            $table: $db.salesReturnItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalesReturnsTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesReturnsTable> {
  $$SalesReturnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnNo => $composableBuilder(
    column: $table.returnNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SalesInvoicesTableOrderingComposer get invoiceId {
    final $$SalesInvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesReturnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesReturnsTable> {
  $$SalesReturnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get returnNo =>
      $composableBuilder(column: $table.returnNo, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SalesInvoicesTableAnnotationComposer get invoiceId {
    final $$SalesInvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.salesInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesInvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.salesInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> salesReturnItemsRefs<T extends Object>(
    Expression<T> Function($$SalesReturnItemsTableAnnotationComposer a) f,
  ) {
    final $$SalesReturnItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesReturnItems,
      getReferencedColumn: (t) => t.returnId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.salesReturnItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalesReturnsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesReturnsTable,
          SalesReturn,
          $$SalesReturnsTableFilterComposer,
          $$SalesReturnsTableOrderingComposer,
          $$SalesReturnsTableAnnotationComposer,
          $$SalesReturnsTableCreateCompanionBuilder,
          $$SalesReturnsTableUpdateCompanionBuilder,
          (SalesReturn, $$SalesReturnsTableReferences),
          SalesReturn,
          PrefetchHooks Function({bool invoiceId, bool salesReturnItemsRefs})
        > {
  $$SalesReturnsTableTableManager(_$AppDatabase db, $SalesReturnsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesReturnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesReturnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesReturnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> returnNo = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> totalMinor = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SalesReturnsCompanion(
                id: id,
                returnNo: returnNo,
                invoiceId: invoiceId,
                date: date,
                totalMinor: totalMinor,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String returnNo,
                required String invoiceId,
                required int date,
                required int totalMinor,
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SalesReturnsCompanion.insert(
                id: id,
                returnNo: returnNo,
                invoiceId: invoiceId,
                date: date,
                totalMinor: totalMinor,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SalesReturnsTable, SalesReturn>(table),
                  $$SalesReturnsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoiceId = false, salesReturnItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (salesReturnItemsRefs) db.salesReturnItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (invoiceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.invoiceId,
                                    referencedTable:
                                        $$SalesReturnsTableReferences
                                            ._invoiceIdTable(db),
                                    referencedColumn:
                                        $$SalesReturnsTableReferences
                                            ._invoiceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (salesReturnItemsRefs)
                        await $_getPrefetchedData<
                          SalesReturn,
                          $SalesReturnsTable,
                          SalesReturnItem
                        >(
                          currentTable: table,
                          referencedTable: $$SalesReturnsTableReferences
                              ._salesReturnItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SalesReturnsTableReferences(
                                db,
                                table,
                                p0,
                              ).salesReturnItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.returnId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SalesReturnsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesReturnsTable,
      SalesReturn,
      $$SalesReturnsTableFilterComposer,
      $$SalesReturnsTableOrderingComposer,
      $$SalesReturnsTableAnnotationComposer,
      $$SalesReturnsTableCreateCompanionBuilder,
      $$SalesReturnsTableUpdateCompanionBuilder,
      (SalesReturn, $$SalesReturnsTableReferences),
      SalesReturn,
      PrefetchHooks Function({bool invoiceId, bool salesReturnItemsRefs})
    >;
typedef $$SalesReturnItemsTableCreateCompanionBuilder =
    SalesReturnItemsCompanion Function({
      Value<int> id,
      required String returnId,
      required String productId,
      required int qtyNum,
      Value<int> qtyDen,
      required int unitPriceMinor,
      required int lineTotalMinor,
    });
typedef $$SalesReturnItemsTableUpdateCompanionBuilder =
    SalesReturnItemsCompanion Function({
      Value<int> id,
      Value<String> returnId,
      Value<String> productId,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<int> unitPriceMinor,
      Value<int> lineTotalMinor,
    });

final class $$SalesReturnItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $SalesReturnItemsTable, SalesReturnItem> {
  $$SalesReturnItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SalesReturnsTable _returnIdTable(_$AppDatabase db) => db.salesReturns
      .createAlias('sales_return_items__return_id__sales_returns__id');

  $$SalesReturnsTableProcessedTableManager get returnId {
    final $_column = $_itemColumn<String>('return_id')!;

    final manager = $$SalesReturnsTableTableManager(
      $_db,
      $_db.salesReturns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_returnIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('sales_return_items__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SalesReturnItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SalesReturnItemsTable> {
  $$SalesReturnItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$SalesReturnsTableFilterComposer get returnId {
    final $$SalesReturnsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.returnId,
      referencedTable: $db.salesReturns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnsTableFilterComposer(
            $db: $db,
            $table: $db.salesReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesReturnItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesReturnItemsTable> {
  $$SalesReturnItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$SalesReturnsTableOrderingComposer get returnId {
    final $$SalesReturnsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.returnId,
      referencedTable: $db.salesReturns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnsTableOrderingComposer(
            $db: $db,
            $table: $db.salesReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesReturnItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesReturnItemsTable> {
  $$SalesReturnItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => column,
  );

  $$SalesReturnsTableAnnotationComposer get returnId {
    final $$SalesReturnsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.returnId,
      referencedTable: $db.salesReturns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesReturnsTableAnnotationComposer(
            $db: $db,
            $table: $db.salesReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesReturnItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesReturnItemsTable,
          SalesReturnItem,
          $$SalesReturnItemsTableFilterComposer,
          $$SalesReturnItemsTableOrderingComposer,
          $$SalesReturnItemsTableAnnotationComposer,
          $$SalesReturnItemsTableCreateCompanionBuilder,
          $$SalesReturnItemsTableUpdateCompanionBuilder,
          (SalesReturnItem, $$SalesReturnItemsTableReferences),
          SalesReturnItem,
          PrefetchHooks Function({bool returnId, bool productId})
        > {
  $$SalesReturnItemsTableTableManager(
    _$AppDatabase db,
    $SalesReturnItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesReturnItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesReturnItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesReturnItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> returnId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<int> unitPriceMinor = const Value.absent(),
                Value<int> lineTotalMinor = const Value.absent(),
              }) => SalesReturnItemsCompanion(
                id: id,
                returnId: returnId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitPriceMinor: unitPriceMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String returnId,
                required String productId,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                required int unitPriceMinor,
                required int lineTotalMinor,
              }) => SalesReturnItemsCompanion.insert(
                id: id,
                returnId: returnId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitPriceMinor: unitPriceMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SalesReturnItemsTable, SalesReturnItem>(table),
                  $$SalesReturnItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({returnId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (returnId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.returnId,
                                referencedTable:
                                    $$SalesReturnItemsTableReferences
                                        ._returnIdTable(db),
                                referencedColumn:
                                    $$SalesReturnItemsTableReferences
                                        ._returnIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$SalesReturnItemsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$SalesReturnItemsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SalesReturnItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesReturnItemsTable,
      SalesReturnItem,
      $$SalesReturnItemsTableFilterComposer,
      $$SalesReturnItemsTableOrderingComposer,
      $$SalesReturnItemsTableAnnotationComposer,
      $$SalesReturnItemsTableCreateCompanionBuilder,
      $$SalesReturnItemsTableUpdateCompanionBuilder,
      (SalesReturnItem, $$SalesReturnItemsTableReferences),
      SalesReturnItem,
      PrefetchHooks Function({bool returnId, bool productId})
    >;
typedef $$PurchaseReturnsTableCreateCompanionBuilder =
    PurchaseReturnsCompanion Function({
      required String id,
      required String returnNo,
      required String invoiceId,
      required int date,
      required int totalMinor,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$PurchaseReturnsTableUpdateCompanionBuilder =
    PurchaseReturnsCompanion Function({
      Value<String> id,
      Value<String> returnNo,
      Value<String> invoiceId,
      Value<int> date,
      Value<int> totalMinor,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$PurchaseReturnsTableReferences
    extends
        BaseReferences<_$AppDatabase, $PurchaseReturnsTable, PurchaseReturn> {
  $$PurchaseReturnsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PurchaseInvoicesTable _invoiceIdTable(_$AppDatabase db) => db
      .purchaseInvoices
      .createAlias('purchase_returns__invoice_id__purchase_invoices__id');

  $$PurchaseInvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<String>('invoice_id')!;

    final manager = $$PurchaseInvoicesTableTableManager(
      $_db,
      $_db.purchaseInvoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $PurchaseReturnItemsTable,
    List<PurchaseReturnItem>
  >
  _purchaseReturnItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.purchaseReturnItems,
        aliasName: 'purchase_returns__id__purchase_return_items__return_id',
      );

  $$PurchaseReturnItemsTableProcessedTableManager get purchaseReturnItemsRefs {
    final manager = $$PurchaseReturnItemsTableTableManager(
      $_db,
      $_db.purchaseReturnItems,
    ).filter((f) => f.returnId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _purchaseReturnItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PurchaseReturnsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseReturnsTable> {
  $$PurchaseReturnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get returnNo => $composableBuilder(
    column: $table.returnNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PurchaseInvoicesTableFilterComposer get invoiceId {
    final $$PurchaseInvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableFilterComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> purchaseReturnItemsRefs(
    Expression<bool> Function($$PurchaseReturnItemsTableFilterComposer f) f,
  ) {
    final $$PurchaseReturnItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchaseReturnItems,
      getReferencedColumn: (t) => t.returnId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnItemsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseReturnItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PurchaseReturnsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseReturnsTable> {
  $$PurchaseReturnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnNo => $composableBuilder(
    column: $table.returnNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PurchaseInvoicesTableOrderingComposer get invoiceId {
    final $$PurchaseInvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseReturnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseReturnsTable> {
  $$PurchaseReturnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get returnNo =>
      $composableBuilder(column: $table.returnNo, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PurchaseInvoicesTableAnnotationComposer get invoiceId {
    final $$PurchaseInvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.purchaseInvoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseInvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseInvoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> purchaseReturnItemsRefs<T extends Object>(
    Expression<T> Function($$PurchaseReturnItemsTableAnnotationComposer a) f,
  ) {
    final $$PurchaseReturnItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.purchaseReturnItems,
          getReferencedColumn: (t) => t.returnId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PurchaseReturnItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.purchaseReturnItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PurchaseReturnsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseReturnsTable,
          PurchaseReturn,
          $$PurchaseReturnsTableFilterComposer,
          $$PurchaseReturnsTableOrderingComposer,
          $$PurchaseReturnsTableAnnotationComposer,
          $$PurchaseReturnsTableCreateCompanionBuilder,
          $$PurchaseReturnsTableUpdateCompanionBuilder,
          (PurchaseReturn, $$PurchaseReturnsTableReferences),
          PurchaseReturn,
          PrefetchHooks Function({bool invoiceId, bool purchaseReturnItemsRefs})
        > {
  $$PurchaseReturnsTableTableManager(
    _$AppDatabase db,
    $PurchaseReturnsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseReturnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseReturnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseReturnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> returnNo = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> totalMinor = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseReturnsCompanion(
                id: id,
                returnNo: returnNo,
                invoiceId: invoiceId,
                date: date,
                totalMinor: totalMinor,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String returnNo,
                required String invoiceId,
                required int date,
                required int totalMinor,
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PurchaseReturnsCompanion.insert(
                id: id,
                returnNo: returnNo,
                invoiceId: invoiceId,
                date: date,
                totalMinor: totalMinor,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PurchaseReturnsTable, PurchaseReturn>(table),
                  $$PurchaseReturnsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoiceId = false, purchaseReturnItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (purchaseReturnItemsRefs) db.purchaseReturnItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (invoiceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.invoiceId,
                                    referencedTable:
                                        $$PurchaseReturnsTableReferences
                                            ._invoiceIdTable(db),
                                    referencedColumn:
                                        $$PurchaseReturnsTableReferences
                                            ._invoiceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (purchaseReturnItemsRefs)
                        await $_getPrefetchedData<
                          PurchaseReturn,
                          $PurchaseReturnsTable,
                          PurchaseReturnItem
                        >(
                          currentTable: table,
                          referencedTable: $$PurchaseReturnsTableReferences
                              ._purchaseReturnItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PurchaseReturnsTableReferences(
                                db,
                                table,
                                p0,
                              ).purchaseReturnItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.returnId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PurchaseReturnsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseReturnsTable,
      PurchaseReturn,
      $$PurchaseReturnsTableFilterComposer,
      $$PurchaseReturnsTableOrderingComposer,
      $$PurchaseReturnsTableAnnotationComposer,
      $$PurchaseReturnsTableCreateCompanionBuilder,
      $$PurchaseReturnsTableUpdateCompanionBuilder,
      (PurchaseReturn, $$PurchaseReturnsTableReferences),
      PurchaseReturn,
      PrefetchHooks Function({bool invoiceId, bool purchaseReturnItemsRefs})
    >;
typedef $$PurchaseReturnItemsTableCreateCompanionBuilder =
    PurchaseReturnItemsCompanion Function({
      Value<int> id,
      required String returnId,
      required String productId,
      required int qtyNum,
      Value<int> qtyDen,
      required int unitPriceMinor,
      required int lineTotalMinor,
    });
typedef $$PurchaseReturnItemsTableUpdateCompanionBuilder =
    PurchaseReturnItemsCompanion Function({
      Value<int> id,
      Value<String> returnId,
      Value<String> productId,
      Value<int> qtyNum,
      Value<int> qtyDen,
      Value<int> unitPriceMinor,
      Value<int> lineTotalMinor,
    });

final class $$PurchaseReturnItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PurchaseReturnItemsTable,
          PurchaseReturnItem
        > {
  $$PurchaseReturnItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PurchaseReturnsTable _returnIdTable(_$AppDatabase db) => db
      .purchaseReturns
      .createAlias('purchase_return_items__return_id__purchase_returns__id');

  $$PurchaseReturnsTableProcessedTableManager get returnId {
    final $_column = $_itemColumn<String>('return_id')!;

    final manager = $$PurchaseReturnsTableTableManager(
      $_db,
      $_db.purchaseReturns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_returnIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) => db.products
      .createAlias('purchase_return_items__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PurchaseReturnItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseReturnItemsTable> {
  $$PurchaseReturnItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$PurchaseReturnsTableFilterComposer get returnId {
    final $$PurchaseReturnsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.returnId,
      referencedTable: $db.purchaseReturns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnsTableFilterComposer(
            $db: $db,
            $table: $db.purchaseReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseReturnItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseReturnItemsTable> {
  $$PurchaseReturnItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyNum => $composableBuilder(
    column: $table.qtyNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qtyDen => $composableBuilder(
    column: $table.qtyDen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$PurchaseReturnsTableOrderingComposer get returnId {
    final $$PurchaseReturnsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.returnId,
      referencedTable: $db.purchaseReturns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnsTableOrderingComposer(
            $db: $db,
            $table: $db.purchaseReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseReturnItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseReturnItemsTable> {
  $$PurchaseReturnItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qtyNum =>
      $composableBuilder(column: $table.qtyNum, builder: (column) => column);

  GeneratedColumn<int> get qtyDen =>
      $composableBuilder(column: $table.qtyDen, builder: (column) => column);

  GeneratedColumn<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => column,
  );

  $$PurchaseReturnsTableAnnotationComposer get returnId {
    final $$PurchaseReturnsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.returnId,
      referencedTable: $db.purchaseReturns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchaseReturnsTableAnnotationComposer(
            $db: $db,
            $table: $db.purchaseReturns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchaseReturnItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseReturnItemsTable,
          PurchaseReturnItem,
          $$PurchaseReturnItemsTableFilterComposer,
          $$PurchaseReturnItemsTableOrderingComposer,
          $$PurchaseReturnItemsTableAnnotationComposer,
          $$PurchaseReturnItemsTableCreateCompanionBuilder,
          $$PurchaseReturnItemsTableUpdateCompanionBuilder,
          (PurchaseReturnItem, $$PurchaseReturnItemsTableReferences),
          PurchaseReturnItem,
          PrefetchHooks Function({bool returnId, bool productId})
        > {
  $$PurchaseReturnItemsTableTableManager(
    _$AppDatabase db,
    $PurchaseReturnItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseReturnItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseReturnItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PurchaseReturnItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> returnId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> qtyNum = const Value.absent(),
                Value<int> qtyDen = const Value.absent(),
                Value<int> unitPriceMinor = const Value.absent(),
                Value<int> lineTotalMinor = const Value.absent(),
              }) => PurchaseReturnItemsCompanion(
                id: id,
                returnId: returnId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitPriceMinor: unitPriceMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String returnId,
                required String productId,
                required int qtyNum,
                Value<int> qtyDen = const Value.absent(),
                required int unitPriceMinor,
                required int lineTotalMinor,
              }) => PurchaseReturnItemsCompanion.insert(
                id: id,
                returnId: returnId,
                productId: productId,
                qtyNum: qtyNum,
                qtyDen: qtyDen,
                unitPriceMinor: unitPriceMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PurchaseReturnItemsTable, PurchaseReturnItem>(
                    table,
                  ),
                  $$PurchaseReturnItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({returnId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (returnId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.returnId,
                                referencedTable:
                                    $$PurchaseReturnItemsTableReferences
                                        ._returnIdTable(db),
                                referencedColumn:
                                    $$PurchaseReturnItemsTableReferences
                                        ._returnIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$PurchaseReturnItemsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$PurchaseReturnItemsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PurchaseReturnItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseReturnItemsTable,
      PurchaseReturnItem,
      $$PurchaseReturnItemsTableFilterComposer,
      $$PurchaseReturnItemsTableOrderingComposer,
      $$PurchaseReturnItemsTableAnnotationComposer,
      $$PurchaseReturnItemsTableCreateCompanionBuilder,
      $$PurchaseReturnItemsTableUpdateCompanionBuilder,
      (PurchaseReturnItem, $$PurchaseReturnItemsTableReferences),
      PurchaseReturnItem,
      PrefetchHooks Function({bool returnId, bool productId})
    >;
typedef $$DocumentSequencesTableCreateCompanionBuilder =
    DocumentSequencesCompanion Function({
      required String docType,
      required String prefix,
      Value<int> nextNo,
      Value<int> rowid,
    });
typedef $$DocumentSequencesTableUpdateCompanionBuilder =
    DocumentSequencesCompanion Function({
      Value<String> docType,
      Value<String> prefix,
      Value<int> nextNo,
      Value<int> rowid,
    });

class $$DocumentSequencesTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentSequencesTable> {
  $$DocumentSequencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get docType => $composableBuilder(
    column: $table.docType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prefix => $composableBuilder(
    column: $table.prefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextNo => $composableBuilder(
    column: $table.nextNo,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentSequencesTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentSequencesTable> {
  $$DocumentSequencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get docType => $composableBuilder(
    column: $table.docType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prefix => $composableBuilder(
    column: $table.prefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextNo => $composableBuilder(
    column: $table.nextNo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentSequencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentSequencesTable> {
  $$DocumentSequencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get docType =>
      $composableBuilder(column: $table.docType, builder: (column) => column);

  GeneratedColumn<String> get prefix =>
      $composableBuilder(column: $table.prefix, builder: (column) => column);

  GeneratedColumn<int> get nextNo =>
      $composableBuilder(column: $table.nextNo, builder: (column) => column);
}

class $$DocumentSequencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentSequencesTable,
          DocumentSequence,
          $$DocumentSequencesTableFilterComposer,
          $$DocumentSequencesTableOrderingComposer,
          $$DocumentSequencesTableAnnotationComposer,
          $$DocumentSequencesTableCreateCompanionBuilder,
          $$DocumentSequencesTableUpdateCompanionBuilder,
          (
            DocumentSequence,
            BaseReferences<
              _$AppDatabase,
              $DocumentSequencesTable,
              DocumentSequence
            >,
          ),
          DocumentSequence,
          PrefetchHooks Function()
        > {
  $$DocumentSequencesTableTableManager(
    _$AppDatabase db,
    $DocumentSequencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentSequencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentSequencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentSequencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> docType = const Value.absent(),
                Value<String> prefix = const Value.absent(),
                Value<int> nextNo = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentSequencesCompanion(
                docType: docType,
                prefix: prefix,
                nextNo: nextNo,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String docType,
                required String prefix,
                Value<int> nextNo = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentSequencesCompanion.insert(
                docType: docType,
                prefix: prefix,
                nextNo: nextNo,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DocumentSequencesTable, DocumentSequence>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $DocumentSequencesTable,
                    DocumentSequence
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentSequencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentSequencesTable,
      DocumentSequence,
      $$DocumentSequencesTableFilterComposer,
      $$DocumentSequencesTableOrderingComposer,
      $$DocumentSequencesTableAnnotationComposer,
      $$DocumentSequencesTableCreateCompanionBuilder,
      $$DocumentSequencesTableUpdateCompanionBuilder,
      (
        DocumentSequence,
        BaseReferences<
          _$AppDatabase,
          $DocumentSequencesTable,
          DocumentSequence
        >,
      ),
      DocumentSequence,
      PrefetchHooks Function()
    >;
typedef $$BackupMetaTableCreateCompanionBuilder =
    BackupMetaCompanion Function({
      Value<int> id,
      required int createdAt,
      required int formatVersion,
      required String fileName,
      Value<String> checksum,
    });
typedef $$BackupMetaTableUpdateCompanionBuilder =
    BackupMetaCompanion Function({
      Value<int> id,
      Value<int> createdAt,
      Value<int> formatVersion,
      Value<String> fileName,
      Value<String> checksum,
    });

class $$BackupMetaTableFilterComposer
    extends Composer<_$AppDatabase, $BackupMetaTable> {
  $$BackupMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get formatVersion => $composableBuilder(
    column: $table.formatVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupMetaTable> {
  $$BackupMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get formatVersion => $composableBuilder(
    column: $table.formatVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupMetaTable> {
  $$BackupMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get formatVersion => $composableBuilder(
    column: $table.formatVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);
}

class $$BackupMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupMetaTable,
          BackupMetaData,
          $$BackupMetaTableFilterComposer,
          $$BackupMetaTableOrderingComposer,
          $$BackupMetaTableAnnotationComposer,
          $$BackupMetaTableCreateCompanionBuilder,
          $$BackupMetaTableUpdateCompanionBuilder,
          (
            BackupMetaData,
            BaseReferences<_$AppDatabase, $BackupMetaTable, BackupMetaData>,
          ),
          BackupMetaData,
          PrefetchHooks Function()
        > {
  $$BackupMetaTableTableManager(_$AppDatabase db, $BackupMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> formatVersion = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> checksum = const Value.absent(),
              }) => BackupMetaCompanion(
                id: id,
                createdAt: createdAt,
                formatVersion: formatVersion,
                fileName: fileName,
                checksum: checksum,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int createdAt,
                required int formatVersion,
                required String fileName,
                Value<String> checksum = const Value.absent(),
              }) => BackupMetaCompanion.insert(
                id: id,
                createdAt: createdAt,
                formatVersion: formatVersion,
                fileName: fileName,
                checksum: checksum,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BackupMetaTable, BackupMetaData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $BackupMetaTable,
                    BackupMetaData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupMetaTable,
      BackupMetaData,
      $$BackupMetaTableFilterComposer,
      $$BackupMetaTableOrderingComposer,
      $$BackupMetaTableAnnotationComposer,
      $$BackupMetaTableCreateCompanionBuilder,
      $$BackupMetaTableUpdateCompanionBuilder,
      (
        BackupMetaData,
        BaseReferences<_$AppDatabase, $BackupMetaTable, BackupMetaData>,
      ),
      BackupMetaData,
      PrefetchHooks Function()
    >;
typedef $$CustomerRemindersTableCreateCompanionBuilder =
    CustomerRemindersCompanion Function({
      Value<int> id,
      required String customerId,
      required int remindAt,
      Value<String> note,
      Value<int> done,
      required int createdAt,
    });
typedef $$CustomerRemindersTableUpdateCompanionBuilder =
    CustomerRemindersCompanion Function({
      Value<int> id,
      Value<String> customerId,
      Value<int> remindAt,
      Value<String> note,
      Value<int> done,
      Value<int> createdAt,
    });

class $$CustomerRemindersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerRemindersTable> {
  $$CustomerRemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remindAt => $composableBuilder(
    column: $table.remindAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomerRemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerRemindersTable> {
  $$CustomerRemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remindAt => $composableBuilder(
    column: $table.remindAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomerRemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerRemindersTable> {
  $$CustomerRemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get remindAt =>
      $composableBuilder(column: $table.remindAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomerRemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomerRemindersTable,
          CustomerReminder,
          $$CustomerRemindersTableFilterComposer,
          $$CustomerRemindersTableOrderingComposer,
          $$CustomerRemindersTableAnnotationComposer,
          $$CustomerRemindersTableCreateCompanionBuilder,
          $$CustomerRemindersTableUpdateCompanionBuilder,
          (
            CustomerReminder,
            BaseReferences<
              _$AppDatabase,
              $CustomerRemindersTable,
              CustomerReminder
            >,
          ),
          CustomerReminder,
          PrefetchHooks Function()
        > {
  $$CustomerRemindersTableTableManager(
    _$AppDatabase db,
    $CustomerRemindersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerRemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerRemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerRemindersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<int> remindAt = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<int> done = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => CustomerRemindersCompanion(
                id: id,
                customerId: customerId,
                remindAt: remindAt,
                note: note,
                done: done,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String customerId,
                required int remindAt,
                Value<String> note = const Value.absent(),
                Value<int> done = const Value.absent(),
                required int createdAt,
              }) => CustomerRemindersCompanion.insert(
                id: id,
                customerId: customerId,
                remindAt: remindAt,
                note: note,
                done: done,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CustomerRemindersTable, CustomerReminder>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CustomerRemindersTable,
                    CustomerReminder
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomerRemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomerRemindersTable,
      CustomerReminder,
      $$CustomerRemindersTableFilterComposer,
      $$CustomerRemindersTableOrderingComposer,
      $$CustomerRemindersTableAnnotationComposer,
      $$CustomerRemindersTableCreateCompanionBuilder,
      $$CustomerRemindersTableUpdateCompanionBuilder,
      (
        CustomerReminder,
        BaseReferences<
          _$AppDatabase,
          $CustomerRemindersTable,
          CustomerReminder
        >,
      ),
      CustomerReminder,
      PrefetchHooks Function()
    >;
typedef $$BackupSettingsTableCreateCompanionBuilder =
    BackupSettingsCompanion Function({
      Value<int> id,
      Value<String> googleAccountEmail,
      Value<int> autoBackupEnabled,
      Value<int> lastAutoBackupAt,
      Value<String> driveFolderId,
      required int updatedAt,
    });
typedef $$BackupSettingsTableUpdateCompanionBuilder =
    BackupSettingsCompanion Function({
      Value<int> id,
      Value<String> googleAccountEmail,
      Value<int> autoBackupEnabled,
      Value<int> lastAutoBackupAt,
      Value<String> driveFolderId,
      Value<int> updatedAt,
    });

class $$BackupSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $BackupSettingsTable> {
  $$BackupSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get googleAccountEmail => $composableBuilder(
    column: $table.googleAccountEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get autoBackupEnabled => $composableBuilder(
    column: $table.autoBackupEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastAutoBackupAt => $composableBuilder(
    column: $table.lastAutoBackupAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get driveFolderId => $composableBuilder(
    column: $table.driveFolderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupSettingsTable> {
  $$BackupSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get googleAccountEmail => $composableBuilder(
    column: $table.googleAccountEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get autoBackupEnabled => $composableBuilder(
    column: $table.autoBackupEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastAutoBackupAt => $composableBuilder(
    column: $table.lastAutoBackupAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get driveFolderId => $composableBuilder(
    column: $table.driveFolderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupSettingsTable> {
  $$BackupSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get googleAccountEmail => $composableBuilder(
    column: $table.googleAccountEmail,
    builder: (column) => column,
  );

  GeneratedColumn<int> get autoBackupEnabled => $composableBuilder(
    column: $table.autoBackupEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastAutoBackupAt => $composableBuilder(
    column: $table.lastAutoBackupAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get driveFolderId => $composableBuilder(
    column: $table.driveFolderId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BackupSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupSettingsTable,
          BackupSetting,
          $$BackupSettingsTableFilterComposer,
          $$BackupSettingsTableOrderingComposer,
          $$BackupSettingsTableAnnotationComposer,
          $$BackupSettingsTableCreateCompanionBuilder,
          $$BackupSettingsTableUpdateCompanionBuilder,
          (
            BackupSetting,
            BaseReferences<_$AppDatabase, $BackupSettingsTable, BackupSetting>,
          ),
          BackupSetting,
          PrefetchHooks Function()
        > {
  $$BackupSettingsTableTableManager(
    _$AppDatabase db,
    $BackupSettingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> googleAccountEmail = const Value.absent(),
                Value<int> autoBackupEnabled = const Value.absent(),
                Value<int> lastAutoBackupAt = const Value.absent(),
                Value<String> driveFolderId = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => BackupSettingsCompanion(
                id: id,
                googleAccountEmail: googleAccountEmail,
                autoBackupEnabled: autoBackupEnabled,
                lastAutoBackupAt: lastAutoBackupAt,
                driveFolderId: driveFolderId,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> googleAccountEmail = const Value.absent(),
                Value<int> autoBackupEnabled = const Value.absent(),
                Value<int> lastAutoBackupAt = const Value.absent(),
                Value<String> driveFolderId = const Value.absent(),
                required int updatedAt,
              }) => BackupSettingsCompanion.insert(
                id: id,
                googleAccountEmail: googleAccountEmail,
                autoBackupEnabled: autoBackupEnabled,
                lastAutoBackupAt: lastAutoBackupAt,
                driveFolderId: driveFolderId,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BackupSettingsTable, BackupSetting>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $BackupSettingsTable,
                    BackupSetting
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupSettingsTable,
      BackupSetting,
      $$BackupSettingsTableFilterComposer,
      $$BackupSettingsTableOrderingComposer,
      $$BackupSettingsTableAnnotationComposer,
      $$BackupSettingsTableCreateCompanionBuilder,
      $$BackupSettingsTableUpdateCompanionBuilder,
      (
        BackupSetting,
        BaseReferences<_$AppDatabase, $BackupSettingsTable, BackupSetting>,
      ),
      BackupSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BusinessSettingsTableTableManager get businessSettings =>
      $$BusinessSettingsTableTableManager(_db, _db.businessSettings);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$UnitConversionsTableTableManager get unitConversions =>
      $$UnitConversionsTableTableManager(_db, _db.unitConversions);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$CashAccountsTableTableManager get cashAccounts =>
      $$CashAccountsTableTableManager(_db, _db.cashAccounts);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$LedgerEntriesTableTableManager get ledgerEntries =>
      $$LedgerEntriesTableTableManager(_db, _db.ledgerEntries);
  $$SalesInvoicesTableTableManager get salesInvoices =>
      $$SalesInvoicesTableTableManager(_db, _db.salesInvoices);
  $$SalesInvoiceItemsTableTableManager get salesInvoiceItems =>
      $$SalesInvoiceItemsTableTableManager(_db, _db.salesInvoiceItems);
  $$PurchaseInvoicesTableTableManager get purchaseInvoices =>
      $$PurchaseInvoicesTableTableManager(_db, _db.purchaseInvoices);
  $$PurchaseInvoiceItemsTableTableManager get purchaseInvoiceItems =>
      $$PurchaseInvoiceItemsTableTableManager(_db, _db.purchaseInvoiceItems);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$PaymentAllocationsTableTableManager get paymentAllocations =>
      $$PaymentAllocationsTableTableManager(_db, _db.paymentAllocations);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$IncomeRecordsTableTableManager get incomeRecords =>
      $$IncomeRecordsTableTableManager(_db, _db.incomeRecords);
  $$AccountTransfersTableTableManager get accountTransfers =>
      $$AccountTransfersTableTableManager(_db, _db.accountTransfers);
  $$InventoryMovementsTableTableManager get inventoryMovements =>
      $$InventoryMovementsTableTableManager(_db, _db.inventoryMovements);
  $$ProductionBatchesTableTableManager get productionBatches =>
      $$ProductionBatchesTableTableManager(_db, _db.productionBatches);
  $$ProductionInputsTableTableManager get productionInputs =>
      $$ProductionInputsTableTableManager(_db, _db.productionInputs);
  $$ProductionOutputsTableTableManager get productionOutputs =>
      $$ProductionOutputsTableTableManager(_db, _db.productionOutputs);
  $$SalesReturnsTableTableManager get salesReturns =>
      $$SalesReturnsTableTableManager(_db, _db.salesReturns);
  $$SalesReturnItemsTableTableManager get salesReturnItems =>
      $$SalesReturnItemsTableTableManager(_db, _db.salesReturnItems);
  $$PurchaseReturnsTableTableManager get purchaseReturns =>
      $$PurchaseReturnsTableTableManager(_db, _db.purchaseReturns);
  $$PurchaseReturnItemsTableTableManager get purchaseReturnItems =>
      $$PurchaseReturnItemsTableTableManager(_db, _db.purchaseReturnItems);
  $$DocumentSequencesTableTableManager get documentSequences =>
      $$DocumentSequencesTableTableManager(_db, _db.documentSequences);
  $$BackupMetaTableTableManager get backupMeta =>
      $$BackupMetaTableTableManager(_db, _db.backupMeta);
  $$CustomerRemindersTableTableManager get customerReminders =>
      $$CustomerRemindersTableTableManager(_db, _db.customerReminders);
  $$BackupSettingsTableTableManager get backupSettings =>
      $$BackupSettingsTableTableManager(_db, _db.backupSettings);
}

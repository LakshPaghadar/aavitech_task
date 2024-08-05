// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CustomerDao? _customerDaoInstance;

  GetProductsResultDao? _getProductsResultDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customer` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `accountRef` TEXT, `address1` TEXT, `address2` TEXT, `address3` TEXT, `address4` TEXT, `address5` TEXT, `cAddress1` TEXT, `cAddress2` TEXT, `cAddress3` TEXT, `cAddress4` TEXT, `cAddress5` TEXT, `contactName` TEXT, `countryCode` TEXT, `createdDate` TEXT, `dateAccountOpened` TEXT, `discountPercentage` REAL, `email` TEXT, `fax` TEXT, `isCostcutter` INTEGER, `isDeleted` INTEGER, `isHenderson` INTEGER, `isMessageEnabled` INTEGER, `isMusgrave` INTEGER, `isPredictionEnable` INTEGER, `isTemplateEnable` INTEGER, `message` TEXT, `modifiedDate` TEXT, `name` TEXT, `telephone` TEXT, `telephone2` TEXT, `webAddress` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GetProductsResult` (`barCode` TEXT, `createdDate` TEXT, `deleted` INTEGER, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `isSpecialOfferSelected` INTEGER, `isWeight` INTEGER, `modifiedDate` TEXT, `name` TEXT, `nominalCode` TEXT, `packSize` INTEGER, `price` REAL, `productCategory` TEXT, `productCode` TEXT, `productVatId` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }

  @override
  GetProductsResultDao get getProductsResultDao {
    return _getProductsResultDaoInstance ??=
        _$GetProductsResultDao(database, changeListener);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _customerInsertionAdapter = InsertionAdapter(
            database,
            'Customer',
            (Customer item) => <String, Object?>{
                  'id': item.id,
                  'accountRef': item.accountRef,
                  'address1': item.address1,
                  'address2': item.address2,
                  'address3': item.address3,
                  'address4': item.address4,
                  'address5': item.address5,
                  'cAddress1': item.cAddress1,
                  'cAddress2': item.cAddress2,
                  'cAddress3': item.cAddress3,
                  'cAddress4': item.cAddress4,
                  'cAddress5': item.cAddress5,
                  'contactName': item.contactName,
                  'countryCode': item.countryCode,
                  'createdDate': item.createdDate,
                  'dateAccountOpened': item.dateAccountOpened,
                  'discountPercentage': item.discountPercentage,
                  'email': item.email,
                  'fax': item.fax,
                  'isCostcutter': item.isCostcutter == null
                      ? null
                      : (item.isCostcutter! ? 1 : 0),
                  'isDeleted':
                      item.isDeleted == null ? null : (item.isDeleted! ? 1 : 0),
                  'isHenderson': item.isHenderson == null
                      ? null
                      : (item.isHenderson! ? 1 : 0),
                  'isMessageEnabled': item.isMessageEnabled == null
                      ? null
                      : (item.isMessageEnabled! ? 1 : 0),
                  'isMusgrave': item.isMusgrave == null
                      ? null
                      : (item.isMusgrave! ? 1 : 0),
                  'isPredictionEnable': item.isPredictionEnable == null
                      ? null
                      : (item.isPredictionEnable! ? 1 : 0),
                  'isTemplateEnable': item.isTemplateEnable == null
                      ? null
                      : (item.isTemplateEnable! ? 1 : 0),
                  'message': item.message,
                  'modifiedDate': item.modifiedDate,
                  'name': item.name,
                  'telephone': item.telephone,
                  'telephone2': item.telephone2,
                  'webAddress': item.webAddress
                }),
        _customerUpdateAdapter = UpdateAdapter(
            database,
            'Customer',
            ['id'],
            (Customer item) => <String, Object?>{
                  'id': item.id,
                  'accountRef': item.accountRef,
                  'address1': item.address1,
                  'address2': item.address2,
                  'address3': item.address3,
                  'address4': item.address4,
                  'address5': item.address5,
                  'cAddress1': item.cAddress1,
                  'cAddress2': item.cAddress2,
                  'cAddress3': item.cAddress3,
                  'cAddress4': item.cAddress4,
                  'cAddress5': item.cAddress5,
                  'contactName': item.contactName,
                  'countryCode': item.countryCode,
                  'createdDate': item.createdDate,
                  'dateAccountOpened': item.dateAccountOpened,
                  'discountPercentage': item.discountPercentage,
                  'email': item.email,
                  'fax': item.fax,
                  'isCostcutter': item.isCostcutter == null
                      ? null
                      : (item.isCostcutter! ? 1 : 0),
                  'isDeleted':
                      item.isDeleted == null ? null : (item.isDeleted! ? 1 : 0),
                  'isHenderson': item.isHenderson == null
                      ? null
                      : (item.isHenderson! ? 1 : 0),
                  'isMessageEnabled': item.isMessageEnabled == null
                      ? null
                      : (item.isMessageEnabled! ? 1 : 0),
                  'isMusgrave': item.isMusgrave == null
                      ? null
                      : (item.isMusgrave! ? 1 : 0),
                  'isPredictionEnable': item.isPredictionEnable == null
                      ? null
                      : (item.isPredictionEnable! ? 1 : 0),
                  'isTemplateEnable': item.isTemplateEnable == null
                      ? null
                      : (item.isTemplateEnable! ? 1 : 0),
                  'message': item.message,
                  'modifiedDate': item.modifiedDate,
                  'name': item.name,
                  'telephone': item.telephone,
                  'telephone2': item.telephone2,
                  'webAddress': item.webAddress
                }),
        _customerDeletionAdapter = DeletionAdapter(
            database,
            'Customer',
            ['id'],
            (Customer item) => <String, Object?>{
                  'id': item.id,
                  'accountRef': item.accountRef,
                  'address1': item.address1,
                  'address2': item.address2,
                  'address3': item.address3,
                  'address4': item.address4,
                  'address5': item.address5,
                  'cAddress1': item.cAddress1,
                  'cAddress2': item.cAddress2,
                  'cAddress3': item.cAddress3,
                  'cAddress4': item.cAddress4,
                  'cAddress5': item.cAddress5,
                  'contactName': item.contactName,
                  'countryCode': item.countryCode,
                  'createdDate': item.createdDate,
                  'dateAccountOpened': item.dateAccountOpened,
                  'discountPercentage': item.discountPercentage,
                  'email': item.email,
                  'fax': item.fax,
                  'isCostcutter': item.isCostcutter == null
                      ? null
                      : (item.isCostcutter! ? 1 : 0),
                  'isDeleted':
                      item.isDeleted == null ? null : (item.isDeleted! ? 1 : 0),
                  'isHenderson': item.isHenderson == null
                      ? null
                      : (item.isHenderson! ? 1 : 0),
                  'isMessageEnabled': item.isMessageEnabled == null
                      ? null
                      : (item.isMessageEnabled! ? 1 : 0),
                  'isMusgrave': item.isMusgrave == null
                      ? null
                      : (item.isMusgrave! ? 1 : 0),
                  'isPredictionEnable': item.isPredictionEnable == null
                      ? null
                      : (item.isPredictionEnable! ? 1 : 0),
                  'isTemplateEnable': item.isTemplateEnable == null
                      ? null
                      : (item.isTemplateEnable! ? 1 : 0),
                  'message': item.message,
                  'modifiedDate': item.modifiedDate,
                  'name': item.name,
                  'telephone': item.telephone,
                  'telephone2': item.telephone2,
                  'webAddress': item.webAddress
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Customer> _customerInsertionAdapter;

  final UpdateAdapter<Customer> _customerUpdateAdapter;

  final DeletionAdapter<Customer> _customerDeletionAdapter;

  @override
  Future<List<Customer>> findAllCustomers() async {
    return _queryAdapter.queryList('SELECT * FROM Customer',
        mapper: (Map<String, Object?> row) => Customer(
            id: row['id'] as int?,
            accountRef: row['accountRef'] as String?,
            address1: row['address1'] as String?,
            address2: row['address2'] as String?,
            address3: row['address3'] as String?,
            address4: row['address4'] as String?,
            address5: row['address5'] as String?,
            cAddress1: row['cAddress1'] as String?,
            cAddress2: row['cAddress2'] as String?,
            cAddress3: row['cAddress3'] as String?,
            cAddress4: row['cAddress4'] as String?,
            cAddress5: row['cAddress5'] as String?,
            contactName: row['contactName'] as String?,
            countryCode: row['countryCode'] as String?,
            createdDate: row['createdDate'] as String?,
            dateAccountOpened: row['dateAccountOpened'] as String?,
            discountPercentage: row['discountPercentage'] as double?,
            email: row['email'] as String?,
            fax: row['fax'] as String?,
            isCostcutter: row['isCostcutter'] == null
                ? null
                : (row['isCostcutter'] as int) != 0,
            isDeleted: row['isDeleted'] == null
                ? null
                : (row['isDeleted'] as int) != 0,
            isHenderson: row['isHenderson'] == null
                ? null
                : (row['isHenderson'] as int) != 0,
            isMessageEnabled: row['isMessageEnabled'] == null
                ? null
                : (row['isMessageEnabled'] as int) != 0,
            isMusgrave: row['isMusgrave'] == null
                ? null
                : (row['isMusgrave'] as int) != 0,
            isPredictionEnable: row['isPredictionEnable'] == null
                ? null
                : (row['isPredictionEnable'] as int) != 0,
            isTemplateEnable: row['isTemplateEnable'] == null
                ? null
                : (row['isTemplateEnable'] as int) != 0,
            message: row['message'] as String?,
            modifiedDate: row['modifiedDate'] as String?,
            name: row['name'] as String?,
            telephone: row['telephone'] as String?,
            telephone2: row['telephone2'] as String?,
            webAddress: row['webAddress'] as String?));
  }

  @override
  Future<void> insertCustomer(Customer customer) async {
    await _customerInsertionAdapter.insert(customer, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCustomer(Customer customer) async {
    await _customerUpdateAdapter.update(customer, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCustomer(Customer customer) async {
    await _customerDeletionAdapter.delete(customer);
  }
}

class _$GetProductsResultDao extends GetProductsResultDao {
  _$GetProductsResultDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _getProductsResultInsertionAdapter = InsertionAdapter(
            database,
            'GetProductsResult',
            (GetProductsResult item) => <String, Object?>{
                  'barCode': item.barCode,
                  'createdDate': item.createdDate,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0),
                  'id': item.id,
                  'isSpecialOfferSelected': item.isSpecialOfferSelected == null
                      ? null
                      : (item.isSpecialOfferSelected! ? 1 : 0),
                  'isWeight':
                      item.isWeight == null ? null : (item.isWeight! ? 1 : 0),
                  'modifiedDate': item.modifiedDate,
                  'name': item.name,
                  'nominalCode': item.nominalCode,
                  'packSize': item.packSize,
                  'price': item.price,
                  'productCategory': item.productCategory,
                  'productCode': item.productCode,
                  'productVatId': item.productVatId
                }),
        _getProductsResultUpdateAdapter = UpdateAdapter(
            database,
            'GetProductsResult',
            ['id'],
            (GetProductsResult item) => <String, Object?>{
                  'barCode': item.barCode,
                  'createdDate': item.createdDate,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0),
                  'id': item.id,
                  'isSpecialOfferSelected': item.isSpecialOfferSelected == null
                      ? null
                      : (item.isSpecialOfferSelected! ? 1 : 0),
                  'isWeight':
                      item.isWeight == null ? null : (item.isWeight! ? 1 : 0),
                  'modifiedDate': item.modifiedDate,
                  'name': item.name,
                  'nominalCode': item.nominalCode,
                  'packSize': item.packSize,
                  'price': item.price,
                  'productCategory': item.productCategory,
                  'productCode': item.productCode,
                  'productVatId': item.productVatId
                }),
        _getProductsResultDeletionAdapter = DeletionAdapter(
            database,
            'GetProductsResult',
            ['id'],
            (GetProductsResult item) => <String, Object?>{
                  'barCode': item.barCode,
                  'createdDate': item.createdDate,
                  'deleted':
                      item.deleted == null ? null : (item.deleted! ? 1 : 0),
                  'id': item.id,
                  'isSpecialOfferSelected': item.isSpecialOfferSelected == null
                      ? null
                      : (item.isSpecialOfferSelected! ? 1 : 0),
                  'isWeight':
                      item.isWeight == null ? null : (item.isWeight! ? 1 : 0),
                  'modifiedDate': item.modifiedDate,
                  'name': item.name,
                  'nominalCode': item.nominalCode,
                  'packSize': item.packSize,
                  'price': item.price,
                  'productCategory': item.productCategory,
                  'productCode': item.productCode,
                  'productVatId': item.productVatId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GetProductsResult> _getProductsResultInsertionAdapter;

  final UpdateAdapter<GetProductsResult> _getProductsResultUpdateAdapter;

  final DeletionAdapter<GetProductsResult> _getProductsResultDeletionAdapter;

  @override
  Future<List<GetProductsResult>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM GetProductsResult',
        mapper: (Map<String, Object?> row) => GetProductsResult(
            barCode: row['barCode'] as String?,
            createdDate: row['createdDate'] as String?,
            deleted:
                row['deleted'] == null ? null : (row['deleted'] as int) != 0,
            id: row['id'] as int?,
            isSpecialOfferSelected: row['isSpecialOfferSelected'] == null
                ? null
                : (row['isSpecialOfferSelected'] as int) != 0,
            isWeight:
                row['isWeight'] == null ? null : (row['isWeight'] as int) != 0,
            modifiedDate: row['modifiedDate'] as String?,
            name: row['name'] as String?,
            nominalCode: row['nominalCode'] as String?,
            packSize: row['packSize'] as int?,
            price: row['price'] as double?,
            productCategory: row['productCategory'] as String?,
            productCode: row['productCode'] as String?,
            productVatId: row['productVatId'] as int?));
  }

  @override
  Future<void> insertProduct(GetProductsResult product) async {
    await _getProductsResultInsertionAdapter.insert(
        product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(GetProductsResult product) async {
    await _getProductsResultUpdateAdapter.update(
        product, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduct(GetProductsResult product) async {
    await _getProductsResultDeletionAdapter.delete(product);
  }
}

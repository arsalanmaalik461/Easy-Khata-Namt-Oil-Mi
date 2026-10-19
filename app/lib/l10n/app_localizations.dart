import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sd'),
    Locale('ur'),
    Locale.fromSubtags(languageCode: 'ur', scriptCode: 'Latn'),
  ];

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account name'**
  String get accountName;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account type'**
  String get accountType;

  /// No description provided for @accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accounts;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get addAccount;

  /// No description provided for @addCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get addCustomer;

  /// No description provided for @addCustomerHint.
  ///
  /// In en, this message translates to:
  /// **'Add your first customer to start keeping khata.'**
  String get addCustomerHint;

  /// No description provided for @addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpense;

  /// No description provided for @addFirstTransaction.
  ///
  /// In en, this message translates to:
  /// **'Record your first transaction to see it here.'**
  String get addFirstTransaction;

  /// No description provided for @addIncome.
  ///
  /// In en, this message translates to:
  /// **'Add Income'**
  String get addIncome;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get addItem;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProduct;

  /// No description provided for @addSupplier.
  ///
  /// In en, this message translates to:
  /// **'Add Supplier'**
  String get addSupplier;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @adjustStock.
  ///
  /// In en, this message translates to:
  /// **'Adjust stock'**
  String get adjustStock;

  /// No description provided for @adjustmentReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get adjustmentReason;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Namt Oil Mil'**
  String get appName;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @archiveConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'The full history will be kept.'**
  String get archiveConfirmBody;

  /// No description provided for @archiveCustomer.
  ///
  /// In en, this message translates to:
  /// **'Archive customer'**
  String get archiveCustomer;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @backupCreated.
  ///
  /// In en, this message translates to:
  /// **'Backup created successfully'**
  String get backupCreated;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed: {error}'**
  String backupFailed(Object error);

  /// No description provided for @backupNow.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get backupNow;

  /// No description provided for @backupRestored.
  ///
  /// In en, this message translates to:
  /// **'Backup restored successfully'**
  String get backupRestored;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @bankBalance.
  ///
  /// In en, this message translates to:
  /// **'Bank balance'**
  String get bankBalance;

  /// No description provided for @baseUnit.
  ///
  /// In en, this message translates to:
  /// **'Base unit'**
  String get baseUnit;

  /// No description provided for @batchDate.
  ///
  /// In en, this message translates to:
  /// **'Batch date'**
  String get batchDate;

  /// No description provided for @batchHistory.
  ///
  /// In en, this message translates to:
  /// **'Batch history'**
  String get batchHistory;

  /// No description provided for @batchNo.
  ///
  /// In en, this message translates to:
  /// **'Batch no.'**
  String get batchNo;

  /// No description provided for @businessName.
  ///
  /// In en, this message translates to:
  /// **'Business name'**
  String get businessName;

  /// No description provided for @businessSettings.
  ///
  /// In en, this message translates to:
  /// **'Business Settings'**
  String get businessSettings;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cashBalance.
  ///
  /// In en, this message translates to:
  /// **'Cash balance'**
  String get cashBalance;

  /// No description provided for @cashSale.
  ///
  /// In en, this message translates to:
  /// **'Cash sale'**
  String get cashSale;

  /// No description provided for @cashbook.
  ///
  /// In en, this message translates to:
  /// **'Cashbook'**
  String get cashbook;

  /// No description provided for @catAdmin.
  ///
  /// In en, this message translates to:
  /// **'Administrative'**
  String get catAdmin;

  /// No description provided for @catCake.
  ///
  /// In en, this message translates to:
  /// **'Oil cake / by-product'**
  String get catCake;

  /// No description provided for @catConsumables.
  ///
  /// In en, this message translates to:
  /// **'Consumables'**
  String get catConsumables;

  /// No description provided for @catContainers.
  ///
  /// In en, this message translates to:
  /// **'Containers'**
  String get catContainers;

  /// No description provided for @catElectricity.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get catElectricity;

  /// No description provided for @catFinishedOil.
  ///
  /// In en, this message translates to:
  /// **'Finished oil'**
  String get catFinishedOil;

  /// No description provided for @catLabour.
  ///
  /// In en, this message translates to:
  /// **'Labour'**
  String get catLabour;

  /// No description provided for @catMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get catMaintenance;

  /// No description provided for @catOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get catOther;

  /// No description provided for @catPackaging.
  ///
  /// In en, this message translates to:
  /// **'Packaging'**
  String get catPackaging;

  /// No description provided for @catRaw.
  ///
  /// In en, this message translates to:
  /// **'Oilseed / Raw material'**
  String get catRaw;

  /// No description provided for @catRent.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get catRent;

  /// No description provided for @catRepairs.
  ///
  /// In en, this message translates to:
  /// **'Repairs'**
  String get catRepairs;

  /// No description provided for @catSpareParts.
  ///
  /// In en, this message translates to:
  /// **'Spare parts'**
  String get catSpareParts;

  /// No description provided for @catTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get catTransport;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @changesSaved.
  ///
  /// In en, this message translates to:
  /// **'Changes saved'**
  String get changesSaved;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPin;

  /// No description provided for @confirmRestore.
  ///
  /// In en, this message translates to:
  /// **'Restoring will replace all current data. Continue?'**
  String get confirmRestore;

  /// No description provided for @copyMessage.
  ///
  /// In en, this message translates to:
  /// **'Copy message'**
  String get copyMessage;

  /// No description provided for @costOfGoods.
  ///
  /// In en, this message translates to:
  /// **'Cost of goods'**
  String get costOfGoods;

  /// No description provided for @costPerUnit.
  ///
  /// In en, this message translates to:
  /// **'Cost per unit'**
  String get costPerUnit;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @creditSale.
  ///
  /// In en, this message translates to:
  /// **'Credit sale'**
  String get creditSale;

  /// No description provided for @currentStock.
  ///
  /// In en, this message translates to:
  /// **'Current stock'**
  String get currentStock;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @customerCode.
  ///
  /// In en, this message translates to:
  /// **'Customer code (optional)'**
  String get customerCode;

  /// No description provided for @customerLedger.
  ///
  /// In en, this message translates to:
  /// **'Customer Ledger'**
  String get customerLedger;

  /// No description provided for @customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer name'**
  String get customerName;

  /// No description provided for @customerStatement.
  ///
  /// In en, this message translates to:
  /// **'Customer Statement'**
  String get customerStatement;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @dailyCashbook.
  ///
  /// In en, this message translates to:
  /// **'Daily cashbook'**
  String get dailyCashbook;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get debit;

  /// No description provided for @defaultCashAccount.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get defaultCashAccount;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get deleteConfirmBody;

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete?'**
  String get deleteConfirmTitle;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @dueSoon.
  ///
  /// In en, this message translates to:
  /// **'Due soon'**
  String get dueSoon;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get editCustomer;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @editSupplier.
  ///
  /// In en, this message translates to:
  /// **'Edit Supplier'**
  String get editSupplier;

  /// No description provided for @electricityCost.
  ///
  /// In en, this message translates to:
  /// **'Electricity cost'**
  String get electricityCost;

  /// No description provided for @emptyStateTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get emptyStateTitle;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get enterPin;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @estimated.
  ///
  /// In en, this message translates to:
  /// **'estimated'**
  String get estimated;

  /// No description provided for @expenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get expenseCategory;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @finishedOutputs.
  ///
  /// In en, this message translates to:
  /// **'Finished outputs'**
  String get finishedOutputs;

  /// No description provided for @firstLaunchBody.
  ///
  /// In en, this message translates to:
  /// **'Set up your business to begin keeping digital khata. Everything works offline.'**
  String get firstLaunchBody;

  /// No description provided for @firstLaunchTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Namt Oil Mil'**
  String get firstLaunchTitle;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @fromAccount.
  ///
  /// In en, this message translates to:
  /// **'From account'**
  String get fromAccount;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @giveUdhaar.
  ///
  /// In en, this message translates to:
  /// **'Give Udhaar'**
  String get giveUdhaar;

  /// No description provided for @grandTotal.
  ///
  /// In en, this message translates to:
  /// **'Grand total'**
  String get grandTotal;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get inStock;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @insufficientStock.
  ///
  /// In en, this message translates to:
  /// **'Insufficient stock for: {product}'**
  String insufficientStock(Object product);

  /// No description provided for @invalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount greater than zero'**
  String get invalidAmount;

  /// No description provided for @invalidBackup.
  ///
  /// In en, this message translates to:
  /// **'This file is not a valid Namt Oil Mil backup.'**
  String get invalidBackup;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @invoiceDate.
  ///
  /// In en, this message translates to:
  /// **'Invoice date'**
  String get invoiceDate;

  /// No description provided for @invoiceNo.
  ///
  /// In en, this message translates to:
  /// **'Invoice no.'**
  String get invoiceNo;

  /// No description provided for @invoiceStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get invoiceStatus;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @labourCost.
  ///
  /// In en, this message translates to:
  /// **'Labour cost'**
  String get labourCost;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @lastBackup.
  ///
  /// In en, this message translates to:
  /// **'Last backup'**
  String get lastBackup;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @loss.
  ///
  /// In en, this message translates to:
  /// **'Loss'**
  String get loss;

  /// No description provided for @lowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get lowStock;

  /// No description provided for @lowStockAlerts.
  ///
  /// In en, this message translates to:
  /// **'Low stock alerts'**
  String get lowStockAlerts;

  /// No description provided for @makePayment.
  ///
  /// In en, this message translates to:
  /// **'Make Payment'**
  String get makePayment;

  /// No description provided for @messageCopied.
  ///
  /// In en, this message translates to:
  /// **'Message copied'**
  String get messageCopied;

  /// No description provided for @methodBank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get methodBank;

  /// No description provided for @methodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get methodCash;

  /// No description provided for @methodEasypaisa.
  ///
  /// In en, this message translates to:
  /// **'Easypaisa'**
  String get methodEasypaisa;

  /// No description provided for @methodJazzcash.
  ///
  /// In en, this message translates to:
  /// **'JazzCash'**
  String get methodJazzcash;

  /// No description provided for @methodOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get methodOther;

  /// No description provided for @monthlyExpenses.
  ///
  /// In en, this message translates to:
  /// **'Monthly expenses'**
  String get monthlyExpenses;

  /// No description provided for @monthlyIncome.
  ///
  /// In en, this message translates to:
  /// **'Monthly income'**
  String get monthlyIncome;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navKhata.
  ///
  /// In en, this message translates to:
  /// **'Khata'**
  String get navKhata;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @navReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get navReports;

  /// No description provided for @navTransactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get navTransactions;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Net profit'**
  String get netProfit;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// No description provided for @newBatch.
  ///
  /// In en, this message translates to:
  /// **'New Batch'**
  String get newBatch;

  /// No description provided for @newPurchase.
  ///
  /// In en, this message translates to:
  /// **'New Purchase'**
  String get newPurchase;

  /// No description provided for @newPurchaseReturn.
  ///
  /// In en, this message translates to:
  /// **'New purchase return'**
  String get newPurchaseReturn;

  /// No description provided for @newSale.
  ///
  /// In en, this message translates to:
  /// **'New Sale'**
  String get newSale;

  /// No description provided for @newSalesReturn.
  ///
  /// In en, this message translates to:
  /// **'New sales return'**
  String get newSalesReturn;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noCustomers.
  ///
  /// In en, this message translates to:
  /// **'No customers yet'**
  String get noCustomers;

  /// No description provided for @noInternetNeeded.
  ///
  /// In en, this message translates to:
  /// **'Works offline'**
  String get noInternetNeeded;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get noProducts;

  /// No description provided for @noSuppliers.
  ///
  /// In en, this message translates to:
  /// **'No suppliers yet'**
  String get noSuppliers;

  /// No description provided for @noTransactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get noTransactionsYet;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @onboardingDone.
  ///
  /// In en, this message translates to:
  /// **'Let\'s begin'**
  String get onboardingDone;

  /// No description provided for @openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening balance'**
  String get openingBalance;

  /// No description provided for @operatingExpenses.
  ///
  /// In en, this message translates to:
  /// **'Operating expenses'**
  String get operatingExpenses;

  /// No description provided for @otherCost.
  ///
  /// In en, this message translates to:
  /// **'Other cost'**
  String get otherCost;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get outOfStock;

  /// No description provided for @outstandingBalance.
  ///
  /// In en, this message translates to:
  /// **'Outstanding balance'**
  String get outstandingBalance;

  /// No description provided for @outstandingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Outstanding invoices'**
  String get outstandingInvoices;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @paidAmount.
  ///
  /// In en, this message translates to:
  /// **'Paid amount'**
  String get paidAmount;

  /// No description provided for @paidToday.
  ///
  /// In en, this message translates to:
  /// **'Paid today'**
  String get paidToday;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get paymentMethod;

  /// No description provided for @paymentReceipt.
  ///
  /// In en, this message translates to:
  /// **'Payment Receipt'**
  String get paymentReceipt;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @pinLock.
  ///
  /// In en, this message translates to:
  /// **'PIN Lock'**
  String get pinLock;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get pinMismatch;

  /// No description provided for @pinRemoved.
  ///
  /// In en, this message translates to:
  /// **'PIN removed'**
  String get pinRemoved;

  /// No description provided for @pinSet.
  ///
  /// In en, this message translates to:
  /// **'PIN set successfully'**
  String get pinSet;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @processLoss.
  ///
  /// In en, this message translates to:
  /// **'Process loss'**
  String get processLoss;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productName;

  /// No description provided for @production.
  ///
  /// In en, this message translates to:
  /// **'Production'**
  String get production;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get profit;

  /// No description provided for @purchaseInvoice.
  ///
  /// In en, this message translates to:
  /// **'Purchase Voucher'**
  String get purchaseInvoice;

  /// No description provided for @purchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Purchase price'**
  String get purchasePrice;

  /// No description provided for @purchaseReturns.
  ///
  /// In en, this message translates to:
  /// **'Purchase returns'**
  String get purchaseReturns;

  /// No description provided for @purchases.
  ///
  /// In en, this message translates to:
  /// **'Purchases'**
  String get purchases;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// No description provided for @rawMaterials.
  ///
  /// In en, this message translates to:
  /// **'Raw materials'**
  String get rawMaterials;

  /// No description provided for @receipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get receipt;

  /// No description provided for @receivePayment.
  ///
  /// In en, this message translates to:
  /// **'Receive Payment'**
  String get receivePayment;

  /// No description provided for @receivedToday.
  ///
  /// In en, this message translates to:
  /// **'Received today'**
  String get receivedToday;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recentTransactions;

  /// No description provided for @recordAdvance.
  ///
  /// In en, this message translates to:
  /// **'Record Advance'**
  String get recordAdvance;

  /// No description provided for @recordSaved.
  ///
  /// In en, this message translates to:
  /// **'Record saved'**
  String get recordSaved;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @remainingAmount.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remainingAmount;

  /// No description provided for @reminderMessage.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminderMessage;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @reorderLevel.
  ///
  /// In en, this message translates to:
  /// **'Reorder level'**
  String get reorderLevel;

  /// No description provided for @reportBalances.
  ///
  /// In en, this message translates to:
  /// **'Cash & bank balances'**
  String get reportBalances;

  /// No description provided for @reportCashbook.
  ///
  /// In en, this message translates to:
  /// **'Cashbook'**
  String get reportCashbook;

  /// No description provided for @reportCustomerLedger.
  ///
  /// In en, this message translates to:
  /// **'Customer ledger'**
  String get reportCustomerLedger;

  /// No description provided for @reportDailySummary.
  ///
  /// In en, this message translates to:
  /// **'Daily summary'**
  String get reportDailySummary;

  /// No description provided for @reportExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expense report'**
  String get reportExpenses;

  /// No description provided for @reportIncome.
  ///
  /// In en, this message translates to:
  /// **'Income report'**
  String get reportIncome;

  /// No description provided for @reportInventoryValuation.
  ///
  /// In en, this message translates to:
  /// **'Inventory valuation'**
  String get reportInventoryValuation;

  /// No description provided for @reportLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low-stock report'**
  String get reportLowStock;

  /// No description provided for @reportMonthlySummary.
  ///
  /// In en, this message translates to:
  /// **'Monthly summary'**
  String get reportMonthlySummary;

  /// No description provided for @reportPayables.
  ///
  /// In en, this message translates to:
  /// **'Payables'**
  String get reportPayables;

  /// No description provided for @reportPaymentsMade.
  ///
  /// In en, this message translates to:
  /// **'Payments made'**
  String get reportPaymentsMade;

  /// No description provided for @reportPaymentsReceived.
  ///
  /// In en, this message translates to:
  /// **'Payments received'**
  String get reportPaymentsReceived;

  /// No description provided for @reportProduction.
  ///
  /// In en, this message translates to:
  /// **'Production report'**
  String get reportProduction;

  /// No description provided for @reportProfitLoss.
  ///
  /// In en, this message translates to:
  /// **'Profit & loss'**
  String get reportProfitLoss;

  /// No description provided for @reportPurchases.
  ///
  /// In en, this message translates to:
  /// **'Purchase report'**
  String get reportPurchases;

  /// No description provided for @reportReceivables.
  ///
  /// In en, this message translates to:
  /// **'Receivables'**
  String get reportReceivables;

  /// No description provided for @reportSales.
  ///
  /// In en, this message translates to:
  /// **'Sales report'**
  String get reportSales;

  /// No description provided for @reportStockMovement.
  ///
  /// In en, this message translates to:
  /// **'Stock movement'**
  String get reportStockMovement;

  /// No description provided for @reportSupplierLedger.
  ///
  /// In en, this message translates to:
  /// **'Supplier ledger'**
  String get reportSupplierLedger;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup'**
  String get restoreBackup;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {error}'**
  String restoreFailed(Object error);

  /// No description provided for @revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// No description provided for @runningBalance.
  ///
  /// In en, this message translates to:
  /// **'Running balance'**
  String get runningBalance;

  /// No description provided for @saleInvoice.
  ///
  /// In en, this message translates to:
  /// **'Sale Invoice'**
  String get saleInvoice;

  /// No description provided for @salePrice.
  ///
  /// In en, this message translates to:
  /// **'Sale price'**
  String get salePrice;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @salesReturns.
  ///
  /// In en, this message translates to:
  /// **'Sales returns'**
  String get salesReturns;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchCustomers.
  ///
  /// In en, this message translates to:
  /// **'Search customers…'**
  String get searchCustomers;

  /// No description provided for @searchSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Search suppliers…'**
  String get searchSuppliers;

  /// No description provided for @selectAccount.
  ///
  /// In en, this message translates to:
  /// **'Select account'**
  String get selectAccount;

  /// No description provided for @selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select customer'**
  String get selectCustomer;

  /// No description provided for @selectProduct.
  ///
  /// In en, this message translates to:
  /// **'Select product'**
  String get selectProduct;

  /// No description provided for @selectSupplier.
  ///
  /// In en, this message translates to:
  /// **'Select supplier'**
  String get selectSupplier;

  /// No description provided for @sendReminder.
  ///
  /// In en, this message translates to:
  /// **'Send reminder'**
  String get sendReminder;

  /// No description provided for @setPin.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get setPin;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get settled;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @shareViaWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Share via WhatsApp'**
  String get shareViaWhatsApp;

  /// No description provided for @statement.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get statement;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @statusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get statusDraft;

  /// No description provided for @statusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get statusPaid;

  /// No description provided for @statusPartiallyPaid.
  ///
  /// In en, this message translates to:
  /// **'Partially paid'**
  String get statusPartiallyPaid;

  /// No description provided for @statusReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned'**
  String get statusReturned;

  /// No description provided for @statusUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get statusUnpaid;

  /// No description provided for @stockIn.
  ///
  /// In en, this message translates to:
  /// **'Stock in'**
  String get stockIn;

  /// No description provided for @stockMovement.
  ///
  /// In en, this message translates to:
  /// **'Stock movement'**
  String get stockMovement;

  /// No description provided for @stockOut.
  ///
  /// In en, this message translates to:
  /// **'Stock out'**
  String get stockOut;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @supplierCode.
  ///
  /// In en, this message translates to:
  /// **'Supplier code (optional)'**
  String get supplierCode;

  /// No description provided for @supplierLedger.
  ///
  /// In en, this message translates to:
  /// **'Supplier Ledger'**
  String get supplierLedger;

  /// No description provided for @supplierName.
  ///
  /// In en, this message translates to:
  /// **'Supplier name'**
  String get supplierName;

  /// No description provided for @supplierStatement.
  ///
  /// In en, this message translates to:
  /// **'Supplier Statement'**
  String get supplierStatement;

  /// No description provided for @suppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get suppliers;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Your Digital Khata'**
  String get tagline;

  /// No description provided for @tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get tax;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get thisMonth;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @thisYear.
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get thisYear;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @toAccount.
  ///
  /// In en, this message translates to:
  /// **'To account'**
  String get toAccount;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @todayPurchases.
  ///
  /// In en, this message translates to:
  /// **'Today\'s purchases'**
  String get todayPurchases;

  /// No description provided for @todaySales.
  ///
  /// In en, this message translates to:
  /// **'Today\'s sales'**
  String get todaySales;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total cost'**
  String get totalCost;

  /// No description provided for @totalCreditGiven.
  ///
  /// In en, this message translates to:
  /// **'Total credit given'**
  String get totalCreditGiven;

  /// No description provided for @totalPaid.
  ///
  /// In en, this message translates to:
  /// **'Total paid'**
  String get totalPaid;

  /// No description provided for @totalPayables.
  ///
  /// In en, this message translates to:
  /// **'To pay'**
  String get totalPayables;

  /// No description provided for @totalPurchased.
  ///
  /// In en, this message translates to:
  /// **'Total purchased'**
  String get totalPurchased;

  /// No description provided for @totalReceivables.
  ///
  /// In en, this message translates to:
  /// **'To receive'**
  String get totalReceivables;

  /// No description provided for @totalReceived.
  ///
  /// In en, this message translates to:
  /// **'Total received'**
  String get totalReceived;

  /// No description provided for @transactionRecorded.
  ///
  /// In en, this message translates to:
  /// **'Transaction recorded'**
  String get transactionRecorded;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @transferFunds.
  ///
  /// In en, this message translates to:
  /// **'Transfer Funds'**
  String get transferFunds;

  /// No description provided for @typeBank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get typeBank;

  /// No description provided for @typeCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get typeCash;

  /// No description provided for @unarchiveCustomer.
  ///
  /// In en, this message translates to:
  /// **'Unarchive customer'**
  String get unarchiveCustomer;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @unitBag.
  ///
  /// In en, this message translates to:
  /// **'Bag'**
  String get unitBag;

  /// No description provided for @unitGram.
  ///
  /// In en, this message translates to:
  /// **'Gram'**
  String get unitGram;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'Kilogram'**
  String get unitKg;

  /// No description provided for @unitLitre.
  ///
  /// In en, this message translates to:
  /// **'Litre'**
  String get unitLitre;

  /// No description provided for @unitMaund.
  ///
  /// In en, this message translates to:
  /// **'Maund'**
  String get unitMaund;

  /// No description provided for @unitPiece.
  ///
  /// In en, this message translates to:
  /// **'Piece'**
  String get unitPiece;

  /// No description provided for @unitPrice.
  ///
  /// In en, this message translates to:
  /// **'Unit price'**
  String get unitPrice;

  /// No description provided for @unitTon.
  ///
  /// In en, this message translates to:
  /// **'Metric ton'**
  String get unitTon;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @voucher.
  ///
  /// In en, this message translates to:
  /// **'Voucher'**
  String get voucher;

  /// No description provided for @wastage.
  ///
  /// In en, this message translates to:
  /// **'Wastage'**
  String get wastage;

  /// No description provided for @wrongPin.
  ///
  /// In en, this message translates to:
  /// **'Wrong PIN'**
  String get wrongPin;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @yieldPercent.
  ///
  /// In en, this message translates to:
  /// **'Yield'**
  String get yieldPercent;

  /// No description provided for @youWillPay.
  ///
  /// In en, this message translates to:
  /// **'You will pay'**
  String get youWillPay;

  /// No description provided for @youWillReceive.
  ///
  /// In en, this message translates to:
  /// **'You will receive'**
  String get youWillReceive;

  /// No description provided for @googleBackup.
  ///
  /// In en, this message translates to:
  /// **'Google / Drive Backup'**
  String get googleBackup;

  /// No description provided for @googleBackupHint.
  ///
  /// In en, this message translates to:
  /// **'Connect your Google account to back up to Drive'**
  String get googleBackupHint;

  /// No description provided for @connectGoogle.
  ///
  /// In en, this message translates to:
  /// **'Connect Google'**
  String get connectGoogle;

  /// No description provided for @disconnectGoogle.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnectGoogle;

  /// No description provided for @googleConnectedAs.
  ///
  /// In en, this message translates to:
  /// **'Connected as {email}'**
  String googleConnectedAs(Object email);

  /// No description provided for @googleConnected.
  ///
  /// In en, this message translates to:
  /// **'Google account connected'**
  String get googleConnected;

  /// No description provided for @googleDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Google account disconnected'**
  String get googleDisconnected;

  /// No description provided for @googleDisconnectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Disconnect your Google account? Auto-backup will be turned off.'**
  String get googleDisconnectConfirm;

  /// No description provided for @autoBackup24h.
  ///
  /// In en, this message translates to:
  /// **'24h auto-backup'**
  String get autoBackup24h;

  /// No description provided for @autoBackup24hHint.
  ///
  /// In en, this message translates to:
  /// **'Automatically back up to Google Drive every 24 hours'**
  String get autoBackup24hHint;

  /// No description provided for @autoBackupEnabled.
  ///
  /// In en, this message translates to:
  /// **'Auto-backup enabled'**
  String get autoBackupEnabled;

  /// No description provided for @lastAutoBackup.
  ///
  /// In en, this message translates to:
  /// **'Last auto-backup'**
  String get lastAutoBackup;

  /// No description provided for @backupNowDrive.
  ///
  /// In en, this message translates to:
  /// **'Back up to Drive now'**
  String get backupNowDrive;

  /// No description provided for @driveBackup.
  ///
  /// In en, this message translates to:
  /// **'Drive backup'**
  String get driveBackup;

  /// No description provided for @backupUploaded.
  ///
  /// In en, this message translates to:
  /// **'Backup uploaded to Google Drive'**
  String get backupUploaded;

  /// No description provided for @backupUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Drive upload failed: {error}'**
  String backupUploadFailed(Object error);

  /// No description provided for @exportCustomRange.
  ///
  /// In en, this message translates to:
  /// **'Export (custom date range)'**
  String get exportCustomRange;

  /// No description provided for @whatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp number'**
  String get whatsappNumber;

  /// No description provided for @whatsappNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to use the phone number'**
  String get whatsappNumberHint;

  /// No description provided for @salesDashboard.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get salesDashboard;

  /// No description provided for @kullSales.
  ///
  /// In en, this message translates to:
  /// **'KULL SALES'**
  String get kullSales;

  /// No description provided for @kullOrders.
  ///
  /// In en, this message translates to:
  /// **'KULL ORDERS'**
  String get kullOrders;

  /// No description provided for @kullNaqad.
  ///
  /// In en, this message translates to:
  /// **'KULL NAQAD'**
  String get kullNaqad;

  /// No description provided for @kullUdhaar.
  ///
  /// In en, this message translates to:
  /// **'KULL UDHAAR'**
  String get kullUdhaar;

  /// No description provided for @hafta.
  ///
  /// In en, this message translates to:
  /// **'Hafta'**
  String get hafta;

  /// No description provided for @maheena.
  ///
  /// In en, this message translates to:
  /// **'Maheena'**
  String get maheena;

  /// No description provided for @apniMarzi.
  ///
  /// In en, this message translates to:
  /// **'Apni marzi'**
  String get apniMarzi;

  /// No description provided for @haaliSales.
  ///
  /// In en, this message translates to:
  /// **'HAALI SALES'**
  String get haaliSales;

  /// No description provided for @saleDarjKarein.
  ///
  /// In en, this message translates to:
  /// **'Sale darj karein'**
  String get saleDarjKarein;

  /// No description provided for @itemsManageKarein.
  ///
  /// In en, this message translates to:
  /// **'Items manage karein'**
  String get itemsManageKarein;

  /// No description provided for @tareekhRakhein.
  ///
  /// In en, this message translates to:
  /// **'Tareekh Rakhein'**
  String get tareekhRakhein;

  /// No description provided for @maineyDiye.
  ///
  /// In en, this message translates to:
  /// **'Mainey Diye'**
  String get maineyDiye;

  /// No description provided for @maineyLiye.
  ///
  /// In en, this message translates to:
  /// **'Mainey Liye'**
  String get maineyLiye;

  /// No description provided for @hisaabClearHai.
  ///
  /// In en, this message translates to:
  /// **'Hisaab clear hai'**
  String get hisaabClearHai;

  /// No description provided for @leneHain.
  ///
  /// In en, this message translates to:
  /// **'Maine lene hain'**
  String get leneHain;

  /// No description provided for @deneHain.
  ///
  /// In en, this message translates to:
  /// **'Maine dene hain'**
  String get deneHain;

  /// No description provided for @navSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get navSales;

  /// No description provided for @navAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get navAccount;

  /// No description provided for @totalBalance.
  ///
  /// In en, this message translates to:
  /// **'TOTAL BALANCE'**
  String get totalBalance;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'results'**
  String get results;

  /// No description provided for @addBills.
  ///
  /// In en, this message translates to:
  /// **'Add bills'**
  String get addBills;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get chooseFromGallery;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// No description provided for @sortName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sortName;

  /// No description provided for @sortDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get sortDate;

  /// No description provided for @sortAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get sortAmount;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @reminderDate.
  ///
  /// In en, this message translates to:
  /// **'Reminder date'**
  String get reminderDate;

  /// No description provided for @setReminder.
  ///
  /// In en, this message translates to:
  /// **'Set reminder'**
  String get setReminder;

  /// No description provided for @imageAddKarein.
  ///
  /// In en, this message translates to:
  /// **'Image add karein'**
  String get imageAddKarein;

  /// No description provided for @itemsManageHint.
  ///
  /// In en, this message translates to:
  /// **'Add, update or remove the things you sell'**
  String get itemsManageHint;

  /// No description provided for @diye.
  ///
  /// In en, this message translates to:
  /// **'Given'**
  String get diye;

  /// No description provided for @liye.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get liye;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @sortAsc.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get sortAsc;

  /// No description provided for @sortDesc.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get sortDesc;

  /// No description provided for @searchSales.
  ///
  /// In en, this message translates to:
  /// **'Search by name or amount'**
  String get searchSales;

  /// No description provided for @noSalesYet.
  ///
  /// In en, this message translates to:
  /// **'No sales yet'**
  String get noSalesYet;

  /// No description provided for @customerSince.
  ///
  /// In en, this message translates to:
  /// **'Customer since'**
  String get customerSince;

  /// No description provided for @lastTransactedOn.
  ///
  /// In en, this message translates to:
  /// **'last transacted on'**
  String get lastTransactedOn;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @reminderSaved.
  ///
  /// In en, this message translates to:
  /// **'Reminder saved'**
  String get reminderSaved;

  /// No description provided for @sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get sms;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @templateUrdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu message'**
  String get templateUrdu;

  /// No description provided for @templateEnglish.
  ///
  /// In en, this message translates to:
  /// **'English message'**
  String get templateEnglish;

  /// No description provided for @chooseTemplate.
  ///
  /// In en, this message translates to:
  /// **'Choose message'**
  String get chooseTemplate;

  /// No description provided for @useTemplate.
  ///
  /// In en, this message translates to:
  /// **'Use this message'**
  String get useTemplate;

  /// No description provided for @noWhatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'No WhatsApp number for this customer'**
  String get noWhatsappNumber;

  /// No description provided for @fingerprintLock.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint lock'**
  String get fingerprintLock;

  /// No description provided for @fingerprintHint.
  ///
  /// In en, this message translates to:
  /// **'Unlock with your fingerprint'**
  String get fingerprintHint;

  /// No description provided for @fingerprintNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint not available on this device'**
  String get fingerprintNotAvailable;

  /// No description provided for @fingerprintFailed.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint verification failed'**
  String get fingerprintFailed;

  /// No description provided for @pickFromContacts.
  ///
  /// In en, this message translates to:
  /// **'Pick from contacts'**
  String get pickFromContacts;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sd', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'ur':
      {
        switch (locale.scriptCode) {
          case 'Latn':
            return AppLocalizationsUrLatn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sd':
      return AppLocalizationsSd();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get about => 'About';

  @override
  String get accountName => 'Account name';

  @override
  String get accountType => 'Account type';

  @override
  String get accounts => 'Accounts';

  @override
  String get add => 'Add';

  @override
  String get addAccount => 'Add Account';

  @override
  String get addCustomer => 'Add Customer';

  @override
  String get addCustomerHint =>
      'Add your first customer to start keeping khata.';

  @override
  String get addExpense => 'Add Expense';

  @override
  String get addFirstTransaction =>
      'Record your first transaction to see it here.';

  @override
  String get addIncome => 'Add Income';

  @override
  String get addItem => 'Add item';

  @override
  String get addProduct => 'Add Product';

  @override
  String get addSupplier => 'Add Supplier';

  @override
  String get address => 'Address';

  @override
  String get adjustStock => 'Adjust stock';

  @override
  String get adjustmentReason => 'Reason';

  @override
  String get all => 'All';

  @override
  String get amount => 'Amount';

  @override
  String get appName => 'Namt Oil Mil';

  @override
  String get apply => 'Apply';

  @override
  String get archiveConfirmBody => 'The full history will be kept.';

  @override
  String get archiveCustomer => 'Archive customer';

  @override
  String get back => 'Back';

  @override
  String get backup => 'Backup';

  @override
  String get backupCreated => 'Backup created successfully';

  @override
  String backupFailed(Object error) {
    return 'Backup failed: $error';
  }

  @override
  String get backupNow => 'Create Backup';

  @override
  String get backupRestored => 'Backup restored successfully';

  @override
  String get balance => 'Balance';

  @override
  String get bankBalance => 'Bank balance';

  @override
  String get baseUnit => 'Base unit';

  @override
  String get batchDate => 'Batch date';

  @override
  String get batchHistory => 'Batch history';

  @override
  String get batchNo => 'Batch no.';

  @override
  String get businessName => 'Business name';

  @override
  String get businessSettings => 'Business Settings';

  @override
  String get cancel => 'Cancel';

  @override
  String get cashBalance => 'Cash balance';

  @override
  String get cashSale => 'Cash sale';

  @override
  String get cashbook => 'Cashbook';

  @override
  String get catAdmin => 'Administrative';

  @override
  String get catCake => 'Oil cake / by-product';

  @override
  String get catConsumables => 'Consumables';

  @override
  String get catContainers => 'Containers';

  @override
  String get catElectricity => 'Electricity';

  @override
  String get catFinishedOil => 'Finished oil';

  @override
  String get catLabour => 'Labour';

  @override
  String get catMaintenance => 'Maintenance';

  @override
  String get catOther => 'Other';

  @override
  String get catPackaging => 'Packaging';

  @override
  String get catRaw => 'Oilseed / Raw material';

  @override
  String get catRent => 'Rent';

  @override
  String get catRepairs => 'Repairs';

  @override
  String get catSpareParts => 'Spare parts';

  @override
  String get catTransport => 'Transport';

  @override
  String get category => 'Category';

  @override
  String get changesSaved => 'Changes saved';

  @override
  String get clear => 'Clear';

  @override
  String get close => 'Close';

  @override
  String get confirm => 'Confirm';

  @override
  String get confirmPin => 'Confirm PIN';

  @override
  String get confirmRestore =>
      'Restoring will replace all current data. Continue?';

  @override
  String get copyMessage => 'Copy message';

  @override
  String get costOfGoods => 'Cost of goods';

  @override
  String get costPerUnit => 'Cost per unit';

  @override
  String get credit => 'Credit';

  @override
  String get creditSale => 'Credit sale';

  @override
  String get currentStock => 'Current stock';

  @override
  String get custom => 'Custom';

  @override
  String get customerCode => 'Customer code (optional)';

  @override
  String get customerLedger => 'Customer Ledger';

  @override
  String get customerName => 'Customer name';

  @override
  String get customerStatement => 'Customer Statement';

  @override
  String get customers => 'Customers';

  @override
  String get dailyCashbook => 'Daily cashbook';

  @override
  String get darkTheme => 'Dark';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get date => 'Date';

  @override
  String get debit => 'Debit';

  @override
  String get defaultCashAccount => 'Cash';

  @override
  String get delete => 'Delete';

  @override
  String get deleteConfirmBody => 'This cannot be undone.';

  @override
  String get deleteConfirmTitle => 'Delete?';

  @override
  String get description => 'Description';

  @override
  String get discount => 'Discount';

  @override
  String get done => 'Done';

  @override
  String get dueSoon => 'Due soon';

  @override
  String get edit => 'Edit';

  @override
  String get editCustomer => 'Edit Customer';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get editSupplier => 'Edit Supplier';

  @override
  String get electricityCost => 'Electricity cost';

  @override
  String get emptyStateTitle => 'Nothing here yet';

  @override
  String get enterPin => 'Enter PIN';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get estimated => 'estimated';

  @override
  String get expenseCategory => 'Category';

  @override
  String get expenses => 'Expenses';

  @override
  String get export => 'Export';

  @override
  String get finishedOutputs => 'Finished outputs';

  @override
  String get firstLaunchBody =>
      'Set up your business to begin keeping digital khata. Everything works offline.';

  @override
  String get firstLaunchTitle => 'Welcome to Namt Oil Mil';

  @override
  String get from => 'From';

  @override
  String get fromAccount => 'From account';

  @override
  String get getStarted => 'Get Started';

  @override
  String get giveUdhaar => 'Give Udhaar';

  @override
  String get grandTotal => 'Grand total';

  @override
  String get inStock => 'In stock';

  @override
  String get income => 'Income';

  @override
  String insufficientStock(Object product) {
    return 'Insufficient stock for: $product';
  }

  @override
  String get invalidAmount => 'Please enter a valid amount greater than zero';

  @override
  String get invalidBackup => 'This file is not a valid Namt Oil Mil backup.';

  @override
  String get invalidPhone => 'Please enter a valid phone number';

  @override
  String get inventory => 'Inventory';

  @override
  String get invoiceDate => 'Invoice date';

  @override
  String get invoiceNo => 'Invoice no.';

  @override
  String get invoiceStatus => 'Status';

  @override
  String get items => 'Items';

  @override
  String get labourCost => 'Labour cost';

  @override
  String get language => 'Language';

  @override
  String get lastBackup => 'Last backup';

  @override
  String get lightTheme => 'Light';

  @override
  String get loading => 'Loading…';

  @override
  String get loss => 'Loss';

  @override
  String get lowStock => 'Low stock';

  @override
  String get lowStockAlerts => 'Low stock alerts';

  @override
  String get makePayment => 'Make Payment';

  @override
  String get messageCopied => 'Message copied';

  @override
  String get methodBank => 'Bank';

  @override
  String get methodCash => 'Cash';

  @override
  String get methodEasypaisa => 'Easypaisa';

  @override
  String get methodJazzcash => 'JazzCash';

  @override
  String get methodOther => 'Other';

  @override
  String get monthlyExpenses => 'Monthly expenses';

  @override
  String get monthlyIncome => 'Monthly income';

  @override
  String get navHome => 'Home';

  @override
  String get navKhata => 'Khata';

  @override
  String get navMore => 'More';

  @override
  String get navReports => 'Reports';

  @override
  String get navTransactions => 'Transactions';

  @override
  String get netProfit => 'Net profit';

  @override
  String get never => 'Never';

  @override
  String get newBatch => 'New Batch';

  @override
  String get newPurchase => 'New Purchase';

  @override
  String get newPurchaseReturn => 'New purchase return';

  @override
  String get newSale => 'New Sale';

  @override
  String get newSalesReturn => 'New sales return';

  @override
  String get no => 'No';

  @override
  String get noCustomers => 'No customers yet';

  @override
  String get noInternetNeeded => 'Works offline';

  @override
  String get noProducts => 'No products yet';

  @override
  String get noSuppliers => 'No suppliers yet';

  @override
  String get noTransactionsYet => 'No transactions yet';

  @override
  String get notes => 'Notes';

  @override
  String get ok => 'OK';

  @override
  String get onboardingDone => 'Let\'s begin';

  @override
  String get openingBalance => 'Opening balance';

  @override
  String get operatingExpenses => 'Operating expenses';

  @override
  String get otherCost => 'Other cost';

  @override
  String get outOfStock => 'Out of stock';

  @override
  String get outstandingBalance => 'Outstanding balance';

  @override
  String get outstandingInvoices => 'Outstanding invoices';

  @override
  String get overdue => 'Overdue';

  @override
  String get paidAmount => 'Paid amount';

  @override
  String get paidToday => 'Paid today';

  @override
  String get paymentMethod => 'Payment method';

  @override
  String get paymentReceipt => 'Payment Receipt';

  @override
  String get phone => 'Phone';

  @override
  String get pinLock => 'PIN Lock';

  @override
  String get pinMismatch => 'PINs do not match';

  @override
  String get pinRemoved => 'PIN removed';

  @override
  String get pinSet => 'PIN set successfully';

  @override
  String get print => 'Print';

  @override
  String get processLoss => 'Process loss';

  @override
  String get productName => 'Product name';

  @override
  String get production => 'Production';

  @override
  String get products => 'Products';

  @override
  String get profit => 'Profit';

  @override
  String get purchaseInvoice => 'Purchase Voucher';

  @override
  String get purchasePrice => 'Purchase price';

  @override
  String get purchaseReturns => 'Purchase returns';

  @override
  String get purchases => 'Purchases';

  @override
  String get quantity => 'Quantity';

  @override
  String get quickActions => 'Quick actions';

  @override
  String get rawMaterials => 'Raw materials';

  @override
  String get receipt => 'Receipt';

  @override
  String get receivePayment => 'Receive Payment';

  @override
  String get receivedToday => 'Received today';

  @override
  String get recentTransactions => 'Recent transactions';

  @override
  String get recordAdvance => 'Record Advance';

  @override
  String get recordSaved => 'Record saved';

  @override
  String get reference => 'Reference';

  @override
  String get remainingAmount => 'Remaining';

  @override
  String get reminderMessage => 'Reminder';

  @override
  String get reminders => 'Reminders';

  @override
  String get reorderLevel => 'Reorder level';

  @override
  String get reportBalances => 'Cash & bank balances';

  @override
  String get reportCashbook => 'Cashbook';

  @override
  String get reportCustomerLedger => 'Customer ledger';

  @override
  String get reportDailySummary => 'Daily summary';

  @override
  String get reportExpenses => 'Expense report';

  @override
  String get reportIncome => 'Income report';

  @override
  String get reportInventoryValuation => 'Inventory valuation';

  @override
  String get reportLowStock => 'Low-stock report';

  @override
  String get reportMonthlySummary => 'Monthly summary';

  @override
  String get reportPayables => 'Payables';

  @override
  String get reportPaymentsMade => 'Payments made';

  @override
  String get reportPaymentsReceived => 'Payments received';

  @override
  String get reportProduction => 'Production report';

  @override
  String get reportProfitLoss => 'Profit & loss';

  @override
  String get reportPurchases => 'Purchase report';

  @override
  String get reportReceivables => 'Receivables';

  @override
  String get reportSales => 'Sales report';

  @override
  String get reportStockMovement => 'Stock movement';

  @override
  String get reportSupplierLedger => 'Supplier ledger';

  @override
  String get requiredField => 'This field is required';

  @override
  String get restoreBackup => 'Restore Backup';

  @override
  String restoreFailed(Object error) {
    return 'Restore failed: $error';
  }

  @override
  String get revenue => 'Revenue';

  @override
  String get runningBalance => 'Running balance';

  @override
  String get saleInvoice => 'Sale Invoice';

  @override
  String get salePrice => 'Sale price';

  @override
  String get sales => 'Sales';

  @override
  String get salesReturns => 'Sales returns';

  @override
  String get save => 'Save';

  @override
  String get search => 'Search';

  @override
  String get searchCustomers => 'Search customers…';

  @override
  String get searchSuppliers => 'Search suppliers…';

  @override
  String get selectAccount => 'Select account';

  @override
  String get selectCustomer => 'Select customer';

  @override
  String get selectProduct => 'Select product';

  @override
  String get selectSupplier => 'Select supplier';

  @override
  String get sendReminder => 'Send reminder';

  @override
  String get setPin => 'Set PIN';

  @override
  String get settings => 'Settings';

  @override
  String get settled => 'Settled';

  @override
  String get share => 'Share';

  @override
  String get shareViaWhatsApp => 'Share via WhatsApp';

  @override
  String get statement => 'Statement';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get statusDraft => 'Draft';

  @override
  String get statusPaid => 'Paid';

  @override
  String get statusPartiallyPaid => 'Partially paid';

  @override
  String get statusReturned => 'Returned';

  @override
  String get statusUnpaid => 'Unpaid';

  @override
  String get stockIn => 'Stock in';

  @override
  String get stockMovement => 'Stock movement';

  @override
  String get stockOut => 'Stock out';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get supplierCode => 'Supplier code (optional)';

  @override
  String get supplierLedger => 'Supplier Ledger';

  @override
  String get supplierName => 'Supplier name';

  @override
  String get supplierStatement => 'Supplier Statement';

  @override
  String get suppliers => 'Suppliers';

  @override
  String get systemTheme => 'System';

  @override
  String get tagline => 'Your Digital Khata';

  @override
  String get tax => 'Tax';

  @override
  String get theme => 'Theme';

  @override
  String get thisMonth => 'This month';

  @override
  String get thisWeek => 'This week';

  @override
  String get thisYear => 'This year';

  @override
  String get to => 'To';

  @override
  String get toAccount => 'To account';

  @override
  String get today => 'Today';

  @override
  String get todayPurchases => 'Today\'s purchases';

  @override
  String get todaySales => 'Today\'s sales';

  @override
  String get total => 'Total';

  @override
  String get totalCost => 'Total cost';

  @override
  String get totalCreditGiven => 'Total credit given';

  @override
  String get totalPaid => 'Total paid';

  @override
  String get totalPayables => 'To pay';

  @override
  String get totalPurchased => 'Total purchased';

  @override
  String get totalReceivables => 'To receive';

  @override
  String get totalReceived => 'Total received';

  @override
  String get transactionRecorded => 'Transaction recorded';

  @override
  String get transfer => 'Transfer';

  @override
  String get transferFunds => 'Transfer Funds';

  @override
  String get typeBank => 'Bank';

  @override
  String get typeCash => 'Cash';

  @override
  String get unarchiveCustomer => 'Unarchive customer';

  @override
  String get unit => 'Unit';

  @override
  String get unitBag => 'Bag';

  @override
  String get unitGram => 'Gram';

  @override
  String get unitKg => 'Kilogram';

  @override
  String get unitLitre => 'Litre';

  @override
  String get unitMaund => 'Maund';

  @override
  String get unitPiece => 'Piece';

  @override
  String get unitPrice => 'Unit price';

  @override
  String get unitTon => 'Metric ton';

  @override
  String get version => 'Version';

  @override
  String get viewAll => 'View all';

  @override
  String get voucher => 'Voucher';

  @override
  String get wastage => 'Wastage';

  @override
  String get wrongPin => 'Wrong PIN';

  @override
  String get yes => 'Yes';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get yieldPercent => 'Yield';

  @override
  String get youWillPay => 'You will pay';

  @override
  String get youWillReceive => 'You will receive';

  @override
  String get googleBackup => 'Google / Drive Backup';

  @override
  String get googleBackupHint =>
      'Connect your Google account to back up to Drive';

  @override
  String get connectGoogle => 'Connect Google';

  @override
  String get disconnectGoogle => 'Disconnect';

  @override
  String googleConnectedAs(Object email) {
    return 'Connected as $email';
  }

  @override
  String get googleConnected => 'Google account connected';

  @override
  String get googleDisconnected => 'Google account disconnected';

  @override
  String get googleDisconnectConfirm =>
      'Disconnect your Google account? Auto-backup will be turned off.';

  @override
  String get autoBackup24h => '24h auto-backup';

  @override
  String get autoBackup24hHint =>
      'Automatically back up to Google Drive every 24 hours';

  @override
  String get autoBackupEnabled => 'Auto-backup enabled';

  @override
  String get lastAutoBackup => 'Last auto-backup';

  @override
  String get backupNowDrive => 'Back up to Drive now';

  @override
  String get driveBackup => 'Drive backup';

  @override
  String get backupUploaded => 'Backup uploaded to Google Drive';

  @override
  String backupUploadFailed(Object error) {
    return 'Drive upload failed: $error';
  }

  @override
  String get exportCustomRange => 'Export (custom date range)';

  @override
  String get whatsappNumber => 'WhatsApp number';

  @override
  String get whatsappNumberHint => 'Leave empty to use the phone number';

  @override
  String get salesDashboard => 'Sales';

  @override
  String get kullSales => 'KULL SALES';

  @override
  String get kullOrders => 'KULL ORDERS';

  @override
  String get kullNaqad => 'KULL NAQAD';

  @override
  String get kullUdhaar => 'KULL UDHAAR';

  @override
  String get hafta => 'Hafta';

  @override
  String get maheena => 'Maheena';

  @override
  String get apniMarzi => 'Apni marzi';

  @override
  String get haaliSales => 'HAALI SALES';

  @override
  String get saleDarjKarein => 'Sale darj karein';

  @override
  String get itemsManageKarein => 'Items manage karein';

  @override
  String get tareekhRakhein => 'Tareekh Rakhein';

  @override
  String get maineyDiye => 'Mainey Diye';

  @override
  String get maineyLiye => 'Mainey Liye';

  @override
  String get hisaabClearHai => 'Hisaab clear hai';

  @override
  String get leneHain => 'Maine lene hain';

  @override
  String get deneHain => 'Maine dene hain';

  @override
  String get navSales => 'Sales';

  @override
  String get navAccount => 'Account';

  @override
  String get totalBalance => 'TOTAL BALANCE';

  @override
  String get results => 'results';

  @override
  String get addBills => 'Add bills';

  @override
  String get takePhoto => 'Camera';

  @override
  String get chooseFromGallery => 'Gallery';

  @override
  String get sortBy => 'Sort by';

  @override
  String get sortName => 'Name';

  @override
  String get sortDate => 'Date';

  @override
  String get sortAmount => 'Amount';

  @override
  String get favorite => 'Favorite';

  @override
  String get reminderDate => 'Reminder date';

  @override
  String get setReminder => 'Set reminder';

  @override
  String get imageAddKarein => 'Image add karein';

  @override
  String get itemsManageHint => 'Add, update or remove the things you sell';

  @override
  String get diye => 'Given';

  @override
  String get liye => 'Received';

  @override
  String get time => 'Time';

  @override
  String get sortAsc => 'Ascending';

  @override
  String get sortDesc => 'Descending';

  @override
  String get searchSales => 'Search by name or amount';

  @override
  String get noSalesYet => 'No sales yet';

  @override
  String get customerSince => 'Customer since';

  @override
  String get lastTransactedOn => 'last transacted on';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get reminderSaved => 'Reminder saved';

  @override
  String get sms => 'SMS';

  @override
  String get whatsapp => 'WhatsApp';

  @override
  String get templateUrdu => 'Urdu message';

  @override
  String get templateEnglish => 'English message';

  @override
  String get chooseTemplate => 'Choose message';

  @override
  String get useTemplate => 'Use this message';

  @override
  String get noWhatsappNumber => 'No WhatsApp number for this customer';

  @override
  String get fingerprintLock => 'Fingerprint lock';

  @override
  String get fingerprintHint => 'Unlock with your fingerprint';

  @override
  String get fingerprintNotAvailable =>
      'Fingerprint not available on this device';

  @override
  String get fingerprintFailed => 'Fingerprint verification failed';

  @override
  String get pickFromContacts => 'Pick from contacts';
}

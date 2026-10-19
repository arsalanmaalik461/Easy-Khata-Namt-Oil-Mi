import 'package:flutter_contacts/flutter_contacts.dart';

import '../core/result.dart';

/// Phone contacts integration — lets the user pick a customer from the
/// phone's contact list instead of typing name/phone manually.
///
/// Permission is requested on first use; denial returns an Err and the
/// manual form remains fully usable.
class ContactPickerService {
  /// Pick a single contact. Returns (name, phone) on success.
  Future<Result<({String name, String phone})>> pickContact() async {
    try {
      final granted = await FlutterContacts.requestPermission(readonly: true);
      if (!granted) {
        return const Err('Contacts permission denied');
      }
      final contact = await FlutterContacts.openExternalPick();
      if (contact == null) {
        return const Err('No contact selected');
      }
      final phone = contact.phones.isNotEmpty
          ? contact.phones.first.number
          : '';
      return Ok((name: contact.displayName, phone: phone));
    } catch (e) {
      return Err('Could not read contacts: $e');
    }
  }

  /// Lightweight contact search for an in-app picker list.
  Future<Result<List<({String name, String phone})>>> searchContacts(
      String query) async {
    try {
      final granted = await FlutterContacts.requestPermission(readonly: true);
      if (!granted) return const Err('Contacts permission denied');
      final contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: false,
      );
      final q = query.trim().toLowerCase();
      final out = <({String name, String phone})>[];
      for (final c in contacts) {
        if (q.isNotEmpty &&
            !c.displayName.toLowerCase().contains(q) &&
            !c.phones.any((p) => p.number.contains(q))) {
          continue;
        }
        out.add((
          name: c.displayName,
          phone: c.phones.isNotEmpty ? c.phones.first.number : '',
        ));
        if (out.length >= 50) break;
      }
      return Ok(out);
    } catch (e) {
      return Err('Could not read contacts: $e');
    }
  }
}

# Bundled fonts

## JameelNooriNastaleeq.ttf (10.8 MB)

- **What:** Jameel Noori Nastaleeq — the Urdu-script (Nastaliq) typeface used
  whenever the app runs in Urdu mode (`languageCode == 'ur'`, non-Latin
  script). Declared in `pubspec.yaml` as family `JameelNooriNastaleeq` and
  applied by `themeForLocale()` in `lib/app/theme.dart`.
- **Source:** https://github.com/abid-mujtaba/ttf-jameel-noori-nastaleeq
  (Arch packaging repo carrying the upstream font file; file verified on
  import: valid TrueType, 10,784,980 bytes, name table contains
  "Jameel Noori Nastaleeq").
- **License:** free for personal use per the distributor's page. This app is
  the user's own business tool; if it is ever distributed commercially,
  re-confirm the font's commercial terms first.
- **Size note:** the font adds ~10 MB to the APK. It is bundled (not
  downloaded at runtime) so Urdu rendering works fully offline, matching
  the app's offline-first requirement.
- **Not used for:** Roman Urdu (`ur-Latn`) and Sindhi keep their existing
  rendering; amounts keep tabular figures via the theme font.

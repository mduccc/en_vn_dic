### English - Vietnam dictionary package

##### Support:
- [x] IPA
- [x] Pos (Noun, verb, ...)
- [x] Example

```dart
if (!EnViDic().hasInit) {
  await EnViDic().init();
}
final vocabulary = EnViDic().lookUp('hello');
final suggests = EnViDic().suggest('he');
```
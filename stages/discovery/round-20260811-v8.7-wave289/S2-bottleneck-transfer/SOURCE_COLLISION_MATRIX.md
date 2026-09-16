# Source and collision matrix — Wave289

| Requirement | First-party source | Current finding | Admission effect |
|---|---|---|---|
| Resource semantics/tree/locale | [Qt Resource System](https://doc.qt.io/qt-6.11/resources.html) | QRC names resources, paths/prefixes and language selectors; rcc emits generated or binary resources. | Fixed object must preserve names, bytes and locale fallback. |
| Stock reader/load | [QResource](https://doc.qt.io/qt-6/qresource.html) | Binary RCC is registered by stock API; QResource exposes raw data, locale, compression and registration behavior. | Reader replacement or changed registration semantics is forbidden. |
| Producer flags | [rcc](https://doc.qt.io/qt-6.11/rcc.html) | Format version, compression/defaults, root, namespace, binary output and large-resource controls are current public action union. | Flags/configuration are not an N2 gap. |
| Build form | [qt_add_binary_resources](https://doc.qt.io/qt-6/qt-add-binary-resources.html) | CMake schedules binary RCC construction with rcc options. | Build wrapper is not a constructor contribution. |
| Current source | qtbase dev bfe073592a0f85fa3ec96f1e85d2922937707ba6 | Pin obtained from official Qt GitHub upstream; source-level writer/reader operation enumeration is still unclosed. | No absence inference; NOT_ADMITTED_UNFROZEN. |
| Candidate action | Adjacent-version joint tree/index/layout plus delta constructor | No stock-legal two-file/two-version action witness distinct from generic packing/order/flag/delta exists. | No complete N2. |

## Collision conclusion

No direct absorption or novelty clearance is claimed. There is no fair primary-paper collision target until a legal non-generic action is frozen. Current documentation instead shows a substantial existing configuration/reader union, and the required action witness remains unclosed.

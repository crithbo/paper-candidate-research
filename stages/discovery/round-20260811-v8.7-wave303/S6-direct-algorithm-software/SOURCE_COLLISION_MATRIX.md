# Source and collision matrix

| first-party source | role | result |
|---|---|---|
| [JVMS StackMapTable specification](https://docs.oracle.com/javase/specs/jvms/se7/html/jvms-4.html) | Defines implicit initial state, frame variants and offset semantics. | Establishes local encoding and previous-frame dependency. |
| [OpenJDK StackMapTable/Verifier review](https://mail.openjdk.org/pipermail/hotspot-runtime-dev/2025-February/076487.html) | Current OpenJDK verifier/reader source route. | Confirms offset-checking verifier involvement. |
| [OpenJDK ClassFile StackMapFrameInfo API](https://docs.oracle.com/en/java/javase/24/docs/api/java.base/java/lang/classfile/attribute/StackMapFrameInfo.html) | Stock classfile writer API and automatic stack-map generation boundary. | Confirms native generation route. |
| Direct StackMapTable compression/layout papers | Latest collision check. | No novelty conclusion needed after action-space structural collapse. |

Only official specification/OpenJDK sources support affirmative technical claims.

# Source and collision matrix

| official source | role | result |
|---|---|---|
| [ANTLR ATNSerializer API](https://www.antlr.org/api/JavaTool/org/antlr/v4/runtime/atn/ATNSerializer.html) | Defines serialized sections and transition/decision references. | Establishes global reference coupling. |
| [ANTLR ATNDeserializer API](https://www.antlr.org/api/Java/org/antlr/v4/runtime/atn/ATNDeserializer.html) | Defines serialized version, decode/deserialize and Java 16-bit word encoding. | Establishes reader/encoding contract. |
| [ANTLR RuntimeMetaData API](https://www.antlr.org/api/Java/org/antlr/v4/runtime/RuntimeMetaData.html) | Tool/runtime version compatibility checking. | Establishes version boundary. |
| [ANTLR upstream](https://github.com/antlr/antlr4) | Official generator/runtime source entry. | Confirms all-target release/version context. |
| Direct serialized-ATN construction papers | Collision route. | No novelty conclusion required after structural collapse. |

Only official ANTLR documentation/project sources support affirmative claims.

# Source and collision matrix

| Family | Primary/current source | Current union / direct subtraction | Result |
|---|---|---|---|
| GNU ld | [official ld SECTIONS manual](https://sourceware.org/binutils/docs/ld/SECTIONS.html); [input-section ordering](https://sourceware.org/binutils/docs/ld/Input-Section-Wildcards.html) | script mapping, ordering, alignment and output layout are native actions | structural drop |
| libxml2 C14N | [upstream source](https://gitlab.gnome.org/GNOME/libxml2); [W3C C14N recommendation](https://www.w3.org/TR/xml-c14n11/) | canonical traversal/namespace/attribute output is fixed or internal | absorbed |
| GNU diff | [official Diffutils manual](https://www.gnu.org/software/diffutils/manual/); [upstream source](https://git.savannah.gnu.org/cgit/diffutils.git/) | native edit construction/output union | unfrozen action certificate |
| Xapian | [official API documentation](https://xapian.org/docs/apidoc/html/); [upstream source](https://github.com/xapian/xapian) | indexing, posting/dictionary and commit/merge union | absorbed |
| FAISS | [official documentation](https://faiss.ai/); [upstream source](https://github.com/facebookresearch/faiss) | training/assignment/list construction union | absorbed |
| Boost.Polygon | [official Voronoi documentation](https://www.boost.org/doc/libs/release/libs/polygon/doc/voronoi_main.htm); [upstream source](https://github.com/boostorg/polygon) | sweep/event/topology construction union | absorbed |

No source is used to infer a current implementation absence. All collision conclusions use affirmative semantics/action evidence.

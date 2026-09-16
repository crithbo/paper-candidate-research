# Natural corpus freeze

- Frozen before accepted natural outcomes: `true`
- Upstream: `https://github.com/tensorflow/tflite-micro`
- Commit: `18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551`
- License: Apache-2.0, frozen copy at `sources/tflite-micro-18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551/LICENSE`
- Exact entries: `inputs/natural_corpus_manifest.json` (URL, path, bytes, Git blob SHA-1, SHA-256, split and family for every file)
- Count: 24 models / 34,572 bytes
- Training: 11 models from quantize, leaky-relu, pad and add.
- Held-out: 13 models from sub, strided-slice, conv, transpose-conv and hello-world.

The split was fixed by family before the models were measured. It is deliberately a bounded Stage A corpus, not a population-representative TFLite benchmark. The selected set spans nine model/operator families and 408–3,488 byte natural buffers while keeping exact native prefix replay inside the public-CPU budget.

No synthetic model contributes to the natural result. The tiny synthetic schemas are validation ceilings only.

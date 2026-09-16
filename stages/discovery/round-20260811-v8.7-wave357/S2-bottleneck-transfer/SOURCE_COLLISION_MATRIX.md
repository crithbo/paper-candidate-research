# Source and collision matrix — Wave357

| Family | Official current source | Existing action/guarantee boundary |
|---|---|---|
| kTLS sendfile | [Kernel TLS](https://docs.kernel.org/6.16/networking/tls.html), [OpenSSL s_server](https://docs.openssl.org/3.6/man1/openssl-s_server/) | KTLS/zerocopy sendfile are opt-in modes; mutation may yield TLS authentication failure. |
| dm-verity | [dm-verity](https://docs.kernel.org/admin-guide/device-mapper/verity.html) | Data/hash tree/root hash and on-demand verification define object; construction parameters are current surface. |
| io_uring ZC Rx | [io_uring ZC Rx](https://docs.kernel.org/networking/iou-zcrx.html) | Registered area/chunk hint/default/fallback are current config. |
| ublk | [ublk](https://docs.kernel.org/6.18/block/ublk.html) | Zero-copy registration and segment alignment are explicit existing APIs; trusted server must return correct data. |
| kernel TLS handshake | [in-kernel handshake](https://docs.kernel.org/networking/tls-handshake.html) | User handshake agent is an external service/controller. |
| TLS offload | [TLS offload](https://docs.kernel.org/next/networking/tls-offload.html) | Software/NIC offload are current modes and record ordering constrains operation. |

## Collision conclusion

No candidate-grade action exists, so direct primary-paper collision cannot be used for novelty clearance. Current sources are used only to establish action union and hard guarantee boundaries.

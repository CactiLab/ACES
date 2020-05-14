.section  .rodata.HexboxAccessList

.global __hexbox_comp0_acl
.type  __hexbox_comp0_acl, %object
__hexbox_comp0_acl:
  .word 0x2
  .word 0x40012c38 /* Name: recording, Addr:0x40012c38, Size: 4 */
  .word 0x40012c3c
  .word 0x40012c00 /* Name: recording, Addr:0x40012c00, Size: 4 */
  .word 0x40012c04
  .size  __hexbox_comp0_acl, .-__hexbox_comp0_acl

.global __hexbox_comp7_acl
.type  __hexbox_comp7_acl, %object
__hexbox_comp7_acl:
  .word 0x3
  .word 0x4002b038 /* Name: recording, Addr:0x4002b038, Size: 8 */
  .word 0x4002b040
  .word 0x4002b00c /* Name: recording, Addr:0x4002b00c, Size: 4 */
  .word 0x4002b010
  .word 0x4002b044 /* Name: recording, Addr:0x4002b044, Size: 4 */
  .word 0x4002b048
  .size  __hexbox_comp7_acl, .-__hexbox_comp7_acl

.global __hexbox_comp12_acl
.type  __hexbox_comp12_acl, %object
__hexbox_comp12_acl:
  .word 0x1
  .word 0x40016c6c /* Name: recording, Addr:0x40016c6c, Size: 4 */
  .word 0x40016c70
  .size  __hexbox_comp12_acl, .-__hexbox_comp12_acl

.global __hexbox_comp10_acl
.type  __hexbox_comp10_acl, %object
__hexbox_comp10_acl:
  .word 0x2
  .word 0x2001ea30 /* Name: uSdHandle_uSdCardInfo, Addr:0x2001ea30, Size: 184 */
  .word 0x2001eae8
  .word 0x40012c38 /* Name: recording, Addr:0x40012c38, Size: 4 */
  .word 0x40012c3c
  .size  __hexbox_comp10_acl, .-__hexbox_comp10_acl

.global __hexbox_comp2_acl
.type  __hexbox_comp2_acl, %object
__hexbox_comp2_acl:
  .word 0x2
  .word 0x40005400 /* Name: recording, Addr:0x40005400, Size: 4 */
  .word 0x40005404
  .word 0x40005410 /* Name: recording, Addr:0x40005410, Size: 4 */
  .word 0x40005414
  .size  __hexbox_comp2_acl, .-__hexbox_comp2_acl

.global __hexbox_comp19_acl
.type  __hexbox_comp19_acl, %object
__hexbox_comp19_acl:
  .word 0x8
  .word 0x20001000 /* Name: __malloc_av____malloc_sbrk_base, Addr:0x20001000, Size: 1036 */
  .word 0x2000140c
  .word 0x20001a1c /* Name: recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording_recording, Addr:0x20001a1c, Size: 356 */
  .word 0x20001b80
  .word 0x200019b4 /* Name: __malloc_max_sbrked_mem___malloc_current_mallinfo, Addr:0x200019b4, Size: 44 */
  .word 0x200019e0
  .word 0x2001bfe0 /* Name: _sbrk.heap_end, Addr:0x2001bfe0, Size: 4 */
  .word 0x2001bfe4
  .word 0x20001a0c /* Name: errno, Addr:0x20001a0c, Size: 4 */
  .word 0x20001a10
  .word 0x20001b8c /* Name: recording, Addr:0x20001b8c, Size: 4 */
  .word 0x20001b90
  .word 0x20001b9c /* Name: recording, Addr:0x20001b9c, Size: 4 */
  .word 0x20001ba0
  .word 0x20001bac /* Name: recording, Addr:0x20001bac, Size: 4 */
  .word 0x20001bb0
  .size  __hexbox_comp19_acl, .-__hexbox_comp19_acl

.global __hexbox_comp11_acl
.type  __hexbox_comp11_acl, %object
__hexbox_comp11_acl:
  .word 0x7
  .word 0x40016914 /* Name: recording, Addr:0x40016914, Size: 16 */
  .word 0x40016924
  .word 0x40016894 /* Name: recording_recording, Addr:0x40016894, Size: 16 */
  .word 0x400168a4
  .word 0x400168ac /* Name: recording, Addr:0x400168ac, Size: 12 */
  .word 0x400168b8
  .word 0x40016904 /* Name: recording, Addr:0x40016904, Size: 12 */
  .word 0x40016910
  .word 0x4001692c /* Name: recording, Addr:0x4001692c, Size: 12 */
  .word 0x40016938
  .word 0x40016884 /* Name: recording, Addr:0x40016884, Size: 12 */
  .word 0x40016890
  .word 0x4001691c /* Name: recording, Addr:0x4001691c, Size: 8 */
  .word 0x40016924
  .size  __hexbox_comp11_acl, .-__hexbox_comp11_acl

.global __hexbox_comp5_acl
.type  __hexbox_comp5_acl, %object
__hexbox_comp5_acl:
  .word 0x1
  .word 0x2001ecb4 /* Name: sdramHandle, Addr:0x2001ecb4, Size: 52 */
  .word 0x2001ece8
  .size  __hexbox_comp5_acl, .-__hexbox_comp5_acl

.global __hexbox_acl_lut
.type  __hexbox_acl_lut, %object
__hexbox_acl_lut:
  .word __hexbox_comp0_acl
  .word __hexbox_comp10_acl
  .word __hexbox_comp11_acl
  .word __hexbox_comp12_acl
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word __hexbox_comp19_acl
  .word 0
  .word 0
  .word 0
  .word __hexbox_comp2_acl
  .word 0
  .word 0
  .word __hexbox_comp5_acl
  .word 0
  .word __hexbox_comp7_acl
  .word 0
  .word 0
  .word 0
  .size  __hexbox_acl_lut, .-__hexbox_acl_lut


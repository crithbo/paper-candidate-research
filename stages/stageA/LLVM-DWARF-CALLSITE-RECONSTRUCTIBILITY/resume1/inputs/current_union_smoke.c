extern void sink_i32(int);

__attribute__((noinline)) void call_cut_i32(int a, int b) {
  if (a != 0) {
    int sum = a + b;
    sink_i32(sum);
  }
}

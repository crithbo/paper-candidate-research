__attribute__((noinline)) int add_pair(int a, int b) {
  return a + b;
}

int main(void) {
  return add_pair(19, 23) == 42 ? 0 : 1;
}

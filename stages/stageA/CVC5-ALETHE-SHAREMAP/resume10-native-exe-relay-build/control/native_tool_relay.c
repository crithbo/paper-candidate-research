#include <errno.h>
#include <process.h>
#include <stdio.h>
#include <string.h>

static const char *const tool_root =
    "D:\\project\\writing\\reserch\\stages\\stageA\\CVC5-ALETHE-SHAREMAP\\resume4-safe-recovery\\resources\\env\\msys64\\mingw64\\bin\\";

static int allowed_tool(const char *name) {
  return strcmp(name, "gcc") == 0 || strcmp(name, "g++") == 0 ||
         strcmp(name, "ar") == 0 || strcmp(name, "ranlib") == 0;
}

int main(int argc, char **argv) {
  char target[1024];
  int written;
  intptr_t result;

  if (argc < 2 || !allowed_tool(argv[1])) {
    fputs("native_tool_relay: expected gcc, g++, ar, or ranlib\n", stderr);
    return 64;
  }

  written = snprintf(target, sizeof(target), "%s%s.exe", tool_root, argv[1]);
  if (written < 0 || (size_t)written >= sizeof(target)) {
    fputs("native_tool_relay: target path overflow\n", stderr);
    return 65;
  }

  argv[1] = target;
  result = _spawnv(_P_WAIT, target, &argv[1]);
  if (result == -1) {
    fprintf(stderr, "native_tool_relay: spawn failed: errno=%d\n", errno);
    return 66;
  }
  return (int)result;
}

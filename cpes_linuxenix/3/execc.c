#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    setuid(0);
    system(argv[1]);
}

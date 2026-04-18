#include <iostream>

void gdt_create(int base, int limit, int value) {
  int *baseptr, *limptr;
  baseptr = &base;
  limptr = &limit;
  int *allocm = new int(value);
  std::cout << allocm << std::endl << value;
}
void gdt_delete(int* gdt_entry) {
  delete gdt_entry;
  gdt_entry = nullptr;
}

int main() {
  int bIn, lIn, val;
  std::cout << "Enter Base:  ";
  std::cin >> bIn;
  std::cout << "Enter Limit:  ";
  std::cin >> lIn;
  std::cout << "Enter Value:  ";
  std::cin >> val;
  gdt_create(bIn, lIn, val);
}
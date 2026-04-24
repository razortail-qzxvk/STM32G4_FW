import test;
int main() {
  // 1. 调用导出的简单函数
  [[maybe_unused]] int sum = add(3, 4);
  return 0;
}

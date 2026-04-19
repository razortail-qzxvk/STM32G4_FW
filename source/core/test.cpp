import test;

// 传统的 #include 依然可以用，但是如果用 Modules 就不推荐和 #include 混写了（虽然允许）
// #include <iostream> 

int main() {
    // 1. 调用导出的简单函数
    [[maybe_unused]] int sum = add(3, 4);

    // 2. 调用导出的模板函数
    [[maybe_unused]] float clamped = clamp(3.14f, 0.0f, 1.0f);

    // 3. 调用导出命名空间中的函数
    [[maybe_unused]] int product = test::math::multiply(2, 5);

    // 4. 使用导出的类
    test::math::Calculator calc(10);
    [[maybe_unused]] int calc_result = calc.calculate(20);

    // 5. 使用导出块里导出的常量和枚举
    [[maybe_unused]] auto ver = VERSION_MAJOR;
    [[maybe_unused]] Status status = Status::OK;

    // 6. [编译报错] 试图调用未导出的内部函数 
    // int fail = internal_multiply(2, 3); // Error: internal_multiply was not declared in this scope

    return 0;
}
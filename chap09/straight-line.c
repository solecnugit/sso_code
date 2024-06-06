/* clang -O1 straight-line.c -S -emit-llvm */
int f(int a, int b, int c)
{
    int Result;
    Result = a+b;
    Result = Result*c + a;
    Result = c*b+Result;
    return Result;
}

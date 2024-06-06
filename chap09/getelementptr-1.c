struct S {
    char c;
    int B[4][10];    
};

int f(struct S *A, int x)
{
    return A->B[x][3];
}


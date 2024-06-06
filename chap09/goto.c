int f(int a) {
L1:
    if (a < 10)
	return a+100;
    a -= 10;
    goto L1;
}

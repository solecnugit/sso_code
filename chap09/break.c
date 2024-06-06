int f(int a) {
    int b=0;
    while (a-- >0) {
	b++;
	if (a==10)
	    break; 
    }
    return b;
}

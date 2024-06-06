extern int g(int);
extern int k(int);

int f(int a){
    switch (a) {
	case 2: 
	    a=a+1;
	    a=g(a);
	    break;
	case 3: 
	    a=a+1;
	    a=g(a);
	    break;
	case 4: 
	    a=a+100;
	    a=k(a);
	    break;
	case 8: 
	    a=a+3;
	    break;
	default:
	    a=a+10;
    }
    return a;
}

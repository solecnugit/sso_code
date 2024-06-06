
int f(int a){
    switch (a) {
	case 2: 
	    a=a+1;
	    break;
	case 4: 
	    a=a+2;
	    break;
	case 8: 
	    a=a+3;
	    break;
	default:
	    a=a+10;
    }
    return a;
}

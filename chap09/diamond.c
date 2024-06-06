
int baz(int x){
    if (x & 1) {
        foo(); 
    } else {
        bar();
    }
    return (x & 1);
}

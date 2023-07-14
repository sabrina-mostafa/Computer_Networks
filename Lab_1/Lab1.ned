simple C201265_Sabrina
{
    gates:
        input in;
        output out;
}
//
// Five instances (tower1, tower2, tower3, tower4, tower5) of C201265_Sabrina connected both ways.
// They will pass messages to one another.
//
network C201265_net
{
    @display("bgb=688,373");
    submodules:
        tower1: C201265_Sabrina {
            @display("p=384,229");
        }
        tower2: C201265_Sabrina {
            @display("p=241,229");
        }
        tower3: C201265_Sabrina {
            @display("p=127,120");
        }
        tower4: C201265_Sabrina {
            @display("p=324,50");
        }
        tower5: C201265_Sabrina {

            @display("p=505,120");
        }
    connections:
        tower1.out --> {  delay = 100ms; } --> tower2.in;
        //        tower1.in <-- {  delay = 100ms; } <-- tower2.out;
        tower2.out --> {  delay = 100ms; } --> tower3.in;
        //        tower2.in <-- {  delay = 100ms; } <-- tower3.out;
        tower3.out --> {  delay = 100ms; } --> tower4.in;
        //        tower3.in <-- {  delay = 100ms; } <-- tower4.out;
        tower4.out --> {  delay = 100ms; } --> tower5.in;
        //        tower4.in <-- {  delay = 100ms; } <-- tower5.out;
        tower5.out --> {  delay = 100ms; } --> tower1.in;
//        tower5.in <-- {  delay = 100ms; } <-- tower1.out;

}

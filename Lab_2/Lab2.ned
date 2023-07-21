simple node_Torque
{
    parameters:
        bool sendMsgOnInit = default(false);
        int limit = default(2);
        @display("i=block/routing");
    gates:
        input in;
        output out;
}
network lab2_Torque
{
    @display("bgb=729,430");
    submodules:
        Sabrina: node_Torque {
            parameters:
                @display("p=324,52;i=block/app2");
                @display("i=,cyan");
        }
        Riya: node_Torque {
            parameters:
                @display("p=487,296");
                @display("i=,gold");
        }
        Dolon: node_Torque {
            parameters:
                @display("p=600,183");
                @display("i=,orange");
        }
        Jannatul: node_Torque {
            parameters:
                @display("p=183,296");
                @display("i=,pink");
        }
        Timu: node_Torque {
            parameters:
                @display("p=57,190");
                @display("i=,silver");
        }
    connections:
        Sabrina.out --> {  delay = 100ms; } --> Timu.in;
        Timu.out --> {  delay = 100ms; } --> Jannatul.in;
        Dolon.in <-- {  delay = 100ms; } <-- Riya.out;
        Dolon.out --> {  delay = 100ms; } --> Sabrina.in;
        Jannatul.out --> {  delay = 100ms; } --> Riya.in;
}

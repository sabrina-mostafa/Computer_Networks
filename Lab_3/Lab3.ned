simple node3_Torque
{
    parameters:

        int limit = default(5);
        int destination = default(3);
    gates:
        inout gate[];
}

network Lab3_Torque
{
    @display("bgb=576,458");
    types:
        channel Channel extends ned.DelayChannel
        {
            delay = 100ms;
        }
    submodules:
        Torque[6]: node3_Torque;
    connections:
        Torque[0].gate++ <--> Channel <--> Torque[1].gate++;
        Torque[1].gate++ <--> Channel <--> Torque[2].gate++;
        Torque[1].gate++ <--> Channel <--> Torque[4].gate++;
        Torque[3].gate++ <--> Channel <--> Torque[4].gate++;
        Torque[4].gate++ <--> Channel <--> Torque[5].gate++;
}

#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class node_Torque : public cSimpleModule
{
private:
    int counter;
  protected:

    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(node_Torque);

void node_Torque::initialize()
{
    counter=10;
    WATCH(counter);
    counter=par("limit");

    if (strcmp("Sabrina", getName()) == 0) {

        EV<<"Sending initial message\n";

        cMessage *msg = new cMessage("Hello node_Torque");

        send(msg, "out");
    }
}

void node_Torque::handleMessage(cMessage *msg)
{
    counter--;
    if(counter ==0){
        EV<<getName()<<" ''s counter reached zero, deleting message\n";
        delete msg;
    }
    else{
        EV<<getName()<<" ''s counter is "<< counter <<", sending back message\n";
        send(msg, "out");
    }
}

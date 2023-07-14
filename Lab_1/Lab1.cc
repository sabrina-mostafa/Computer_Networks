#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class C201265_Sabrina : public cSimpleModule
{
  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(C201265_Sabrina);

void C201265_Sabrina::initialize()
{
    if (strcmp("tower1", getName()) == 0) {
        cMessage *msg = new cMessage("C201265-Sabrina_Mostafa");
        send(msg, "out");
    }
}

void C201265_Sabrina::handleMessage(cMessage *msg)
{
    send(msg, "out");
}

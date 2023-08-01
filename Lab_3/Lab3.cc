/*
 * Lab3.cc
 *
 *  Created on: Jul 28, 2023
 *      Author: Sabrina_C201265
 */


#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
using namespace omnetpp;

class node3_Torque : public cSimpleModule
{
private:
    int counter;
    int dest;
  protected:
    virtual void forwardMessage(cMessage *msg);
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(node3_Torque);
void node3_Torque::initialize()
{
    counter = par("limit");
    dest = par("destination");
    if (getIndex() == 0) {
        // Boot the process scheduling the initial message as a self-message.
        char msgname[20];
        sprintf(msgname, "tic-%d", getIndex());
        cMessage *msg = new cMessage(msgname);
        scheduleAt(0.0, msg);
    }    }

void node3_Torque::handleMessage(cMessage *msg)
{
    counter--;
    if (getIndex() == dest) {
        // Message arrived.
        EV << "Message " << msg << " arrived.\n";
        delete msg;
    }
    else if(counter==0) {
               EV<<getName()<<"'s counter reached zero, deleting message\n";
               delete msg;
    }
    else{
        forwardMessage(msg);
    }   }

void node3_Torque::forwardMessage(cMessage *msg)
{

    int n = gateSize("gate");
    int k = intuniform(0, n-1);

    EV << "Forwarding message " << msg << " on gate[" << k << "]\n";
    send(msg,"gate$o",k);   }


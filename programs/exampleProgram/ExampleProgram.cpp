// -*- mode:C++; tab-width:4; c-basic-offset:4; indent-tabs-mode:nil -*-

#include "ExampleProgram.hpp"

#include <cstdio>

#include <ColorDebug.h>

using namespace roboticslab;

/************************************************************************/

bool ExampleProgram::configure(yarp::os::ResourceFinder & rf)
{
    CD_DEBUG("%s\n", rf.toString().c_str());

    std::printf("--------------------------------------------------------------\n");

    if (rf.check("help"))
    {
        std::printf("ExampleProgram options:\n");
        std::printf("\t--help (this help)\t--from [file.ini]\t--context [path]\n");
        //std::printf("\t--file (default: \"%s\")\n", fileName.c_str());
    }

    std::printf("--------------------------------------------------------------\n");

    return true;
}

/************************************************************************/

double ExampleProgram::getPeriod()
{
    return 2.0;  // Fixed, in seconds, the slow thread that calls updateModule below
}

/************************************************************************/

bool ExampleProgram::updateModule()
{
    return true;
}

/************************************************************************/

bool ExampleProgram::interruptModule()
{
    return true;
}

/************************************************************************/

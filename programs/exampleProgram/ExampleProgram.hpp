// -*- mode:C++; tab-width:4; c-basic-offset:4; indent-tabs-mode:nil -*-

#ifndef __EXAMPLE_PROGRAM_HPP__
#define __EXAMPLE_PROGRAM_HPP__

#include <yarp/os/RFModule.h>

namespace roboticslab
{

/**
 * @ingroup exampleProgram
 *
 * @brief exampleProgram
 */
class ExampleProgram : public yarp::os::RFModule
{
public:
    virtual bool configure(yarp::os::ResourceFinder & rf) override;

protected:
    virtual bool interruptModule() override;
    virtual double getPeriod() override;
    virtual bool updateModule() override;
};

} // namespace roboticslab

#endif // __EXAMPLE_PROGRAM_HPP__

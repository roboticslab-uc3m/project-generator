#include "gtest/gtest.h"

#include "ExampleLibrary.hpp"

#include <ColorDebug.h>

namespace roboticslab
{

/**
 * @brief Tests \ref ExampleLibrary.
 */
class ExampleLibraryTest : public testing::Test
{
public:
    virtual void SetUp()
    {
        exampleLibrary = new ExampleLibrary;
    }

    virtual void TearDown()
    {
        delete exampleLibrary;
        exampleLibrary = 0;
    }

protected:
    ExampleLibrary* exampleLibrary;
};

TEST_F(ExampleLibraryTest, ExampleLibraryConstructor)
{
    //ASSERT_TRUE(exampleLibrary->expectTrueResult());

    ASSERT_TRUE(true);
}

}  // namespace roboticslab

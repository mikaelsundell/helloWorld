// Copyright 2022-present Contributors to the helloWorld project.
// SPDX-License-Identifier: BSD-3-Clause
// https://github.com/mikaelsundell/helloWorld

#include <iostream>
#include "helloFetch.h"
//#include <half.h>
//#include <ImathVec.h>
//#include <aces_Writer.h>

int
main(int argc, char **argv)
{
    std::cout << "hello, world!" << std::endl;

    helloFetch helloFetch;
    helloFetch.sayHello();

    
    // imath
    /*
    {
        std::cout << "imath test" << std::endl;
        
        Imath::V3f vector1(1.0f, 2.0f, 3.0f);
        Imath::V3f vector2(4.0f, 5.0f, 6.0f);
        Imath::V3f result = vector1 + vector2;

        std::cout << "Result: (" 
                  << result.x 
                  << ", " 
                  << result.y 
                  << ", " 
                  << result.z 
                  << ")" << std::endl;

        Imath::half half1 = Imath::half(3.14f);
        float float1 = float(half1);
        Imath::half half2 = float1 * Imath::half(2.0f);

        std::cout << "Result: (" 
                    << half1
                    << ", " 
                    << float1
                    << ", " 
                    << half2
                    << ")" << std::endl;
    }*/
    // aces container
    /*{
        std::cout << "aces_container test" << std::endl;

        MetaWriteClip params;
        params.outputRows = 1024;
        params.outputCols = 1024;
        params.hi.channels.resize(3);
        params.hi.channels[0].name = "B";
        params.hi.channels[1].name = "G";
        params.hi.channels[2].name = "R";

        aces_Writer writer;
        writer.configure(params);

        std::cout << writer.getDefaultHeaderInfo() << std::endl;
    }*/
}

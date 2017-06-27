//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

// Created: 2017-5-26 for project qot

import ned.DelayChannel;

module Node {
    parameters:
        @display("i=misc/node_vs");
    gates:
        inout g[];
    connections allowunconnected:
}

//
// A generated network with ring topology.
//
network Network
{
    types:
        channel canal extends ned.DatarateChannel
        {
            datarate = 100Mbps;
            delay = 100us;
            ber = 1e-10;
		}
    submodules:
        node0: Node {
            @display("p=200,50");
            
        }
        node1: Node {
            @display("p=350,201");
            
        }
        node2: Node {
            @display("p=199,350");
            
        }
        node3: Node {
            @display("p=50,200");
            
        }
    connections:
        node0.g++ <--> canal <--> node1.g++;
        node1.g++ <--> canal <--> node2.g++;
        node2.g++ <--> canal <--> node3.g++;
        node3.g++ <--> canal <--> node0.g++;
}


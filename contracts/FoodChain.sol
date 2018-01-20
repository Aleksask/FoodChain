pragma solidity ^0.4.17;

contract FoodChain {
    
    struct Commodity {
        string Symbol;
    }

    struct Farmer {
        address Uid;
        string Name;
        string Surname;
        uint Longitude;
        uint Lattitude;
    }

    struct Buyer {
        address Uid;
        string Name;
        string Location;
    }

    struct BuyOrder {  
        uint Id;
        Commodity Product;
        uint Quantity;
        uint Price;        
    }

    struct Cooperative {    
        address Uid;
        Commodity Product;
        HarvestMonth uint;
        mapping(Farmer => uint)  // What quantity of commodity does each farmer put for sale
    }

    uint totalOrders = 0;
    mapping (address=>Farmer) Farmers;
    mapping (uint=>BuyOrder) ActiveBids;

    function register(Farmer newFarmer) public {
       // Users[newUser.Uid]
       Farmers[newFarmer.Uid] = newFarmer;
    }

    function putAnOrder(BuyOrder bidOrder) public {
        ActiveBids[totalOrders++] = bidOrder;
    }

}

pragma solidity ^0.4.4;

contract FoodChain {
    

    struct Field {
    
        string Produce;
        uint Yield;
    }

    struct Farmer {
        address Uid;
        string Name;
        string Surname;
        uint Longitude;
        uint Lattitude;    
        mapping (string=>Field) Land;
    }

    struct Buyer {
        address Uid;
        string Name;
        string Location;
    }

    struct BuyOrder {  
        uint Id;
        string Product;
        uint Quantity;
        uint Price;        
    }

    struct Cooperative {    
        address Uid;
        string Product;
        uint HarvestMonth;
        // Farmer to What quantity of string does each farmer put for sale
        mapping(address => uint) ShareInCooperative;  
    }

    uint totalOrders = 0;
    mapping (address=>Farmer) Farmers;
    mapping (address=>Buyer) Buyers;
    mapping (uint=>BuyOrder) ActiveBids;
    

    function registerFarmer(address Uid,
        string Name,
        string Surname,
        uint Longitude,
        uint Lattitude) public 
    {
       Farmers[Uid] = Farmer({ 
        Uid : Uid, 
       Name : Name, 
       Surname : Surname, 
       Longitude : Longitude, 
       Lattitude : Lattitude
       });
    }

    function registerFarmerField(address farmerUid, string produce, uint yield) public {
        
        Farmers[farmerUid].Land[produce] = Field({
            Produce : produce,
            Yield : yield
        });
    }

    // function registerBuyer(Buyer buyer) public {
    //     Buyers[buyer.Uid] = buyer;
    // }

    // function putAnOrder(BuyOrder bidOrder) public {
    //     ActiveBids[totalOrders++] = bidOrder;
    // }

}
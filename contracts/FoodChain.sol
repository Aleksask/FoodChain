pragma solidity ^0.4.17;

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
        address Buyer;
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
    mapping (address=>uint) BuyerActiveBids;
    BuyOrder[] allOrders;
    

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

    function registerBuyer(address Uid,
        string Name,
        string Location) public 
    {
        Buyers[Uid] = Buyer({
            Uid : Uid,
            Name : Name,
            Location : Location
        });
    }

    function putAnOrder(string produce, uint quantity, uint price, address buyerId) public returns (uint) {
        uint newOrderId = ++totalOrders;
        var order = BuyOrder({
             Id : newOrderId,
             Buyer : buyerId,
             Product : produce,
             Quantity : quantity,
             Price : price  
        });
        
        allOrders.push(order);

        BuyerActiveBids[buyerId] = newOrderId;

        return newOrderId;
    }

}
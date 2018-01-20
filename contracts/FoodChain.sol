pragma solidity ^0.4.17;

contract FoodChain {
    
    struct Field {    
        string Product;
        uint Yield;
        bool IsFilled;
    }

    struct Farmer {
        address Uid;
        string Name;
        string Surname;
        uint256 Longitude;
        uint256 Lattitude;
        mapping (string => Field) Land;
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

    struct CooperativeContract {    
        uint Uid;
        BuyOrder Order;
        // Farmer to What quantity of string does each farmer put for sale
        mapping(address => uint) ShareInCooperative;
    }

    uint totalOrders = 0;
    Farmer[] Farmers;
    mapping (address=>Buyer) public Buyers;
    mapping (address=>uint) BuyerActiveBids;
    BuyOrder[] allOrders;
    CooperativeContract[] liveContracts;
    

    function registerFarmer(address Uid,
        string Name,
        string Surname,
        uint8 Longitude,
        uint8 Lattitude) public 
    {
       Farmers.push(Farmer({ 
        Uid : Uid, 
       Name : Name, 
       Surname : Surname, 
       Longitude : Longitude, 
       Lattitude : Lattitude
       }));
    }

    function registerFarmerField(address farmerUid, string Product, uint yield) public {
        for (uint i = 0; i < Farmers.length; i++) {
            if (Farmers[i].Uid == farmerUid) {
                Farmers[i].Land[Product] = Field({
                    Product : Product,
                    Yield : yield,
                    IsFilled : false
                });
            }
        }
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

    function putAnOrder(string Product, uint quantity, uint price, address buyerId) public returns (uint) {
        uint newOrderId = ++totalOrders;
        var order = BuyOrder({
             Id : newOrderId,
             Buyer : buyerId,
             Product : Product,
             Quantity : quantity,
             Price : price  
        });
        
        BuyerActiveBids[buyerId] = newOrderId;
        allOrders.push(order);
        
        

        return newOrderId;
    }

    function matchFarmersAndBuyers() public {
        
        for (uint256 j; j < allOrders.length; j++) {
            var order = allOrders[j];
            var orderQuantity = order.Quantity;
            uint256 filledQuantity = 0;
            //todo create a cooperative contract
            var coopContract = CooperativeContract({
                                    Uid : order.Id,
                                    Order : order});

            for (uint256 i; i < Farmers.length ; i++) {
                var farmer = Farmers[i];
                var field = farmer.Land[order.Product];
                if (field.Yield == 0 || field.IsFilled) 
                    continue;
                
                 var pendingQuantity = orderQuantity - filledQuantity;

                if (pendingQuantity >= 0) {

                    var quantityToFill = min(pendingQuantity, field.Yield);
                   
                    filledQuantity += quantityToFill;

                    field.Yield -= quantityToFill;

                    var x = coopContract.ShareInCooperative;
                    x[farmer.Id] = quantityToFill;

                    //todo add farmer to cooperative contract

                    if (field.Yield == 0)
                        field.IsFilled = true;
                }
                coopContract = coopContract;
                if (pendingQuantity == 0) 
                    break;
            }

            liveContracts.push(coopContract);
        }
    }

    function max(uint a, uint b) public returns (uint) {
        if (a > b) 
            return a;
        else 
            return b;
    }

    function min(uint a, uint b) public returns (uint) {
        if (a < b) 
            return a;
        else 
            return b;
    }

}

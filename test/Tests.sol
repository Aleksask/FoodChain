import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FoodChain.sol";

contract TestFoodChain {
    function test() {
        MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

        uint expected = 10000;

        Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
    }
}
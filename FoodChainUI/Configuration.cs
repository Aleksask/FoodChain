using LightInject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nethereum;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using Nethereum.Hex.HexConvertors.Extensions;
using Nethereum.RPC.TransactionManagers;
using Nethereum.Hex.HexTypes;

namespace FoodChainUI
{
    public static class Configuration
    {
        public static ServiceContainer DiContainer = new ServiceContainer((new ContainerOptions { EnableVariance = false }));

        static string password = "password";
        static Account _ethAccount;
        static string privateKey1 = "0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3";

        static string recieverAddress = "0x0d1d4e623D10F9FBA5Db95830F7d3839406C6AF2";

        static string proofOfExistanceAddress = "0x2c2b9c9a4a25e24b174f26114e8926a9f2128fe4";

        static string MultiplyTestContractAddress = "0x82d50ad3c1091866e258fd0f1a7cc9674609d254";

        static string foodchainAddress = "0xf204a4ef082f5c04bb89f7d5e6568b796096735a";

        static string foodchainABI = @"[{'constant':false,'inputs':[{'name':'farmerUid','type':'address'},{'name':'Product','type':'string'},{'name':'yield','type':'uint256'}],'name':'registerFarmerField','outputs':[],'payable':false,'stateMutability':'nonpayable','type':'function'},{'constant':false,'inputs':[{'name':'Uid','type':'address'},{'name':'Name','type':'string'},{'name':'Location','type':'string'}],'name':'registerBuyer','outputs':[],'payable':false,'stateMutability':'nonpayable','type':'function'},{'constant':false,'inputs':[{'name':'Uid','type':'address'},{'name':'Name','type':'string'},{'name':'Surname','type':'string'},{'name':'Longitude','type':'uint8'},{'name':'Lattitude','type':'uint8'}],'name':'registerFarmer','outputs':[],'payable':false,'stateMutability':'nonpayable','type':'function'},{'constant':false,'inputs':[{'name':'Product','type':'string'},{'name':'quantity','type':'uint256'},{'name':'price','type':'uint256'},{'name':'buyerId','type':'address'}],'name':'putAnOrder','outputs':[{'name':'','type':'uint256'}],'payable':false,'stateMutability':'nonpayable','type':'function'},{'constant':true,'inputs':[{'name':'a','type':'uint256'},{'name':'b','type':'uint256'}],'name':'max','outputs':[{'name':'','type':'uint256'}],'payable':false,'stateMutability':'pure','type':'function'},{'constant':true,'inputs':[{'name':'a','type':'uint256'},{'name':'b','type':'uint256'}],'name':'min','outputs':[{'name':'','type':'uint256'}],'payable':false,'stateMutability':'pure','type':'function'},{'constant':true,'inputs':[{'name':'','type':'address'}],'name':'Buyers','outputs':[{'name':'Uid','type':'address'},{'name':'Name','type':'string'},{'name':'Location','type':'string'}],'payable':false,'stateMutability':'view','type':'function'}]";

        static string MultiplyerABI = @"[ { 'constant': false, 'inputs': [  {  'name': 'multiplier',  'type': 'uint256'  } ], 'name': 'test', 'outputs': [], 'payable': false, 'stateMutability': 'nonpayable', 'type': 'function' }, { 'constant': false, 'inputs': [  {  'name': 'a',  'type': 'uint256'  } ], 'name': 'multiply', 'outputs': [  {  'name': 'd',  'type': 'uint256'  } ], 'payable': false, 'stateMutability': 'nonpayable', 'type': 'function' } ]";

        static string ABIForProofOFExistance = @"[ {'constant': false,'inputs': [  { 'name': 'doc', 'type': 'string'  }],'name': 'notorize','outputs': [],'payable': false,'stateMutability': 'nonpayable','type': 'function' }, {'constant': true,'inputs': [  { 'name': 'doc', 'type': 'string'  }],'name': 'proofFor','outputs': [  { 'name': '', 'type': 'bytes32'  }],'payable': false,'stateMutability': 'view','type': 'function' }, {'constant': true,'inputs': [],'name': 'proof','outputs': [  { 'name': '', 'type': 'bytes32'  }],'payable': false,'stateMutability': 'view','type': 'function' }  ]";

        /// <summary>
        /// Run this configuration before the app starts! 
        /// </summary>
        /// <returns></returns>
        public static async Task RunConfiguration()
        {
            DiContainer.SetDefaultLifetime<PerContainerLifetime>();
            DiContainer.Register<Models.Repository>();

            var account = new Nethereum.Web3.Accounts.Account(privateKey1);

   
            var web3 = new Nethereum.Web3.Web3(account, "HTTP://127.0.0.1:7545");

            //string result = await  web3.TransactionManager.SendTransactionAsync(account.Address, recieverAddress, new HexBigInteger(11000000000000000000));



            var contract = web3.Eth.GetContract(MultiplyerABI, MultiplyTestContractAddress);
            var multiplyFunction = contract.GetFunction("multiply");
            var result = await multiplyFunction.CallAsync<int>(8);

            var testFunction = contract.GetFunction("test");
            var testResult = await testFunction.SendTransactionAsync(account.Address, 3);

            var multiplyResultAgain = await multiplyFunction.CallAsync<int>(7);

            
            var contractPoE = web3.Eth.GetContract(ABIForProofOFExistance, proofOfExistanceAddress);
            var notoriseFunction = contractPoE.GetFunction("notorize");
            await notoriseFunction.SendTransactionAsync(account.Address, "Something");
            

           /*
            var contractFoodchain = web3.Eth.GetContract(foodchainABI, foodchainAddress);
            var notoriseFunction = contract.GetFunction("notorize");
            await notoriseFunction.SendTransactionAsync("Something");
            */
            




            int m = 6; 
            //var account = Nethereum.Web3.Accounts.Account.LoadFromKeyStore()
        }



}


}

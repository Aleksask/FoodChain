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

            string result = await  web3.TransactionManager.SendTransactionAsync(account.Address, recieverAddress, new HexBigInteger(11000000000000000000));
            int m = 6; 
            //var account = Nethereum.Web3.Accounts.Account.LoadFromKeyStore()
        }



}


}

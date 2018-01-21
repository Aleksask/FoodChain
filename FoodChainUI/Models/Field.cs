using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodChainUI.Models
{
    /// <summary>
    /// Field and crop are used currently
    /// </summary>
    public class Field
    {
        public string Product { get; set; }

        uint Yield { get; set; }

        bool IsFilled { get; set; }
    }
}

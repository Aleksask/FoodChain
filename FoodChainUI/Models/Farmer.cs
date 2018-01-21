using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Telerik;
using Telerik.Core;
using Windows.Devices.Geolocation;

namespace FoodChainUI.Models
{
    public class Farmer : ViewModelBase
    {
        public string Name { get; set; }

        public string Surname { get; set; }

        double Longitude { get; set; }

        double Lattitude { get; set; }

        BasicGeoposition Location { get; set; }
    }
}

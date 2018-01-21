using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Telerik.Core;

namespace FoodChainUI.Models
{
    public class Repository : ViewModelBase
    {
        public ObservableCollection<Farmer> AllFarmers { get; set; } = new ObservableCollection<Farmer>();

        private Farmer _selectedFarmer;

        public Farmer SelectedFarmer
        {
            get
            {
                return _selectedFarmer;
            }
            set
            {
                if(value != _selectedFarmer)
                {
                    _selectedFarmer = value;
                    OnPropertyChanged(); 
                }
            }
        }

        public Repository()
        {
            AllFarmers.Add(new Farmer {Name = "Bob", Surname = "Stone" });
            AllFarmers.Add(new Farmer { Name = "Kennedy", Surname = "Stone" });

            _selectedFarmer = AllFarmers.FirstOrDefault(); 
        }



    }
}
